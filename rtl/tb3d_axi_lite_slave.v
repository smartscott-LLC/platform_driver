// =============================================================================
// Module  : tb3d_axi_lite_slave
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_axi_lite_slave.v
//
// Purpose : AXI4-Lite slave providing the Control/Status Register (CSR)
//           interface for the TB3-D engine.
//
//           Host software (MicroBlaze firmware, CIPS driver) reads and writes
//           these registers via the AXI4-Lite master port routed through the
//           AXI SmartConnect / NoC to this slave.  The slave decodes 32-bit
//           word-aligned addresses and routes them to the appropriate engine
//           sub-module control signals.
//
// AXI4-Lite interface:
//   Data width  : 32 bits
//   Address width: 16 bits (64 KB region)
//   Byte strobes: supported on write
//   Outstanding transactions: 1 (no out-of-order)
//
// Register Map (word address, byte offset = addr × 4):
//   0x000  CTRL            R/W   [0]=global_en  [1]=sw_reset  [2]=enc_mode
//                                [3]=dec_mode
//   0x001  STATUS          RO    [0]=ready  [1]=busy  [2]=error  [3]=overflow
//                                [4]=underflow
//   0x002  VERSION         RO    0x00010000  (major=1, minor=0, patch=0)
//   0x003  ENCODE_IN       R/W   [7:4]=physical[3:0]  [3:0]=color[3:0]
//   0x004  ENCODE_OUT      RO    [7:0]=TB3D byte result
//   0x005  DECODE_IN       R/W   [7:0]=TB3D byte to decode
//   0x006  DECODE_PHY      RO    [3:0]=physical nibble
//   0x007  DECODE_COL      RO    [3:0]=color nibble
//   0x008  TRANSCODE_FWD   R/W   [7:0]=legacy byte → TB3D (write triggers)
//   0x009  TRANSCODE_FWD_O RO    [7:0]=TB3D byte result
//   0x00A  TRANSCODE_REV   R/W   [7:0]=TB3D byte → legacy (write triggers)
//   0x00B  TRANSCODE_REV_O RO    [7:0]=legacy byte result
//   0x00C  BIT_ACC_CTL     R/W   [15:8]=input_byte [4:3]=bit_pos
//                                [2]=write_phys [1]=phys_val [0]=write_state
//   0x00D  BIT_ACC_OUT     RO    [17]=phys_bit [16]=state_bit
//                                [15:8]=phys_modified [7:0]=state_modified
//   0x00E  CACHE_CTRL      R/W   [0]=push  [1]=pop  [2]=dma_fetch  [3]=flush
//   0x00F  CACHE_WDATA     R/W   [7:0]=TB3D byte to push
//   0x010  CACHE_RDATA     RO    [7:0]=TB3D byte from pop/peek
//   0x011  CACHE_STATUS    RO    [0]=full  [1]=empty  [12:2]=count
//   0x012  CACHE_DMA_PAIR  R/W   [7:0]={color[3:0],physical[3:0]} for DMA path
//   0x013  SBUF_CTRL       R/W   [0]=push  [1]=fill
//   0x014  SBUF_WCOLOR     R/W   [3:0]=color nibble to push
//   0x015  SBUF_RIDX       R/W   [11:0]=read index
//   0x016  SBUF_RDATA      RO    [3:0]=color nibble at read index
//   0x017  SBUF_STATUS     RO    [0]=full  [1]=empty  [13:2]=count
//   0x018  VEC_CTRL        R/W   [0]=start  [1]=mode (0=enc/1=dec)
//   0x019  VEC_STATUS      RO    [0]=done  [1]=busy
//   0x01A  DMA_SRCADDR_L   R/W   DMA source address [31:0]
//   0x01B  DMA_SRCADDR_H   R/W   DMA source address [63:32]
//   0x01C  DMA_DSTADDR_L   R/W   DMA destination address [31:0]
//   0x01D  DMA_DSTADDR_H   R/W   DMA destination address [63:32]
//   0x01E  DMA_LEN         R/W   Transfer length in bytes
//   0x01F  DMA_CTRL        R/W   [0]=start  [1]=mode (0=enc/1=dec)
//   0x020  DMA_STATUS      RO    [0]=done  [1]=busy  [2]=error
//   0x021  INTR_ENABLE     R/W   Interrupt enable mask
//   0x022  INTR_STATUS     R/W1C Interrupt status (write 1 to clear)
//   0x023  INTR_FORCE      WO    Write 1 to force-assert an interrupt bit
// =============================================================================

`timescale 1ns / 1ps

module tb3d_axi_lite_slave (
    input  wire         clk,
    input  wire         rst_n,

    // =========================================================================
    // AXI4-Lite Slave Interface
    // =========================================================================
    // Write address channel
    input  wire [15:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output reg          s_axi_awready,

    // Write data channel
    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output reg          s_axi_wready,

    // Write response channel
    output reg  [1:0]   s_axi_bresp,
    output reg          s_axi_bvalid,
    input  wire         s_axi_bready,

    // Read address channel
    input  wire [15:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output reg          s_axi_arready,

    // Read data channel
    output reg  [31:0]  s_axi_rdata,
    output reg  [1:0]   s_axi_rresp,
    output reg          s_axi_rvalid,
    input  wire         s_axi_rready,

    // =========================================================================
    // Engine control outputs (to sub-modules)
    // =========================================================================
    output reg          global_en,
    output reg          sw_reset,

    // Encode / decode single-byte
    output reg  [3:0]   enc_physical,
    output reg  [3:0]   enc_color,
    output reg          enc_trigger,
    input  wire [7:0]   enc_result,

    output reg  [7:0]   dec_in,
    output reg          dec_trigger,
    input  wire [3:0]   dec_physical,
    input  wire [3:0]   dec_color,

    // Transcoder
    output reg  [7:0]   tc_fwd_in,
    output reg          tc_fwd_trigger,
    input  wire [7:0]   tc_fwd_out,

    output reg  [7:0]   tc_rev_in,
    output reg          tc_rev_trigger,
    input  wire [7:0]   tc_rev_out,

    // Bit accessor
    output reg  [7:0]   ba_byte,
    output reg  [1:0]   ba_pos,
    output reg          ba_write_phys,
    output reg          ba_phys_val,
    output reg          ba_write_state,
    output reg          ba_state_val,
    input  wire         ba_phys_bit,
    input  wire         ba_state_bit,
    input  wire [7:0]   ba_phys_out,
    input  wire [7:0]   ba_state_out,

    // Dragonfly Cache
    output reg          cache_push,
    output reg  [7:0]   cache_wdata,
    input  wire [7:0]   cache_rdata,
    input  wire         cache_rdata_valid,
    output reg          cache_pop,
    input  wire         cache_full,
    input  wire         cache_empty,
    input  wire [9:0]   cache_count,
    output reg          cache_dma_valid,
    output reg  [7:0]   cache_dma_pair,

    // State Buffer
    output reg          sbuf_push,
    output reg  [3:0]   sbuf_color,
    output reg          sbuf_fill,
    output reg  [11:0]  sbuf_ridx,
    input  wire [3:0]   sbuf_rdata,
    input  wire         sbuf_rvalid,
    input  wire         sbuf_full,
    input  wire         sbuf_empty,
    input  wire [12:0]  sbuf_count,

    // Vector engine
    output reg          vec_start,
    output reg          vec_mode,
    input  wire         vec_done,

    // DMA controller
    output reg  [63:0]  dma_src,
    output reg  [63:0]  dma_dst,
    output reg  [31:0]  dma_len,
    output reg          dma_mode,
    output reg          dma_start,
    input  wire         dma_done,
    input  wire         dma_busy,
    input  wire         dma_error,

    // Interrupt interface
    output reg          intr_req     // level-sensitive interrupt to CIPS pl_ps_irq
);

    // =========================================================================
    // AXI4-Lite write state machine
    // =========================================================================
    localparam WR_IDLE  = 2'b00,
               WR_WDATA = 2'b01,
               WR_RESP  = 2'b10;

    reg [1:0]  wr_state;
    reg [15:0] wr_addr_lat;
    reg [31:0] wr_data_lat;
    reg [3:0]  wr_strb_lat;
    wire       wr_do;

    // =========================================================================
    // AXI4-Lite read state machine
    // =========================================================================
    localparam RD_IDLE = 1'b0,
               RD_DATA = 1'b1;

    reg        rd_state;
    reg [15:0] rd_addr_lat;

    // =========================================================================
    // Address decode — word address (byte_addr >> 2)
    // =========================================================================
    wire [13:0] wr_word = wr_addr_lat[15:2];
    wire [13:0] rd_word = rd_addr_lat[15:2];

    // =========================================================================
    // CSR shadow registers
    // =========================================================================
    reg [31:0] r_ctrl;
    reg [31:0] r_encode_in;
    reg [31:0] r_decode_in;
    reg [31:0] r_tc_fwd;
    reg [31:0] r_tc_rev;
    reg [31:0] r_bit_acc_ctl;
    reg [31:0] r_cache_ctrl;
    reg [31:0] r_cache_wdata;
    reg [31:0] r_cache_dma_pair;
    reg [31:0] r_sbuf_ctrl;
    reg [31:0] r_sbuf_wcolor;
    reg [31:0] r_sbuf_ridx;
    reg [31:0] r_vec_ctrl;
    reg [31:0] r_dma_src_l;
    reg [31:0] r_dma_src_h;
    reg [31:0] r_dma_dst_l;
    reg [31:0] r_dma_dst_h;
    reg [31:0] r_dma_len;
    reg [31:0] r_dma_ctrl;
    reg [31:0] r_intr_en;
    reg [31:0] r_intr_sts;

    // =========================================================================
    // Helper: apply byte strobes to update a 32-bit register
    // =========================================================================
    function [31:0] apply_strb;
        input [31:0] old_val;
        input [31:0] new_val;
        input [3:0]  strb;
        integer k;
        begin
            apply_strb = old_val;
            for (k = 0; k < 4; k = k + 1)
                if (strb[k]) apply_strb[k*8 +: 8] = new_val[k*8 +: 8];
        end
    endfunction

    // =========================================================================
    // Write path
    // =========================================================================
    assign wr_do = (wr_state == WR_RESP);

    // clear one-shot strobes every cycle by default
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_state    <= WR_IDLE;
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            wr_addr_lat   <= 16'h0;
            wr_data_lat   <= 32'h0;
            wr_strb_lat   <= 4'h0;

            // Read state machine reset (co-located to avoid multiple-driver conflict)
            rd_state      <= RD_IDLE;
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= 32'h0;
            s_axi_rresp   <= 2'b00;
            rd_addr_lat   <= 16'h0;

            // CSR defaults
            r_ctrl         <= 32'h0;
            r_encode_in    <= 32'h0;
            r_decode_in    <= 32'h0;
            r_tc_fwd       <= 32'h0;
            r_tc_rev       <= 32'h0;
            r_bit_acc_ctl  <= 32'h0;
            r_cache_ctrl   <= 32'h0;
            r_cache_wdata  <= 32'h0;
            r_cache_dma_pair <= 32'h0;
            r_sbuf_ctrl    <= 32'h0;
            r_sbuf_wcolor  <= 32'h0;
            r_sbuf_ridx    <= 32'h0;
            r_vec_ctrl     <= 32'h0;
            r_dma_src_l    <= 32'h0;
            r_dma_src_h    <= 32'h0;
            r_dma_dst_l    <= 32'h0;
            r_dma_dst_h    <= 32'h0;
            r_dma_len      <= 32'h0;
            r_dma_ctrl     <= 32'h0;
            r_intr_en      <= 32'h0;
            r_intr_sts     <= 32'h0;

            // control outputs
            global_en      <= 1'b0;
            sw_reset       <= 1'b0;
            enc_physical   <= 4'h0;
            enc_color      <= 4'h0;
            enc_trigger    <= 1'b0;
            dec_in         <= 8'h0;
            dec_trigger    <= 1'b0;
            tc_fwd_in      <= 8'h0;
            tc_fwd_trigger <= 1'b0;
            tc_rev_in      <= 8'h0;
            tc_rev_trigger <= 1'b0;
            ba_byte        <= 8'h0;
            ba_pos         <= 2'h0;
            ba_write_phys  <= 1'b0;
            ba_phys_val    <= 1'b0;
            ba_write_state <= 1'b0;
            ba_state_val   <= 1'b0;
            cache_push     <= 1'b0;
            cache_wdata    <= 8'h0;
            cache_pop      <= 1'b0;
            cache_dma_valid <= 1'b0;
            cache_dma_pair <= 8'h0;
            sbuf_push      <= 1'b0;
            sbuf_color     <= 4'h0;
            sbuf_fill      <= 1'b0;
            sbuf_ridx      <= 12'h0;
            vec_start      <= 1'b0;
            vec_mode       <= 1'b0;
            dma_src        <= 64'h0;
            dma_dst        <= 64'h0;
            dma_len        <= 32'h0;
            dma_mode       <= 1'b0;
            dma_start      <= 1'b0;
            intr_req       <= 1'b0;
        end else begin
            // -----------------------------------------------------------------
            // Default deassert one-shot outputs
            // -----------------------------------------------------------------
            enc_trigger     <= 1'b0;
            dec_trigger     <= 1'b0;
            tc_fwd_trigger  <= 1'b0;
            tc_rev_trigger  <= 1'b0;
            cache_push      <= 1'b0;
            cache_pop       <= 1'b0;
            cache_dma_valid <= 1'b0;
            sbuf_push       <= 1'b0;
            sbuf_fill       <= 1'b0;
            vec_start       <= 1'b0;
            dma_start       <= 1'b0;
            sw_reset        <= 1'b0;

            // -----------------------------------------------------------------
            // AXI write handshake
            // -----------------------------------------------------------------
            case (wr_state)
                WR_IDLE: begin
                    s_axi_awready <= 1'b0;
                    s_axi_wready  <= 1'b0;
                    if (s_axi_awvalid && s_axi_wvalid) begin
                        wr_addr_lat   <= s_axi_awaddr;
                        wr_data_lat   <= s_axi_wdata;
                        wr_strb_lat   <= s_axi_wstrb;
                        s_axi_awready <= 1'b1;
                        s_axi_wready  <= 1'b1;
                        wr_state      <= WR_RESP;
                    end else if (s_axi_awvalid) begin
                        wr_addr_lat   <= s_axi_awaddr;
                        s_axi_awready <= 1'b1;
                        wr_state      <= WR_WDATA;
                    end
                end

                WR_WDATA: begin
                    s_axi_awready <= 1'b0;
                    if (s_axi_wvalid) begin
                        wr_data_lat  <= s_axi_wdata;
                        wr_strb_lat  <= s_axi_wstrb;
                        s_axi_wready <= 1'b1;
                        wr_state     <= WR_RESP;
                    end
                end

                WR_RESP: begin
                    s_axi_awready <= 1'b0;
                    s_axi_wready  <= 1'b0;
                    s_axi_bvalid  <= 1'b1;
                    s_axi_bresp   <= 2'b00;
                    // Only deassert bvalid when the handshake is between a
                    // CURRENTLY-asserted bvalid and bready.  Checking the
                    // registered (previous-cycle) value of s_axi_bvalid
                    // prevents the new assignment from being immediately
                    // overridden when bready is pre-asserted by the master.
                    if (s_axi_bvalid && s_axi_bready) begin
                        s_axi_bvalid <= 1'b0;
                        wr_state     <= WR_IDLE;
                    end
                end

                default: wr_state <= WR_IDLE;
            endcase

            // -----------------------------------------------------------------
            // Register write decode (executed when entering WR_RESP)
            // -----------------------------------------------------------------
            if (wr_state == WR_WDATA && s_axi_wvalid) begin
                /* handled next cycle via WR_RESP entry — fall through */
            end

            if (wr_do) begin
                case (wr_word)
                    14'h000: begin  // CTRL
                        r_ctrl       <= apply_strb(r_ctrl, wr_data_lat, wr_strb_lat);
                        global_en    <= wr_data_lat[0] & wr_strb_lat[0];
                        sw_reset     <= wr_data_lat[1] & wr_strb_lat[0];
                    end
                    14'h003: begin  // ENCODE_IN — trigger encode
                        r_encode_in  <= apply_strb(r_encode_in, wr_data_lat, wr_strb_lat);
                        enc_physical <= wr_data_lat[7:4];
                        enc_color    <= wr_data_lat[3:0];
                        enc_trigger  <= 1'b1;
                    end
                    14'h005: begin  // DECODE_IN — trigger decode
                        r_decode_in  <= apply_strb(r_decode_in, wr_data_lat, wr_strb_lat);
                        dec_in       <= wr_data_lat[7:0];
                        dec_trigger  <= 1'b1;
                    end
                    14'h008: begin  // TRANSCODE_FWD — legacy → TB3D
                        r_tc_fwd     <= apply_strb(r_tc_fwd, wr_data_lat, wr_strb_lat);
                        tc_fwd_in    <= wr_data_lat[7:0];
                        tc_fwd_trigger <= 1'b1;
                    end
                    14'h00A: begin  // TRANSCODE_REV — TB3D → legacy
                        r_tc_rev     <= apply_strb(r_tc_rev, wr_data_lat, wr_strb_lat);
                        tc_rev_in    <= wr_data_lat[7:0];
                        tc_rev_trigger <= 1'b1;
                    end
                    14'h00C: begin  // BIT_ACC_CTL
                        r_bit_acc_ctl  <= apply_strb(r_bit_acc_ctl, wr_data_lat, wr_strb_lat);
                        ba_byte        <= wr_data_lat[15:8];
                        ba_pos         <= wr_data_lat[4:3];
                        ba_write_phys  <= wr_data_lat[2];
                        ba_phys_val    <= wr_data_lat[1];
                        ba_write_state <= wr_data_lat[0];
                        ba_state_val   <= wr_data_lat[5];   // bit [5] = state write value
                                                             // (bit [0] = write_state enable)
                    end
                    14'h00E: begin  // CACHE_CTRL
                        r_cache_ctrl  <= apply_strb(r_cache_ctrl, wr_data_lat, wr_strb_lat);
                        cache_push    <= wr_data_lat[0];
                        cache_pop     <= wr_data_lat[1];
                        cache_dma_valid <= wr_data_lat[2];
                    end
                    14'h00F: begin  // CACHE_WDATA
                        r_cache_wdata <= apply_strb(r_cache_wdata, wr_data_lat, wr_strb_lat);
                        cache_wdata   <= wr_data_lat[7:0];
                    end
                    14'h012: begin  // CACHE_DMA_PAIR
                        r_cache_dma_pair <= apply_strb(r_cache_dma_pair, wr_data_lat, wr_strb_lat);
                        cache_dma_pair   <= wr_data_lat[7:0];
                        cache_dma_valid  <= 1'b1;
                    end
                    14'h013: begin  // SBUF_CTRL
                        r_sbuf_ctrl <= apply_strb(r_sbuf_ctrl, wr_data_lat, wr_strb_lat);
                        sbuf_push   <= wr_data_lat[0];
                        sbuf_fill   <= wr_data_lat[1];
                    end
                    14'h014: begin  // SBUF_WCOLOR
                        r_sbuf_wcolor <= apply_strb(r_sbuf_wcolor, wr_data_lat, wr_strb_lat);
                        sbuf_color    <= wr_data_lat[3:0];
                    end
                    14'h015: begin  // SBUF_RIDX
                        r_sbuf_ridx <= apply_strb(r_sbuf_ridx, wr_data_lat, wr_strb_lat);
                        sbuf_ridx   <= wr_data_lat[11:0];
                    end
                    14'h018: begin  // VEC_CTRL
                        r_vec_ctrl <= apply_strb(r_vec_ctrl, wr_data_lat, wr_strb_lat);
                        vec_start  <= wr_data_lat[0];
                        vec_mode   <= wr_data_lat[1];
                    end
                    14'h01A: begin  // DMA_SRCADDR_L
                        r_dma_src_l   <= apply_strb(r_dma_src_l, wr_data_lat, wr_strb_lat);
                        dma_src[31:0] <= wr_data_lat;
                    end
                    14'h01B: begin  // DMA_SRCADDR_H
                        r_dma_src_h    <= apply_strb(r_dma_src_h, wr_data_lat, wr_strb_lat);
                        dma_src[63:32] <= wr_data_lat;
                    end
                    14'h01C: begin  // DMA_DSTADDR_L
                        r_dma_dst_l   <= apply_strb(r_dma_dst_l, wr_data_lat, wr_strb_lat);
                        dma_dst[31:0] <= wr_data_lat;
                    end
                    14'h01D: begin  // DMA_DSTADDR_H
                        r_dma_dst_h    <= apply_strb(r_dma_dst_h, wr_data_lat, wr_strb_lat);
                        dma_dst[63:32] <= wr_data_lat;
                    end
                    14'h01E: begin  // DMA_LEN
                        r_dma_len <= apply_strb(r_dma_len, wr_data_lat, wr_strb_lat);
                        dma_len   <= wr_data_lat;
                    end
                    14'h01F: begin  // DMA_CTRL
                        r_dma_ctrl <= apply_strb(r_dma_ctrl, wr_data_lat, wr_strb_lat);
                        dma_start  <= wr_data_lat[0];
                        dma_mode   <= wr_data_lat[1];
                    end
                    14'h021: begin  // INTR_ENABLE
                        r_intr_en <= apply_strb(r_intr_en, wr_data_lat, wr_strb_lat);
                    end
                    14'h022: begin  // INTR_STATUS — write-1-to-clear
                        r_intr_sts <= r_intr_sts & ~(wr_data_lat & {{28{1'b0}}, wr_strb_lat});
                    end
                    14'h023: begin  // INTR_FORCE — write 1 to set interrupt bits
                        r_intr_sts <= r_intr_sts | wr_data_lat;
                    end
                    default: begin end
                endcase
            end

            // -----------------------------------------------------------------
            // Capture hardware-set interrupt conditions
            // -----------------------------------------------------------------
            if (dma_done)    r_intr_sts[0] <= 1'b1;
            if (dma_error)   r_intr_sts[1] <= 1'b1;
            if (cache_full)  r_intr_sts[2] <= 1'b1;
            if (vec_done)    r_intr_sts[3] <= 1'b1;

            intr_req <= |(r_intr_sts & r_intr_en);

            // -----------------------------------------------------------------
            // AXI read handshake
            // -----------------------------------------------------------------
            case (rd_state)
                RD_IDLE: begin
                    s_axi_arready <= 1'b0;
                    if (s_axi_arvalid) begin
                        rd_addr_lat   <= s_axi_araddr;
                        s_axi_arready <= 1'b1;
                        rd_state      <= RD_DATA;
                    end
                end

                RD_DATA: begin
                    s_axi_arready <= 1'b0;
                    s_axi_rvalid  <= 1'b1;
                    s_axi_rresp   <= 2'b00;

                    case (rd_word)
                        14'h000: s_axi_rdata <= r_ctrl;
                        14'h001: s_axi_rdata <= {27'h0, dma_error, cache_empty,
                                                        cache_full, dma_busy,
                                                        global_en};
                        14'h002: s_axi_rdata <= 32'h0001_0000;  // version 1.0.0
                        14'h003: s_axi_rdata <= r_encode_in;
                        14'h004: s_axi_rdata <= {24'h0, enc_result};
                        14'h005: s_axi_rdata <= r_decode_in;
                        14'h006: s_axi_rdata <= {28'h0, dec_physical};
                        14'h007: s_axi_rdata <= {28'h0, dec_color};
                        14'h008: s_axi_rdata <= r_tc_fwd;
                        14'h009: s_axi_rdata <= {24'h0, tc_fwd_out};
                        14'h00A: s_axi_rdata <= r_tc_rev;
                        14'h00B: s_axi_rdata <= {24'h0, tc_rev_out};
                        14'h00C: s_axi_rdata <= r_bit_acc_ctl;
                        14'h00D: s_axi_rdata <= {14'h0, ba_state_bit, ba_phys_bit,
                                                        ba_state_out, ba_phys_out};
                        14'h00E: s_axi_rdata <= r_cache_ctrl;
                        14'h00F: s_axi_rdata <= r_cache_wdata;
                        14'h010: s_axi_rdata <= {24'h0, cache_rdata};
                        14'h011: s_axi_rdata <= {22'h0, cache_count, cache_empty, cache_full};
                        14'h012: s_axi_rdata <= r_cache_dma_pair;
                        14'h013: s_axi_rdata <= r_sbuf_ctrl;
                        14'h014: s_axi_rdata <= r_sbuf_wcolor;
                        14'h015: s_axi_rdata <= r_sbuf_ridx;
                        14'h016: s_axi_rdata <= {28'h0, sbuf_rdata};
                        14'h017: s_axi_rdata <= {19'h0, sbuf_count, sbuf_empty, sbuf_full};
                        14'h018: s_axi_rdata <= r_vec_ctrl;
                        14'h019: s_axi_rdata <= {30'h0, dma_busy, vec_done};
                        14'h01A: s_axi_rdata <= r_dma_src_l;
                        14'h01B: s_axi_rdata <= r_dma_src_h;
                        14'h01C: s_axi_rdata <= r_dma_dst_l;
                        14'h01D: s_axi_rdata <= r_dma_dst_h;
                        14'h01E: s_axi_rdata <= r_dma_len;
                        14'h01F: s_axi_rdata <= r_dma_ctrl;
                        14'h020: s_axi_rdata <= {29'h0, dma_error, dma_busy, dma_done};
                        14'h021: s_axi_rdata <= r_intr_en;
                        14'h022: s_axi_rdata <= r_intr_sts;
                        default: s_axi_rdata <= 32'hDEAD_C0DE;
                    endcase

                    if (s_axi_rvalid && s_axi_rready) begin
                        s_axi_rvalid <= 1'b0;
                        rd_state     <= RD_IDLE;
                    end
                end

                default: rd_state <= RD_IDLE;
            endcase
        end
    end

endmodule
