// =============================================================================
// Module  : tb3d_transcoder
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_transcoder.v
//
// Purpose : Bidirectional lossless bijective converter between standard
//           8-bit legacy bytes and TB3-D encoded bytes.
//
// Forward (legacy → TB3-D):
//   physical = legacy_in[3:0]    (lower nibble becomes the physical plane)
//   color    = legacy_in[7:4]    (upper nibble becomes the color/state plane)
//   tb3d_out = tb3d_encode(physical, color)
//
// Reverse (TB3-D → legacy):
//   {physical, color} = tb3d_decode(tb3d_in)
//   legacy_out = {color[3:0], physical[3:0]}
//
// The round-trip is bijective: for any 8-bit value X,
//   tb3d_transcode_to_legacy( tb3d_transcode_from_legacy(X) ) == X
//
// Latency  : 0 clock cycles (pure combinational)
// Area     : 0 LUTs (wire permutations only)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_transcoder (
    // -------------------------------------------------------------------------
    // Forward path: standard 8-bit byte → TB3-D byte
    // -------------------------------------------------------------------------
    input  wire [7:0] legacy_in,   // Standard 8-bit input byte
    output wire [7:0] tb3d_out,    // Transcoded TB3-D byte

    // -------------------------------------------------------------------------
    // Reverse path: TB3-D byte → standard 8-bit byte
    // -------------------------------------------------------------------------
    input  wire [7:0] tb3d_in,     // TB3-D byte to reverse-transcode
    output wire [7:0] legacy_out   // Recovered standard 8-bit byte
);

    // -------------------------------------------------------------------------
    // Forward path — lower nibble is physical, upper nibble is color
    // -------------------------------------------------------------------------
    wire [3:0] fwd_physical = legacy_in[3:0];
    wire [3:0] fwd_color    = legacy_in[7:4];

    tb3d_encode u_encode (
        .physical (fwd_physical),
        .color    (fwd_color),
        .encoded  (tb3d_out)
    );

    // -------------------------------------------------------------------------
    // Reverse path — de-interleave and reassemble as {color, physical}
    // -------------------------------------------------------------------------
    wire [3:0] rev_physical;
    wire [3:0] rev_color;

    tb3d_decode u_decode (
        .encoded  (tb3d_in),
        .physical (rev_physical),
        .color    (rev_color)
    );

    assign legacy_out = {rev_color, rev_physical};

endmodule
