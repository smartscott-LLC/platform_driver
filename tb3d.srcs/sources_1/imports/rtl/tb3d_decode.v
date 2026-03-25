// =============================================================================
// Module  : tb3d_decode
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_decode.v
//
// Purpose : Combinational single-byte decoder.
//           De-interleaves a TB3-D byte into its 4-bit physical nibble and
//           4-bit color/state nibble.
//
// Decoding layout (inverse of tb3d_encode):
//   physical[0] = encoded[0]   (position 0 → physical bit 0)
//   physical[1] = encoded[2]   (position 2 → physical bit 1)
//   physical[2] = encoded[4]   (position 4 → physical bit 2)
//   physical[3] = encoded[6]   (position 6 → physical bit 3)
//   color[0]    = encoded[1]   (position 1 → color bit 0)
//   color[1]    = encoded[3]   (position 3 → color bit 1)
//   color[2]    = encoded[5]   (position 5 → color bit 2)
//   color[3]    = encoded[7]   (position 7 → color bit 3)
//
//   Physical lane mask : 0x55 = 0101_0101  (bit positions 0, 2, 4, 6)
//   Color lane mask    : 0xAA = 1010_1010  (bit positions 1, 3, 5, 7)
//
// Latency  : 0 clock cycles (pure combinational)
// Area     : 0 LUTs (wiring only — no logic gates required)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_decode (
    // -------------------------------------------------------------------------
    // Input
    // -------------------------------------------------------------------------
    input  wire [7:0] encoded,    // TB3-D byte to decode

    // -------------------------------------------------------------------------
    // Outputs
    // -------------------------------------------------------------------------
    output wire [3:0] physical,   // Recovered 4-bit physical nibble  [0..15]
    output wire [3:0] color       // Recovered 4-bit color/state nibble [0..15]
);

    // -------------------------------------------------------------------------
    // De-interleave — pure wire permutation, zero logic depth
    // -------------------------------------------------------------------------
    assign physical[0] = encoded[0];   // bit 0 → P0
    assign physical[1] = encoded[2];   // bit 2 → P1
    assign physical[2] = encoded[4];   // bit 4 → P2
    assign physical[3] = encoded[6];   // bit 6 → P3

    assign color[0]    = encoded[1];   // bit 1 → C0
    assign color[1]    = encoded[3];   // bit 3 → C1
    assign color[2]    = encoded[5];   // bit 5 → C2
    assign color[3]    = encoded[7];   // bit 7 → C3

endmodule
