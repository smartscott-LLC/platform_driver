// =============================================================================
// Module  : tb3d_pmc_intercept
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_pmc_intercept.v
//
// Purpose : In-wire intercept for the Platform Management Controller (PMC)
//           AXI master.  Loaded as Early-PL in the PDI so it is active before
//           the ARM APU/RPU cores wake up.  Every bit the PMC pushes into the
//           chip fabric passes through TB3-D encode/decode here, establishing
//           the "new language" at the earliest possible boot stage.
//
//           The PMC hands the "keys to the kingdom" to the MicroBlaze once
//           our logic is active.  The APU and RPU become guests in a system
//           that already speaks TB3-D.
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXI_PMC   AXI4 slave   — in-wire FROM the PMC AXI master  (Slave 1)
//   M_AXI_SYS   AXI4 master  — TB3D-processed data TO the system fabric
//   S_AXI_CTRL  AXI4-Lite slave — runtime control FROM orchestrator M_AXI_PMC
//                               (Slave 2 / orchestrator feedback path)
//
// Rule satisfied: 2 slaves (S_AXI_PMC + S_AXI_CTRL) + 1 master (M_AXI_SYS)
//
// Data widths:
//   S_AXI_PMC / M_AXI_SYS: 128-bit (Versal NoC / LPD bus width)
//   S_AXI_CTRL: 32-bit AXI4-Lite
//   Address: 64-bit
//
// Clock domain:
//   axi_clk  200 MHz — all interfaces
//   (In a real PDI this module is clocked from the PMC reference; the block
//    design clock wizard sources it from the Early-PL clock domain.)
//
// S_AXI_CTRL CSR map (32-bit, byte address)
//   0x00  CTRL      [0]=intercept_en  [1]=bypass_mode  [2]=boot_lock
//   0x04  STATUS    [0]=ready  [1]=busy  [2]=pmc_active  (RO)
//   0x08  PERF_WR   PMC AW-channel transaction counter  (RO)
//   0x0C  PERF_RD   PMC AR-channel transaction counter  (RO)
//   0x10  BOOT_SEQ  boot sequence step counter  (RO)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_pmc_intercept #(
    parameter integer DATA_W = 128,
    parameter integer ADDR_W = 64,
    parameter integer ID_W   = 4
) (
    // =========================================================================
    // Clock & Reset  (all three interfaces share axi_clk)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_PMC:M_AXI_SYS:S_AXI_CTRL, ASSOCIATED_RESET axi_rst_n, FREQ_HZ 200000000" *)
    input  wire axi_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire axi_rst_n,

    // =========================================================================
    // S_AXI_PMC — AXI4 slave  (in-wire FROM PMC AXI master — Slave 1)
    //             Active from Early-PL; intercepts all PMC-to-fabric traffic.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWID"    *) input  wire [ID_W-1:0]    s_axi_pmc_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWADDR"  *) input  wire [ADDR_W-1:0]  s_axi_pmc_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWLEN"   *) input  wire [7:0]         s_axi_pmc_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWSIZE"  *) input  wire [2:0]         s_axi_pmc_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWBURST" *) input  wire [1:0]         s_axi_pmc_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWVALID" *) input  wire               s_axi_pmc_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC AWREADY" *) output wire               s_axi_pmc_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC WDATA"   *) input  wire [DATA_W-1:0]  s_axi_pmc_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC WSTRB"   *) input  wire [DATA_W/8-1:0] s_axi_pmc_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC WLAST"   *) input  wire               s_axi_pmc_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC WVALID"  *) input  wire               s_axi_pmc_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC WREADY"  *) output wire               s_axi_pmc_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC BID"     *) output wire [ID_W-1:0]    s_axi_pmc_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC BRESP"   *) output wire [1:0]         s_axi_pmc_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC BVALID"  *) output wire               s_axi_pmc_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC BREADY"  *) input  wire               s_axi_pmc_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARID"    *) input  wire [ID_W-1:0]    s_axi_pmc_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARADDR"  *) input  wire [ADDR_W-1:0]  s_axi_pmc_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARLEN"   *) input  wire [7:0]         s_axi_pmc_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARSIZE"  *) input  wire [2:0]         s_axi_pmc_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARBURST" *) input  wire [1:0]         s_axi_pmc_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARVALID" *) input  wire               s_axi_pmc_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC ARREADY" *) output wire               s_axi_pmc_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RID"     *) output wire [ID_W-1:0]    s_axi_pmc_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RDATA"   *) output wire [DATA_W-1:0]  s_axi_pmc_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RRESP"   *) output wire [1:0]         s_axi_pmc_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RLAST"   *) output wire               s_axi_pmc_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RVALID"  *) output wire               s_axi_pmc_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_PMC RREADY"  *) input  wire               s_axi_pmc_rready,

    // =========================================================================
    // M_AXI_SYS — AXI4 master  (TB3D-processed data → system fabric)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWID"    *) output wire [ID_W-1:0]    m_axi_sys_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWADDR"  *) output wire [ADDR_W-1:0]  m_axi_sys_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWLEN"   *) output wire [7:0]         m_axi_sys_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWSIZE"  *) output wire [2:0]         m_axi_sys_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWBURST" *) output wire [1:0]         m_axi_sys_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWVALID" *) output wire               m_axi_sys_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS AWREADY" *) input  wire               m_axi_sys_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS WDATA"   *) output wire [DATA_W-1:0]  m_axi_sys_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS WSTRB"   *) output wire [DATA_W/8-1:0] m_axi_sys_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS WLAST"   *) output wire               m_axi_sys_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS WVALID"  *) output wire               m_axi_sys_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS WREADY"  *) input  wire               m_axi_sys_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS BID"     *) input  wire [ID_W-1:0]    m_axi_sys_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS BRESP"   *) input  wire [1:0]         m_axi_sys_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS BVALID"  *) input  wire               m_axi_sys_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS BREADY"  *) output wire               m_axi_sys_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARID"    *) output wire [ID_W-1:0]    m_axi_sys_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARADDR"  *) output wire [ADDR_W-1:0]  m_axi_sys_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARLEN"   *) output wire [7:0]         m_axi_sys_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARSIZE"  *) output wire [2:0]         m_axi_sys_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARBURST" *) output wire [1:0]         m_axi_sys_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARVALID" *) output wire               m_axi_sys_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS ARREADY" *) input  wire               m_axi_sys_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RID"     *) input  wire [ID_W-1:0]    m_axi_sys_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RDATA"   *) input  wire [DATA_W-1:0]  m_axi_sys_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RRESP"   *) input  wire [1:0]         m_axi_sys_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RLAST"   *) input  wire               m_axi_sys_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RVALID"  *) input  wire               m_axi_sys_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_SYS RREADY"  *) output wire               m_axi_sys_rready,

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite slave  (FROM orchestrator M_AXI_PMC — Slave 2)
    //              Boot-lock, intercept enable, bypass, performance readback.
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
    reg [31:0] csr_ctrl;      // 0x00 [0]=intercept_en [1]=bypass [2]=boot_lock
    reg [31:0] csr_wr_cnt;    // 0x08
    reg [31:0] csr_rd_cnt;    // 0x0C
    reg [31:0] csr_boot_seq;  // 0x10 boot sequence step counter

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
                    4'd1: cr_dat <= {29'h0, 1'b1, 1'b0, 1'b1}; // pmc_active=1 busy=0 ready=1
                    4'd2: cr_dat <= csr_wr_cnt;
                    4'd3: cr_dat <= csr_rd_cnt;
                    4'd4: cr_dat <= csr_boot_seq;
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
                .physical (s_axi_pmc_wdata[B+3:B  ]),
                .color    (s_axi_pmc_wdata[B+7:B+4]),
                .encoded  (wdata_encoded[B+7:B])
            );
            wire [3:0] rp, rc;
            tb3d_decode u_dec (
                .encoded  (m_axi_sys_rdata[B+7:B]),
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
    assign m_axi_sys_awid    = s_axi_pmc_awid;
    assign m_axi_sys_awaddr  = s_axi_pmc_awaddr;
    assign m_axi_sys_awlen   = s_axi_pmc_awlen;
    assign m_axi_sys_awsize  = s_axi_pmc_awsize;
    assign m_axi_sys_awburst = s_axi_pmc_awburst;
    assign m_axi_sys_awvalid = s_axi_pmc_awvalid;
    assign s_axi_pmc_awready = m_axi_sys_awready;

    // Write data — encode
    assign m_axi_sys_wdata  = codec_active ? wdata_encoded : s_axi_pmc_wdata;
    assign m_axi_sys_wstrb  = s_axi_pmc_wstrb;
    assign m_axi_sys_wlast  = s_axi_pmc_wlast;
    assign m_axi_sys_wvalid = s_axi_pmc_wvalid;
    assign s_axi_pmc_wready = m_axi_sys_wready;

    // Write response — pass-through
    assign s_axi_pmc_bid    = m_axi_sys_bid;
    assign s_axi_pmc_bresp  = m_axi_sys_bresp;
    assign s_axi_pmc_bvalid = m_axi_sys_bvalid;
    assign m_axi_sys_bready = s_axi_pmc_bready;

    // Read address — pass-through
    assign m_axi_sys_arid    = s_axi_pmc_arid;
    assign m_axi_sys_araddr  = s_axi_pmc_araddr;
    assign m_axi_sys_arlen   = s_axi_pmc_arlen;
    assign m_axi_sys_arsize  = s_axi_pmc_arsize;
    assign m_axi_sys_arburst = s_axi_pmc_arburst;
    assign m_axi_sys_arvalid = s_axi_pmc_arvalid;
    assign s_axi_pmc_arready = m_axi_sys_arready;

    // Read data — decode
    assign s_axi_pmc_rid    = m_axi_sys_rid;
    assign s_axi_pmc_rdata  = codec_active ? rdata_decoded : m_axi_sys_rdata;
    assign s_axi_pmc_rresp  = m_axi_sys_rresp;
    assign s_axi_pmc_rlast  = m_axi_sys_rlast;
    assign s_axi_pmc_rvalid = m_axi_sys_rvalid;
    assign m_axi_sys_rready = s_axi_pmc_rready;

    // Performance counters + boot sequence tracker
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin csr_wr_cnt<=0; csr_rd_cnt<=0; csr_boot_seq<=0; end
        else begin
            if (s_axi_pmc_awvalid && s_axi_pmc_awready) begin
                csr_wr_cnt  <= csr_wr_cnt + 1;
                csr_boot_seq <= csr_boot_seq + 1;
            end
            if (s_axi_pmc_arvalid && s_axi_pmc_arready) csr_rd_cnt <= csr_rd_cnt + 1;
        end
    end

endmodule
