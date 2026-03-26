// =============================================================================
// Module  : tb3d_gtyp_xcvr
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_gtyp_xcvr.v
//
// Purpose : GTYP Transceiver TB3-D Encode/Decode bridge.
//           Sits between the Versal GTYP transceiver user interface (generated
//           by the GT Wizard or connected directly to GTYPX1 primitives) and
//           the fabric AXI4-Stream data path.  Transparently applies TB3-D
//           encoding to outbound (TX) data and TB3-D decoding to inbound (RX)
//           data, keeping the logic "in-wire" — all encode/decode paths are
//           purely combinational (zero register latency on data).
//
// Target  : Versal Premium VP1802 (VPK180) — GTYP SerDes (64-bit user bus)
//
// TX path  (fabric → GT serialiser, 64-bit / 8 bytes per clock):
//   AXI4-Stream slave → 8 × tb3d_encode (combinational) → gt_txdata[63:0]
//   Each input byte convention: [7:4] = color nibble, [3:0] = physical nibble.
//   The GT transceiver then serialises the TB3-D encoded stream at line rate.
//
// RX path  (GT deserialiser → fabric, 64-bit / 8 bytes per clock):
//   gt_rxdata[63:0] → 8 × tb3d_decode (combinational) → AXI4-Stream master
//   Each decoded byte: [7:4] = recovered color nibble, [3:0] = physical nibble.
//
// Bypass mode (bypass=1):
//   Data passes through unmodified in both directions.  Useful for GT
//   loopback testing and standalone board-bring-up without TB3-D encoding.
//
// Block-design connections:
//   gt_txdata[63:0]  → GTYP GT_TX0_TXDATA[63:0]  (or GT Wizard TXDATA)
//   gt_rxdata[63:0]  ← GTYP GT_RX0_RXDATA[63:0]  (or GT Wizard RXDATA)
//   gt_txcharisk[7:0]→ GTYP GT_TX0_TXCHARISK[7:0] (tie all zero)
//   S_AXIS           ← CIPS AXI DMA MM2S or upstream fabric producer
//   M_AXIS           → CIPS AXI DMA S2MM or downstream fabric consumer
// =============================================================================

`timescale 1ns / 1ps

module tb3d_gtyp_xcvr (
    // =========================================================================
    // Clocks and reset
    //   gt_txusrclk2 : TX user clock from GTYP (line_rate / 66 or / 40)
    //   gt_rxusrclk2 : RX user clock from GTYP
    //   rst_n        : active-low synchronous reset; drive from
    //                  gt_tx_reset_done & gt_rx_reset_done (ANDed)
    // =========================================================================
    input  wire        gt_txusrclk2,
    input  wire        gt_rxusrclk2,
    input  wire        rst_n,

    // =========================================================================
    // AXI4-Stream Slave — fabric TX data in (raw binary, 64-bit / 8 bytes)
    //   Connect to the AXI DMA MM2S output or the engine M_AXIS port.
    //   TREADY is permanently asserted; the GT serialiser always accepts data.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 8, HAS_TREADY 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0" *)
    input  wire [63:0] s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
    input  wire        s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
    output wire        s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
    input  wire        s_axis_tlast,

    // =========================================================================
    // AXI4-Stream Master — fabric RX data out (TB3-D decoded, 64-bit / 8 bytes)
    //   Connect to the AXI DMA S2MM input or the engine S_AXIS port.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 8, HAS_TREADY 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0" *)
    output wire [63:0] m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
    output wire        m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
    input  wire        m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
    output wire        m_axis_tlast,

    // =========================================================================
    // GTYP Parallel Data Interface
    //   gt_txdata     : 64-bit TX parallel data to GTYP serialiser
    //   gt_rxdata     : 64-bit RX parallel data from GTYP deserialiser
    //   gt_txcharisk  : 8-bit K-character indicators (tied zero — no K-chars
    //                   in TB3-D stream; 64b/66b scrambling handles framing)
    //   gt_rxcharisk  : 8-bit RX K-char indicators (accepted; not used here)
    // =========================================================================
    output wire [63:0] gt_txdata,
    input  wire [63:0] gt_rxdata,
    output wire [7:0]  gt_txcharisk,
    input  wire [7:0]  gt_rxcharisk,

    // =========================================================================
    // Bypass control
    //   bypass = 0 : TB3-D encode TX, decode RX (normal operation)
    //   bypass = 1 : pass raw data unchanged (loopback / test mode)
    //   Connect to a CSR bit in tb3d_engine_top or tie to 1'b0.
    // =========================================================================
    input  wire        bypass
);

    // =========================================================================
    // TX path — 8 parallel tb3d_encode instances (combinational, zero latency)
    //
    // Input byte layout per element i (s_axis_tdata[i*8 +: 8]):
    //   [7:4] = color nibble   (C)
    //   [3:0] = physical nibble (P)
    //
    // Output: TB3-D interleaved byte at gt_txdata[i*8 +: 8]
    //   bit 0 = P[0],  bit 1 = C[0],  bit 2 = P[1],  bit 3 = C[1]
    //   bit 4 = P[2],  bit 5 = C[2],  bit 6 = P[3],  bit 7 = C[3]
    // =========================================================================
    wire [63:0] tx_encoded;

    genvar tx_i;
    generate
        for (tx_i = 0; tx_i < 8; tx_i = tx_i + 1) begin : GEN_TX_ENC
            tb3d_encode u_tx_enc (
                .physical (s_axis_tdata[tx_i*8     +: 4]),  // lower nibble
                .color    (s_axis_tdata[tx_i*8 + 4 +: 4]),  // upper nibble
                .encoded  (tx_encoded   [tx_i*8     +: 8])
            );
        end
    endgenerate

    // Mux: bypass passes raw data, normal routes TB3-D encoded data
    assign gt_txdata    = bypass ? s_axis_tdata : tx_encoded;
    assign gt_txcharisk = 8'h00;  // no K-characters in TB3-D stream

    // TX flow-control: GT serialiser always accepts data (no back-pressure)
    assign s_axis_tready = 1'b1;

    // =========================================================================
    // RX path — 8 parallel tb3d_decode instances (combinational, zero latency)
    //
    // Input: TB3-D interleaved byte from GT deserialiser (gt_rxdata[i*8 +: 8])
    // Output per element i (m_axis_tdata[i*8 +: 8]):
    //   [7:4] = recovered color nibble
    //   [3:0] = recovered physical nibble
    // =========================================================================
    wire [63:0] rx_decoded;

    genvar rx_i;
    generate
        for (rx_i = 0; rx_i < 8; rx_i = rx_i + 1) begin : GEN_RX_DEC
            wire [3:0] rx_phy;
            wire [3:0] rx_col;

            tb3d_decode u_rx_dec (
                .encoded  (gt_rxdata [rx_i*8 +: 8]),
                .physical (rx_phy),
                .color    (rx_col)
            );

            // Repack decoded nibbles as {color[3:0], physical[3:0]}
            assign rx_decoded[rx_i*8 +: 8] = {rx_col, rx_phy};
        end
    endgenerate

    // Mux: bypass or decoded data
    assign m_axis_tdata = bypass ? gt_rxdata : rx_decoded;

    // =========================================================================
    // RX AXI-Stream valid / last handshaking
    //
    // The GTYP deserialiser presents new 64-bit data every RX user clock cycle
    // once the CDR is locked.  We register TVALID and TLAST using gt_rxusrclk2
    // to form a clean AXI4-Stream source.
    //
    // TLAST is derived from gt_rxcharisk[0]: a K-character on lane 0 marks the
    // end of a TB3-D packet boundary (e.g. 64b/66b sync word or an application-
    // level frame marker inserted by the remote transmitter).  In 64b/66b mode
    // the GT Wizard filters K-characters internally; in 8b/10b mode K28.5 (0xBC)
    // is the standard comma character used for alignment.
    // =========================================================================
    reg rx_valid_r;
    reg rx_last_r;

    always @(posedge gt_rxusrclk2) begin
        if (!rst_n) begin
            rx_valid_r <= 1'b0;
            rx_last_r  <= 1'b0;
        end else begin
            rx_valid_r <= 1'b1;              // data is valid every RX clock when locked
            rx_last_r  <= gt_rxcharisk[0];   // K-char on byte 0 = packet boundary
        end
    end

    assign m_axis_tvalid = rx_valid_r;
    assign m_axis_tlast  = rx_last_r;

endmodule
