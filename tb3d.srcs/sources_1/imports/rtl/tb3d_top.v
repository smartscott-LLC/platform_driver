// =============================================================================
// Module  : tb3d_top
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_top.v
//
// Purpose : System-level wrapper for the TB3-D engine targeting AMD Versal
//           Premium VP1802 (VPK180 evaluation board).
//
// Target  : Versal Premium  VP1802-vsva3340-2MP-e-S  (VPK180)
// Tool    : Vivado 2024.x or later
//
// Block-Design integration:
//   Import this file as an RTL source in the Vivado block design.
//   All external ports map directly to Versal PL block-design interfaces.
//
// External interfaces:
//
//   Clocks / reset:
//     pl_clk    — AXI clock from NoC Clock Generator or CIPS pl_clk0 (≥300 MHz)
//     pl_resetn — Active-low synchronous reset from proc_sys_reset (aresetn)
//
//   AXI4-Lite Slave  (S_AXI — 32-bit, 16-bit address):
//     MicroBlaze data AXI master → AXI SmartConnect / NoC NSU → this port.
//     Provides software R/W access to all TB3-D CSR registers.
//
//   AXI4-Stream Slave  (S_AXIS — 512-bit):
//     CIPS AXI DMA MM2S → this port.
//     Raw binary (nibble pairs or TB3-D bytes) flows into the vector engine.
//     If the DMA data width is less than 512 bits, insert tb3d_versal_dma_bridge
//     between the DMA and this port.
//
//   AXI4-Stream Master  (M_AXIS — 512-bit):
//     This port → CIPS AXI DMA S2MM.
//     TB3-D folded output (encode mode) or decoded nibble pairs (decode mode).
//
//   AXI4 Master  (M_AXI — 64-bit address, 64-bit data):
//     This port → NoC NMU → LPDDR4 / DDR4 memory controller.
//     Used by the internal DMA controller for scatter-gather memory transfers.
//
//   Interrupt:
//     pl_irq — level signal to CIPS pl_ps_irq0 input.
//
//   Board I/O:
//     led[3:0] — VPK180 LVCMOS18 LEDs (DS17 / DS18 / DS19 / DS20)
//       led[0] = engine ready (always 1 after reset)
//       led[1] = interrupt / DMA active
//       led[2] = heartbeat blink (~4.5 Hz at 300 MHz)
//       led[3] = spare (low)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_top (
    // =========================================================================
    // Clock and reset
    // pl_clk driven by CIPS pl_clk0 or NoC clock generator output.
    // pl_resetn driven by proc_sys_reset aresetn (active-low, synchronous).
    // =========================================================================
    input  wire         pl_clk,
    input  wire         pl_resetn,

    // =========================================================================
    // AXI4-Lite Slave — CSR
    // MicroBlaze AXI master → AXI SmartConnect / NoC NSU → this interface
    // =========================================================================
    input  wire [15:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,

    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,

    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,

    input  wire [15:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,

    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    // =========================================================================
    // AXI4-Stream Slave — CIPS AXI DMA MM2S → engine (raw binary in)
    // =========================================================================
    input  wire [511:0] s_axis_tdata,
    input  wire         s_axis_tvalid,
    output wire         s_axis_tready,
    input  wire         s_axis_tlast,

    // =========================================================================
    // AXI4-Stream Master — engine → CIPS AXI DMA S2MM (TB3-D folded out)
    // =========================================================================
    output wire [511:0] m_axis_tdata,
    output wire         m_axis_tvalid,
    input  wire         m_axis_tready,
    output wire         m_axis_tlast,

    // =========================================================================
    // AXI4 Master — internal DMA controller → NoC NMU → LPDDR4 / DDR4
    // =========================================================================
    output wire [63:0]  m_axi_araddr,
    output wire [7:0]   m_axi_arlen,
    output wire [2:0]   m_axi_arsize,
    output wire [1:0]   m_axi_arburst,
    output wire [3:0]   m_axi_arid,
    output wire         m_axi_arvalid,
    input  wire         m_axi_arready,

    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire [3:0]   m_axi_rid,
    input  wire         m_axi_rvalid,
    output wire         m_axi_rready,

    output wire [63:0]  m_axi_awaddr,
    output wire [7:0]   m_axi_awlen,
    output wire [2:0]   m_axi_awsize,
    output wire [1:0]   m_axi_awburst,
    output wire [3:0]   m_axi_awid,
    output wire         m_axi_awvalid,
    input  wire         m_axi_awready,

    output wire [63:0]  m_axi_wdata,
    output wire [7:0]   m_axi_wstrb,
    output wire         m_axi_wlast,
    output wire         m_axi_wvalid,
    input  wire         m_axi_wready,

    input  wire [1:0]   m_axi_bresp,
    input  wire [3:0]   m_axi_bid,
    input  wire         m_axi_bvalid,
    output wire         m_axi_bready,

    // =========================================================================
    // Interrupt — level output to CIPS pl_ps_irq0
    // =========================================================================
    output wire         pl_irq,

    // =========================================================================
    // Board I/O — VPK180 LVCMOS18 LEDs (DS17 / DS18 / DS19 / DS20)
    // =========================================================================
    output reg  [3:0]   led
);

    // =========================================================================
    // Internal interrupt signal from engine
    // =========================================================================
    wire intr_req_raw;

    // =========================================================================
    // TB3-D Engine Top instantiation
    // =========================================================================
    tb3d_engine_top u_engine (
        .clk              (pl_clk),
        .rst_n            (pl_resetn),

        // AXI4-Lite CSR
        .s_axi_awaddr     (s_axi_awaddr),
        .s_axi_awvalid    (s_axi_awvalid),
        .s_axi_awready    (s_axi_awready),
        .s_axi_wdata      (s_axi_wdata),
        .s_axi_wstrb      (s_axi_wstrb),
        .s_axi_wvalid     (s_axi_wvalid),
        .s_axi_wready     (s_axi_wready),
        .s_axi_bresp      (s_axi_bresp),
        .s_axi_bvalid     (s_axi_bvalid),
        .s_axi_bready     (s_axi_bready),
        .s_axi_araddr     (s_axi_araddr),
        .s_axi_arvalid    (s_axi_arvalid),
        .s_axi_arready    (s_axi_arready),
        .s_axi_rdata      (s_axi_rdata),
        .s_axi_rresp      (s_axi_rresp),
        .s_axi_rvalid     (s_axi_rvalid),
        .s_axi_rready     (s_axi_rready),

        // AXI4 master → NoC NMU
        .m_axi_araddr     (m_axi_araddr),
        .m_axi_arlen      (m_axi_arlen),
        .m_axi_arsize     (m_axi_arsize),
        .m_axi_arburst    (m_axi_arburst),
        .m_axi_arid       (m_axi_arid),
        .m_axi_arvalid    (m_axi_arvalid),
        .m_axi_arready    (m_axi_arready),
        .m_axi_rdata      (m_axi_rdata),
        .m_axi_rresp      (m_axi_rresp),
        .m_axi_rlast      (m_axi_rlast),
        .m_axi_rid        (m_axi_rid),
        .m_axi_rvalid     (m_axi_rvalid),
        .m_axi_rready     (m_axi_rready),
        .m_axi_awaddr     (m_axi_awaddr),
        .m_axi_awlen      (m_axi_awlen),
        .m_axi_awsize     (m_axi_awsize),
        .m_axi_awburst    (m_axi_awburst),
        .m_axi_awid       (m_axi_awid),
        .m_axi_awvalid    (m_axi_awvalid),
        .m_axi_awready    (m_axi_awready),
        .m_axi_wdata      (m_axi_wdata),
        .m_axi_wstrb      (m_axi_wstrb),
        .m_axi_wlast      (m_axi_wlast),
        .m_axi_wvalid     (m_axi_wvalid),
        .m_axi_wready     (m_axi_wready),
        .m_axi_bresp      (m_axi_bresp),
        .m_axi_bid        (m_axi_bid),
        .m_axi_bvalid     (m_axi_bvalid),
        .m_axi_bready     (m_axi_bready),

        // Interrupt
        .intr_req         (intr_req_raw),

        // AXI4-Stream DMA paths
        .s_axis_tdata     (s_axis_tdata),
        .s_axis_tvalid    (s_axis_tvalid),
        .s_axis_tready    (s_axis_tready),
        .s_axis_tlast     (s_axis_tlast),

        .m_axis_tdata     (m_axis_tdata),
        .m_axis_tvalid    (m_axis_tvalid),
        .m_axis_tready    (m_axis_tready),
        .m_axis_tlast     (m_axis_tlast)
    );

    // =========================================================================
    // Interrupt output
    // Drive the CIPS pl_ps_irq0 level input directly.  The CIPS interrupt
    // controller latches the level; no pulse stretching is required here.
    // =========================================================================
    assign pl_irq = intr_req_raw;

    // =========================================================================
    // Status LEDs (VPK180 — DS17 / DS18 / DS19 / DS20, LVCMOS18)
    // =========================================================================
    reg [25:0] heartbeat_ctr;

    always @(posedge pl_clk) begin
        if (!pl_resetn) begin
            heartbeat_ctr <= 26'h0;
            led           <= 4'b0000;
        end else begin
            heartbeat_ctr <= heartbeat_ctr + 26'd1;
            led[0]        <= 1'b1;                  // engine ready
            led[1]        <= intr_req_raw;           // interrupt / DMA active
            led[2]        <= heartbeat_ctr[25];      // ~4.5 Hz at 300 MHz
            led[3]        <= 1'b0;                   // spare
        end
    end

endmodule
