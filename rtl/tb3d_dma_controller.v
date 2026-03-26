// =============================================================================
// Module  : tb3d_dma_controller
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_dma_controller.v
//
// Purpose : AXI4 master DMA engine.
//
//           Executes linear block transfers between system memory (accessed
//           via the NoC NMU → LPDDR4/DDR4 memory controller) and the
//           Dragonfly Cache.  Two transfer modes are supported:
//
//   MODE 0 — Encode (host → cache):
//     Reads raw nibble-pair bytes from host memory at src_addr,
//     presents them to the Dragonfly Cache's DMA-fetch port (which encodes
//     each nibble-pair on-the-fly before storing), for len bytes.
//
//   MODE 1 — Decode (cache → host):
//     Pops TB3-D bytes from the Dragonfly Cache, encodes them back to
//     nibble-pair format, and writes them to host memory at dst_addr.
//     (In practice the cache already holds TB3-D bytes; this mode simply
//      streams them to the host without any additional transcoding.
//      The host driver interprets the raw TB3-D stream directly.)
//
// AXI4 master interface:
//   Data width  : 64 bits
//   Address width: 64 bits
//   Burst type  : INCR, up to 16 beats per burst (128 bytes per burst)
//   ID width    : 4 bits
//
// State machine overview:
//   IDLE        → wait for start_i
//   RD_ADDR     → issue AXI4 AR request to host memory
//   RD_DATA     → collect AXI4 R beats, feed into Dragonfly Cache
//   WR_ADDR     → issue AXI4 AW request to host memory
//   WR_DATA     → drain Dragonfly Cache, issue AXI4 W beats
//   WR_RESP     → wait for AXI4 B response
//   DONE        → assert done_o for 1 cycle, return to IDLE
// =============================================================================

`timescale 1ns / 1ps

module tb3d_dma_controller (
    input  wire         clk,
    input  wire         rst_n,

    // =========================================================================
    // Control interface (from AXI4-Lite CSR slave)
    // =========================================================================
    input  wire [63:0]  src_addr_i,   // source byte address in host memory
    input  wire [63:0]  dst_addr_i,   // destination byte address in host memory
    input  wire [31:0]  len_i,        // transfer length in bytes
    input  wire         mode_i,       // 0 = encode (host→cache), 1 = decode (cache→host)
    input  wire         start_i,      // pulse high for 1 cycle to begin transfer

    output reg          done_o,       // 1-cycle pulse when transfer completes
    output reg          busy_o,       // high during active transfer
    output reg          error_o,      // latched on AXI4 SLVERR / DECERR

    // =========================================================================
    // AXI4 Master — Read Channel (for encode mode: host → cache)
    // =========================================================================
    output reg  [63:0]  m_axi_araddr,
    output reg  [7:0]   m_axi_arlen,
    output reg  [2:0]   m_axi_arsize,
    output reg  [1:0]   m_axi_arburst,
    output reg  [3:0]   m_axi_arid,
    output reg          m_axi_arvalid,
    input  wire         m_axi_arready,

    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire [3:0]   m_axi_rid,
    input  wire         m_axi_rvalid,
    output reg          m_axi_rready,

    // =========================================================================
    // AXI4 Master — Write Channel (for decode mode: cache → host)
    // =========================================================================
    output reg  [63:0]  m_axi_awaddr,
    output reg  [7:0]   m_axi_awlen,
    output reg  [2:0]   m_axi_awsize,
    output reg  [1:0]   m_axi_awburst,
    output reg  [3:0]   m_axi_awid,
    output reg          m_axi_awvalid,
    input  wire         m_axi_awready,

    output reg  [63:0]  m_axi_wdata,
    output reg  [7:0]   m_axi_wstrb,
    output reg          m_axi_wlast,
    output reg          m_axi_wvalid,
    input  wire         m_axi_wready,

    input  wire [1:0]   m_axi_bresp,
    input  wire [3:0]   m_axi_bid,
    input  wire         m_axi_bvalid,
    output reg          m_axi_bready,

    // =========================================================================
    // Dragonfly Cache interface
    // =========================================================================
    // Encode path: DMA feeds nibble pairs into cache
    output reg          cache_dma_valid,
    output reg  [7:0]   cache_dma_pair,   // {color[3:0], physical[3:0]}
    input  wire         cache_dma_ready,

    // Decode path: DMA pops TB3-D bytes from cache
    output reg          cache_pop_req,
    input  wire [7:0]   cache_pop_data,
    input  wire         cache_pop_valid,

    input  wire         cache_empty,
    input  wire         cache_full
);

    // =========================================================================
    // Constants
    // =========================================================================
    localparam [2:0] AXI_SIZE_8B  = 3'b011;  // 8 bytes per beat
    localparam [1:0] AXI_BURST_INCR = 2'b01;
    localparam [7:0] MAX_BURST_LEN  = 8'd15; // 16 beats × 8 bytes = 128 bytes

    // =========================================================================
    // State encoding
    // =========================================================================
    localparam [3:0]
        ST_IDLE     = 4'd0,
        ST_RD_ADDR  = 4'd1,
        ST_RD_DATA  = 4'd2,
        ST_WR_ADDR  = 4'd3,
        ST_WR_DATA  = 4'd4,
        ST_WR_RESP  = 4'd5,
        ST_DONE     = 4'd6;

    reg [3:0]  state;

    // =========================================================================
    // Transfer tracking registers
    // =========================================================================
    reg [63:0] cur_src;
    reg [63:0] cur_dst;
    reg [31:0] remaining;     // bytes still to transfer
    reg [7:0]  burst_beats;   // beats in current AXI4 burst
    reg [7:0]  beat_cnt;      // beats issued in current burst
    reg        cur_mode;

    // Pack the 8-byte AXI4 read data into 8 cache DMA entries
    // Each byte of the 64-bit word is one nibble-pair entry
    reg [2:0]  rd_byte_idx;   // which byte of the 64-bit word we are feeding

    // =========================================================================
    // Burst length calculation: min(remaining/8, 16) - 1
    // =========================================================================
    wire [31:0] beats_needed = (remaining[31:3] >= 32'd16) ? 32'd16 :
                                (remaining[31:3] == 32'd0)  ? 32'd1  :
                                 remaining[31:3];
    wire [7:0]  next_burst_len = beats_needed[7:0] - 8'd1;

    // =========================================================================
    // Sequential state machine
    // =========================================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            state          <= ST_IDLE;
            done_o         <= 1'b0;
            busy_o         <= 1'b0;
            error_o        <= 1'b0;
            cur_src        <= 64'h0;
            cur_dst        <= 64'h0;
            remaining      <= 32'h0;
            burst_beats    <= 8'h0;
            beat_cnt       <= 8'h0;
            cur_mode       <= 1'b0;
            rd_byte_idx    <= 3'b0;

            m_axi_araddr   <= 64'h0;
            m_axi_arlen    <= 8'h0;
            m_axi_arsize   <= AXI_SIZE_8B;
            m_axi_arburst  <= AXI_BURST_INCR;
            m_axi_arid     <= 4'h0;
            m_axi_arvalid  <= 1'b0;
            m_axi_rready   <= 1'b0;

            m_axi_awaddr   <= 64'h0;
            m_axi_awlen    <= 8'h0;
            m_axi_awsize   <= AXI_SIZE_8B;
            m_axi_awburst  <= AXI_BURST_INCR;
            m_axi_awid     <= 4'h1;
            m_axi_awvalid  <= 1'b0;
            m_axi_wdata    <= 64'h0;
            m_axi_wstrb    <= 8'hFF;
            m_axi_wlast    <= 1'b0;
            m_axi_wvalid   <= 1'b0;
            m_axi_bready   <= 1'b0;

            cache_dma_valid <= 1'b0;
            cache_dma_pair  <= 8'h0;
            cache_pop_req   <= 1'b0;
        end else begin
            done_o          <= 1'b0;
            cache_dma_valid <= 1'b0;
            cache_pop_req   <= 1'b0;

            case (state)
                // --------------------------------------------------------------
                ST_IDLE: begin
                    busy_o  <= 1'b0;
                    error_o <= 1'b0;
                    if (start_i) begin
                        cur_src     <= src_addr_i;
                        cur_dst     <= dst_addr_i;
                        remaining   <= len_i;
                        cur_mode    <= mode_i;
                        busy_o      <= 1'b1;
                        state       <= mode_i ? ST_WR_ADDR : ST_RD_ADDR;
                    end
                end

                // --------------------------------------------------------------
                // Encode mode: read from host memory
                // --------------------------------------------------------------
                ST_RD_ADDR: begin
                    burst_beats   <= next_burst_len;
                    beat_cnt      <= 8'h0;
                    rd_byte_idx   <= 3'b0;

                    m_axi_araddr  <= cur_src;
                    m_axi_arlen   <= next_burst_len;
                    m_axi_arsize  <= AXI_SIZE_8B;
                    m_axi_arburst <= AXI_BURST_INCR;
                    m_axi_arvalid <= 1'b1;
                    m_axi_rready  <= 1'b1;

                    if (m_axi_arvalid && m_axi_arready) begin
                        m_axi_arvalid <= 1'b0;
                        state         <= ST_RD_DATA;
                    end
                end

                ST_RD_DATA: begin
                    if (m_axi_rvalid) begin
                        if (m_axi_rresp != 2'b00) error_o <= 1'b1;

                        // Feed each byte of the 64-bit word to the cache one
                        // at a time over successive cycles using rd_byte_idx.
                        // For simplicity, pack all 8 bytes directly using the
                        // byte indexed into the 64-bit data word.
                        // Assert cache_dma_valid unconditionally when data is
                        // available; do NOT gate VALID on READY — AXI requires
                        // the master to assert VALID independently of READY to
                        // prevent potential deadlock.
                        cache_dma_valid <= 1'b1;
                        cache_dma_pair  <= m_axi_rdata[rd_byte_idx*8 +: 8];

                        if (rd_byte_idx == 3'd7 || remaining <= 32'd1) begin
                            rd_byte_idx <= 3'b0;
                            if (m_axi_rlast || remaining <= 32'd8) begin
                                m_axi_rready <= 1'b0;
                                if (remaining <= {{24{1'b0}}, (burst_beats + 8'd1) << 3})
                                    remaining <= 32'h0;
                                else
                                    remaining <= remaining - {24'h0, (burst_beats + 8'd1) << 3};
                                cur_src <= cur_src + {56'h0, (burst_beats + 8'd1) << 3};
                                state   <= (remaining <= {{24{1'b0}}, (burst_beats + 8'd1) << 3})
                                           ? ST_DONE : ST_RD_ADDR;
                            end
                        end else begin
                            rd_byte_idx <= rd_byte_idx + 3'd1;
                        end
                    end
                end

                // --------------------------------------------------------------
                // Decode mode: write from cache to host memory
                // --------------------------------------------------------------
                ST_WR_ADDR: begin
                    burst_beats    <= next_burst_len;
                    beat_cnt       <= 8'h0;

                    m_axi_awaddr   <= cur_dst;
                    m_axi_awlen    <= next_burst_len;
                    m_axi_awsize   <= AXI_SIZE_8B;
                    m_axi_awburst  <= AXI_BURST_INCR;
                    m_axi_awvalid  <= 1'b1;

                    if (m_axi_awvalid && m_axi_awready) begin
                        m_axi_awvalid <= 1'b0;
                        state         <= ST_WR_DATA;
                    end
                end

                ST_WR_DATA: begin
                    if (!cache_empty && !m_axi_wvalid) begin
                        cache_pop_req <= 1'b1;
                    end

                    if (cache_pop_valid) begin
                        cache_pop_req   <= 1'b0;
                        // Pack 8 cache bytes into one 64-bit AXI4 beat
                        m_axi_wdata     <= {cache_pop_data, cache_pop_data,
                                            cache_pop_data, cache_pop_data,
                                            cache_pop_data, cache_pop_data,
                                            cache_pop_data, cache_pop_data};
                        // In a real implementation, buffer 8 bytes before
                        // issuing the 64-bit beat.  Simplified single-byte
                        // per beat path here; use byte enables to mark valid.
                        m_axi_wstrb     <= 8'h01;
                        m_axi_wlast     <= (beat_cnt == burst_beats);
                        m_axi_wvalid    <= 1'b1;
                    end

                    if (m_axi_wvalid && m_axi_wready) begin
                        m_axi_wvalid <= 1'b0;
                        m_axi_wlast  <= 1'b0;

                        if (remaining <= 32'd1) begin
                            remaining <= 32'h0;
                        end else begin
                            remaining <= remaining - 32'd1;
                        end
                        cur_dst  <= cur_dst + 64'd1;
                        beat_cnt <= beat_cnt + 8'd1;

                        if (beat_cnt == burst_beats) begin
                            state <= ST_WR_RESP;
                        end
                    end
                end

                ST_WR_RESP: begin
                    m_axi_bready <= 1'b1;
                    if (m_axi_bvalid) begin
                        m_axi_bready <= 1'b0;
                        if (m_axi_bresp != 2'b00) error_o <= 1'b1;
                        state <= (remaining == 32'h0) ? ST_DONE : ST_WR_ADDR;
                    end
                end

                // --------------------------------------------------------------
                ST_DONE: begin
                    done_o  <= 1'b1;
                    busy_o  <= 1'b0;
                    state   <= ST_IDLE;
                end

                default: state <= ST_IDLE;
            endcase
        end
    end

endmodule
