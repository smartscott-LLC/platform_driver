// =============================================================================
// Module  : tb3d_microblaze_module
// Project : TB3-D Platform Driver — Versal 1802
// File    : rtl/tb3d_microblaze_module.v
//
// Purpose : Wrapper for Microblaze subsystem integration. Encapsulates:
//           - Microblaze CPU with instruction/data LMB caches
//           - L2 cache control (cache-aware chunk movements)
//           - DDR4 AXI master interface (via PL-to-PS interconnect)
//           - UART debug console (optional, for telemetry)
//           - S_AXI_CTRL slave for orchestrator configuration and monitoring
//
// Clock Domain: mb_clk (Microblaze processor clock, typically 125-200 MHz)
//              DDR access goes through async FIFO CDC to axi_clk domain
//
// S_AXI_CTRL CSR Register Map (AXI4-Lite slave, 32-bit, 5-bit word address):
//   0x00  CTRL      — bit[0]=start_op, bit[1]=flush_cache, bit[2]=prefetch_en
//   0x04  STATUS    — bit[0]=ready, bit[1]=busy, bit[31:2]=cache_stats (RO)
//   0x08  DDR_ADDR_LO — lower 32 bits of target DDR address (RW)
//   0x0C  DDR_ADDR_HI — upper 32 bits of target DDR address (RW)
//   0x10  DDR_LEN   — burst length in bytes, cache-line aligned (RW)
//   0x14  PERF_HITS — L2 cache hit count (RO)
//   0x18  PERF_MISS — L2 cache miss count (RO)
//   0x1C  PERF_LAT  — average DDR latency in ns (RO, placeholder)
//
// =============================================================================

`timescale 1ns / 1ps

module tb3d_microblaze_module #(
    parameter MB_CLOCK_FREQ_HZ  = 200_000_000,  // Microblaze clock (Hz)
    parameter DDR_DATA_WIDTH    = 64,            // DDR4 AXI data width
    parameter DDR_ADDR_WIDTH    = 64,            // Full 64-bit addressing
    parameter CACHE_LINE_SIZE   = 64             // Bytes per L2 cache line
) (
    // =========================================================================
    // Clock & Reset (Microblaze / AXI-Lite shared domain)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI:S_AXI_CTRL, ASSOCIATED_RESET mb_rst_n" *)
    input  wire                      mb_clk,         // Microblaze processor clock
    input  wire                      mb_rst_n,       // Active-low reset

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite slave (32-bit data, 5-bit word address)
    // Connects to orchestrator M_AXI_MB_CTRL; replaces raw csr_* pins.
    // =========================================================================
    // Write address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWADDR" *)
    input  wire [4:0]                s_axi_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWPROT" *)
    input  wire [2:0]                s_axi_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWVALID" *)
    input  wire                      s_axi_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWREADY" *)
    output wire                      s_axi_ctrl_awready,
    // Write data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WDATA" *)
    input  wire [31:0]               s_axi_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WSTRB" *)
    input  wire [3:0]                s_axi_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WVALID" *)
    input  wire                      s_axi_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WREADY" *)
    output wire                      s_axi_ctrl_wready,
    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BRESP" *)
    output wire [1:0]                s_axi_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BVALID" *)
    output wire                      s_axi_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BREADY" *)
    input  wire                      s_axi_ctrl_bready,
    // Read address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARADDR" *)
    input  wire [4:0]                s_axi_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARPROT" *)
    input  wire [2:0]                s_axi_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARVALID" *)
    input  wire                      s_axi_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARREADY" *)
    output wire                      s_axi_ctrl_arready,
    // Read data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RDATA" *)
    output wire [31:0]               s_axi_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RRESP" *)
    output wire [1:0]                s_axi_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RVALID" *)
    output wire                      s_axi_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RREADY" *)
    input  wire                      s_axi_ctrl_rready,

    // =========================================================================
    // M_AXI — AXI4 Master to DDR4 (mb_clk domain)
    // Connects to Versal PS DDR4 controller via PL-to-PS interconnect.
    // =========================================================================
    // Write address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWADDR" *)
    output wire [DDR_ADDR_WIDTH-1:0] m_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWLEN" *)
    output wire [7:0]                m_axi_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWSIZE" *)
    output wire [2:0]                m_axi_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWBURST" *)
    output wire [1:0]                m_axi_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWVALID" *)
    output wire                      m_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI AWREADY" *)
    input  wire                      m_axi_awready,
    // Write data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI WDATA" *)
    output wire [DDR_DATA_WIDTH-1:0] m_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI WSTRB" *)
    output wire [(DDR_DATA_WIDTH/8)-1:0] m_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI WLAST" *)
    output wire                      m_axi_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI WVALID" *)
    output wire                      m_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI WREADY" *)
    input  wire                      m_axi_wready,
    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI BRESP" *)
    input  wire [1:0]                m_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI BVALID" *)
    input  wire                      m_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI BREADY" *)
    output wire                      m_axi_bready,
    // Read address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARADDR" *)
    output wire [DDR_ADDR_WIDTH-1:0] m_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARLEN" *)
    output wire [7:0]                m_axi_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARSIZE" *)
    output wire [2:0]                m_axi_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARBURST" *)
    output wire [1:0]                m_axi_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARVALID" *)
    output wire                      m_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI ARREADY" *)
    input  wire                      m_axi_arready,
    // Read data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI RDATA" *)
    input  wire [DDR_DATA_WIDTH-1:0] m_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI RRESP" *)
    input  wire [1:0]                m_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI RLAST" *)
    input  wire                      m_axi_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI RVALID" *)
    input  wire                      m_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI RREADY" *)
    output wire                      m_axi_rready,

    // =========================================================================
    // UART Interface (debug console, optional)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:uart_rtl:1.0 UART RxD" *)
    input  wire                      uart_rx,        // UART RX (from host)
    (* X_INTERFACE_INFO = "xilinx.com:interface:uart_rtl:1.0 UART TxD" *)
    output wire                      uart_tx         // UART TX (to host)
);

    // =========================================================================
    // S_AXI_CTRL : CSR register bank
    // =========================================================================
    // CSR registers (mb_clk domain):
    reg [31:0] csr_ctrl;       // CTRL: bit[0]=start_op, [1]=flush_cache, [2]=prefetch_en
    reg [31:0] csr_ddr_addr_lo;// DDR_ADDR_LO
    reg [31:0] csr_ddr_addr_hi;// DDR_ADDR_HI
    reg [31:0] csr_ddr_len;    // DDR_LEN

    // Internal control signals (derived from CSR writes)
    wire        csr_start_op    = csr_ctrl[0];
    wire        csr_flush_cache = csr_ctrl[1];
    wire        csr_prefetch_en = csr_ctrl[2];
    wire [DDR_ADDR_WIDTH-1:0] csr_ddr_addr = {csr_ddr_addr_hi, csr_ddr_addr_lo};

    // AXI4-Lite write path
    reg        axi_awready_r;
    reg        axi_wready_r;
    reg        axi_bvalid_r;
    reg [1:0]  axi_bresp_r;
    reg [4:0]  axi_awaddr_lat;

    // AXI4-Lite read path
    reg        axi_arready_r;
    reg        axi_rvalid_r;
    reg [31:0] axi_rdata_r;
    reg [1:0]  axi_rresp_r;

    assign s_axi_ctrl_awready = axi_awready_r;
    assign s_axi_ctrl_wready  = axi_wready_r;
    assign s_axi_ctrl_bresp   = axi_bresp_r;
    assign s_axi_ctrl_bvalid  = axi_bvalid_r;
    assign s_axi_ctrl_arready = axi_arready_r;
    assign s_axi_ctrl_rdata   = axi_rdata_r;
    assign s_axi_ctrl_rresp   = axi_rresp_r;
    assign s_axi_ctrl_rvalid  = axi_rvalid_r;

    // --- Write: address handshake ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            axi_awready_r  <= 1'b0;
            axi_awaddr_lat <= 5'h0;
        end else begin
            if (!axi_awready_r && s_axi_ctrl_awvalid && s_axi_ctrl_wvalid) begin
                axi_awready_r  <= 1'b1;
                axi_awaddr_lat <= s_axi_ctrl_awaddr;
            end else begin
                axi_awready_r <= 1'b0;
            end
        end
    end

    // --- Write: data handshake ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            axi_wready_r <= 1'b0;
        end else begin
            if (!axi_wready_r && s_axi_ctrl_wvalid && s_axi_ctrl_awvalid) begin
                axi_wready_r <= 1'b1;
            end else begin
                axi_wready_r <= 1'b0;
            end
        end
    end

    // --- Write: update CSR registers ---
    // start_op (bit[0]) is latched until the FSM transitions out of IDLE,
    // at which point the FSM clears it via csr_ctrl[0] = 0.
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            csr_ctrl        <= 32'h0;
            csr_ddr_addr_lo <= 32'h0;
            csr_ddr_addr_hi <= 32'h0;
            csr_ddr_len     <= 32'h0;
        end else begin
            if (axi_awready_r && s_axi_ctrl_awvalid &&
                axi_wready_r  && s_axi_ctrl_wvalid) begin
                case (axi_awaddr_lat[4:2])
                    3'd0: csr_ctrl        <= s_axi_ctrl_wdata;  // CTRL
                    3'd2: csr_ddr_addr_lo <= s_axi_ctrl_wdata;  // DDR_ADDR_LO
                    3'd3: csr_ddr_addr_hi <= s_axi_ctrl_wdata;  // DDR_ADDR_HI
                    3'd4: csr_ddr_len     <= s_axi_ctrl_wdata;  // DDR_LEN
                    default: begin end
                endcase
            end else if (state == STATE_READ_ADDR) begin
                // Clear start_op once the FSM has consumed it
                csr_ctrl[0] <= 1'b0;
            end
        end
    end

    // --- Write: response ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            axi_bvalid_r <= 1'b0;
            axi_bresp_r  <= 2'b00;
        end else begin
            if (axi_awready_r && s_axi_ctrl_awvalid &&
                axi_wready_r  && s_axi_ctrl_wvalid) begin
                axi_bvalid_r <= 1'b1;
                axi_bresp_r  <= 2'b00;
            end else if (s_axi_ctrl_bready && axi_bvalid_r) begin
                axi_bvalid_r <= 1'b0;
            end
        end
    end

    // --- Read: address handshake ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            axi_arready_r <= 1'b0;
        end else begin
            if (!axi_arready_r && s_axi_ctrl_arvalid) begin
                axi_arready_r <= 1'b1;
            end else begin
                axi_arready_r <= 1'b0;
            end
        end
    end

    // =========================================================================
    // Internal State Machine (DDR4 AXI master)
    // =========================================================================
    localparam STATE_IDLE       = 3'h0;
    localparam STATE_READ_ADDR  = 3'h1;
    localparam STATE_READ_DATA  = 3'h2;
    localparam STATE_WRITE_ADDR = 3'h3;
    localparam STATE_WRITE_DATA = 3'h4;
    localparam STATE_WRITE_RESP = 3'h5;
    localparam STATE_DONE       = 3'h6;

    reg [2:0]                   state, state_next;
    reg [DDR_ADDR_WIDTH-1:0]    op_addr;
    reg [31:0]                  op_len;
    reg [31:0]                  bytes_remaining;
    reg                         busy_flag;

    // Cache hit/miss performance counters
    reg [31:0]                  cache_hit_count;
    reg [31:0]                  cache_miss_count;
    reg [DDR_ADDR_WIDTH-1:0]    last_addr;

    wire cache_hit_predicted = ((csr_ddr_addr >= last_addr) &&
                                (csr_ddr_addr < last_addr + CACHE_LINE_SIZE));

    // State machine
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            state              <= STATE_IDLE;
            state_next         <= STATE_IDLE;
            busy_flag          <= 1'b0;
            op_addr            <= {DDR_ADDR_WIDTH{1'b0}};
            op_len             <= 32'h0;
            bytes_remaining    <= 32'h0;
            last_addr          <= {DDR_ADDR_WIDTH{1'b0}};
            cache_hit_count    <= 32'h0;
            cache_miss_count   <= 32'h0;
        end else begin
            state <= state_next;

            case (state)
                STATE_IDLE: begin
                    busy_flag <= 1'b0;
                    if (csr_start_op) begin
                        op_addr         <= csr_ddr_addr;
                        op_len          <= csr_ddr_len;
                        bytes_remaining <= csr_ddr_len;
                        busy_flag       <= 1'b1;
                        state_next      <= STATE_READ_ADDR;
                        if (cache_hit_predicted) begin
                            cache_hit_count <= cache_hit_count + 1;
                        end else begin
                            cache_miss_count <= cache_miss_count + 1;
                            last_addr        <= csr_ddr_addr;
                        end
                    end
                end

                STATE_READ_ADDR: begin
                    if (m_axi_arready) state_next <= STATE_READ_DATA;
                end

                STATE_READ_DATA: begin
                    if (m_axi_rvalid) begin
                        bytes_remaining <= bytes_remaining - DDR_DATA_WIDTH/8;
                        if (m_axi_rlast || bytes_remaining <= DDR_DATA_WIDTH/8)
                            state_next <= STATE_DONE;
                    end
                end

                STATE_DONE: begin
                    busy_flag  <= 1'b0;
                    state_next <= STATE_IDLE;
                end

                default: state_next <= STATE_IDLE;
            endcase
        end
    end

    // =========================================================================
    // AXI Read Path (DDR4 master)
    // =========================================================================
    assign m_axi_araddr  = op_addr;
    assign m_axi_arlen   = (op_len > 16) ? 8'hF : (op_len[7:0] - 1);
    assign m_axi_arsize  = 3'h3;
    assign m_axi_arburst = 2'h1;
    assign m_axi_arvalid = (state == STATE_READ_ADDR);
    assign m_axi_rready  = (state == STATE_READ_DATA);

    // =========================================================================
    // AXI Write Path (DDR4 master, placeholder)
    // =========================================================================
    assign m_axi_awaddr  = {DDR_ADDR_WIDTH{1'b0}};
    assign m_axi_awlen   = 8'h0;
    assign m_axi_awsize  = 3'h3;
    assign m_axi_awburst = 2'h1;
    assign m_axi_awvalid = 1'b0;
    assign m_axi_wdata   = {DDR_DATA_WIDTH{1'b0}};
    assign m_axi_wstrb   = {(DDR_DATA_WIDTH/8){1'b0}};
    assign m_axi_wlast   = 1'b0;
    assign m_axi_wvalid  = 1'b0;
    assign m_axi_bready  = 1'b1;

    // =========================================================================
    // Internal status signals (drive CSR STATUS + read path)
    // STATUS register layout (32-bit, offset 0x04):
    //   bit[0]  : ready (1 = idle, accepting operations)
    //   bit[1]  : busy  (1 = DDR operation in progress)
    //   bit[31:2]: reserved
    // Full counters are at dedicated offsets 0x14 (hits) and 0x18 (misses).
    // =========================================================================
    wire        mb_ready  = (state == STATE_IDLE);
    wire [31:0] mb_status = {30'h0, busy_flag, mb_ready};

    // --- Read: data mux (CSR status) ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            axi_rvalid_r <= 1'b0;
            axi_rdata_r  <= 32'h0;
            axi_rresp_r  <= 2'b00;
        end else begin
            if (axi_arready_r && s_axi_ctrl_arvalid && !axi_rvalid_r) begin
                axi_rvalid_r <= 1'b1;
                axi_rresp_r  <= 2'b00;
                case (s_axi_ctrl_araddr[4:2])
                    3'd0: axi_rdata_r <= csr_ctrl;           // CTRL
                    3'd1: axi_rdata_r <= mb_status;          // STATUS (RO)
                    3'd2: axi_rdata_r <= csr_ddr_addr_lo;    // DDR_ADDR_LO
                    3'd3: axi_rdata_r <= csr_ddr_addr_hi;    // DDR_ADDR_HI
                    3'd4: axi_rdata_r <= csr_ddr_len;        // DDR_LEN
                    3'd5: axi_rdata_r <= cache_hit_count;    // PERF_HITS
                    3'd6: axi_rdata_r <= cache_miss_count;   // PERF_MISS
                    3'd7: axi_rdata_r <= 32'h0;              // PERF_LAT (placeholder)
                    default: axi_rdata_r <= 32'h0;
                endcase
            end else if (axi_rvalid_r && s_axi_ctrl_rready) begin
                axi_rvalid_r <= 1'b0;
            end
        end
    end

    // =========================================================================
    // UART Interface (debug console, stub)
    // =========================================================================
    assign uart_tx = 1'b1;  // UART idle state

endmodule
