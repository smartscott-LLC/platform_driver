// =============================================================================
// Module  : tb3d_microblaze_module
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_microblaze_module.v
//
// Purpose : In-wire intercept for the MicroBlaze I-Cache and D-Cache AXI
//           masters (M_AXI_IC and M_AXI_DC).  Sits between the MicroBlaze
//           processor and the Versal NoC so every cache-line fetch or
//           write-back passes through TB3-D encode/decode before it reaches
//           DDR via the NoC, effectively doubling effective NoC bandwidth
//           without changing the clock frequency.
//
//           Write-Back cache policy is enforced at the system level by
//           configuring MicroBlaze with C_DCACHE_USE_WRITEBACK=1; this module
//           handles the resulting burst writes efficiently.
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXI_CACHE  AXI4 slave   — intercepts MicroBlaze M_AXI_IC / M_AXI_DC
//                               (Slave 1 / in-wire data path)
//   M_AXI_NOC    AXI4 master  — TB3D-processed data onwards to NoC / DDR
//   S_AXI_CTRL   AXI4-Lite slave — runtime control FROM orchestrator M_AXI_MB
//                               (Slave 2 / orchestrator feedback path)
//
// Rule satisfied: 2 slaves (S_AXI_CACHE + S_AXI_CTRL) + 1 master (M_AXI_NOC)
//
// Data widths:
//   S_AXI_CACHE / M_AXI_NOC: 128-bit (matches Versal NoC native width)
//   S_AXI_CTRL: 32-bit AXI4-Lite
//   Address: 64-bit
//
// Clock domain:
//   mb_clk  200–456 MHz  — all interfaces (single clock domain; CDC to NoC
//                          is handled by the NoC bridge in the block design)
//
// S_AXI_CTRL CSR map (32-bit, byte address)
//   0x00  CTRL      [0]=intercept_en  [1]=bypass_mode  [2]=writeback_flush
//   0x04  STATUS    [0]=ready  [1]=busy  [2]=err  (RO)
//   0x08  PERF_WR   write-transaction counter  (RO)
//   0x0C  PERF_RD   read-transaction counter   (RO)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_microblaze_module #(
    parameter integer DATA_W = 128,
    parameter integer ADDR_W = 64,
    parameter integer ID_W   = 4
) (
    // =========================================================================
    // Clock & Reset  (all three interfaces share mb_clk)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_CACHE:M_AXI_NOC:S_AXI_CTRL, ASSOCIATED_RESET mb_rst_n, FREQ_HZ 200000000" *)
    input  wire mb_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire mb_rst_n,

    // =========================================================================
    // S_AXI_CACHE — AXI4 slave  (FROM MicroBlaze M_AXI_IC / M_AXI_DC)
    //               Slave 1 / in-wire data path
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWID"    *) input  wire [ID_W-1:0]    s_axi_cache_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWADDR"  *) input  wire [ADDR_W-1:0]  s_axi_cache_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWLEN"   *) input  wire [7:0]         s_axi_cache_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWSIZE"  *) input  wire [2:0]         s_axi_cache_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWBURST" *) input  wire [1:0]         s_axi_cache_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWVALID" *) input  wire               s_axi_cache_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE AWREADY" *) output wire               s_axi_cache_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE WDATA"   *) input  wire [DATA_W-1:0]  s_axi_cache_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE WSTRB"   *) input  wire [DATA_W/8-1:0] s_axi_cache_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE WLAST"   *) input  wire               s_axi_cache_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE WVALID"  *) input  wire               s_axi_cache_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE WREADY"  *) output wire               s_axi_cache_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE BID"     *) output wire [ID_W-1:0]    s_axi_cache_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE BRESP"   *) output wire [1:0]         s_axi_cache_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE BVALID"  *) output wire               s_axi_cache_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE BREADY"  *) input  wire               s_axi_cache_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARID"    *) input  wire [ID_W-1:0]    s_axi_cache_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARADDR"  *) input  wire [ADDR_W-1:0]  s_axi_cache_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARLEN"   *) input  wire [7:0]         s_axi_cache_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARSIZE"  *) input  wire [2:0]         s_axi_cache_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARBURST" *) input  wire [1:0]         s_axi_cache_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARVALID" *) input  wire               s_axi_cache_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE ARREADY" *) output wire               s_axi_cache_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RID"     *) output wire [ID_W-1:0]    s_axi_cache_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RDATA"   *) output wire [DATA_W-1:0]  s_axi_cache_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RRESP"   *) output wire [1:0]         s_axi_cache_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RLAST"   *) output wire               s_axi_cache_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RVALID"  *) output wire               s_axi_cache_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CACHE RREADY"  *) input  wire               s_axi_cache_rready,

    // =========================================================================
    // M_AXI_NOC — AXI4 master  (TB3D-processed data → Versal NoC → DDR)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWID"    *) output wire [ID_W-1:0]    m_axi_noc_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWADDR"  *) output wire [ADDR_W-1:0]  m_axi_noc_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWLEN"   *) output wire [7:0]         m_axi_noc_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWSIZE"  *) output wire [2:0]         m_axi_noc_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWBURST" *) output wire [1:0]         m_axi_noc_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWVALID" *) output wire               m_axi_noc_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC AWREADY" *) input  wire               m_axi_noc_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC WDATA"   *) output wire [DATA_W-1:0]  m_axi_noc_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC WSTRB"   *) output wire [DATA_W/8-1:0] m_axi_noc_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC WLAST"   *) output wire               m_axi_noc_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC WVALID"  *) output wire               m_axi_noc_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC WREADY"  *) input  wire               m_axi_noc_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC BID"     *) input  wire [ID_W-1:0]    m_axi_noc_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC BRESP"   *) input  wire [1:0]         m_axi_noc_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC BVALID"  *) input  wire               m_axi_noc_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC BREADY"  *) output wire               m_axi_noc_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARID"    *) output wire [ID_W-1:0]    m_axi_noc_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARADDR"  *) output wire [ADDR_W-1:0]  m_axi_noc_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARLEN"   *) output wire [7:0]         m_axi_noc_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARSIZE"  *) output wire [2:0]         m_axi_noc_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARBURST" *) output wire [1:0]         m_axi_noc_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARVALID" *) output wire               m_axi_noc_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC ARREADY" *) input  wire               m_axi_noc_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RID"     *) input  wire [ID_W-1:0]    m_axi_noc_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RDATA"   *) input  wire [DATA_W-1:0]  m_axi_noc_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RRESP"   *) input  wire [1:0]         m_axi_noc_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RLAST"   *) input  wire               m_axi_noc_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RVALID"  *) input  wire               m_axi_noc_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_NOC RREADY"  *) output wire               m_axi_noc_rready,

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite slave  (FROM orchestrator M_AXI_MB — Slave 2)
    //              Runtime enable, bypass mode, performance counters.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWADDR"  *) input  wire [7:0]  s_axi_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWPROT"  *) input  wire [2:0]  s_axi_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWVALID" *) input  wire        s_axi_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWREADY" *) output wire        s_axi_ctrl_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WDATA"   *) input  wire [31:0] s_axi_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WSTRB"   *) input  wire [3:0]  s_axi_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WVALID"  *) input  wire        s_axi_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WREADY"  *) output wire        s_axi_ctrl_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BRESP"   *) output wire [1:0]  s_axi_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BVALID"  *) output wire        s_axi_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BREADY"  *) input  wire        s_axi_ctrl_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARADDR"  *) input  wire [7:0]  s_axi_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARPROT"  *) input  wire [2:0]  s_axi_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARVALID" *) input  wire        s_axi_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARREADY" *) output wire        s_axi_ctrl_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RDATA"   *) output wire [31:0] s_axi_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RRESP"   *) output wire [1:0]  s_axi_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RVALID"  *) output wire        s_axi_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RREADY"  *) input  wire        s_axi_ctrl_rready
);

    // =========================================================================
    // S_AXI_CTRL register bank
    // =========================================================================
    reg [31:0] csr_ctrl;    // 0x00 [0]=intercept_en [1]=bypass
    reg [31:0] csr_wr_cnt;  // 0x08 write transaction counter
    reg [31:0] csr_rd_cnt;  // 0x0C read  transaction counter

    reg  ca_act; reg [7:0] ca_lat; reg cw_act; reg cb_pend;
    reg  cr_act; reg [7:0] cr_lat; reg crp; reg [31:0] cr_dat;

    assign s_axi_ctrl_awready = !ca_act && !cb_pend;
    assign s_axi_ctrl_wready  = !cw_act && !cb_pend;
    assign s_axi_ctrl_bresp   = 2'b00;
    assign s_axi_ctrl_bvalid  = cb_pend;
    assign s_axi_ctrl_arready = !cr_act && !crp;
    assign s_axi_ctrl_rdata   = cr_dat;
    assign s_axi_ctrl_rresp   = 2'b00;
    assign s_axi_ctrl_rvalid  = crp;

    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin
            ca_act<=0; cw_act<=0; cb_pend<=0; ca_lat<=0; csr_ctrl<=0;
        end else begin
            if (s_axi_ctrl_awvalid && s_axi_ctrl_awready) begin ca_act<=1; ca_lat<=s_axi_ctrl_awaddr; end
            if (s_axi_ctrl_wvalid  && s_axi_ctrl_wready)  cw_act<=1;
            if (ca_act && cw_act) begin
                ca_act<=0; cw_act<=0; cb_pend<=1;
                if (ca_lat[5:2] == 4'd0) csr_ctrl <= s_axi_ctrl_wdata;
            end
            if (cb_pend && s_axi_ctrl_bready) cb_pend<=0;
        end
    end
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin cr_act<=0; crp<=0; cr_lat<=0; cr_dat<=0; end
        else begin
            if (s_axi_ctrl_arvalid && s_axi_ctrl_arready) begin cr_act<=1; cr_lat<=s_axi_ctrl_araddr; end
            if (cr_act && !crp) begin
                cr_act<=0; crp<=1;
                case (cr_lat[5:2])
                    4'd0: cr_dat <= csr_ctrl;
                    4'd1: cr_dat <= {30'h0, 1'b1, 1'b0}; // ready=1 busy=0
                    4'd2: cr_dat <= csr_wr_cnt;
                    4'd3: cr_dat <= csr_rd_cnt;
                    default: cr_dat <= 32'h0;
                endcase
            end
            if (crp && s_axi_ctrl_rready) crp<=0;
        end
    end

    // =========================================================================
    // TB3D Data Transformation  (combinational, byte-granular)
    //
    // Write path (S_AXI_CACHE W → TB3D encode → M_AXI_NOC W)
    // Read  path (M_AXI_NOC R → TB3D decode → S_AXI_CACHE R)
    // =========================================================================
    wire intercept_en = csr_ctrl[0];
    wire bypass_mode  = csr_ctrl[1];
    wire codec_active = intercept_en && !bypass_mode;

    wire [DATA_W-1:0] wdata_encoded;
    wire [DATA_W-1:0] rdata_decoded;

    genvar b;
    generate
        for (b = 0; b < DATA_W/8; b = b + 1) begin : g_codec
            localparam B = b * 8;
            tb3d_encode u_enc (
                .physical (s_axi_cache_wdata[B+3:B  ]),
                .color    (s_axi_cache_wdata[B+7:B+4]),
                .encoded  (wdata_encoded[B+7:B])
            );
            wire [3:0] rp, rc;
            tb3d_decode u_dec (
                .encoded  (m_axi_noc_rdata[B+7:B]),
                .physical (rp),
                .color    (rc)
            );
            assign rdata_decoded[B+7:B] = {rc, rp};
        end
    endgenerate

    // =========================================================================
    // AXI4 Transparent Proxy  (address and control channels pass straight through;
    //                           only W data and R data are transformed)
    // =========================================================================

    // --- Write address channel ---
    assign m_axi_noc_awid    = s_axi_cache_awid;
    assign m_axi_noc_awaddr  = s_axi_cache_awaddr;
    assign m_axi_noc_awlen   = s_axi_cache_awlen;
    assign m_axi_noc_awsize  = s_axi_cache_awsize;
    assign m_axi_noc_awburst = s_axi_cache_awburst;
    assign m_axi_noc_awvalid = s_axi_cache_awvalid;
    assign s_axi_cache_awready = m_axi_noc_awready;

    // --- Write data channel (encode on write) ---
    assign m_axi_noc_wdata  = codec_active ? wdata_encoded : s_axi_cache_wdata;
    assign m_axi_noc_wstrb  = s_axi_cache_wstrb;
    assign m_axi_noc_wlast  = s_axi_cache_wlast;
    assign m_axi_noc_wvalid = s_axi_cache_wvalid;
    assign s_axi_cache_wready = m_axi_noc_wready;

    // --- Write response channel ---
    assign s_axi_cache_bid    = m_axi_noc_bid;
    assign s_axi_cache_bresp  = m_axi_noc_bresp;
    assign s_axi_cache_bvalid = m_axi_noc_bvalid;
    assign m_axi_noc_bready   = s_axi_cache_bready;

    // --- Read address channel ---
    assign m_axi_noc_arid    = s_axi_cache_arid;
    assign m_axi_noc_araddr  = s_axi_cache_araddr;
    assign m_axi_noc_arlen   = s_axi_cache_arlen;
    assign m_axi_noc_arsize  = s_axi_cache_arsize;
    assign m_axi_noc_arburst = s_axi_cache_arburst;
    assign m_axi_noc_arvalid = s_axi_cache_arvalid;
    assign s_axi_cache_arready = m_axi_noc_arready;

    // --- Read data channel (decode on read-return) ---
    assign s_axi_cache_rid    = m_axi_noc_rid;
    assign s_axi_cache_rdata  = codec_active ? rdata_decoded : m_axi_noc_rdata;
    assign s_axi_cache_rresp  = m_axi_noc_rresp;
    assign s_axi_cache_rlast  = m_axi_noc_rlast;
    assign s_axi_cache_rvalid = m_axi_noc_rvalid;
    assign m_axi_noc_rready   = s_axi_cache_rready;

    // --- Performance counters ---
    always @(posedge mb_clk or negedge mb_rst_n) begin
        if (!mb_rst_n) begin csr_wr_cnt<=0; csr_rd_cnt<=0; end
        else begin
            if (s_axi_cache_awvalid && s_axi_cache_awready) csr_wr_cnt <= csr_wr_cnt + 1;
            if (s_axi_cache_arvalid && s_axi_cache_arready) csr_rd_cnt <= csr_rd_cnt + 1;
        end
    end

endmodule
