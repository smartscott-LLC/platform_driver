// =============================================================================
// Module  : tb3d_dragonfly_cache
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_dragonfly_cache.v
//
// Purpose : Dragonfly Cache — a synchronous FIFO ring-buffer that holds TB3-D
//           encoded bytes with an integrated DMA nibble-pair fetch path.
//
//           Equivalent to the C structures tb3d_dragonfly_cache_t and the
//           functions tb3d_cache_push / tb3d_cache_pop / tb3d_cache_peek /
//           tb3d_cache_dma_fetch.
//
// Architecture:
//   - DEPTH × 8-bit synchronous BRAM-mapped ring buffer (inferred SDP RAM)
//   - Separate DEPTH × 4-bit state-shadow buffer (color nibble metadata lane)
//   - Push port   : accepts a pre-encoded TB3-D byte
//   - Pop port    : removes and returns the oldest TB3-D byte
//   - Peek port   : returns the oldest TB3-D byte without removal
//   - DMA fetch port : accepts a nibble-pair {color[3:0], physical[3:0]},
//                      internally encodes it, and writes into the ring buffer
//                      (equivalent to the C DMA path that calls encode_batch
//                       before writing into the cache-line-aligned buffer)
//
// Parameters:
//   DEPTH  — number of TB3-D bytes in the ring buffer (default 512)
//            Must be a power of two to enable modulo-via-masking.
//   ADDR_W — ceil(log2(DEPTH)), default 9
//
// Overflow / Underflow policy:
//   push_ready   = 0 when full  (caller must back-pressure or discard)
//   pop_data_valid = 0 when empty
//   peek_valid   = 0 when empty
//
// Timing:
//   Registered read — pop / peek data available one cycle after request.
//   Push and DMA fetch are registered on the rising clock edge.
// =============================================================================

`timescale 1ns / 1ps

module tb3d_dragonfly_cache #(
    parameter DEPTH  = 512,
    parameter ADDR_W = 9       // must satisfy 2^ADDR_W == DEPTH
) (
    input  wire         clk,
    input  wire         rst_n,         // active-low synchronous reset

    // -------------------------------------------------------------------------
    // Push path — insert a pre-encoded TB3-D byte
    // -------------------------------------------------------------------------
    input  wire         push_valid,    // 1 = caller wants to push
    input  wire [7:0]   push_data,     // TB3-D byte to store
    output wire         push_ready,    // 1 = cache can accept the byte

    // -------------------------------------------------------------------------
    // Pop path — read and remove the oldest TB3-D byte
    // -------------------------------------------------------------------------
    input  wire         pop_req,       // 1 = caller wants to pop
    output reg  [7:0]   pop_data,      // TB3-D byte (valid when pop_data_valid)
    output reg          pop_data_valid,// 1 = pop_data is valid

    // -------------------------------------------------------------------------
    // Peek path — read the oldest byte without removing it
    // -------------------------------------------------------------------------
    output reg  [7:0]   peek_data,     // front-of-queue TB3-D byte
    output wire         peek_valid,    // 1 = peek_data is valid (cache non-empty)

    // -------------------------------------------------------------------------
    // DMA fetch path — insert a nibble pair (encode-then-store)
    // Replaces the C function tb3d_cache_dma_fetch for a single element.
    // A burst controller can assert this for multiple consecutive cycles.
    // -------------------------------------------------------------------------
    input  wire         dma_valid,     // 1 = nibble pair arriving from DMA
    input  wire [7:0]   dma_pair,      // {color[3:0], physical[3:0]}
    output wire         dma_ready,     // 1 = cache can accept the DMA entry

    // -------------------------------------------------------------------------
    // Status
    // -------------------------------------------------------------------------
    output wire                  full,
    output wire                  empty,
    output wire [ADDR_W:0]       count   // valid entries (0 .. DEPTH)
);

    // =========================================================================
    // Internal BRAM-inferred ring buffers
    // =========================================================================
    reg [7:0] mem [0:DEPTH-1];          // main TB3-D byte storage
    reg [3:0] smem[0:DEPTH-1];          // state / color nibble shadow lane

    // =========================================================================
    // Head / tail / count pointers
    // =========================================================================
    reg [ADDR_W-1:0] wr_ptr;    // next write slot
    reg [ADDR_W-1:0] rd_ptr;    // next read slot
    reg [ADDR_W:0]   cnt;       // number of occupied entries

    assign full      = (cnt == DEPTH[ADDR_W:0]);
    assign empty     = (cnt == {(ADDR_W+1){1'b0}});
    assign count     = cnt;
    assign push_ready = !full;
    assign dma_ready  = !full;
    assign peek_valid = !empty;

    // =========================================================================
    // Write arbitration: DMA fetch has priority over scalar push
    // (mirrors the C spec where dma_fetch is the hot-path DMA lane)
    // =========================================================================
    wire do_dma_write   = dma_valid  && dma_ready;
    wire do_push_write  = push_valid && push_ready && !do_dma_write;
    wire do_write       = do_dma_write || do_push_write;

    // Encode the DMA nibble pair on the fly
    wire [3:0] dma_physical = dma_pair[3:0];
    wire [3:0] dma_color    = dma_pair[7:4];
    wire [7:0] dma_encoded;

    tb3d_encode u_dma_encode (
        .physical (dma_physical),
        .color    (dma_color),
        .encoded  (dma_encoded)
    );

    wire [7:0]  write_byte  = do_dma_write ? dma_encoded  : push_data;
    wire [3:0]  write_color = do_dma_write ? dma_color     : push_data[7:4];
                // For scalar push the color nibble is extracted from the
                // already-encoded TB3-D byte for the state-shadow lane.
                // Correct extraction: color is at odd bit positions.
    wire [3:0]  push_color_shadow;
    assign push_color_shadow[0] = push_data[1];
    assign push_color_shadow[1] = push_data[3];
    assign push_color_shadow[2] = push_data[5];
    assign push_color_shadow[3] = push_data[7];

    wire [3:0] shadow_color = do_dma_write ? dma_color : push_color_shadow;

    // =========================================================================
    // Pop / pop arbitration
    // =========================================================================
    wire do_pop = pop_req && !empty;

    // =========================================================================
    // Sequential logic
    // =========================================================================
    integer j;

    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr <= {ADDR_W{1'b0}};
            rd_ptr <= {ADDR_W{1'b0}};
            cnt    <= {(ADDR_W+1){1'b0}};
            pop_data_valid <= 1'b0;
            pop_data       <= 8'h00;
            peek_data      <= 8'h00;
        end else begin
            // ------------------------------------------------------------------
            // Write
            // ------------------------------------------------------------------
            if (do_write) begin
                mem [wr_ptr] <= write_byte;
                smem[wr_ptr] <= shadow_color;
                wr_ptr       <= wr_ptr + {{(ADDR_W-1){1'b0}}, 1'b1};
            end

            // ------------------------------------------------------------------
            // Pop
            // ------------------------------------------------------------------
            pop_data_valid <= 1'b0;
            if (do_pop) begin
                pop_data       <= mem[rd_ptr];
                pop_data_valid <= 1'b1;
                rd_ptr         <= rd_ptr + {{(ADDR_W-1){1'b0}}, 1'b1};
            end

            // ------------------------------------------------------------------
            // Peek (combinational read; registered for timing)
            // ------------------------------------------------------------------
            peek_data <= mem[rd_ptr];

            // ------------------------------------------------------------------
            // Count update
            // ------------------------------------------------------------------
            case ({do_write, do_pop})
                2'b10:   cnt <= cnt + {{ADDR_W{1'b0}}, 1'b1};
                2'b01:   cnt <= cnt - {{ADDR_W{1'b0}}, 1'b1};
                default: cnt <= cnt;
            endcase
        end
    end

endmodule
