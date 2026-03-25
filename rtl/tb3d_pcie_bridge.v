// =============================================================================
// Module  : tb3d_pcie_bridge
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_pcie_bridge.v
//
// Purpose : PCIe TLP bridge for Xilinx 7-Series devices.
//
//           Interfaces between the Xilinx 7 Series Integrated Block for PCI
//           Express (pcie_7x_1 v3.3) AXI4-Stream interface and the TB3-D
//           engine's internal AXI4-Lite CSR bus and AXI4 DMA bus.
//
// Xilinx 7-Series PCIe IP AXI4-Stream signals used:
//   RX path (incoming TLPs from host):
//     m_axis_rx_tdata[63:0]  — 64-bit data (two DWORDs per beat)
//     m_axis_rx_tkeep[7:0]   — byte enable
//     m_axis_rx_tlast        — last beat of TLP
//     m_axis_rx_tvalid       — data valid
//     m_axis_rx_tready       — back-pressure (driven by this module)
//     m_axis_rx_tuser[21:0]  — metadata:
//       [21]    = err_fwd        (forward error)
//       [14:8]  = bar_hit[6:0]  (one-hot: [8]=BAR0, [10]=BAR2, etc.)
//       [1]     = is_sof_0      (SOF in lower DW of this beat)
//
//   TX path (outgoing TLPs to host):
//     s_axis_tx_tdata[63:0]
//     s_axis_tx_tkeep[7:0]
//     s_axis_tx_tlast
//     s_axis_tx_tvalid
//     s_axis_tx_tready        — back-pressure from PCIe IP
//     s_axis_tx_tuser[3:0]   — [0]=is_sof, [1]=is_eof_0, [2]=is_eof_1,
//                               [3]=discontinue
//
// BAR mapping (configured in Vivado IP catalog — see vivado/tb3d.tcl):
//   BAR0 : 64 KB  Non-Prefetchable MMIO  → AXI4-Lite CSR
//   BAR2/3: 256 MB Prefetchable 64-bit MMIO → AXI4 DMA window
//
// TLP data path (64-bit, 250 MHz):
//   DW ordering within a 64-bit beat: lower DW at [31:0], upper DW at [63:32]
//   Beat 0 : {DW1, DW0}   — TLP header first two DWORDs
//   Beat 1 : {DW3, DW2}   — address (32-bit) or {addr_lo, addr_hi} (64-bit)
//              For 3-DW TLPs: DW2=addr32, DW3=data (MWr32) or DW3=padding (MRd32)
//              For 4-DW TLPs: DW2=addr_hi, DW3=addr_lo
//   Beat 2 : {pad, DW4}   — payload (MWr64 only)
//
// Supported TLP types (same as before, now over 64-bit AXIS):
//   MRd32 / MRd64 → BAR0 or BAR2 read → Completion with Data (CplD)
//   MWr32 / MWr64 → BAR0 or BAR2 write
//   CplD          → received in response to DMA reads issued by the engine
//
// Completer ID: {cfg_bus_number, cfg_device_number, cfg_function_number}
//   Passed in as a single 16-bit wire from tb3d_top.
// =============================================================================

`timescale 1ns / 1ps

module tb3d_pcie_bridge (
    input  wire         clk,    // user_clk_out from PCIe IP (250 MHz)
    input  wire         rst_n,  // active-low synchronous reset

    // =========================================================================
    // Configuration — completer ID for completion TLPs
    // =========================================================================
    input  wire [15:0]  completer_id,   // {bus[7:0], dev[4:0], func[2:0]}

    // =========================================================================
    // AXI4-Stream RX — Incoming TLPs from Xilinx 7-Series PCIe IP
    // =========================================================================
    input  wire [63:0]  m_axis_rx_tdata,
    input  wire [7:0]   m_axis_rx_tkeep,
    input  wire         m_axis_rx_tlast,
    input  wire         m_axis_rx_tvalid,
    output reg          m_axis_rx_tready,
    input  wire [21:0]  m_axis_rx_tuser,

    // =========================================================================
    // AXI4-Stream TX — Outgoing TLPs to Xilinx 7-Series PCIe IP
    // =========================================================================
    output reg  [63:0]  s_axis_tx_tdata,
    output reg  [7:0]   s_axis_tx_tkeep,
    output reg          s_axis_tx_tlast,
    output reg          s_axis_tx_tvalid,
    input  wire         s_axis_tx_tready,
    output reg  [3:0]   s_axis_tx_tuser,

    // =========================================================================
    // AXI4-Lite master — CSR access (BAR0)
    // =========================================================================
    output reg  [15:0]  m_csr_awaddr,
    output reg          m_csr_awvalid,
    input  wire         m_csr_awready,

    output reg  [31:0]  m_csr_wdata,
    output reg  [3:0]   m_csr_wstrb,
    output reg          m_csr_wvalid,
    input  wire         m_csr_wready,

    input  wire [1:0]   m_csr_bresp,
    input  wire         m_csr_bvalid,
    output reg          m_csr_bready,

    output reg  [15:0]  m_csr_araddr,
    output reg          m_csr_arvalid,
    input  wire         m_csr_arready,

    input  wire [31:0]  m_csr_rdata,
    input  wire [1:0]   m_csr_rresp,
    input  wire         m_csr_rvalid,
    output reg          m_csr_rready,

    // =========================================================================
    // AXI4 master outbound — DMA (BAR2)
    // =========================================================================
    output reg  [63:0]  m_dma_araddr,
    output reg  [7:0]   m_dma_arlen,
    output reg  [2:0]   m_dma_arsize,
    output reg  [1:0]   m_dma_arburst,
    output reg          m_dma_arvalid,
    input  wire         m_dma_arready,

    input  wire [63:0]  m_dma_rdata,
    input  wire [1:0]   m_dma_rresp,
    input  wire         m_dma_rlast,
    input  wire         m_dma_rvalid,
    output reg          m_dma_rready,

    output reg  [63:0]  m_dma_awaddr,
    output reg  [7:0]   m_dma_awlen,
    output reg  [2:0]   m_dma_awsize,
    output reg  [1:0]   m_dma_awburst,
    output reg          m_dma_awvalid,
    input  wire         m_dma_awready,

    output reg  [63:0]  m_dma_wdata,
    output reg  [7:0]   m_dma_wstrb,
    output reg          m_dma_wlast,
    output reg          m_dma_wvalid,
    input  wire         m_dma_wready,

    input  wire [1:0]   m_dma_bresp,
    input  wire         m_dma_bvalid,
    output reg          m_dma_bready
);

    // =========================================================================
    // TLP field extraction from Beat 0 ({DW1, DW0} in tdata[63:0])
    //
    // PCIe TLP DW0 at tdata[31:0] (natural bit order, MSB at bit 31):
    //   [31:29] = fmt[2:0]
    //   [28:24] = type[4:0]
    //   [9:0]   = length[9:0]  (in DWORDs)
    //
    // DW1 at tdata[63:32]:
    //   [63:48] = requester_id[15:0]
    //   [47:40] = tag[7:0]
    //   [39:36] = last_be[3:0]
    //   [35:32] = first_be[3:0]
    // =========================================================================

    // RX tuser BAR-hit bits: tuser[14:8] = bar_hit[6:0] (one-hot)
    wire       rx_err     = m_axis_rx_tuser[21];
    wire [6:0] bar_hit    = m_axis_rx_tuser[14:8];
    wire       is_bar0    = bar_hit[0];   // BAR0 = CSR
    wire       is_bar2    = bar_hit[2];   // BAR2 = DMA (64-bit prefetchable)

    // DW0 fields (beat 0, lower DW)
    wire [2:0]  tlp_fmt    = m_axis_rx_tdata[31:29];
    wire [4:0]  tlp_type   = m_axis_rx_tdata[28:24];
    wire [9:0]  tlp_length = m_axis_rx_tdata[9:0];

    // DW1 fields (beat 0, upper DW)
    wire [15:0] tlp_req_id   = m_axis_rx_tdata[63:48];
    wire [7:0]  tlp_tag      = m_axis_rx_tdata[47:40];
    wire [3:0]  tlp_last_be  = m_axis_rx_tdata[39:36];
    wire [3:0]  tlp_first_be = m_axis_rx_tdata[35:32];

    // TLP type decode (fmt[2:1]=data/addr, type identifies packet type)
    wire is_mrd32 = (tlp_fmt == 3'b000) && (tlp_type == 5'h00);  // MRd32
    wire is_mrd64 = (tlp_fmt == 3'b001) && (tlp_type == 5'h00);  // MRd64
    wire is_mwr32 = (tlp_fmt == 3'b010) && (tlp_type == 5'h00);  // MWr32
    wire is_mwr64 = (tlp_fmt == 3'b011) && (tlp_type == 5'h00);  // MWr64
    wire is_cpld  = (tlp_fmt == 3'b010) && (tlp_type == 5'h0A);  // CplD

    // =========================================================================
    // RX State Machine
    // Parses multi-beat TLPs from the 64-bit AXI-Stream interface.
    // =========================================================================
    localparam [2:0]
        RX_IDLE       = 3'd0,
        RX_BEAT1      = 3'd1,   // Second beat (DW2 / DW2+DW3)
        RX_BEAT2      = 3'd2,   // Third beat (data for MWr64)
        RX_CSR_RESP   = 3'd3,   // Wait for AXI write response
        RX_CSR_READ   = 3'd4,   // Wait for AXI read data
        RX_DMA_RESP   = 3'd5,   // Wait for AXI DMA write response
        RX_DMA_READ   = 3'd6,   // Wait for DMA read data
        RX_DISCARD    = 3'd7;

    reg [2:0]  rx_state;

    // Saved header fields (beat 0)
    reg [2:0]  saved_fmt;
    reg [4:0]  saved_type;
    reg [15:0] saved_req_id;
    reg [7:0]  saved_tag;
    reg [3:0]  saved_first_be;
    reg        saved_bar0;
    reg        saved_bar2;

    // Saved address / data
    reg [31:0] saved_addr_hi;   // For 64-bit address: DW2
    reg [31:0] saved_addr_lo;   // For 64-bit address: DW3 / for 32-bit: DW2
    reg [31:0] saved_wdata;     // Write data
    reg [6:0]  saved_lower_addr;

    // Completion pending
    reg        cpl_pending;
    reg [31:0] cpl_rdata;
    reg [15:0] cpl_req_id;
    reg [7:0]  cpl_tag;
    reg [6:0]  cpl_lower_addr;

    // CSR read pending
    reg        csr_rd_pending;

    always @(posedge clk) begin
        if (!rst_n) begin
            rx_state       <= RX_IDLE;
            m_axis_rx_tready <= 1'b1;
            cpl_pending    <= 1'b0;
            csr_rd_pending <= 1'b0;
            saved_fmt      <= 3'h0;
            saved_type     <= 5'h0;
            saved_req_id   <= 16'h0;
            saved_tag      <= 8'h0;
            saved_first_be <= 4'hF;
            saved_bar0     <= 1'b0;
            saved_bar2     <= 1'b0;
            saved_addr_hi  <= 32'h0;
            saved_addr_lo  <= 32'h0;
            saved_wdata    <= 32'h0;
            saved_lower_addr <= 7'h0;
            cpl_rdata      <= 32'h0;
            cpl_req_id     <= 16'h0;
            cpl_tag        <= 8'h0;
            cpl_lower_addr <= 7'h0;

            m_csr_awaddr   <= 16'h0;
            m_csr_awvalid  <= 1'b0;
            m_csr_wdata    <= 32'h0;
            m_csr_wstrb    <= 4'hF;
            m_csr_wvalid   <= 1'b0;
            m_csr_bready   <= 1'b1;
            m_csr_araddr   <= 16'h0;
            m_csr_arvalid  <= 1'b0;
            m_csr_rready   <= 1'b0;

            m_dma_awaddr   <= 64'h0;
            m_dma_awvalid  <= 1'b0;
            m_dma_wdata    <= 64'h0;
            m_dma_wstrb    <= 8'hFF;
            m_dma_wlast    <= 1'b1;
            m_dma_wvalid   <= 1'b0;
            m_dma_bready   <= 1'b1;
            m_dma_araddr   <= 64'h0;
            m_dma_arvalid  <= 1'b0;
            m_dma_rready   <= 1'b0;
            m_dma_awlen    <= 8'h0;
            m_dma_awsize   <= 3'b011;
            m_dma_awburst  <= 2'b01;
            m_dma_arlen    <= 8'h0;
            m_dma_arsize   <= 3'b011;
            m_dma_arburst  <= 2'b01;
        end else begin
            // -----------------------------------------------------------------
            // Default deasserts
            // -----------------------------------------------------------------
            m_csr_awvalid <= 1'b0;
            m_csr_wvalid  <= 1'b0;
            m_csr_arvalid <= 1'b0;
            m_dma_awvalid <= 1'b0;
            m_dma_wvalid  <= 1'b0;
            m_dma_arvalid <= 1'b0;

            // -----------------------------------------------------------------
            // Clear cpl_pending when the TX state machine has consumed it.
            // tx_cpl_taken is a one-cycle pulse registered in the TX always
            // block below.  cpl_pending must only be driven from THIS always
            // block to avoid a multiple-driver DRC violation (MDRV-1).
            // -----------------------------------------------------------------
            if (tx_cpl_taken)
                cpl_pending <= 1'b0;

            // -----------------------------------------------------------------
            // Capture CSR read data when it arrives from the AXI4-Lite slave
            // -----------------------------------------------------------------
            if (csr_rd_pending && m_csr_rvalid) begin
                cpl_rdata      <= m_csr_rdata;
                csr_rd_pending <= 1'b0;
                cpl_pending    <= 1'b1;
                m_csr_rready   <= 1'b0;
            end

            // -----------------------------------------------------------------
            // RX state machine
            // -----------------------------------------------------------------
            case (rx_state)
                // -------------------------------------------------------------
                // RX_IDLE: wait for first beat of a new TLP
                // -------------------------------------------------------------
                RX_IDLE: begin
                    m_axis_rx_tready <= 1'b1;
                    if (m_axis_rx_tvalid && !rx_err) begin
                        // Capture beat-0 header fields
                        saved_fmt      <= tlp_fmt;
                        saved_type     <= tlp_type;
                        saved_req_id   <= tlp_req_id;
                        saved_tag      <= tlp_tag;
                        saved_first_be <= tlp_first_be;
                        saved_bar0     <= is_bar0;
                        saved_bar2     <= is_bar2;
                        rx_state       <= RX_BEAT1;
                    end else if (m_axis_rx_tvalid && rx_err) begin
                        rx_state <= RX_DISCARD;
                    end
                end

                // -------------------------------------------------------------
                // RX_BEAT1: second beat — contains address (and data for MWr32)
                //   tdata[31:0]  = DW2 = 32-bit address (MRd32/MWr32)
                //                       or addr_hi (MRd64/MWr64)
                //   tdata[63:32] = DW3 = write data (MWr32)
                //                       or addr_lo (MRd64/MWr64)
                // -------------------------------------------------------------
                RX_BEAT1: begin
                    m_axis_rx_tready <= 1'b1;
                    if (m_axis_rx_tvalid) begin
                        saved_addr_hi <= m_axis_rx_tdata[31:0];   // DW2
                        saved_addr_lo <= m_axis_rx_tdata[63:32];  // DW3

                        if (saved_fmt[1:0] == 2'b00 ||
                            saved_fmt[1:0] == 2'b10) begin
                            // 3-DW header (32-bit address): fmt[0]=0
                            // addr32 is DW2 = tdata[31:0]
                            // MWr32: data is DW3 = tdata[63:32]
                            // MRd32: tlast here (no data)
                            saved_wdata      <= m_axis_rx_tdata[63:32];
                            saved_lower_addr <= m_axis_rx_tdata[6:0]; // addr[6:0]

                            if (saved_bar0 &&
                                (saved_fmt == 3'b010)) begin
                                // BAR0 MWr32 — issue AXI4-Lite write
                                m_csr_awaddr  <= m_axis_rx_tdata[15:0];
                                m_csr_awvalid <= 1'b1;
                                m_csr_wdata   <= m_axis_rx_tdata[63:32];
                                m_csr_wstrb   <= saved_first_be;
                                m_csr_wvalid  <= 1'b1;
                                rx_state      <= RX_CSR_RESP;
                            end else if (saved_bar0 &&
                                         (saved_fmt == 3'b000)) begin
                                // BAR0 MRd32 — issue AXI4-Lite read
                                m_csr_araddr   <= m_axis_rx_tdata[15:0];
                                m_csr_arvalid  <= 1'b1;
                                m_csr_rready   <= 1'b1;
                                cpl_req_id     <= saved_req_id;
                                cpl_tag        <= saved_tag;
                                cpl_lower_addr <= m_axis_rx_tdata[6:0];
                                csr_rd_pending <= 1'b1;
                                rx_state       <= RX_CSR_READ;
                            end else if (saved_bar2 &&
                                         (saved_fmt == 3'b010)) begin
                                // BAR2 MWr32 — AXI4 DMA write (32-bit addr)
                                m_dma_awaddr  <= {32'h0, m_axis_rx_tdata[31:0]};
                                m_dma_awvalid <= 1'b1;
                                m_dma_wdata   <= {32'h0, m_axis_rx_tdata[63:32]};
                                m_dma_wstrb   <= {4'h0, saved_first_be};
                                m_dma_wlast   <= 1'b1;
                                m_dma_wvalid  <= 1'b1;
                                rx_state      <= RX_DMA_RESP;
                            end else if (saved_bar2 &&
                                         (saved_fmt == 3'b000)) begin
                                // BAR2 MRd32 — AXI4 DMA read
                                m_dma_araddr  <= {32'h0, m_axis_rx_tdata[31:0]};
                                m_dma_arvalid <= 1'b1;
                                cpl_req_id    <= saved_req_id;
                                cpl_tag       <= saved_tag;
                                cpl_lower_addr <= m_axis_rx_tdata[6:0];
                                m_dma_rready  <= 1'b1;
                                rx_state      <= RX_DMA_READ;
                            end else if (m_axis_rx_tlast) begin
                                rx_state <= RX_IDLE;
                            end else begin
                                rx_state <= RX_DISCARD;
                            end
                        end else begin
                            // 4-DW header (64-bit address): fmt[0]=1
                            // Beat 1 carries: tdata[31:0]  = DW2 = addr_hi (bits[63:32])
                            //                 tdata[63:32] = DW3 = addr_lo (bits[31:2],PH[1:0])
                            // lower_addr = addr_lo[6:0] = tdata[38:32] (DW3 bits [6:0])
                            saved_lower_addr <= m_axis_rx_tdata[38:32]; // DW3[6:0] = addr_lo[6:0]
                            if (m_axis_rx_tlast) begin
                                // MRd64: no data follows, handle now
                                if (saved_bar0) begin
                                    // BAR0 MRd64: CSR offset from addr_lo[15:0] = DW3[15:0]
                                    m_csr_araddr   <= m_axis_rx_tdata[47:32]; // DW3[15:0]
                                    m_csr_arvalid  <= 1'b1;
                                    m_csr_rready   <= 1'b1;
                                    cpl_req_id     <= saved_req_id;
                                    cpl_tag        <= saved_tag;
                                    cpl_lower_addr <= m_axis_rx_tdata[38:32];
                                    csr_rd_pending <= 1'b1;
                                    rx_state       <= RX_CSR_READ;
                                end else if (saved_bar2) begin
                                    // BAR2 MRd64: full address = {DW2, DW3} = {addr_hi, addr_lo}
                                    // addr_hi (bits[63:32]) is at tdata[31:0]  (DW2 in lower slot)
                                    // addr_lo (bits[31:0])  is at tdata[63:32] (DW3 in upper slot)
                                    m_dma_araddr   <= {m_axis_rx_tdata[31:0],    // DW2 = addr_hi
                                                       m_axis_rx_tdata[63:32]};  // DW3 = addr_lo
                                    m_dma_arvalid  <= 1'b1;
                                    cpl_req_id     <= saved_req_id;
                                    cpl_tag        <= saved_tag;
                                    cpl_lower_addr <= m_axis_rx_tdata[38:32];
                                    m_dma_rready   <= 1'b1;
                                    rx_state       <= RX_DMA_READ;
                                end else begin
                                    rx_state <= RX_IDLE;
                                end
                            end else begin
                                // MWr64 or longer: data in beat 2
                                rx_state <= RX_BEAT2;
                            end
                        end
                    end
                end

                // -------------------------------------------------------------
                // RX_BEAT2: third beat — payload (MWr64 first data DW)
                //   tdata[31:0] = DW4 = first write data DW
                // -------------------------------------------------------------
                RX_BEAT2: begin
                    m_axis_rx_tready <= 1'b1;
                    if (m_axis_rx_tvalid) begin
                        saved_wdata <= m_axis_rx_tdata[31:0];
                        if (saved_bar0) begin
                            // BAR0 MWr64
                            m_csr_awaddr  <= saved_addr_lo[15:0];
                            m_csr_awvalid <= 1'b1;
                            m_csr_wdata   <= m_axis_rx_tdata[31:0];
                            m_csr_wstrb   <= saved_first_be;
                            m_csr_wvalid  <= 1'b1;
                            rx_state      <= RX_CSR_RESP;
                        end else if (saved_bar2) begin
                            // BAR2 MWr64
                            // saved_addr_hi = DW2 (addr[63:32]) and
                            // saved_addr_lo = DW3 (addr[31:0]) saved in RX_BEAT1
                            m_dma_awaddr  <= {saved_addr_hi, saved_addr_lo};
                            m_dma_awvalid <= 1'b1;
                            m_dma_wdata   <= {32'h0, m_axis_rx_tdata[31:0]};
                            m_dma_wstrb   <= {4'h0, saved_first_be};
                            m_dma_wlast   <= 1'b1;
                            m_dma_wvalid  <= 1'b1;
                            rx_state      <= RX_DMA_RESP;
                        end else begin
                            rx_state <= RX_DISCARD;
                        end
                    end
                end

                // -------------------------------------------------------------
                // RX_CSR_RESP: wait for AXI4-Lite write response
                // -------------------------------------------------------------
                RX_CSR_RESP: begin
                    m_axis_rx_tready <= 1'b0;
                    if (m_csr_bvalid) begin
                        rx_state <= RX_IDLE;
                    end
                end

                // -------------------------------------------------------------
                // RX_CSR_READ: wait for CSR read data (captured by separate
                //              always block above)
                // -------------------------------------------------------------
                RX_CSR_READ: begin
                    m_axis_rx_tready <= 1'b0;
                    if (!csr_rd_pending) begin
                        rx_state <= RX_IDLE;
                    end
                end

                // -------------------------------------------------------------
                // RX_DMA_RESP: wait for AXI4 DMA write response
                // -------------------------------------------------------------
                RX_DMA_RESP: begin
                    m_axis_rx_tready <= 1'b0;
                    if (m_dma_bvalid) begin
                        rx_state <= RX_IDLE;
                    end
                end

                // -------------------------------------------------------------
                // RX_DMA_READ: wait for DMA read data
                // -------------------------------------------------------------
                RX_DMA_READ: begin
                    m_axis_rx_tready <= 1'b0;
                    if (m_dma_rvalid && m_dma_rlast) begin
                        cpl_rdata    <= m_dma_rdata[31:0];
                        cpl_pending  <= 1'b1;
                        m_dma_rready <= 1'b0;
                        rx_state     <= RX_IDLE;
                    end
                end

                // -------------------------------------------------------------
                // RX_DISCARD: drain remaining beats of an unhandled TLP
                // -------------------------------------------------------------
                RX_DISCARD: begin
                    m_axis_rx_tready <= 1'b1;
                    if (m_axis_rx_tvalid && m_axis_rx_tlast)
                        rx_state <= RX_IDLE;
                end

                default: rx_state <= RX_IDLE;
            endcase
        end
    end

    // =========================================================================
    // TX State Machine — Send Completion with Data (CplD) TLPs
    //
    // CplD format (3-DW header + 1 DW data), 64-bit AXI-Stream encoding:
    //
    //   Beat 0: tdata = {DW1, DW0}
    //     DW0[31:29] = fmt  = 3'b010 (has data, no digest)
    //     DW0[28:24] = type = 5'h0A  (Completion)
    //     DW0[9:0]   = length = 10'd1  (1 DWORD payload)
    //     DW1[31:16] = completer_id
    //     DW1[15:13] = status = 3'b000  (Successful Completion)
    //     DW1[12]    = BCM    = 1'b0
    //     DW1[11:0]  = byte_count = 12'd4
    //
    //   Beat 1: tdata = {DW3, DW2}  (tlast=1)
    //     DW2[31:16] = requester_id
    //     DW2[15:8]  = tag
    //     DW2[7]     = 1'b0 (reserved)
    //     DW2[6:0]   = lower_addr
    //     DW3[31:0]  = read data payload
    // =========================================================================

    localparam [1:0]
        TX_IDLE  = 2'd0,
        TX_BEAT0 = 2'd1,   // send {DW1, DW0}
        TX_BEAT1 = 2'd2;   // send {DW3(data), DW2}

    reg [1:0]  tx_state;
    reg        tx_cpl_taken;

    always @(posedge clk) begin
        if (!rst_n) begin
            tx_state       <= TX_IDLE;
            s_axis_tx_tvalid <= 1'b0;
            s_axis_tx_tdata  <= 64'h0;
            s_axis_tx_tkeep  <= 8'h0;
            s_axis_tx_tlast  <= 1'b0;
            s_axis_tx_tuser  <= 4'h0;
            tx_cpl_taken     <= 1'b0;
        end else begin
            tx_cpl_taken <= 1'b0;

            case (tx_state)
                // -------------------------------------------------------------
                // TX_IDLE: wait for a completion to send
                // -------------------------------------------------------------
                TX_IDLE: begin
                    s_axis_tx_tvalid <= 1'b0;
                    if (cpl_pending) begin
                        tx_cpl_taken   <= 1'b1;   // signal to clear cpl_pending
                        tx_state       <= TX_BEAT0;
                    end
                end

                // -------------------------------------------------------------
                // TX_BEAT0: transmit {DW1, DW0} of CplD
                // -------------------------------------------------------------
                TX_BEAT0: begin
                    if (s_axis_tx_tready || !s_axis_tx_tvalid) begin
                        // DW0 (lower 32 bits)
                        s_axis_tx_tdata[31:29] <= 3'b010;   // fmt: has data
                        s_axis_tx_tdata[28:24] <= 5'h0A;    // type: Cpl
                        s_axis_tx_tdata[23:10] <= 14'h0;    // reserved/TC/attr
                        s_axis_tx_tdata[9:0]   <= 10'd1;    // length = 1 DW
                        // DW1 (upper 32 bits)
                        s_axis_tx_tdata[63:48] <= completer_id;
                        s_axis_tx_tdata[47:45] <= 3'b000;   // status: success
                        s_axis_tx_tdata[44]    <= 1'b0;     // BCM
                        s_axis_tx_tdata[43:32] <= 12'd4;    // byte count = 4

                        s_axis_tx_tkeep  <= 8'hFF;
                        s_axis_tx_tlast  <= 1'b0;
                        s_axis_tx_tvalid <= 1'b1;
                        s_axis_tx_tuser  <= 4'b0001;  // is_sof = bit[0]
                        tx_state         <= TX_BEAT1;
                    end
                end

                // -------------------------------------------------------------
                // TX_BEAT1: transmit {DW3(data), DW2} of CplD  (tlast=1)
                // -------------------------------------------------------------
                TX_BEAT1: begin
                    if (s_axis_tx_tready || !s_axis_tx_tvalid) begin
                        // DW2 (lower 32 bits)
                        s_axis_tx_tdata[31:16] <= cpl_req_id;
                        s_axis_tx_tdata[15:8]  <= cpl_tag;
                        s_axis_tx_tdata[7]     <= 1'b0;
                        s_axis_tx_tdata[6:0]   <= cpl_lower_addr;
                        // DW3 (upper 32 bits) = read data
                        s_axis_tx_tdata[63:32] <= cpl_rdata;

                        s_axis_tx_tkeep  <= 8'hFF;
                        s_axis_tx_tlast  <= 1'b1;
                        s_axis_tx_tvalid <= 1'b1;
                        s_axis_tx_tuser  <= 4'b0000;  // not SOF; EOF in tkeep
                        tx_state         <= TX_IDLE;
                    end
                end

                default: tx_state <= TX_IDLE;
            endcase

            // Deassert valid after transfer is accepted
            if (s_axis_tx_tvalid && s_axis_tx_tready && s_axis_tx_tlast) begin
                s_axis_tx_tvalid <= 1'b0;
                s_axis_tx_tlast  <= 1'b0;
            end
        end
    end

endmodule
