// =============================================================================
// Module  : tb3d_encode
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_encode.v
//
// Purpose : Combinational single-byte encoder.
//           Interleaves a 4-bit physical nibble and a 4-bit color/state nibble
//           into a single 8-bit TB3-D byte.
//
// Encoding layout (0-indexed bit positions):
//   encoded[0] = physical[0]   (physical bit 0 → position 0)
//   encoded[1] = color[0]      (color    bit 0 → position 1)
//   encoded[2] = physical[1]   (physical bit 1 → position 2)
//   encoded[3] = color[1]      (color    bit 1 → position 3)
//   encoded[4] = physical[2]   (physical bit 2 → position 4)
//   encoded[5] = color[2]      (color    bit 2 → position 5)
//   encoded[6] = physical[3]   (physical bit 3 → position 6)
//   encoded[7] = color[3]      (color    bit 3 → position 7)
//
//   Physical lane mask : 0x55 = 0101_0101  (bit positions 0, 2, 4, 6)
//   Color lane mask    : 0xAA = 1010_1010  (bit positions 1, 3, 5, 7)
//
// Latency  : 0 clock cycles (pure combinational)
// Area     : 0 LUTs (wiring only — no logic gates required)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_encode (
    // -------------------------------------------------------------------------
    // Inputs
    // -------------------------------------------------------------------------
    input  wire [3:0] physical,   // 4-bit physical nibble  [0..15]
    input  wire [3:0] color,      // 4-bit color/state nibble [0..15]

    // -------------------------------------------------------------------------
    // Output
    // -------------------------------------------------------------------------
    output wire [7:0] encoded     // TB3-D byte  (physical lane @ 0x55,
                                  //              color lane    @ 0xAA)
);

    // -------------------------------------------------------------------------
    // Interleave — pure wire permutation, zero logic depth
    // -------------------------------------------------------------------------
    assign encoded[0] = physical[0];   // P0 → bit 0
    assign encoded[1] = color[0];      // C0 → bit 1
    assign encoded[2] = physical[1];   // P1 → bit 2
    assign encoded[3] = color[1];      // C1 → bit 3
    assign encoded[4] = physical[2];   // P2 → bit 4
    assign encoded[5] = color[2];      // C2 → bit 5
    assign encoded[6] = physical[3];   // P3 → bit 6
    assign encoded[7] = color[3];      // C3 → bit 7

endmodule
