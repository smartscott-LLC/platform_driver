// =============================================================================
// Module  : tb3d_bit_accessor
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_bit_accessor.v
//
// Purpose : Bit-level read and read-modify-write unit for a single TB3-D byte.
//
//   Read operations  (combinational, always valid):
//     phys_bit_rd   — the physical bit at nibble position bit_pos
//     state_rd      — the color/state bit at nibble position bit_pos
//                     (0 = TB3D_STATE_GREEN, 1 = TB3D_STATE_RED)
//
//   Write operations (combinational, activated by write_phys / write_state):
//     phys_byte_out — copy of tb3d_byte with physical bit at bit_pos forced
//                     to phys_write_val; unchanged if write_phys == 0
//     state_byte_out— copy of tb3d_byte with color bit at bit_pos forced
//                     to state_write_val; unchanged if write_state == 0
//
// Bit mapping inside a TB3-D byte:
//   nibble pos 0 → encoded bit 0 (physical), bit 1 (color)
//   nibble pos 1 → encoded bit 2 (physical), bit 3 (color)
//   nibble pos 2 → encoded bit 4 (physical), bit 5 (color)
//   nibble pos 3 → encoded bit 6 (physical), bit 7 (color)
//
// Latency  : 0 clock cycles (pure combinational)
// Area     : ~8 LUTs (4×2-input mux for each write-path)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_bit_accessor (
    // -------------------------------------------------------------------------
    // Inputs
    // -------------------------------------------------------------------------
    input  wire [7:0] tb3d_byte,       // TB3-D byte to inspect / modify

    // Nibble bit position to read or write (0 = LSB of nibble, 3 = MSB)
    input  wire [1:0] bit_pos,

    // Physical bit write path
    input  wire       write_phys,      // 1 = update physical bit at bit_pos
    input  wire       phys_write_val,  // new value to write

    // Color / state bit write path
    input  wire       write_state,     // 1 = update color bit at bit_pos
    input  wire       state_write_val, // new value to write (0=GREEN, 1=RED)

    // -------------------------------------------------------------------------
    // Outputs — read
    // -------------------------------------------------------------------------
    output reg        phys_bit_rd,     // Current physical bit at bit_pos
    output reg        state_rd,        // Current color/state bit at bit_pos

    // -------------------------------------------------------------------------
    // Outputs — modified bytes (write paths)
    // -------------------------------------------------------------------------
    output reg  [7:0] phys_byte_out,   // tb3d_byte with physical bit updated
    output reg  [7:0] state_byte_out   // tb3d_byte with color bit updated
);

    // -------------------------------------------------------------------------
    // Read: extract bits from tb3d_byte based on bit_pos
    // Physical bit lives at encoded position bit_pos*2
    // Color bit lives at encoded position bit_pos*2 + 1
    // -------------------------------------------------------------------------
    always @(*) begin
        case (bit_pos)
            2'b00: phys_bit_rd = tb3d_byte[0];
            2'b01: phys_bit_rd = tb3d_byte[2];
            2'b10: phys_bit_rd = tb3d_byte[4];
            2'b11: phys_bit_rd = tb3d_byte[6];
        endcase
    end

    always @(*) begin
        case (bit_pos)
            2'b00: state_rd = tb3d_byte[1];
            2'b01: state_rd = tb3d_byte[3];
            2'b10: state_rd = tb3d_byte[5];
            2'b11: state_rd = tb3d_byte[7];
        endcase
    end

    // -------------------------------------------------------------------------
    // Write physical bit: replace the physical bit at bit_pos with
    // phys_write_val; pass through unchanged if write_phys == 0.
    // -------------------------------------------------------------------------
    always @(*) begin
        phys_byte_out = tb3d_byte;               // default: passthrough
        if (write_phys) begin
            case (bit_pos)
                2'b00: phys_byte_out[0] = phys_write_val;
                2'b01: phys_byte_out[2] = phys_write_val;
                2'b10: phys_byte_out[4] = phys_write_val;
                2'b11: phys_byte_out[6] = phys_write_val;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Write color/state bit: replace the color bit at bit_pos with
    // state_write_val; pass through unchanged if write_state == 0.
    // -------------------------------------------------------------------------
    always @(*) begin
        state_byte_out = tb3d_byte;              // default: passthrough
        if (write_state) begin
            case (bit_pos)
                2'b00: state_byte_out[1] = state_write_val;
                2'b01: state_byte_out[3] = state_write_val;
                2'b10: state_byte_out[5] = state_write_val;
                2'b11: state_byte_out[7] = state_write_val;
            endcase
        end
    end

endmodule
