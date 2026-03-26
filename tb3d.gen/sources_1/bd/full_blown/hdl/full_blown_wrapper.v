//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Thu Mar 26 01:20:55 2026
//Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target full_blown_wrapper.bd
//Design      : full_blown_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module full_blown_wrapper
   (S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    UART_0_rxd,
    UART_0_txd,
    aclk0_0,
    ch0_lpddr4_trip1_ca_a,
    ch0_lpddr4_trip1_ca_b,
    ch0_lpddr4_trip1_ck_c_a,
    ch0_lpddr4_trip1_ck_c_b,
    ch0_lpddr4_trip1_ck_t_a,
    ch0_lpddr4_trip1_ck_t_b,
    ch0_lpddr4_trip1_cke_a,
    ch0_lpddr4_trip1_cke_b,
    ch0_lpddr4_trip1_cs_a,
    ch0_lpddr4_trip1_cs_b,
    ch0_lpddr4_trip1_dmi_a,
    ch0_lpddr4_trip1_dmi_b,
    ch0_lpddr4_trip1_dq_a,
    ch0_lpddr4_trip1_dq_b,
    ch0_lpddr4_trip1_dqs_c_a,
    ch0_lpddr4_trip1_dqs_c_b,
    ch0_lpddr4_trip1_dqs_t_a,
    ch0_lpddr4_trip1_dqs_t_b,
    ch0_lpddr4_trip1_reset_n,
    ch0_lpddr4_trip2_ca_a,
    ch0_lpddr4_trip2_ca_b,
    ch0_lpddr4_trip2_ck_c_a,
    ch0_lpddr4_trip2_ck_c_b,
    ch0_lpddr4_trip2_ck_t_a,
    ch0_lpddr4_trip2_ck_t_b,
    ch0_lpddr4_trip2_cke_a,
    ch0_lpddr4_trip2_cke_b,
    ch0_lpddr4_trip2_cs_a,
    ch0_lpddr4_trip2_cs_b,
    ch0_lpddr4_trip2_dmi_a,
    ch0_lpddr4_trip2_dmi_b,
    ch0_lpddr4_trip2_dq_a,
    ch0_lpddr4_trip2_dq_b,
    ch0_lpddr4_trip2_dqs_c_a,
    ch0_lpddr4_trip2_dqs_c_b,
    ch0_lpddr4_trip2_dqs_t_a,
    ch0_lpddr4_trip2_dqs_t_b,
    ch0_lpddr4_trip2_reset_n,
    ch1_lpddr4_trip1_ca_a,
    ch1_lpddr4_trip1_ca_b,
    ch1_lpddr4_trip1_ck_c_a,
    ch1_lpddr4_trip1_ck_c_b,
    ch1_lpddr4_trip1_ck_t_a,
    ch1_lpddr4_trip1_ck_t_b,
    ch1_lpddr4_trip1_cke_a,
    ch1_lpddr4_trip1_cke_b,
    ch1_lpddr4_trip1_cs_a,
    ch1_lpddr4_trip1_cs_b,
    ch1_lpddr4_trip1_dmi_a,
    ch1_lpddr4_trip1_dmi_b,
    ch1_lpddr4_trip1_dq_a,
    ch1_lpddr4_trip1_dq_b,
    ch1_lpddr4_trip1_dqs_c_a,
    ch1_lpddr4_trip1_dqs_c_b,
    ch1_lpddr4_trip1_dqs_t_a,
    ch1_lpddr4_trip1_dqs_t_b,
    ch1_lpddr4_trip1_reset_n,
    ch1_lpddr4_trip2_ca_a,
    ch1_lpddr4_trip2_ca_b,
    ch1_lpddr4_trip2_ck_c_a,
    ch1_lpddr4_trip2_ck_c_b,
    ch1_lpddr4_trip2_ck_t_a,
    ch1_lpddr4_trip2_ck_t_b,
    ch1_lpddr4_trip2_cke_a,
    ch1_lpddr4_trip2_cke_b,
    ch1_lpddr4_trip2_cs_a,
    ch1_lpddr4_trip2_cs_b,
    ch1_lpddr4_trip2_dmi_a,
    ch1_lpddr4_trip2_dmi_b,
    ch1_lpddr4_trip2_dq_a,
    ch1_lpddr4_trip2_dq_b,
    ch1_lpddr4_trip2_dqs_c_a,
    ch1_lpddr4_trip2_dqs_c_b,
    ch1_lpddr4_trip2_dqs_t_a,
    ch1_lpddr4_trip2_dqs_t_b,
    ch1_lpddr4_trip2_reset_n,
    clk_100MHz,
    gt_refclk0_0_clk_n,
    gt_refclk0_0_clk_p,
    lpddr4_clk1_clk_n,
    lpddr4_clk1_clk_p,
    lpddr4_clk2_clk_n,
    lpddr4_clk2_clk_p,
    reset_rtl);
  input [63:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output [0:0]S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  input [63:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output [0:0]S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [0:0]S00_AXI_wlast;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;
  input UART_0_rxd;
  output UART_0_txd;
  input aclk0_0;
  output [5:0]ch0_lpddr4_trip1_ca_a;
  output [5:0]ch0_lpddr4_trip1_ca_b;
  output ch0_lpddr4_trip1_ck_c_a;
  output ch0_lpddr4_trip1_ck_c_b;
  output ch0_lpddr4_trip1_ck_t_a;
  output ch0_lpddr4_trip1_ck_t_b;
  output ch0_lpddr4_trip1_cke_a;
  output ch0_lpddr4_trip1_cke_b;
  output ch0_lpddr4_trip1_cs_a;
  output ch0_lpddr4_trip1_cs_b;
  inout [1:0]ch0_lpddr4_trip1_dmi_a;
  inout [1:0]ch0_lpddr4_trip1_dmi_b;
  inout [15:0]ch0_lpddr4_trip1_dq_a;
  inout [15:0]ch0_lpddr4_trip1_dq_b;
  inout [1:0]ch0_lpddr4_trip1_dqs_c_a;
  inout [1:0]ch0_lpddr4_trip1_dqs_c_b;
  inout [1:0]ch0_lpddr4_trip1_dqs_t_a;
  inout [1:0]ch0_lpddr4_trip1_dqs_t_b;
  output ch0_lpddr4_trip1_reset_n;
  output [5:0]ch0_lpddr4_trip2_ca_a;
  output [5:0]ch0_lpddr4_trip2_ca_b;
  output ch0_lpddr4_trip2_ck_c_a;
  output ch0_lpddr4_trip2_ck_c_b;
  output ch0_lpddr4_trip2_ck_t_a;
  output ch0_lpddr4_trip2_ck_t_b;
  output ch0_lpddr4_trip2_cke_a;
  output ch0_lpddr4_trip2_cke_b;
  output ch0_lpddr4_trip2_cs_a;
  output ch0_lpddr4_trip2_cs_b;
  inout [1:0]ch0_lpddr4_trip2_dmi_a;
  inout [1:0]ch0_lpddr4_trip2_dmi_b;
  inout [15:0]ch0_lpddr4_trip2_dq_a;
  inout [15:0]ch0_lpddr4_trip2_dq_b;
  inout [1:0]ch0_lpddr4_trip2_dqs_c_a;
  inout [1:0]ch0_lpddr4_trip2_dqs_c_b;
  inout [1:0]ch0_lpddr4_trip2_dqs_t_a;
  inout [1:0]ch0_lpddr4_trip2_dqs_t_b;
  output ch0_lpddr4_trip2_reset_n;
  output [5:0]ch1_lpddr4_trip1_ca_a;
  output [5:0]ch1_lpddr4_trip1_ca_b;
  output ch1_lpddr4_trip1_ck_c_a;
  output ch1_lpddr4_trip1_ck_c_b;
  output ch1_lpddr4_trip1_ck_t_a;
  output ch1_lpddr4_trip1_ck_t_b;
  output ch1_lpddr4_trip1_cke_a;
  output ch1_lpddr4_trip1_cke_b;
  output ch1_lpddr4_trip1_cs_a;
  output ch1_lpddr4_trip1_cs_b;
  inout [1:0]ch1_lpddr4_trip1_dmi_a;
  inout [1:0]ch1_lpddr4_trip1_dmi_b;
  inout [15:0]ch1_lpddr4_trip1_dq_a;
  inout [15:0]ch1_lpddr4_trip1_dq_b;
  inout [1:0]ch1_lpddr4_trip1_dqs_c_a;
  inout [1:0]ch1_lpddr4_trip1_dqs_c_b;
  inout [1:0]ch1_lpddr4_trip1_dqs_t_a;
  inout [1:0]ch1_lpddr4_trip1_dqs_t_b;
  output ch1_lpddr4_trip1_reset_n;
  output [5:0]ch1_lpddr4_trip2_ca_a;
  output [5:0]ch1_lpddr4_trip2_ca_b;
  output ch1_lpddr4_trip2_ck_c_a;
  output ch1_lpddr4_trip2_ck_c_b;
  output ch1_lpddr4_trip2_ck_t_a;
  output ch1_lpddr4_trip2_ck_t_b;
  output ch1_lpddr4_trip2_cke_a;
  output ch1_lpddr4_trip2_cke_b;
  output ch1_lpddr4_trip2_cs_a;
  output ch1_lpddr4_trip2_cs_b;
  inout [1:0]ch1_lpddr4_trip2_dmi_a;
  inout [1:0]ch1_lpddr4_trip2_dmi_b;
  inout [15:0]ch1_lpddr4_trip2_dq_a;
  inout [15:0]ch1_lpddr4_trip2_dq_b;
  inout [1:0]ch1_lpddr4_trip2_dqs_c_a;
  inout [1:0]ch1_lpddr4_trip2_dqs_c_b;
  inout [1:0]ch1_lpddr4_trip2_dqs_t_a;
  inout [1:0]ch1_lpddr4_trip2_dqs_t_b;
  output ch1_lpddr4_trip2_reset_n;
  input clk_100MHz;
  input gt_refclk0_0_clk_n;
  input gt_refclk0_0_clk_p;
  input lpddr4_clk1_clk_n;
  input lpddr4_clk1_clk_p;
  input lpddr4_clk2_clk_n;
  input lpddr4_clk2_clk_p;
  input reset_rtl;

  wire [63:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]S00_AXI_arready;
  wire [3:0]S00_AXI_arregion;
  wire [2:0]S00_AXI_arsize;
  wire [0:0]S00_AXI_arvalid;
  wire [63:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire [0:0]S00_AXI_awready;
  wire [3:0]S00_AXI_awregion;
  wire [2:0]S00_AXI_awsize;
  wire [0:0]S00_AXI_awvalid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [0:0]S00_AXI_rlast;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wlast;
  wire [0:0]S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire UART_0_rxd;
  wire UART_0_txd;
  wire aclk0_0;
  wire [5:0]ch0_lpddr4_trip1_ca_a;
  wire [5:0]ch0_lpddr4_trip1_ca_b;
  wire ch0_lpddr4_trip1_ck_c_a;
  wire ch0_lpddr4_trip1_ck_c_b;
  wire ch0_lpddr4_trip1_ck_t_a;
  wire ch0_lpddr4_trip1_ck_t_b;
  wire ch0_lpddr4_trip1_cke_a;
  wire ch0_lpddr4_trip1_cke_b;
  wire ch0_lpddr4_trip1_cs_a;
  wire ch0_lpddr4_trip1_cs_b;
  wire [1:0]ch0_lpddr4_trip1_dmi_a;
  wire [1:0]ch0_lpddr4_trip1_dmi_b;
  wire [15:0]ch0_lpddr4_trip1_dq_a;
  wire [15:0]ch0_lpddr4_trip1_dq_b;
  wire [1:0]ch0_lpddr4_trip1_dqs_c_a;
  wire [1:0]ch0_lpddr4_trip1_dqs_c_b;
  wire [1:0]ch0_lpddr4_trip1_dqs_t_a;
  wire [1:0]ch0_lpddr4_trip1_dqs_t_b;
  wire ch0_lpddr4_trip1_reset_n;
  wire [5:0]ch0_lpddr4_trip2_ca_a;
  wire [5:0]ch0_lpddr4_trip2_ca_b;
  wire ch0_lpddr4_trip2_ck_c_a;
  wire ch0_lpddr4_trip2_ck_c_b;
  wire ch0_lpddr4_trip2_ck_t_a;
  wire ch0_lpddr4_trip2_ck_t_b;
  wire ch0_lpddr4_trip2_cke_a;
  wire ch0_lpddr4_trip2_cke_b;
  wire ch0_lpddr4_trip2_cs_a;
  wire ch0_lpddr4_trip2_cs_b;
  wire [1:0]ch0_lpddr4_trip2_dmi_a;
  wire [1:0]ch0_lpddr4_trip2_dmi_b;
  wire [15:0]ch0_lpddr4_trip2_dq_a;
  wire [15:0]ch0_lpddr4_trip2_dq_b;
  wire [1:0]ch0_lpddr4_trip2_dqs_c_a;
  wire [1:0]ch0_lpddr4_trip2_dqs_c_b;
  wire [1:0]ch0_lpddr4_trip2_dqs_t_a;
  wire [1:0]ch0_lpddr4_trip2_dqs_t_b;
  wire ch0_lpddr4_trip2_reset_n;
  wire [5:0]ch1_lpddr4_trip1_ca_a;
  wire [5:0]ch1_lpddr4_trip1_ca_b;
  wire ch1_lpddr4_trip1_ck_c_a;
  wire ch1_lpddr4_trip1_ck_c_b;
  wire ch1_lpddr4_trip1_ck_t_a;
  wire ch1_lpddr4_trip1_ck_t_b;
  wire ch1_lpddr4_trip1_cke_a;
  wire ch1_lpddr4_trip1_cke_b;
  wire ch1_lpddr4_trip1_cs_a;
  wire ch1_lpddr4_trip1_cs_b;
  wire [1:0]ch1_lpddr4_trip1_dmi_a;
  wire [1:0]ch1_lpddr4_trip1_dmi_b;
  wire [15:0]ch1_lpddr4_trip1_dq_a;
  wire [15:0]ch1_lpddr4_trip1_dq_b;
  wire [1:0]ch1_lpddr4_trip1_dqs_c_a;
  wire [1:0]ch1_lpddr4_trip1_dqs_c_b;
  wire [1:0]ch1_lpddr4_trip1_dqs_t_a;
  wire [1:0]ch1_lpddr4_trip1_dqs_t_b;
  wire ch1_lpddr4_trip1_reset_n;
  wire [5:0]ch1_lpddr4_trip2_ca_a;
  wire [5:0]ch1_lpddr4_trip2_ca_b;
  wire ch1_lpddr4_trip2_ck_c_a;
  wire ch1_lpddr4_trip2_ck_c_b;
  wire ch1_lpddr4_trip2_ck_t_a;
  wire ch1_lpddr4_trip2_ck_t_b;
  wire ch1_lpddr4_trip2_cke_a;
  wire ch1_lpddr4_trip2_cke_b;
  wire ch1_lpddr4_trip2_cs_a;
  wire ch1_lpddr4_trip2_cs_b;
  wire [1:0]ch1_lpddr4_trip2_dmi_a;
  wire [1:0]ch1_lpddr4_trip2_dmi_b;
  wire [15:0]ch1_lpddr4_trip2_dq_a;
  wire [15:0]ch1_lpddr4_trip2_dq_b;
  wire [1:0]ch1_lpddr4_trip2_dqs_c_a;
  wire [1:0]ch1_lpddr4_trip2_dqs_c_b;
  wire [1:0]ch1_lpddr4_trip2_dqs_t_a;
  wire [1:0]ch1_lpddr4_trip2_dqs_t_b;
  wire ch1_lpddr4_trip2_reset_n;
  wire clk_100MHz;
  wire gt_refclk0_0_clk_n;
  wire gt_refclk0_0_clk_p;
  wire lpddr4_clk1_clk_n;
  wire lpddr4_clk1_clk_p;
  wire lpddr4_clk2_clk_n;
  wire lpddr4_clk2_clk_p;
  wire reset_rtl;

  full_blown full_blown_i
       (.S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arregion(S00_AXI_arregion),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awregion(S00_AXI_awregion),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .UART_0_rxd(UART_0_rxd),
        .UART_0_txd(UART_0_txd),
        .aclk0_0(aclk0_0),
        .ch0_lpddr4_trip1_ca_a(ch0_lpddr4_trip1_ca_a),
        .ch0_lpddr4_trip1_ca_b(ch0_lpddr4_trip1_ca_b),
        .ch0_lpddr4_trip1_ck_c_a(ch0_lpddr4_trip1_ck_c_a),
        .ch0_lpddr4_trip1_ck_c_b(ch0_lpddr4_trip1_ck_c_b),
        .ch0_lpddr4_trip1_ck_t_a(ch0_lpddr4_trip1_ck_t_a),
        .ch0_lpddr4_trip1_ck_t_b(ch0_lpddr4_trip1_ck_t_b),
        .ch0_lpddr4_trip1_cke_a(ch0_lpddr4_trip1_cke_a),
        .ch0_lpddr4_trip1_cke_b(ch0_lpddr4_trip1_cke_b),
        .ch0_lpddr4_trip1_cs_a(ch0_lpddr4_trip1_cs_a),
        .ch0_lpddr4_trip1_cs_b(ch0_lpddr4_trip1_cs_b),
        .ch0_lpddr4_trip1_dmi_a(ch0_lpddr4_trip1_dmi_a),
        .ch0_lpddr4_trip1_dmi_b(ch0_lpddr4_trip1_dmi_b),
        .ch0_lpddr4_trip1_dq_a(ch0_lpddr4_trip1_dq_a),
        .ch0_lpddr4_trip1_dq_b(ch0_lpddr4_trip1_dq_b),
        .ch0_lpddr4_trip1_dqs_c_a(ch0_lpddr4_trip1_dqs_c_a),
        .ch0_lpddr4_trip1_dqs_c_b(ch0_lpddr4_trip1_dqs_c_b),
        .ch0_lpddr4_trip1_dqs_t_a(ch0_lpddr4_trip1_dqs_t_a),
        .ch0_lpddr4_trip1_dqs_t_b(ch0_lpddr4_trip1_dqs_t_b),
        .ch0_lpddr4_trip1_reset_n(ch0_lpddr4_trip1_reset_n),
        .ch0_lpddr4_trip2_ca_a(ch0_lpddr4_trip2_ca_a),
        .ch0_lpddr4_trip2_ca_b(ch0_lpddr4_trip2_ca_b),
        .ch0_lpddr4_trip2_ck_c_a(ch0_lpddr4_trip2_ck_c_a),
        .ch0_lpddr4_trip2_ck_c_b(ch0_lpddr4_trip2_ck_c_b),
        .ch0_lpddr4_trip2_ck_t_a(ch0_lpddr4_trip2_ck_t_a),
        .ch0_lpddr4_trip2_ck_t_b(ch0_lpddr4_trip2_ck_t_b),
        .ch0_lpddr4_trip2_cke_a(ch0_lpddr4_trip2_cke_a),
        .ch0_lpddr4_trip2_cke_b(ch0_lpddr4_trip2_cke_b),
        .ch0_lpddr4_trip2_cs_a(ch0_lpddr4_trip2_cs_a),
        .ch0_lpddr4_trip2_cs_b(ch0_lpddr4_trip2_cs_b),
        .ch0_lpddr4_trip2_dmi_a(ch0_lpddr4_trip2_dmi_a),
        .ch0_lpddr4_trip2_dmi_b(ch0_lpddr4_trip2_dmi_b),
        .ch0_lpddr4_trip2_dq_a(ch0_lpddr4_trip2_dq_a),
        .ch0_lpddr4_trip2_dq_b(ch0_lpddr4_trip2_dq_b),
        .ch0_lpddr4_trip2_dqs_c_a(ch0_lpddr4_trip2_dqs_c_a),
        .ch0_lpddr4_trip2_dqs_c_b(ch0_lpddr4_trip2_dqs_c_b),
        .ch0_lpddr4_trip2_dqs_t_a(ch0_lpddr4_trip2_dqs_t_a),
        .ch0_lpddr4_trip2_dqs_t_b(ch0_lpddr4_trip2_dqs_t_b),
        .ch0_lpddr4_trip2_reset_n(ch0_lpddr4_trip2_reset_n),
        .ch1_lpddr4_trip1_ca_a(ch1_lpddr4_trip1_ca_a),
        .ch1_lpddr4_trip1_ca_b(ch1_lpddr4_trip1_ca_b),
        .ch1_lpddr4_trip1_ck_c_a(ch1_lpddr4_trip1_ck_c_a),
        .ch1_lpddr4_trip1_ck_c_b(ch1_lpddr4_trip1_ck_c_b),
        .ch1_lpddr4_trip1_ck_t_a(ch1_lpddr4_trip1_ck_t_a),
        .ch1_lpddr4_trip1_ck_t_b(ch1_lpddr4_trip1_ck_t_b),
        .ch1_lpddr4_trip1_cke_a(ch1_lpddr4_trip1_cke_a),
        .ch1_lpddr4_trip1_cke_b(ch1_lpddr4_trip1_cke_b),
        .ch1_lpddr4_trip1_cs_a(ch1_lpddr4_trip1_cs_a),
        .ch1_lpddr4_trip1_cs_b(ch1_lpddr4_trip1_cs_b),
        .ch1_lpddr4_trip1_dmi_a(ch1_lpddr4_trip1_dmi_a),
        .ch1_lpddr4_trip1_dmi_b(ch1_lpddr4_trip1_dmi_b),
        .ch1_lpddr4_trip1_dq_a(ch1_lpddr4_trip1_dq_a),
        .ch1_lpddr4_trip1_dq_b(ch1_lpddr4_trip1_dq_b),
        .ch1_lpddr4_trip1_dqs_c_a(ch1_lpddr4_trip1_dqs_c_a),
        .ch1_lpddr4_trip1_dqs_c_b(ch1_lpddr4_trip1_dqs_c_b),
        .ch1_lpddr4_trip1_dqs_t_a(ch1_lpddr4_trip1_dqs_t_a),
        .ch1_lpddr4_trip1_dqs_t_b(ch1_lpddr4_trip1_dqs_t_b),
        .ch1_lpddr4_trip1_reset_n(ch1_lpddr4_trip1_reset_n),
        .ch1_lpddr4_trip2_ca_a(ch1_lpddr4_trip2_ca_a),
        .ch1_lpddr4_trip2_ca_b(ch1_lpddr4_trip2_ca_b),
        .ch1_lpddr4_trip2_ck_c_a(ch1_lpddr4_trip2_ck_c_a),
        .ch1_lpddr4_trip2_ck_c_b(ch1_lpddr4_trip2_ck_c_b),
        .ch1_lpddr4_trip2_ck_t_a(ch1_lpddr4_trip2_ck_t_a),
        .ch1_lpddr4_trip2_ck_t_b(ch1_lpddr4_trip2_ck_t_b),
        .ch1_lpddr4_trip2_cke_a(ch1_lpddr4_trip2_cke_a),
        .ch1_lpddr4_trip2_cke_b(ch1_lpddr4_trip2_cke_b),
        .ch1_lpddr4_trip2_cs_a(ch1_lpddr4_trip2_cs_a),
        .ch1_lpddr4_trip2_cs_b(ch1_lpddr4_trip2_cs_b),
        .ch1_lpddr4_trip2_dmi_a(ch1_lpddr4_trip2_dmi_a),
        .ch1_lpddr4_trip2_dmi_b(ch1_lpddr4_trip2_dmi_b),
        .ch1_lpddr4_trip2_dq_a(ch1_lpddr4_trip2_dq_a),
        .ch1_lpddr4_trip2_dq_b(ch1_lpddr4_trip2_dq_b),
        .ch1_lpddr4_trip2_dqs_c_a(ch1_lpddr4_trip2_dqs_c_a),
        .ch1_lpddr4_trip2_dqs_c_b(ch1_lpddr4_trip2_dqs_c_b),
        .ch1_lpddr4_trip2_dqs_t_a(ch1_lpddr4_trip2_dqs_t_a),
        .ch1_lpddr4_trip2_dqs_t_b(ch1_lpddr4_trip2_dqs_t_b),
        .ch1_lpddr4_trip2_reset_n(ch1_lpddr4_trip2_reset_n),
        .clk_100MHz(clk_100MHz),
        .gt_refclk0_0_clk_n(gt_refclk0_0_clk_n),
        .gt_refclk0_0_clk_p(gt_refclk0_0_clk_p),
        .lpddr4_clk1_clk_n(lpddr4_clk1_clk_n),
        .lpddr4_clk1_clk_p(lpddr4_clk1_clk_p),
        .lpddr4_clk2_clk_n(lpddr4_clk2_clk_n),
        .lpddr4_clk2_clk_p(lpddr4_clk2_clk_p),
        .reset_rtl(reset_rtl));
endmodule
