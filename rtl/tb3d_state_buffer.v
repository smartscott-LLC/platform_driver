// =============================================================================
// Module  : tb3d_state_buffer
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_state_buffer.v
//
// Purpose : State Buffer — dedicated 4-bit per-entry metadata lane that
//           shadows the Dragonfly Cache's color nibble for rapid look-ahead
//           without a full decode.
//
//           Equivalent to the C type tb3d_state_buffer_t and the functions:
//             tb3d_state_buffer_push  — append a color nibble
//             tb3d_state_buffer_read  — indexed random-access read
//             tb3d_state_buffer_fill  — bulk fill from an array of TB3-D bytes
//
// Architecture:
//   - Synchronous single-port BRAM (inferred) with 4-bit data width
//   - Linear (non-circular) storage: fill grows the write pointer;
//     push appends at the write pointer
//   - Random-access indexed read: rd_index → rd_color_o (1-cycle latency)
//   - Bulk fill: asserted fill_valid with fill_byte_i for COUNT cycles;
//               the color nibble is extracted in hardware each cycle
//   - capacity is set by parameter DEPTH; push/fill_valid are gated by full
//
// Parameters:
//   DEPTH  — maximum entries (default 4096, matching TB3D_CACHE_DEFAULT_CAPACITY)
//   ADDR_W — ceil(log2(DEPTH))
// =============================================================================

`timescale 1ns / 1ps

module tb3d_state_buffer #(
    parameter DEPTH  = 4096,
    parameter ADDR_W = 12
) (
    input  wire              clk,
    input  wire              rst_n,      // active-low synchronous reset

    // -------------------------------------------------------------------------
    // Push path — append a single color nibble
    // -------------------------------------------------------------------------
    input  wire              push_valid,
    input  wire [3:0]        push_color,  // color nibble [0..15]
    output wire              push_ready,

    // -------------------------------------------------------------------------
    // Fill path — ingest a TB3-D byte; extracts color nibble automatically
    // Assert fill_valid for each byte in the batch; back-pressure via fill_ready
    // -------------------------------------------------------------------------
    input  wire              fill_valid,
    input  wire [7:0]        fill_byte,   // TB3-D encoded byte
    output wire              fill_ready,

    // -------------------------------------------------------------------------
    // Indexed read port — 1-cycle latency
    // -------------------------------------------------------------------------
    input  wire [ADDR_W-1:0] rd_index,    // byte index into the buffer
    output reg  [3:0]        rd_color_o,  // color nibble at rd_index
    output reg               rd_valid_o,  // 1 = rd_color_o is valid (index < size)

    // -------------------------------------------------------------------------
    // Status
    // -------------------------------------------------------------------------
    output wire              full,
    output wire              empty,
    output wire [ADDR_W:0]   count
);

    // =========================================================================
    // Storage
    // =========================================================================
    reg [3:0] mem [0:DEPTH-1];

    // =========================================================================
    // Write pointer and count
    // =========================================================================
    reg [ADDR_W-1:0] wr_ptr;
    reg [ADDR_W:0]   cnt;

    assign full        = (cnt == DEPTH[ADDR_W:0]);
    assign empty       = (cnt == {(ADDR_W+1){1'b0}});
    assign count       = cnt;
    assign push_ready  = !full;
    assign fill_ready  = !full;

    // =========================================================================
    // Color nibble extraction from a TB3-D byte
    // The color lane occupies odd bit positions: 1, 3, 5, 7
    // =========================================================================
    wire [3:0] fill_color;
    assign fill_color[0] = fill_byte[1];
    assign fill_color[1] = fill_byte[3];
    assign fill_color[2] = fill_byte[5];
    assign fill_color[3] = fill_byte[7];

    // =========================================================================
    // Write arbitration: fill takes priority over push (hot-path DMA)
    // =========================================================================
    wire do_fill  = fill_valid  && fill_ready;
    wire do_push  = push_valid  && push_ready && !do_fill;
    wire do_write = do_fill || do_push;
    wire [3:0] write_color = do_fill ? fill_color : push_color;

    // =========================================================================
    // Sequential logic
    // =========================================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr <= {ADDR_W{1'b0}};
            cnt    <= {(ADDR_W+1){1'b0}};
        end else begin
            if (do_write) begin
                mem[wr_ptr] <= write_color;
                wr_ptr      <= wr_ptr + {{(ADDR_W-1){1'b0}}, 1'b1};
                cnt         <= cnt + {{ADDR_W{1'b0}}, 1'b1};
            end
        end
    end

    // =========================================================================
    // Indexed read (1-cycle latency, registered output for timing)
    // =========================================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            rd_color_o <= 4'h0;
            rd_valid_o <= 1'b0;
        end else begin
            rd_color_o <= mem[rd_index];
            rd_valid_o <= ({1'b0, rd_index} < cnt);
        end
    end

endmodule
