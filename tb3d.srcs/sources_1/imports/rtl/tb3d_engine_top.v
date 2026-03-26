// =============================================================================
// Module  : tb3d_engine_top
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_engine_top.v
//
// Purpose : Engine integration layer — Versal VP1802 target.
//           Instantiates and interconnects all TB3-D sub-modules:
//             - tb3d_encode         (combinational encoder)
//             - tb3d_decode         (combinational decoder)
//             - tb3d_transcoder     (legacy ↔ TB3-D)
//             - tb3d_bit_accessor   (bit-level R/W)
//             - tb3d_vector_engine  (64-element pipeline)
//             - tb3d_dragonfly_cache(ring-buffer DMA cache)
//             - tb3d_state_buffer   (color nibble metadata lane)
//             - tb3d_axi_lite_slave (CSR register bank)
//             - tb3d_dma_controller (AXI4 master DMA)
//
//           The AXI4-Lite CSR interface provides the register interface for all
//           control and status operations.  The AXI4 DMA master interface is
//           exported to the top-level for connection to the AXI NoC.
//
//           The 512-bit AXI4-Stream slave (S_AXIS) receives raw binary from the
//           AXI DMA MM2S channel and feeds the 64-element vector engine.
//           The 512-bit AXI4-Stream master (M_AXIS) returns the TB3-D encoded
//           (or decoded) result to the AXI DMA S2MM channel for write-back to
//           system memory.  The X_INTERFACE_INFO attributes on all four stream
//           ports enable direct interface-level connection in the Vivado block
//           design without any bridging IP.
//
// Parameters:
//   CACHE_DEPTH   — Dragonfly Cache depth in TB3-D bytes (default 512)
//   CACHE_ADDR_W  — ceil(log2(CACHE_DEPTH))
//   SBUF_DEPTH    — State Buffer depth (default 4096)
//   SBUF_ADDR_W   — ceil(log2(SBUF_DEPTH))
// =============================================================================

`timescale 1ns / 1ps

module tb3d_engine_top #(
    parameter CACHE_DEPTH  = 512,
    parameter CACHE_ADDR_W = 9,
    parameter SBUF_DEPTH   = 4096,
    parameter SBUF_ADDR_W  = 12
) (
    input  wire         clk,
    input  wire         rst_n,

    // =========================================================================
    // AXI4-Lite Slave — CSR interface (connects to PCIe bridge BAR0)
    // =========================================================================
    input  wire [15:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,

    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,

    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,

    input  wire [15:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,

    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    // =========================================================================
    // AXI4 Master — DMA engine outbound (connects to PCIe bridge or DRAM ctrl)
    // =========================================================================
    output wire [63:0]  m_axi_araddr,
    output wire [7:0]   m_axi_arlen,
    output wire [2:0]   m_axi_arsize,
    output wire [1:0]   m_axi_arburst,
    output wire [3:0]   m_axi_arid,
    output wire         m_axi_arvalid,
    input  wire         m_axi_arready,

    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire [3:0]   m_axi_rid,
    input  wire         m_axi_rvalid,
    output wire         m_axi_rready,

    output wire [63:0]  m_axi_awaddr,
    output wire [7:0]   m_axi_awlen,
    output wire [2:0]   m_axi_awsize,
    output wire [1:0]   m_axi_awburst,
    output wire [3:0]   m_axi_awid,
    output wire         m_axi_awvalid,
    input  wire         m_axi_awready,

    output wire [63:0]  m_axi_wdata,
    output wire [7:0]   m_axi_wstrb,
    output wire         m_axi_wlast,
    output wire         m_axi_wvalid,
    input  wire         m_axi_wready,

    input  wire [1:0]   m_axi_bresp,
    input  wire [3:0]   m_axi_bid,
    input  wire         m_axi_bvalid,
    output wire         m_axi_bready,

    // =========================================================================
    // Interrupt output
    // =========================================================================
    output wire         intr_req,

    // =========================================================================
    // AXI4-Stream Slave — input data from AXI DMA MM2S channel
    //
    // Raw binary arrives here from system memory via the AXI DMA engine.
    // In encode mode (vec_mode=0) the data is treated as 64 packed
    // {color[3:0],physical[3:0]} nibble pairs and TB3-D encoded.
    // In decode mode (vec_mode=1) the data is treated as 64 TB3-D bytes
    // and decoded back to nibble pairs.
    //
    // TREADY is permanently asserted — the pipeline accepts one 512-bit
    // beat every clock cycle (fully pipelined, zero stall).
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
    input  wire [511:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
    input  wire          s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
    output wire          s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
    input  wire          s_axis_tlast,

    // =========================================================================
    // AXI4-Stream Master — output data to AXI DMA S2MM channel
    //
    // TB3-D encoded or decoded result streams from the vector engine back to
    // system memory via the AXI DMA engine.  In encode mode tb3d_bytes_o
    // carries the result; in decode mode nibble_pairs_o carries it.
    // The output is held (TVALID asserted) until the DMA asserts TREADY.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
    output wire [511:0]  m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
    output wire          m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
    input  wire          m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
    output wire          m_axis_tlast
);

    // =========================================================================
    // Internal wires — CSR slave → sub-module control
    // =========================================================================
    wire        global_en;
    wire        sw_reset;
    wire        sys_rst_n = rst_n && !sw_reset;

    // Encode
    wire [3:0]  enc_physical;
    wire [3:0]  enc_color;
    wire        enc_trigger;
    wire [7:0]  enc_result;

    // Decode
    wire [7:0]  dec_in;
    wire        dec_trigger;
    wire [3:0]  dec_physical;
    wire [3:0]  dec_color;

    // Transcoder
    wire [7:0]  tc_fwd_in;
    wire        tc_fwd_trigger;
    wire [7:0]  tc_fwd_out;
    wire [7:0]  tc_rev_in;
    wire        tc_rev_trigger;
    wire [7:0]  tc_rev_out;

    // Bit accessor
    wire [7:0]  ba_byte;
    wire [1:0]  ba_pos;
    wire        ba_write_phys;
    wire        ba_phys_val;
    wire        ba_write_state;
    wire        ba_state_val;
    wire        ba_phys_bit;
    wire        ba_state_bit;
    wire [7:0]  ba_phys_out;
    wire [7:0]  ba_state_out;

    // Dragonfly Cache
    wire        cache_push;
    wire [7:0]  cache_wdata;
    wire [7:0]  cache_rdata;
    wire        cache_rdata_valid;
    wire        cache_pop;
    wire        cache_full;
    wire        cache_empty;
    wire [CACHE_ADDR_W:0] cache_count;
    wire        cache_dma_valid_csr;
    wire [7:0]  cache_dma_pair_csr;
    wire        cache_dma_valid_dma;
    wire [7:0]  cache_dma_pair_dma;
    wire        cache_dma_ready;
    wire        cache_dma_valid;
    wire [7:0]  cache_dma_pair;
    wire        cache_peek_valid;
    wire [7:0]  cache_peek_data;
    wire        cache_pop_dma_req;
    wire [7:0]  cache_pop_dma_data;
    wire        cache_pop_dma_valid;

    // State buffer
    wire        sbuf_push;
    wire [3:0]  sbuf_color;
    wire        sbuf_fill;
    wire [SBUF_ADDR_W-1:0] sbuf_ridx;
    wire [3:0]  sbuf_rdata;
    wire        sbuf_rvalid;
    wire        sbuf_full;
    wire        sbuf_empty;
    wire [SBUF_ADDR_W:0] sbuf_count;

    // Vector engine
    wire        vec_start;       // CSR-initiated start
    wire        vec_mode;        // 0 = encode, 1 = decode (CSR-controlled)
    wire        vec_done;

    // AXI4-Stream → vector engine input fan-out
    // s_axis_tdata drives both engine inputs; vec_mode selects which path is
    // meaningful (encode uses nibble_pairs_i, decode uses tb3d_bytes_i).
    wire [511:0] vec_nibble_pairs_i;
    wire [511:0] vec_tb3d_bytes_i;
    assign vec_nibble_pairs_i = s_axis_tdata;
    assign vec_tb3d_bytes_i   = s_axis_tdata;

    // S_AXIS is always ready — the pipeline accepts one beat per clock.
    assign s_axis_tready = 1'b1;

    // AXI-Stream beat triggers the vector engine (OR'd with CSR-initiated start)
    wire axis_vec_start = s_axis_tvalid;   // tready is always 1

    // Vector engine raw outputs
    wire [511:0] vec_nibble_pairs_o;   // decode result (valid when done_o)
    wire [511:0] vec_tb3d_bytes_o;     // encode result (valid when done_o)

    // DMA controller
    wire [63:0] dma_src;
    wire [63:0] dma_dst;
    wire [31:0] dma_len;
    wire        dma_mode;
    wire        dma_start;
    wire        dma_done;
    wire        dma_busy;
    wire        dma_error;

    // =========================================================================
    // Encode/Decode registered results (capture triggered outputs)
    // =========================================================================
    reg [7:0] enc_result_r;
    reg [3:0] dec_phy_r;
    reg [3:0] dec_col_r;

    wire [7:0] enc_raw;
    wire [3:0] dec_phy_raw;
    wire [3:0] dec_col_raw;

    // Instantiate combinational encode for single-byte path
    tb3d_encode u_enc_csr (
        .physical (enc_physical),
        .color    (enc_color),
        .encoded  (enc_raw)
    );

    always @(posedge clk) begin
        if (!sys_rst_n) begin
            enc_result_r <= 8'h0;
        end else if (enc_trigger) begin
            enc_result_r <= enc_raw;
        end
    end
    assign enc_result = enc_result_r;

    // Instantiate combinational decode for single-byte path
    tb3d_decode u_dec_csr (
        .encoded  (dec_in),
        .physical (dec_phy_raw),
        .color    (dec_col_raw)
    );

    always @(posedge clk) begin
        if (!sys_rst_n) begin
            dec_phy_r <= 4'h0;
            dec_col_r <= 4'h0;
        end else if (dec_trigger) begin
            dec_phy_r <= dec_phy_raw;
            dec_col_r <= dec_col_raw;
        end
    end
    assign dec_physical = dec_phy_r;
    assign dec_color    = dec_col_r;

    // =========================================================================
    // Transcoder
    // =========================================================================
    wire [7:0] tc_fwd_raw;
    wire [7:0] tc_rev_raw;
    reg  [7:0] tc_fwd_r;
    reg  [7:0] tc_rev_r;

    tb3d_transcoder u_transcoder (
        .legacy_in  (tc_fwd_in),
        .tb3d_out   (tc_fwd_raw),
        .tb3d_in    (tc_rev_in),
        .legacy_out (tc_rev_raw)
    );

    always @(posedge clk) begin
        if (!sys_rst_n) begin
            tc_fwd_r <= 8'h0;
            tc_rev_r <= 8'h0;
        end else begin
            if (tc_fwd_trigger) tc_fwd_r <= tc_fwd_raw;
            if (tc_rev_trigger) tc_rev_r <= tc_rev_raw;
        end
    end
    assign tc_fwd_out = tc_fwd_r;
    assign tc_rev_out = tc_rev_r;

    // =========================================================================
    // Bit Accessor
    // =========================================================================
    tb3d_bit_accessor u_bit_acc (
        .tb3d_byte      (ba_byte),
        .bit_pos        (ba_pos),
        .write_phys     (ba_write_phys),
        .phys_write_val (ba_phys_val),
        .write_state    (ba_write_state),
        .state_write_val(ba_state_val),
        .phys_bit_rd    (ba_phys_bit),
        .state_rd       (ba_state_bit),
        .phys_byte_out  (ba_phys_out),
        .state_byte_out (ba_state_out)
    );

    // =========================================================================
    // Dragonfly Cache
    // DMA valid/pair from CSR slave or DMA controller (OR arbitration)
    // =========================================================================
    assign cache_dma_valid = cache_dma_valid_csr | cache_dma_valid_dma;
    assign cache_dma_pair  = cache_dma_valid_dma ? cache_dma_pair_dma
                                                 : cache_dma_pair_csr;
    // Pop: CSR slave or DMA controller
    wire cache_pop_req = cache_pop | cache_pop_dma_req;

    tb3d_dragonfly_cache #(
        .DEPTH  (CACHE_DEPTH),
        .ADDR_W (CACHE_ADDR_W)
    ) u_cache (
        .clk            (clk),
        .rst_n          (sys_rst_n),
        .push_valid     (cache_push),
        .push_data      (cache_wdata),
        .push_ready     (cache_dma_ready),
        .pop_req        (cache_pop_req),
        .pop_data       (cache_rdata),
        .pop_data_valid (cache_rdata_valid),
        .peek_data      (cache_peek_data),
        .peek_valid     (cache_peek_valid),
        .dma_valid      (cache_dma_valid),
        .dma_pair       (cache_dma_pair),
        .dma_ready      (),
        .full           (cache_full),
        .empty          (cache_empty),
        .count          (cache_count)
    );

    // DMA controller pop path gets cache_pop_data from the same pop port
    assign cache_pop_dma_data  = cache_rdata;
    assign cache_pop_dma_valid = cache_rdata_valid & cache_pop_dma_req;

    // =========================================================================
    // State Buffer
    // =========================================================================
    tb3d_state_buffer #(
        .DEPTH  (SBUF_DEPTH),
        .ADDR_W (SBUF_ADDR_W)
    ) u_sbuf (
        .clk        (clk),
        .rst_n      (sys_rst_n),
        .push_valid (sbuf_push),
        .push_color (sbuf_color),
        .push_ready (),
        .fill_valid (sbuf_fill),
        .fill_byte  (cache_rdata),    // auto-fill from cache pop data
        .fill_ready (),
        .rd_index   (sbuf_ridx),
        .rd_color_o (sbuf_rdata),
        .rd_valid_o (sbuf_rvalid),
        .full       (sbuf_full),
        .empty      (sbuf_empty),
        .count      (sbuf_count)
    );

    // =========================================================================
    // Vector Engine
    // =========================================================================
    tb3d_vector_engine u_vec (
        .clk              (clk),
        .rst_n            (sys_rst_n),
        .start_i          (vec_start | axis_vec_start),
        .mode_i           (vec_mode),
        .nibble_pairs_i   (vec_nibble_pairs_i),
        .nibble_pairs_o   (vec_nibble_pairs_o),
        .tb3d_bytes_i     (vec_tb3d_bytes_i),
        .tb3d_bytes_o     (vec_tb3d_bytes_o),
        .done_o           (vec_done)
    );

    // =========================================================================
    // AXI4-Stream Master output register
    //
    // Captures the vector engine result when done_o fires and holds it until
    // the AXI DMA S2MM channel is ready (TREADY asserted).  This prevents
    // result loss when the DMA applies back-pressure.
    // In encode mode (vec_mode=0) tb3d_bytes_o carries the TB3-D output.
    // In decode mode (vec_mode=1) nibble_pairs_o carries the decoded output.
    // =========================================================================
    reg [511:0] m_axis_tdata_r;
    reg         m_axis_tvalid_r;
    reg         m_axis_tlast_r;

    always @(posedge clk) begin
        if (!sys_rst_n) begin
            m_axis_tdata_r  <= 512'b0;
            m_axis_tvalid_r <= 1'b0;
            m_axis_tlast_r  <= 1'b0;
        end else if (vec_done) begin
            // Latch result; vec_mode is stable for the transaction duration
            m_axis_tdata_r  <= vec_mode ? vec_nibble_pairs_o : vec_tb3d_bytes_o;
            m_axis_tvalid_r <= 1'b1;
            m_axis_tlast_r  <= 1'b1;
        end else if (m_axis_tready && m_axis_tvalid_r) begin
            // DMA accepted the beat — de-assert valid/last
            m_axis_tvalid_r <= 1'b0;
            m_axis_tlast_r  <= 1'b0;
        end
    end

    assign m_axis_tdata  = m_axis_tdata_r;
    assign m_axis_tvalid = m_axis_tvalid_r;
    assign m_axis_tlast  = m_axis_tlast_r;

    // =========================================================================
    // AXI4-Lite CSR Slave
    // =========================================================================
    tb3d_axi_lite_slave u_csr (
        .clk              (clk),
        .rst_n            (sys_rst_n),

        .s_axi_awaddr     (s_axi_awaddr),
        .s_axi_awvalid    (s_axi_awvalid),
        .s_axi_awready    (s_axi_awready),
        .s_axi_wdata      (s_axi_wdata),
        .s_axi_wstrb      (s_axi_wstrb),
        .s_axi_wvalid     (s_axi_wvalid),
        .s_axi_wready     (s_axi_wready),
        .s_axi_bresp      (s_axi_bresp),
        .s_axi_bvalid     (s_axi_bvalid),
        .s_axi_bready     (s_axi_bready),
        .s_axi_araddr     (s_axi_araddr),
        .s_axi_arvalid    (s_axi_arvalid),
        .s_axi_arready    (s_axi_arready),
        .s_axi_rdata      (s_axi_rdata),
        .s_axi_rresp      (s_axi_rresp),
        .s_axi_rvalid     (s_axi_rvalid),
        .s_axi_rready     (s_axi_rready),

        .global_en        (global_en),
        .sw_reset         (sw_reset),

        .enc_physical     (enc_physical),
        .enc_color        (enc_color),
        .enc_trigger      (enc_trigger),
        .enc_result       (enc_result),

        .dec_in           (dec_in),
        .dec_trigger      (dec_trigger),
        .dec_physical     (dec_physical),
        .dec_color        (dec_color),

        .tc_fwd_in        (tc_fwd_in),
        .tc_fwd_trigger   (tc_fwd_trigger),
        .tc_fwd_out       (tc_fwd_out),
        .tc_rev_in        (tc_rev_in),
        .tc_rev_trigger   (tc_rev_trigger),
        .tc_rev_out       (tc_rev_out),

        .ba_byte          (ba_byte),
        .ba_pos           (ba_pos),
        .ba_write_phys    (ba_write_phys),
        .ba_phys_val      (ba_phys_val),
        .ba_write_state   (ba_write_state),
        .ba_state_val     (ba_state_val),
        .ba_phys_bit      (ba_phys_bit),
        .ba_state_bit     (ba_state_bit),
        .ba_phys_out      (ba_phys_out),
        .ba_state_out     (ba_state_out),

        .cache_push       (cache_push),
        .cache_wdata      (cache_wdata),
        .cache_rdata      (cache_rdata),
        .cache_rdata_valid(cache_rdata_valid),
        .cache_pop        (cache_pop),
        .cache_full       (cache_full),
        .cache_empty      (cache_empty),
        .cache_count      (cache_count[9:0]),
        .cache_dma_valid  (cache_dma_valid_csr),
        .cache_dma_pair   (cache_dma_pair_csr),

        .sbuf_push        (sbuf_push),
        .sbuf_color       (sbuf_color),
        .sbuf_fill        (sbuf_fill),
        .sbuf_ridx        (sbuf_ridx),
        .sbuf_rdata       (sbuf_rdata),
        .sbuf_rvalid      (sbuf_rvalid),
        .sbuf_full        (sbuf_full),
        .sbuf_empty       (sbuf_empty),
        .sbuf_count       (sbuf_count[12:0]),

        .vec_start        (vec_start),
        .vec_mode         (vec_mode),
        .vec_done         (vec_done),

        .dma_src          (dma_src),
        .dma_dst          (dma_dst),
        .dma_len          (dma_len),
        .dma_mode         (dma_mode),
        .dma_start        (dma_start),
        .dma_done         (dma_done),
        .dma_busy         (dma_busy),
        .dma_error        (dma_error),

        .intr_req         (intr_req)
    );

    // =========================================================================
    // DMA Controller
    // =========================================================================
    tb3d_dma_controller u_dma (
        .clk              (clk),
        .rst_n            (sys_rst_n),

        .src_addr_i       (dma_src),
        .dst_addr_i       (dma_dst),
        .len_i            (dma_len),
        .mode_i           (dma_mode),
        .start_i          (dma_start),
        .done_o           (dma_done),
        .busy_o           (dma_busy),
        .error_o          (dma_error),

        .m_axi_araddr     (m_axi_araddr),
        .m_axi_arlen      (m_axi_arlen),
        .m_axi_arsize     (m_axi_arsize),
        .m_axi_arburst    (m_axi_arburst),
        .m_axi_arid       (m_axi_arid),
        .m_axi_arvalid    (m_axi_arvalid),
        .m_axi_arready    (m_axi_arready),
        .m_axi_rdata      (m_axi_rdata),
        .m_axi_rresp      (m_axi_rresp),
        .m_axi_rlast      (m_axi_rlast),
        .m_axi_rid        (m_axi_rid),
        .m_axi_rvalid     (m_axi_rvalid),
        .m_axi_rready     (m_axi_rready),
        .m_axi_awaddr     (m_axi_awaddr),
        .m_axi_awlen      (m_axi_awlen),
        .m_axi_awsize     (m_axi_awsize),
        .m_axi_awburst    (m_axi_awburst),
        .m_axi_awid       (m_axi_awid),
        .m_axi_awvalid    (m_axi_awvalid),
        .m_axi_awready    (m_axi_awready),
        .m_axi_wdata      (m_axi_wdata),
        .m_axi_wstrb      (m_axi_wstrb),
        .m_axi_wlast      (m_axi_wlast),
        .m_axi_wvalid     (m_axi_wvalid),
        .m_axi_wready     (m_axi_wready),
        .m_axi_bresp      (m_axi_bresp),
        .m_axi_bid        (m_axi_bid),
        .m_axi_bvalid     (m_axi_bvalid),
        .m_axi_bready     (m_axi_bready),

        .cache_dma_valid  (cache_dma_valid_dma),
        .cache_dma_pair   (cache_dma_pair_dma),
        .cache_dma_ready  (cache_dma_ready),
        .cache_pop_req    (cache_pop_dma_req),
        .cache_pop_data   (cache_pop_dma_data),
        .cache_pop_valid  (cache_pop_dma_valid),
        .cache_empty      (cache_empty),
        .cache_full       (cache_full)
    );

endmodule
