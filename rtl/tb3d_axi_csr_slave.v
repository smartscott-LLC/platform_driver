// =============================================================================
// Module  : tb3d_axi_csr_slave
// Project : TB3-D Platform Driver — Versal 1802
// File    : rtl/tb3d_axi_csr_slave.v
//
// Purpose : AXI4-Lite Control/Status Register (CSR) interface for TB3-D engine.
//           Modern, parameterized version targeting Versal 1802 VPK180.
//
//           This module is instantiated as part of the orchestrator hierarchy
//           and manages all TB3-D configuration, status readback, and interrupt
//           control. Address space: 0x4000_0000–0x4000_FFFF (64 KB).
//
// Register Map (word address @ 0x4000_xxxx):
//
//   Offset   Register Name     Access  Width  [Bits]  Purpose
//   ────────────────────────────────────────────────────────────────
//   0x00     CONTROL           R/W     32     See below
//   0x04     STATUS            RO      32     See below
//   0x08     VERSION           RO      32     [31:16]=major, [15:8]=minor, [7:0]=patch
//   0x0C     GTY_LOCK_0        RO      32     GTY lanes 0–31 lock status (1=locked)
//   0x10     GTY_LOCK_1        RO      32     GTY lanes 32–63 lock status
//   ...      GTY_LOCK_[N]      RO      32     ... (continues for all 512 lanes / 32)
//   0x4C     GTY_ERROR_0       RO      32     GTY lanes 0–31 error flags
//   0x50     GTY_ERROR_1       RO      32     GTY lanes 32–63 error flags
//   ...      GTY_ERROR_[N]     RO      32     ... (continues for all 512 lanes / 32)
//   0x80     MB_STATUS         RO      32     Microblaze subsystem status
//   0x84     MB_CONTROL        R/W     32     Microblaze control (cache ops, etc.)
//   0x88     CACHE_STATS       RO      32     [31:16]=hits, [15:0]=misses
//   0x8C     DMA_DEBUG         RO      32     DMA state for debugging
//
// CONTROL register (0x00): [31:0]
//   [0]     GLOBAL_EN       (1=enable all codecs, 0=disable)
//   [1]     GTY_CODEC_EN    (1=GTY codec enabled)
//   [2]     INTR_EN         (1=interrupt generation enabled)
//   [3]     CACHE_EN        (1=L2 cache ops enabled)
//   [7:4]   MODE            (future: operation mode selection)
//   [31:8]  RESERVED        (tied to zero)
//
// STATUS register (0x04): [31:0] — READ ONLY
//   [0]     READY           (1=system ready for commands)
//   [1]     BUSY            (1=transfer in progress)
//   [2]     ERROR           (1=error occurred, write 1 to CONTROL[4] to clear)
//   [3]     GTY_LOCKED      (1=all enabled GTY lanes locked)
//   [4]     MB_READY        (1=Microblaze subsystem ready)
//   [5]     CACHE_FULL      (1=L2 cache full)
//   [31:6]  RESERVED        (tied to zero)
//
// Latency   : 1 cycle write, 2 cycles read (combinational + sync output register)
// Clock     : axi_clk (200 MHz, primary domain)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_axi_csr_slave #(
    parameter AXI_ADDR_WIDTH        = 16,       // 64 KB address space
    parameter AXI_DATA_WIDTH        = 32,       // 32-bit CSR data width
    parameter NUM_GTY_LANES         = 512,      // Total GTY lanes
    parameter NUM_GTY_STATUS_REGS   = (NUM_GTY_LANES + 31) / 32  // Regs needed
) (
    // =========================================================================
    // Clock & Reset
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET axi_rst_n" *)
    input  wire                     axi_clk,
    input  wire                     axi_rst_n,

    // =========================================================================
    // AXI4-Lite Slave Interface
    // =========================================================================
    // Write address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWPROT" *)
    input  wire [2:0]                 s_axi_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWVALID" *)
    input  wire                       s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWREADY" *)
    output reg                        s_axi_awready,

    // Write data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WDATA" *)
    input  wire [AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WSTRB" *)
    input  wire [(AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WVALID" *)
    input  wire                       s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WREADY" *)
    output reg                        s_axi_wready,

    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BRESP" *)
    output wire [1:0]                 s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BVALID" *)
    output reg                        s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BREADY" *)
    input  wire                       s_axi_bready,

    // Read address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARPROT" *)
    input  wire [2:0]                 s_axi_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARVALID" *)
    input  wire                       s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARREADY" *)
    output reg                        s_axi_arready,

    // Read data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RDATA" *)
    output reg  [AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RRESP" *)
    output wire [1:0]                 s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RVALID" *)
    output reg                        s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RREADY" *)
    input  wire                       s_axi_rready,

    // =========================================================================
    // Control/Status Outputs to Orchestrator & Sub-modules
    // =========================================================================
    output wire [31:0]                csr_control,        // Control register value
    output wire                       csr_global_en,      // Global enable flag
    output wire                       csr_gty_codec_en,   // GTY codec enable
    output wire                       csr_intr_en,        // Interrupt enable
    output wire                       csr_cache_en,       // Cache enable
    output wire [3:0]                 csr_mode,           // Operation mode

    // =========================================================================
    // Status Inputs from Orchestrator & Sub-modules
    // =========================================================================
    input  wire [31:0]                status_flags,       // Aggregated status
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_locked,    // Per-lane lock status
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_error,     // Per-lane error flags
    input  wire [31:0]                mb_status,          // Microblaze status
    input  wire [31:0]                cache_stats,        // Cache hit/miss counts
    input  wire [31:0]                dma_debug,          // DMA debug info

    // =========================================================================
    // Interrupt Outputs
    // =========================================================================
    output wire                       intr_enable_o,      // Interrupt signal (active-high)
    output wire                       intr_ack_i          // Interrupt acknowledge (write CONTROL[5])
);

    // =========================================================================
    // Internal Registers
    // =========================================================================

    reg  [31:0]  control_reg;        // CONTROL @ 0x00 (R/W)
    reg  [31:0]  read_data;          // Latched read data
    wire [31:0]  status_reg;         // STATUS @ 0x04 (RO, combinational)

    // Write address / data latches (for AXI protocol pipelining)
    reg  [AXI_ADDR_WIDTH-1:0]  wr_addr;
    reg  [AXI_DATA_WIDTH-1:0]  wr_data;
    reg  [(AXI_DATA_WIDTH/8)-1:0] wr_strb;
    reg                            wr_en;

    // Read address latch
    reg  [AXI_ADDR_WIDTH-1:0]  rd_addr;
    reg                            rd_en;

    // =========================================================================
    // AXI4-Lite Write Path
    // =========================================================================

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            control_reg <= 32'h0000_0001;  // Default: GLOBAL_EN=1
            wr_en <= 1'b0;
            s_axi_awready <= 1'b1;
            s_axi_wready <= 1'b1;
            s_axi_bvalid <= 1'b0;
        end else begin
            // Write address -- always ready (single slave, no queueing)
            s_axi_awready <= 1'b1;
            if (s_axi_awvalid && s_axi_awready) begin
                wr_addr <= s_axi_awaddr;
            end

            // Write data -- always ready
            s_axi_wready <= 1'b1;
            if (s_axi_wvalid && s_axi_wready) begin
                wr_data <= s_axi_wdata;
                wr_strb <= s_axi_wstrb;
                wr_en <= 1'b1;
            end else begin
                wr_en <= 1'b0;
            end

            // CSR decode and register update (next cycle after write data)
            if (wr_en) begin
                case (wr_addr[7:0])
                    8'h00: begin
                        // CONTROL register — selective write based on byte strobe
                        if (wr_strb[0]) control_reg[7:0]   <= wr_data[7:0];
                        if (wr_strb[1]) control_reg[15:8]  <= wr_data[15:8];
                        if (wr_strb[2]) control_reg[23:16] <= wr_data[23:16];
                        if (wr_strb[3]) control_reg[31:24] <= wr_data[31:24];
                    end
                    // STATUS, GTY_LOCK, GTY_ERROR, MB_STATUS, etc. are all RO
                    // Writes to RO registers are ignored (no AXI error response)
                    default: begin
                        // Silently ignore writes to unimplemented / RO addresses
                    end
                endcase
            end

            // Write response -- follow write data valid
            s_axi_bvalid <= s_axi_wvalid;
        end
    end

    assign s_axi_bresp = 2'b00;  // Always OKAY response

    // =========================================================================
    // AXI4-Lite Read Path
    // =========================================================================

    // Latch read address
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            rd_en <= 1'b0;
            s_axi_arready <= 1'b1;
        end else begin
            s_axi_arready <= 1'b1;
            if (s_axi_arvalid && s_axi_arready) begin
                rd_addr <= s_axi_araddr;
                rd_en <= 1'b1;
            end else begin
                rd_en <= 1'b0;
            end
        end
    end

    // Combinational read data multiplexing
    wire [31:0] read_data_comb;
    assign read_data_comb = (rd_addr[7:0] == 8'h00) ? control_reg      :
                            (rd_addr[7:0] == 8'h04) ? status_reg        :
                            (rd_addr[7:0] == 8'h08) ? 32'h0001_0000     :  // VERSION 1.0.0
                            (rd_addr[7:0] >= 8'h0C && rd_addr[7:0] <= 8'h4B) ?
                                gty_lock_read_mux(rd_addr[7:0]) :  // GTY_LOCK_[0-16]
                            (rd_addr[7:0] >= 8'h4C && rd_addr[7:0] <= 8'h7F) ?
                                gty_error_read_mux(rd_addr[7:0]) :  // GTY_ERROR_[0-16]
                            (rd_addr[7:0] == 8'h80) ? mb_status        :
                            (rd_addr[7:0] == 8'h84) ? control_reg      :  // MB_CONTROL (read-back)
                            (rd_addr[7:0] == 8'h88) ? cache_stats      :
                            (rd_addr[7:0] == 8'h8C) ? dma_debug        :
                            32'h0000_0000;  // Default: all zeros (unmapped)

    // Latch read data and assert valid
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            s_rvalid <= 1'b0;
            read_data <= 32'h0000_0000;
        end else begin
            if (rd_en) begin
                read_data <= read_data_comb;
                s_axi_rvalid <= 1'b1;
            end else if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end
        end
    end

    assign s_axi_rdata = read_data;
    assign s_axi_rresp = 2'b00;  // Always OKAY response

    // =========================================================================
    // GTY Status Multiplexers
    //
    // Pack 512 lock bits across 16 x 32-bit registers (lanes 0–31, 32–63, etc.)
    // =========================================================================

    function [31:0] gty_lock_read_mux;
        input [7:0] addr;
        reg [4:0] reg_index;
        begin
            // Convert address offset to register index
            // 0x0C → reg 0 (lanes 0–31)
            // 0x10 → reg 1 (lanes 32–63)
            // etc.
            reg_index = (addr - 8'h0C) >> 2;
            if (reg_index < NUM_GTY_STATUS_REGS) begin
                gty_lock_read_mux = gty_lane_locked[32*(reg_index+1)-1:32*reg_index];
            end else begin
                gty_lock_read_mux = 32'h0000_0000;
            end
        end
    endfunction

    function [31:0] gty_error_read_mux;
        input [7:0] addr;
        reg [4:0] reg_index;
        begin
            // Convert address offset to register index
            // 0x4C → reg 0 (lanes 0–31)
            // 0x50 → reg 1 (lanes 32–63)
            // etc.
            reg_index = (addr - 8'h4C) >> 2;
            if (reg_index < NUM_GTY_STATUS_REGS) begin
                gty_error_read_mux = gty_lane_error[32*(reg_index+1)-1:32*reg_index];
            end else begin
                gty_error_read_mux = 32'h0000_0000;
            end
        end
    endfunction

    // =========================================================================
    // STATUS Register (Combinational, RO)
    // Aggregated status from all sub-modules
    // =========================================================================

    // Check if all enabled GTY lanes are locked
    wire gty_all_locked = |(gty_lane_locked[NUM_GTY_LANES-1:0]);

    assign status_reg[0] = 1'b1;                          // [0] READY (always)
    assign status_reg[1] = status_flags[1];               // [1] BUSY (from orchestrator)
    assign status_reg[2] = status_flags[2];               // [2] ERROR (from orchestrator)
    assign status_reg[3] = gty_all_locked;                // [3] GTY_LOCKED
    assign status_reg[4] = status_flags[4];               // [4] MB_READY
    assign status_reg[5] = status_flags[5];               // [5] CACHE_FULL
    assign status_reg[31:6] = 26'h0000_000;              // [31:6] RESERVED

    // =========================================================================
    // Control Signal Outputs (directly from control_reg)
    // =========================================================================

    assign csr_control      = control_reg;
    assign csr_global_en    = control_reg[0];
    assign csr_gty_codec_en = control_reg[1];
    assign csr_intr_en      = control_reg[2];
    assign csr_cache_en     = control_reg[3];
    assign csr_mode         = control_reg[7:4];

    // =========================================================================
    // Interrupt Control
    // =========================================================================

    // Interrupt asserted when INTR_EN=1 and ERROR=1
    assign intr_enable_o = (control_reg[2] & status_flags[2]);  // INTR_EN & ERROR

    // Interrupt acknowledge: write 1 to CONTROL[5] to clear error
    assign intr_ack_i = (wr_en && wr_addr[7:0] == 8'h00 && wr_data[5]);

endmodule
