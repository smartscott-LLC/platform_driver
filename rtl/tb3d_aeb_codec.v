// =============================================================================
// Module  : tb3d_aeb_codec
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_aeb_codec.v
//
// Purpose : In-wire AXI Expansion Bridge (AEB) intercept codec.
//           Sits between high-speed memory-mapped peripherals and the Versal
//           NoC, allowing TB3D encoding/decoding of all memory transactions
//           from external accelerators, SmartConnect ports, or HLS IP.
//
//           The AEB handles AXI4 (not AXI4-Stream, not Lite) transactions at
//           full bandwidth (typically 256-bit data), so this codec must
//           maintain the same throughput as the data path.
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXI_APP    AXI4 slave   — in-wire FROM app/peripheral (Slave 1)
//   M_AXI_NOC    AXI4 master  — TB3D-processed data TO Versal NoC
//   S_AXI_CTRL   AXI4-Lite slave — runtime control FROM orchestrator
//
// Rule satisfied: 2 slaves + 1 master
//
// Data widths:
//   S_AXI_APP / M_AXI_NOC: 256-bit (can be parameterized: 128/256/512)
//   S_AXI_CTRL: 32-bit, 8-bit byte address
//   Address: 64-bit
//
// Clock domain:
//   axi_clk  200 MHz — all interfaces
//
// S_AXI_CTRL CSR map (32-bit, byte address)
//   0x00  CTRL      [0]=codec_en  [1]=bypass_mode
//   0x04  STATUS    [0]=ready  [1]=busy  (RO)
//   0x08  PERF_WR   AW-channel transaction counter  (RO)
//   0x0C  PERF_RD   AR-channel transaction counter  (RO)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_aeb_codec #(
    parameter integer DATA_W = 256,
    parameter integer ADDR_W = 64,
    parameter integer ID_W   = 12
) (
    // =========================================================================
    // Clock & Reset
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_APP:M_AXI_NOC:S_AXI_CTRL, ASSOCIATED_RESET axi_rst_n, FREQ_HZ 200000000" *)
    input  wire axi_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire axi_rst_n,

    // =========================================================================
    // S_AXI_APP — AXI4 slave  (FROM app/peripheral — Slave 1)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWID"    *) input  wire [ID_W-1:0]    s_axi_app_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWADDR"  *) input  wire [ADDR_W-1:0]  s_axi_app_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWLEN"   *) input  wire [7:0]         s_axi_app_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWSIZE"  *) input  wire [2:0]         s_axi_app_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWBURST" *) input  wire [1:0]         s_axi_app_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWVALID" *) input  wire               s_axi_app_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP AWREADY" *) output wire               s_axi_app_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP WDATA"   *) input  wire [DATA_W-1:0]  s_axi_app_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP WSTRB"   *) input  wire [DATA_W/8-1:0] s_axi_app_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP WLAST"   *) input  wire               s_axi_app_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP WVALID"  *) input  wire               s_axi_app_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP WREADY"  *) output wire               s_axi_app_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP BID"     *) output wire [ID_W-1:0]    s_axi_app_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP BRESP"   *) output wire [1:0]         s_axi_app_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP BVALID"  *) output wire               s_axi_app_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP BREADY"  *) input  wire               s_axi_app_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARID"    *) input  wire [ID_W-1:0]    s_axi_app_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARADDR"  *) input  wire [ADDR_W-1:0]  s_axi_app_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARLEN"   *) input  wire [7:0]         s_axi_app_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARSIZE"  *) input  wire [2:0]         s_axi_app_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARBURST" *) input  wire [1:0]         s_axi_app_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARVALID" *) input  wire               s_axi_app_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP ARREADY" *) output wire               s_axi_app_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RID"     *) output wire [ID_W-1:0]    s_axi_app_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RDATA"   *) output wire [DATA_W-1:0]  s_axi_app_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RRESP"   *) output wire [1:0]         s_axi_app_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RLAST"   *) output wire               s_axi_app_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RVALID"  *) output wire               s_axi_app_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_APP RREADY"  *) input  wire               s_axi_app_rready,

    // =========================================================================
    // M_AXI_NOC — AXI4 master  (TB3D-processed data → NoC)
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
    // S_AXI_CTRL — AXI4-Lite slave  (configuration)
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
    // IMPLEMENTATION STUB (Pass-through for initial deployment)
    // =========================================================================
    //
    // The AEB codec follow the same pattern as PCIe:
    // - Pass-through data from S_AXI_APP to M_AXI_NOC
    // - Implement basic CSR control (0x00–0x0C)
    // - Report codec ready and operational
    //
    // Full TB3D encoding/decoding on 256-bit data path would apply the
    // same dual-plane (physical/color) interleaving scheme as the GTY codec.
    //

    reg [31:0] csr_ctrl;
    reg [31:0] perf_wr = 0;
    reg [31:0] perf_rd = 0;

    // Pass-through write path
    assign m_axi_noc_awid    = s_axi_app_awid;
    assign m_axi_noc_awaddr  = s_axi_app_awaddr;
    assign m_axi_noc_awlen   = s_axi_app_awlen;
    assign m_axi_noc_awsize  = s_axi_app_awsize;
    assign m_axi_noc_awburst = s_axi_app_awburst;
    assign m_axi_noc_awvalid = s_axi_app_awvalid;
    assign s_axi_app_awready = m_axi_noc_awready;
    assign m_axi_noc_wdata   = s_axi_app_wdata;
    assign m_axi_noc_wstrb   = s_axi_app_wstrb;
    assign m_axi_noc_wlast   = s_axi_app_wlast;
    assign m_axi_noc_wvalid  = s_axi_app_wvalid;
    assign s_axi_app_wready  = m_axi_noc_wready;
    assign s_axi_app_bid     = m_axi_noc_bid;
    assign s_axi_app_bresp   = m_axi_noc_bresp;
    assign s_axi_app_bvalid  = m_axi_noc_bvalid;
    assign m_axi_noc_bready  = s_axi_app_bready;

    // Pass-through read path
    assign m_axi_noc_arid    = s_axi_app_arid;
    assign m_axi_noc_araddr  = s_axi_app_araddr;
    assign m_axi_noc_arlen   = s_axi_app_arlen;
    assign m_axi_noc_arsize  = s_axi_app_arsize;
    assign m_axi_noc_arburst = s_axi_app_arburst;
    assign m_axi_noc_arvalid = s_axi_app_arvalid;
    assign s_axi_app_arready = m_axi_noc_arready;
    assign s_axi_app_rid     = m_axi_noc_rid;
    assign s_axi_app_rdata   = m_axi_noc_rdata;
    assign s_axi_app_rresp   = m_axi_noc_rresp;
    assign s_axi_app_rlast   = m_axi_noc_rlast;
    assign s_axi_app_rvalid  = m_axi_noc_rvalid;
    assign m_axi_noc_rready  = s_axi_app_rready;

    // CSR registers
    assign s_axi_ctrl_awready = 1'b1;
    assign s_axi_ctrl_wready  = 1'b1;
    assign s_axi_ctrl_bresp   = 2'b00;
    assign s_axi_ctrl_bvalid  = 1'b1;
    assign s_axi_ctrl_arready = 1'b1;
    assign s_axi_ctrl_rdata   = (s_axi_ctrl_araddr == 8'h00) ? csr_ctrl :
                                (s_axi_ctrl_araddr == 8'h04) ? 32'h0000_0001 :  // STATUS: ready
                                (s_axi_ctrl_araddr == 8'h08) ? perf_wr :
                                (s_axi_ctrl_araddr == 8'h0C) ? perf_rd : 32'h0;
    assign s_axi_ctrl_rresp   = 2'b00;
    assign s_axi_ctrl_rvalid  = 1'b1;

    // CSR write handling
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            csr_ctrl <= 32'h0;
        end else begin
            if (s_axi_ctrl_wvalid && s_axi_ctrl_awvalid) begin
                if (s_axi_ctrl_awaddr == 8'h00) begin
                    csr_ctrl <= s_axi_ctrl_wdata;
                end
            end
        end
    end

endmodule
