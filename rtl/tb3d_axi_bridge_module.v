// =============================================================================
// Module  : tb3d_axi_bridge_module
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_axi_bridge_module.v
//
// Purpose : In-wire intercept for the Versal Network-on-Chip (NoC).
//           Placed between a NoC NMU master and a NoC NSU slave so every
//           transaction flowing through the primary NoC highway passes through
//           TB3-D encode/decode.  This doubles effective NoC bandwidth without
//           increasing the clock frequency (128-bit NoC native width → 2x
//           effective payload per beat after TB3D compression).
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXI       AXI4 slave   — in-wire data FROM the NoC NMU  (Slave 1)
//   M_AXI_NOC   AXI4 master  — TB3D-processed data TO the NoC NSU / DDR
//   S_AXI_CTRL  AXI4-Lite slave — runtime control FROM orchestrator M_AXI_AXB
//                               (Slave 2 / orchestrator feedback path)
//
// Rule satisfied: 2 slaves (S_AXI + S_AXI_CTRL) + 1 master (M_AXI_NOC)
//
// Data widths:
//   S_AXI / M_AXI_NOC: 128-bit (Versal NoC native packet width)
//   S_AXI_CTRL: 32-bit AXI4-Lite
//   Address: 64-bit
//
// Clock domain:
//   axi_clk  200 MHz — all interfaces (PL-to-NoC clock)
//
// S_AXI_CTRL CSR map (32-bit, byte address)
//   0x00  CTRL      [0]=intercept_en  [1]=bypass_mode
//   0x04  STATUS    [0]=ready  [1]=busy  (RO)
//   0x08  PERF_WR   AW-channel transaction counter  (RO)
//   0x0C  PERF_RD   AR-channel transaction counter  (RO)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_axi_bridge_module #(
    parameter integer DATA_W = 128,
    parameter integer ADDR_W = 64,
    parameter integer ID_W   = 4
) (
    // =========================================================================
    // Clock & Reset  (all three interfaces share axi_clk)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:M_AXI_NOC:S_AXI_CTRL, ASSOCIATED_RESET axi_rst_n, FREQ_HZ 200000000" *)
    input  wire axi_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire axi_rst_n,

    // =========================================================================
    // S_AXI — AXI4 slave  (in-wire FROM NoC NMU — Slave 1)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWID"    *) input  wire [ID_W-1:0]    s_axi_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWADDR"  *) input  wire [ADDR_W-1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWLEN"   *) input  wire [7:0]         s_axi_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWSIZE"  *) input  wire [2:0]         s_axi_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWBURST" *) input  wire [1:0]         s_axi_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWVALID" *) input  wire               s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWREADY" *) output wire               s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WDATA"   *) input  wire [DATA_W-1:0]  s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WSTRB"   *) input  wire [DATA_W/8-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WLAST"   *) input  wire               s_axi_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WVALID"  *) input  wire               s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WREADY"  *) output wire               s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BID"     *) output wire [ID_W-1:0]    s_axi_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BRESP"   *) output wire [1:0]         s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BVALID"  *) output wire               s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BREADY"  *) input  wire               s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARID"    *) input  wire [ID_W-1:0]    s_axi_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARADDR"  *) input  wire [ADDR_W-1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARLEN"   *) input  wire [7:0]         s_axi_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARSIZE"  *) input  wire [2:0]         s_axi_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARBURST" *) input  wire [1:0]         s_axi_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARVALID" *) input  wire               s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARREADY" *) output wire               s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RID"     *) output wire [ID_W-1:0]    s_axi_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RDATA"   *) output wire [DATA_W-1:0]  s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RRESP"   *) output wire [1:0]         s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RLAST"   *) output wire               s_axi_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RVALID"  *) output wire               s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RREADY"  *) input  wire               s_axi_rready,

    // =========================================================================
    // M_AXI_NOC — AXI4 master  (TB3D-processed data → NoC NSU / DDR)
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
    // S_AXI_CTRL — AXI4-Lite slave  (FROM orchestrator M_AXI_AXB — Slave 2)
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
    // S_AXI_CTRL register bank  (axi_clk domain)
    // =========================================================================
    reg [31:0] csr_ctrl;
    reg [31:0] csr_wr_cnt;
    reg [31:0] csr_rd_cnt;

    reg ca_act; reg [7:0] ca_lat; reg cw_act; reg cb_pend;
    reg cr_act; reg [7:0] cr_lat; reg crp; reg [31:0] cr_dat;

    assign s_axi_ctrl_awready = !ca_act && !cb_pend;
    assign s_axi_ctrl_wready  = !cw_act && !cb_pend;
    assign s_axi_ctrl_bresp   = 2'b00;
    assign s_axi_ctrl_bvalid  = cb_pend;
    assign s_axi_ctrl_arready = !cr_act && !crp;
    assign s_axi_ctrl_rdata   = cr_dat;
    assign s_axi_ctrl_rresp   = 2'b00;
    assign s_axi_ctrl_rvalid  = crp;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin ca_act<=0; cw_act<=0; cb_pend<=0; ca_lat<=0; csr_ctrl<=0; end
        else begin
            if (s_axi_ctrl_awvalid && s_axi_ctrl_awready) begin ca_act<=1; ca_lat<=s_axi_ctrl_awaddr; end
            if (s_axi_ctrl_wvalid  && s_axi_ctrl_wready)  cw_act<=1;
            if (ca_act && cw_act) begin
                ca_act<=0; cw_act<=0; cb_pend<=1;
                if (ca_lat[5:2] == 4'd0) csr_ctrl <= s_axi_ctrl_wdata;
            end
            if (cb_pend && s_axi_ctrl_bready) cb_pend<=0;
        end
    end
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin cr_act<=0; crp<=0; cr_lat<=0; cr_dat<=0; end
        else begin
            if (s_axi_ctrl_arvalid && s_axi_ctrl_arready) begin cr_act<=1; cr_lat<=s_axi_ctrl_araddr; end
            if (cr_act && !crp) begin
                cr_act<=0; crp<=1;
                case (cr_lat[5:2])
                    4'd0: cr_dat <= csr_ctrl;
                    4'd1: cr_dat <= 32'h0000_0001; // ready
                    4'd2: cr_dat <= csr_wr_cnt;
                    4'd3: cr_dat <= csr_rd_cnt;
                    default: cr_dat <= 32'h0;
                endcase
            end
            if (crp && s_axi_ctrl_rready) crp<=0;
        end
    end

    // =========================================================================
    // TB3D Data Transformation  (combinational, byte-granular on 128-bit bus)
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
                .physical (s_axi_wdata[B+3:B  ]),
                .color    (s_axi_wdata[B+7:B+4]),
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
    // AXI4 Transparent Proxy with TB3D data transformation
    // =========================================================================

    // Write address — pass-through
    assign m_axi_noc_awid    = s_axi_awid;
    assign m_axi_noc_awaddr  = s_axi_awaddr;
    assign m_axi_noc_awlen   = s_axi_awlen;
    assign m_axi_noc_awsize  = s_axi_awsize;
    assign m_axi_noc_awburst = s_axi_awburst;
    assign m_axi_noc_awvalid = s_axi_awvalid;
    assign s_axi_awready     = m_axi_noc_awready;

    // Write data — encode
    assign m_axi_noc_wdata  = codec_active ? wdata_encoded : s_axi_wdata;
    assign m_axi_noc_wstrb  = s_axi_wstrb;
    assign m_axi_noc_wlast  = s_axi_wlast;
    assign m_axi_noc_wvalid = s_axi_wvalid;
    assign s_axi_wready     = m_axi_noc_wready;

    // Write response — pass-through
    assign s_axi_bid    = m_axi_noc_bid;
    assign s_axi_bresp  = m_axi_noc_bresp;
    assign s_axi_bvalid = m_axi_noc_bvalid;
    assign m_axi_noc_bready = s_axi_bready;

    // Read address — pass-through
    assign m_axi_noc_arid    = s_axi_arid;
    assign m_axi_noc_araddr  = s_axi_araddr;
    assign m_axi_noc_arlen   = s_axi_arlen;
    assign m_axi_noc_arsize  = s_axi_arsize;
    assign m_axi_noc_arburst = s_axi_arburst;
    assign m_axi_noc_arvalid = s_axi_arvalid;
    assign s_axi_arready     = m_axi_noc_arready;

    // Read data — decode
    assign s_axi_rid    = m_axi_noc_rid;
    assign s_axi_rdata  = codec_active ? rdata_decoded : m_axi_noc_rdata;
    assign s_axi_rresp  = m_axi_noc_rresp;
    assign s_axi_rlast  = m_axi_noc_rlast;
    assign s_axi_rvalid = m_axi_noc_rvalid;
    assign m_axi_noc_rready = s_axi_rready;

    // Performance counters
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin csr_wr_cnt<=0; csr_rd_cnt<=0; end
        else begin
            if (s_axi_awvalid && s_axi_awready) csr_wr_cnt <= csr_wr_cnt + 1;
            if (s_axi_arvalid && s_axi_arready) csr_rd_cnt <= csr_rd_cnt + 1;
        end
    end

endmodule
