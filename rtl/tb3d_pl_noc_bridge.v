// =============================================================================
// Module  : tb3d_pl_noc_bridge
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_pl_noc_bridge.v
//
// Purpose : PL ↔ NoC transparent TB3-D logic-injection bridge.
//
//           Sits "in-wire" between the Versal CIPS PL master port (or any
//           AXI4 master in the PL) and a NoC NSU/NMU endpoint, transparently
//           applying TB3-D encoding / decoding to the data payloads so that
//           all traffic flowing through the NoC carries TB3-D encoded binary.
//
//           This makes the TB3-D engine the entity "pulling the strings" behind
//           the chipset — every memory transaction is automatically encoded /
//           decoded without the CPU or MicroBlaze needing any awareness of the
//           transformation.
//
// Data path (COMBINATIONAL throughout — zero pipeline registers on data):
//   Write (CIPS PL → NoC):
//     s_axi_wdata  → 16 × tb3d_encode (combinational) → m_axi_wdata
//     All write-address and write-control signals: direct wire passthrough
//
//   Read (NoC → CIPS PL):
//     m_axi_rdata  → 16 × tb3d_decode (combinational) → s_axi_rdata
//     All read-address and read-control signals: direct wire passthrough
//
//   AXI ID / strobe / burst / len / size / last / resp: pure wire assignments
//
// AXI data width: 128-bit (Versal NoC native; 16 bytes per beat)
//   Each byte encoded independently: [7:4]=color nibble → color input of
//   tb3d_encode; [3:0]=physical nibble → physical input of tb3d_encode.
//   The encoded output byte maps identically to the 128-bit bus lane.
//
// Bypass mode (bypass=1):
//   WDATA and RDATA pass through as-is.  All other signals always pass through.
//   Useful for bring-up or when the bridge is temporarily disabled via CSR.
//
// Block-design connections:
//   s_*  ← CIPS M_AXI_FPD or any PL AXI4 master
//   m_*  → NoC NMU (or AXI SmartConnect → NoC NMU)
//   clk  ← same NoC clock as tb3d_engine_top (pl_clk / noc_clk_gen output)
//   bypass ← CSR bit (tie 1'b0 for normal TB3-D operation)
//
// Target  : Versal Premium VP1802 (VPK180)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_pl_noc_bridge (
    // =========================================================================
    // Clock and reset (same domain as tb3d_engine_top)
    // =========================================================================
    input  wire          clk,
    input  wire          rst_n,

    // =========================================================================
    // AXI4 Slave — CIPS PL Master input (128-bit data)
    // Connect: CIPS M_AXI_FPD (or PL AXI master) → this port
    // =========================================================================
    // Write address channel
    input  wire [63:0]   s_axi_awaddr,
    input  wire [7:0]    s_axi_awlen,
    input  wire [2:0]    s_axi_awsize,
    input  wire [1:0]    s_axi_awburst,
    input  wire [3:0]    s_axi_awid,
    input  wire          s_axi_awvalid,
    output wire          s_axi_awready,

    // Write data channel
    input  wire [127:0]  s_axi_wdata,
    input  wire [15:0]   s_axi_wstrb,
    input  wire          s_axi_wlast,
    input  wire          s_axi_wvalid,
    output wire          s_axi_wready,

    // Write response channel
    output wire [1:0]    s_axi_bresp,
    output wire [3:0]    s_axi_bid,
    output wire          s_axi_bvalid,
    input  wire          s_axi_bready,

    // Read address channel
    input  wire [63:0]   s_axi_araddr,
    input  wire [7:0]    s_axi_arlen,
    input  wire [2:0]    s_axi_arsize,
    input  wire [1:0]    s_axi_arburst,
    input  wire [3:0]    s_axi_arid,
    input  wire          s_axi_arvalid,
    output wire          s_axi_arready,

    // Read data channel
    output wire [127:0]  s_axi_rdata,
    output wire [1:0]    s_axi_rresp,
    output wire [3:0]    s_axi_rid,
    output wire          s_axi_rlast,
    output wire          s_axi_rvalid,
    input  wire          s_axi_rready,

    // =========================================================================
    // AXI4 Master — NoC NMU output (128-bit data)
    // Connect: this port → NoC NMU → LPDDR4 / DDR4
    // =========================================================================
    // Write address channel
    output wire [63:0]   m_axi_awaddr,
    output wire [7:0]    m_axi_awlen,
    output wire [2:0]    m_axi_awsize,
    output wire [1:0]    m_axi_awburst,
    output wire [3:0]    m_axi_awid,
    output wire          m_axi_awvalid,
    input  wire          m_axi_awready,

    // Write data channel
    output wire [127:0]  m_axi_wdata,
    output wire [15:0]   m_axi_wstrb,
    output wire          m_axi_wlast,
    output wire          m_axi_wvalid,
    input  wire          m_axi_wready,

    // Write response channel
    input  wire [1:0]    m_axi_bresp,
    input  wire [3:0]    m_axi_bid,
    input  wire          m_axi_bvalid,
    output wire          m_axi_bready,

    // Read address channel
    output wire [63:0]   m_axi_araddr,
    output wire [7:0]    m_axi_arlen,
    output wire [2:0]    m_axi_arsize,
    output wire [1:0]    m_axi_arburst,
    output wire [3:0]    m_axi_arid,
    output wire          m_axi_arvalid,
    input  wire          m_axi_arready,

    // Read data channel
    input  wire [127:0]  m_axi_rdata,
    input  wire [1:0]    m_axi_rresp,
    input  wire [3:0]    m_axi_rid,
    input  wire          m_axi_rlast,
    input  wire          m_axi_rvalid,
    output wire          m_axi_rready,

    // =========================================================================
    // Bypass control (tie 1'b0 for normal TB3-D operation)
    // =========================================================================
    input  wire          bypass
);

    // =========================================================================
    // AXI4 Control-channel pass-throughs
    // All address, ID, length, size, burst, strobe, last, valid, ready, and
    // response signals are PURE WIRE ASSIGNMENTS — zero logic depth, zero
    // latency, zero LUTs.  Only WDATA and RDATA pass through encode/decode.
    // =========================================================================

    // Write address channel — direct wire-through
    assign m_axi_awaddr  = s_axi_awaddr;
    assign m_axi_awlen   = s_axi_awlen;
    assign m_axi_awsize  = s_axi_awsize;
    assign m_axi_awburst = s_axi_awburst;
    assign m_axi_awid    = s_axi_awid;
    assign m_axi_awvalid = s_axi_awvalid;
    assign s_axi_awready = m_axi_awready;

    // Write data control signals — direct wire-through
    assign m_axi_wstrb   = s_axi_wstrb;
    assign m_axi_wlast   = s_axi_wlast;
    assign m_axi_wvalid  = s_axi_wvalid;
    assign s_axi_wready  = m_axi_wready;

    // Write response channel — direct wire-through
    assign s_axi_bresp   = m_axi_bresp;
    assign s_axi_bid     = m_axi_bid;
    assign s_axi_bvalid  = m_axi_bvalid;
    assign m_axi_bready  = s_axi_bready;

    // Read address channel — direct wire-through
    assign m_axi_araddr  = s_axi_araddr;
    assign m_axi_arlen   = s_axi_arlen;
    assign m_axi_arsize  = s_axi_arsize;
    assign m_axi_arburst = s_axi_arburst;
    assign m_axi_arid    = s_axi_arid;
    assign m_axi_arvalid = s_axi_arvalid;
    assign s_axi_arready = m_axi_arready;

    // Read data control signals — direct wire-through
    assign s_axi_rresp   = m_axi_rresp;
    assign s_axi_rid     = m_axi_rid;
    assign s_axi_rlast   = m_axi_rlast;
    assign s_axi_rvalid  = m_axi_rvalid;
    assign m_axi_rready  = s_axi_rready;

    // =========================================================================
    // Write DATA path — TB3-D encode (combinational, 16 × tb3d_encode)
    //
    // Each input byte layout: [7:4] = color nibble (C), [3:0] = physical (P)
    // Output: TB3-D interleaved byte with physical lane at 0x55, color at 0xAA
    // =========================================================================
    wire [127:0] wdata_encoded;

    genvar wi;
    generate
        for (wi = 0; wi < 16; wi = wi + 1) begin : GEN_WENC
            tb3d_encode u_wenc (
                .physical (s_axi_wdata[wi*8     +: 4]),  // lower nibble
                .color    (s_axi_wdata[wi*8 + 4 +: 4]),  // upper nibble
                .encoded  (wdata_encoded[wi*8   +: 8])
            );
        end
    endgenerate

    // Mux between encoded and raw (bypass mode)
    assign m_axi_wdata = bypass ? s_axi_wdata : wdata_encoded;

    // =========================================================================
    // Read DATA path — TB3-D decode (combinational, 16 × tb3d_decode)
    //
    // Input: TB3-D interleaved byte from NoC RDATA
    // Output byte: [7:4] = recovered color nibble, [3:0] = physical nibble
    // =========================================================================
    wire [127:0] rdata_decoded;

    genvar ri;
    generate
        for (ri = 0; ri < 16; ri = ri + 1) begin : GEN_RDEC
            wire [3:0] rd_phy;
            wire [3:0] rd_col;

            tb3d_decode u_rdec (
                .encoded  (m_axi_rdata[ri*8 +: 8]),
                .physical (rd_phy),
                .color    (rd_col)
            );

            // Repack to {color[3:0], physical[3:0]}
            assign rdata_decoded[ri*8 +: 8] = {rd_col, rd_phy};
        end
    endgenerate

    // Mux between decoded and raw (bypass mode)
    assign s_axi_rdata = bypass ? m_axi_rdata : rdata_decoded;

endmodule
