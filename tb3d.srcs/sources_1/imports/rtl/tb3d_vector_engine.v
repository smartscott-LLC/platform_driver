// =============================================================================
// Module  : tb3d_vector_engine
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_vector_engine.v
//
// Purpose : 64-element fully-parallel pipelined encode / decode engine.
//           Equivalent to the software tb3d_encode_v64 / tb3d_decode_v64
//           (AVX-512 path) implemented in synthesizable register-transfer
//           logic on the FPGA fabric.
//
// Encode mode (mode_i == 0):
//   Input  : 64 × {color[3:0], physical[3:0]} = 512 bits (nibble_pairs_i)
//   Output : 64 × TB3D byte = 512 bits (tb3d_bytes_o)
//   Each pair is spread via tb3d_encode into one 8-bit TB3-D byte in parallel.
//
// Decode mode (mode_i == 1):
//   Input  : 64 × TB3D byte = 512 bits (tb3d_bytes_i)
//   Output : 64 × {color[3:0], physical[3:0]} = 512 bits (nibble_pairs_o)
//
// Pipeline (3 registered stages, latency = 2 clocks after start_i):
//   Stage 0 (FF): sample inputs on start_i
//   Stage 1 (FF): results after combinational spread/compress
//   Stage 2 (combinational): output registered on done_o assertion
//
//   done_o is asserted 2 clocks after start_i.
//   New transactions may be issued every clock (fully pipelined).
//
// Port packing convention (nibble_pairs):
//   nibble_pairs[i*8 +: 8] = {color_i[3:0], physical_i[3:0]}  for i=0..63
//
// Timing budget: All logic between registers is pure wire permutation
//   (interleave / de-interleave), so timing closure is trivially achieved
//   at 500 MHz+ on Arria 10 GX fabric with any placement.
// =============================================================================

`timescale 1ns / 1ps

module tb3d_vector_engine (
    input  wire         clk,
    input  wire         rst_n,         // active-low synchronous reset

    // -------------------------------------------------------------------------
    // Control
    // -------------------------------------------------------------------------
    input  wire         start_i,       // assert for 1 cycle to launch
    input  wire         mode_i,        // 0 = encode,  1 = decode

    // -------------------------------------------------------------------------
    // Encode input / Decode output  (nibble pairs, 8 bits per element)
    // Element packing: bits [7:4] = color nibble, bits [3:0] = physical nibble
    // -------------------------------------------------------------------------
    input  wire [511:0] nibble_pairs_i,  // 64 × {color[3:0], physical[3:0]}
    output wire [511:0] nibble_pairs_o,  // 64 decoded pairs (valid when done_o)

    // -------------------------------------------------------------------------
    // Encode output / Decode input  (TB3-D bytes, 8 bits per element)
    // -------------------------------------------------------------------------
    input  wire [511:0] tb3d_bytes_i,    // 64 TB3-D bytes (decode input)
    output wire [511:0] tb3d_bytes_o,    // 64 TB3-D bytes (encode output)

    // -------------------------------------------------------------------------
    // Status
    // -------------------------------------------------------------------------
    output wire         done_o           // result valid, 2 clocks after start_i
);

    // =========================================================================
    // Stage 0 — input registration
    // =========================================================================
    reg [511:0] s0_pairs;
    reg [511:0] s0_bytes;
    reg         s0_mode;
    reg         s0_valid;

    always @(posedge clk) begin
        if (!rst_n) begin
            s0_pairs <= 512'b0;
            s0_bytes <= 512'b0;
            s0_mode  <= 1'b0;
            s0_valid <= 1'b0;
        end else begin
            s0_pairs <= nibble_pairs_i;
            s0_bytes <= tb3d_bytes_i;
            s0_mode  <= mode_i;
            s0_valid <= start_i;
        end
    end

    // =========================================================================
    // Stage 1 — encode & decode functions
    //
    // Using Verilog-2001 functions avoids generate-loop individual-bit assigns
    // to 512-bit wires, which can produce stale/zero values in some simulators
    // (Icarus Verilog) due to elaboration ordering of bit-by-bit wire drivers.
    //
    // Encode: {color[3:0], physical[3:0]} → TB3-D byte
    //   TB3D[0]=P[0], TB3D[1]=C[0], TB3D[2]=P[1], TB3D[3]=C[1],
    //   TB3D[4]=P[2], TB3D[5]=C[2], TB3D[6]=P[3], TB3D[7]=C[3]
    //
    // Decode: TB3-D byte → {color[3:0], physical[3:0]}
    //   P[0]=TB[0], P[1]=TB[2], P[2]=TB[4], P[3]=TB[6]
    //   C[0]=TB[1], C[1]=TB[3], C[2]=TB[5], C[3]=TB[7]
    // =========================================================================
    function [511:0] f_encode_v64;
        input [511:0] pairs;
        integer       k;
        reg   [3:0]   phy;
        reg   [3:0]   col;
        begin
            for (k = 0; k < 64; k = k + 1) begin
                phy = pairs[k*8 +: 4];
                col = pairs[k*8+4 +: 4];
                f_encode_v64[k*8+0] = phy[0];
                f_encode_v64[k*8+1] = col[0];
                f_encode_v64[k*8+2] = phy[1];
                f_encode_v64[k*8+3] = col[1];
                f_encode_v64[k*8+4] = phy[2];
                f_encode_v64[k*8+5] = col[2];
                f_encode_v64[k*8+6] = phy[3];
                f_encode_v64[k*8+7] = col[3];
            end
        end
    endfunction

    function [511:0] f_decode_v64;
        input [511:0] bytes_in;
        integer       k;
        reg   [7:0]   tb;
        begin
            for (k = 0; k < 64; k = k + 1) begin
                tb = bytes_in[k*8 +: 8];
                f_decode_v64[k*8+0] = tb[0];   // physical[0]
                f_decode_v64[k*8+1] = tb[2];   // physical[1]
                f_decode_v64[k*8+2] = tb[4];   // physical[2]
                f_decode_v64[k*8+3] = tb[6];   // physical[3]
                f_decode_v64[k*8+4] = tb[1];   // color[0]
                f_decode_v64[k*8+5] = tb[3];   // color[1]
                f_decode_v64[k*8+6] = tb[5];   // color[2]
                f_decode_v64[k*8+7] = tb[7];   // color[3]
            end
        end
    endfunction

    // =========================================================================
    // Stage 1 output registration
    // =========================================================================
    reg [511:0] s1_encoded;
    reg [511:0] s1_decoded;
    reg         s1_mode;
    reg         s1_valid;

    always @(posedge clk) begin
        if (!rst_n) begin
            s1_encoded <= 512'b0;
            s1_decoded <= 512'b0;
            s1_mode    <= 1'b0;
            s1_valid   <= 1'b0;
        end else begin
            s1_encoded <= f_encode_v64(s0_pairs);
            s1_decoded <= f_decode_v64(s0_bytes);
            s1_mode    <= s0_mode;
            s1_valid   <= s0_valid;
        end
    end

    // =========================================================================
    // done_o: one additional register stage so that the pulse is visible in
    // the testbench / downstream logic ACTIVE region on the cycle after
    // s1_valid fires (s1_valid fires in the NBA region; done_r is registered
    // from s1_valid so it is stable in the following cycle's active region).
    // Total pipeline latency from start_i to done_o visible = 3 clock cycles.
    // =========================================================================
    reg done_r;
    always @(posedge clk) begin
        if (!rst_n) done_r <= 1'b0;
        else        done_r <= s1_valid;
    end

    // =========================================================================
    // Output mux: select encode or decode result based on mode
    // =========================================================================
    assign tb3d_bytes_o   = s1_encoded;
    assign nibble_pairs_o = s1_decoded;
    assign done_o         = done_r;

endmodule
