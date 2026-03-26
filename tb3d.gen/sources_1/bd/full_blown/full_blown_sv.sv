// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:full_blown:1.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module full_blown_sv (
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI" *)
  (* X_INTERFACE_MODE = "slave S00_AXI" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN full_blown_aclk0_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  vivado_aximm_v1_0.slave S00_AXI,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire clk_100MHz,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire reset_rtl,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire aclk0_0,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch0_lpddr4_trip1_dq_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch0_lpddr4_trip1_dq_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dqs_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dqs_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dqs_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dqs_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch0_lpddr4_trip1_ca_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch0_lpddr4_trip1_ca_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_cs_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_cs_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_ck_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_ck_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_ck_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_ck_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_cke_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_cke_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dmi_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip1_dmi_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip1_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch1_lpddr4_trip1_dq_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch1_lpddr4_trip1_dq_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dqs_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dqs_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dqs_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dqs_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch1_lpddr4_trip1_ca_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch1_lpddr4_trip1_ca_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_cs_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_cs_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_ck_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_ck_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_ck_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_ck_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_cke_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_cke_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dmi_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip1_dmi_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip1_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire lpddr4_clk1_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire lpddr4_clk1_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch0_lpddr4_trip2_dq_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch0_lpddr4_trip2_dq_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dqs_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dqs_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dqs_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dqs_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch0_lpddr4_trip2_ca_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch0_lpddr4_trip2_ca_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_cs_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_cs_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_ck_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_ck_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_ck_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_ck_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_cke_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_cke_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dmi_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch0_lpddr4_trip2_dmi_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch0_lpddr4_trip2_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch1_lpddr4_trip2_dq_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [15:0] ch1_lpddr4_trip2_dq_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dqs_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dqs_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dqs_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dqs_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch1_lpddr4_trip2_ca_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [5:0] ch1_lpddr4_trip2_ca_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_cs_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_cs_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_ck_t_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_ck_t_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_ck_c_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_ck_c_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_cke_a,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_cke_b,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dmi_a,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [1:0] ch1_lpddr4_trip2_dmi_b,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ch1_lpddr4_trip2_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire lpddr4_clk2_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire lpddr4_clk2_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire gt_refclk0_0_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire gt_refclk0_0_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire UART_0_rxd,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire UART_0_txd
);

  // interface wire assignments
  assign S00_AXI.BID = 0;
  assign S00_AXI.BUSER = 0;
  assign S00_AXI.RID = 0;
  assign S00_AXI.RUSER = 0;

  full_blown inst (
    .clk_100MHz(clk_100MHz),
    .reset_rtl(reset_rtl),
    .S00_AXI_awaddr(S00_AXI.AWADDR),
    .S00_AXI_awlen(S00_AXI.AWLEN),
    .S00_AXI_awsize(S00_AXI.AWSIZE),
    .S00_AXI_awburst(S00_AXI.AWBURST),
    .S00_AXI_awlock(S00_AXI.AWLOCK),
    .S00_AXI_awcache(S00_AXI.AWCACHE),
    .S00_AXI_awprot(S00_AXI.AWPROT),
    .S00_AXI_awregion(S00_AXI.AWREGION),
    .S00_AXI_awqos(S00_AXI.AWQOS),
    .S00_AXI_awvalid(S00_AXI.AWVALID),
    .S00_AXI_awready(S00_AXI.AWREADY),
    .S00_AXI_wdata(S00_AXI.WDATA),
    .S00_AXI_wstrb(S00_AXI.WSTRB),
    .S00_AXI_wlast(S00_AXI.WLAST),
    .S00_AXI_wvalid(S00_AXI.WVALID),
    .S00_AXI_wready(S00_AXI.WREADY),
    .S00_AXI_bresp(S00_AXI.BRESP),
    .S00_AXI_bvalid(S00_AXI.BVALID),
    .S00_AXI_bready(S00_AXI.BREADY),
    .S00_AXI_araddr(S00_AXI.ARADDR),
    .S00_AXI_arlen(S00_AXI.ARLEN),
    .S00_AXI_arsize(S00_AXI.ARSIZE),
    .S00_AXI_arburst(S00_AXI.ARBURST),
    .S00_AXI_arlock(S00_AXI.ARLOCK),
    .S00_AXI_arcache(S00_AXI.ARCACHE),
    .S00_AXI_arprot(S00_AXI.ARPROT),
    .S00_AXI_arregion(S00_AXI.ARREGION),
    .S00_AXI_arqos(S00_AXI.ARQOS),
    .S00_AXI_arvalid(S00_AXI.ARVALID),
    .S00_AXI_arready(S00_AXI.ARREADY),
    .S00_AXI_rdata(S00_AXI.RDATA),
    .S00_AXI_rresp(S00_AXI.RRESP),
    .S00_AXI_rlast(S00_AXI.RLAST),
    .S00_AXI_rvalid(S00_AXI.RVALID),
    .S00_AXI_rready(S00_AXI.RREADY),
    .aclk0_0(aclk0_0),
    .ch0_lpddr4_trip1_dq_a(ch0_lpddr4_trip1_dq_a),
    .ch0_lpddr4_trip1_dq_b(ch0_lpddr4_trip1_dq_b),
    .ch0_lpddr4_trip1_dqs_t_a(ch0_lpddr4_trip1_dqs_t_a),
    .ch0_lpddr4_trip1_dqs_t_b(ch0_lpddr4_trip1_dqs_t_b),
    .ch0_lpddr4_trip1_dqs_c_a(ch0_lpddr4_trip1_dqs_c_a),
    .ch0_lpddr4_trip1_dqs_c_b(ch0_lpddr4_trip1_dqs_c_b),
    .ch0_lpddr4_trip1_ca_a(ch0_lpddr4_trip1_ca_a),
    .ch0_lpddr4_trip1_ca_b(ch0_lpddr4_trip1_ca_b),
    .ch0_lpddr4_trip1_cs_a(ch0_lpddr4_trip1_cs_a),
    .ch0_lpddr4_trip1_cs_b(ch0_lpddr4_trip1_cs_b),
    .ch0_lpddr4_trip1_ck_t_a(ch0_lpddr4_trip1_ck_t_a),
    .ch0_lpddr4_trip1_ck_t_b(ch0_lpddr4_trip1_ck_t_b),
    .ch0_lpddr4_trip1_ck_c_a(ch0_lpddr4_trip1_ck_c_a),
    .ch0_lpddr4_trip1_ck_c_b(ch0_lpddr4_trip1_ck_c_b),
    .ch0_lpddr4_trip1_cke_a(ch0_lpddr4_trip1_cke_a),
    .ch0_lpddr4_trip1_cke_b(ch0_lpddr4_trip1_cke_b),
    .ch0_lpddr4_trip1_dmi_a(ch0_lpddr4_trip1_dmi_a),
    .ch0_lpddr4_trip1_dmi_b(ch0_lpddr4_trip1_dmi_b),
    .ch0_lpddr4_trip1_reset_n(ch0_lpddr4_trip1_reset_n),
    .ch1_lpddr4_trip1_dq_a(ch1_lpddr4_trip1_dq_a),
    .ch1_lpddr4_trip1_dq_b(ch1_lpddr4_trip1_dq_b),
    .ch1_lpddr4_trip1_dqs_t_a(ch1_lpddr4_trip1_dqs_t_a),
    .ch1_lpddr4_trip1_dqs_t_b(ch1_lpddr4_trip1_dqs_t_b),
    .ch1_lpddr4_trip1_dqs_c_a(ch1_lpddr4_trip1_dqs_c_a),
    .ch1_lpddr4_trip1_dqs_c_b(ch1_lpddr4_trip1_dqs_c_b),
    .ch1_lpddr4_trip1_ca_a(ch1_lpddr4_trip1_ca_a),
    .ch1_lpddr4_trip1_ca_b(ch1_lpddr4_trip1_ca_b),
    .ch1_lpddr4_trip1_cs_a(ch1_lpddr4_trip1_cs_a),
    .ch1_lpddr4_trip1_cs_b(ch1_lpddr4_trip1_cs_b),
    .ch1_lpddr4_trip1_ck_t_a(ch1_lpddr4_trip1_ck_t_a),
    .ch1_lpddr4_trip1_ck_t_b(ch1_lpddr4_trip1_ck_t_b),
    .ch1_lpddr4_trip1_ck_c_a(ch1_lpddr4_trip1_ck_c_a),
    .ch1_lpddr4_trip1_ck_c_b(ch1_lpddr4_trip1_ck_c_b),
    .ch1_lpddr4_trip1_cke_a(ch1_lpddr4_trip1_cke_a),
    .ch1_lpddr4_trip1_cke_b(ch1_lpddr4_trip1_cke_b),
    .ch1_lpddr4_trip1_dmi_a(ch1_lpddr4_trip1_dmi_a),
    .ch1_lpddr4_trip1_dmi_b(ch1_lpddr4_trip1_dmi_b),
    .ch1_lpddr4_trip1_reset_n(ch1_lpddr4_trip1_reset_n),
    .lpddr4_clk1_clk_p(lpddr4_clk1_clk_p),
    .lpddr4_clk1_clk_n(lpddr4_clk1_clk_n),
    .ch0_lpddr4_trip2_dq_a(ch0_lpddr4_trip2_dq_a),
    .ch0_lpddr4_trip2_dq_b(ch0_lpddr4_trip2_dq_b),
    .ch0_lpddr4_trip2_dqs_t_a(ch0_lpddr4_trip2_dqs_t_a),
    .ch0_lpddr4_trip2_dqs_t_b(ch0_lpddr4_trip2_dqs_t_b),
    .ch0_lpddr4_trip2_dqs_c_a(ch0_lpddr4_trip2_dqs_c_a),
    .ch0_lpddr4_trip2_dqs_c_b(ch0_lpddr4_trip2_dqs_c_b),
    .ch0_lpddr4_trip2_ca_a(ch0_lpddr4_trip2_ca_a),
    .ch0_lpddr4_trip2_ca_b(ch0_lpddr4_trip2_ca_b),
    .ch0_lpddr4_trip2_cs_a(ch0_lpddr4_trip2_cs_a),
    .ch0_lpddr4_trip2_cs_b(ch0_lpddr4_trip2_cs_b),
    .ch0_lpddr4_trip2_ck_t_a(ch0_lpddr4_trip2_ck_t_a),
    .ch0_lpddr4_trip2_ck_t_b(ch0_lpddr4_trip2_ck_t_b),
    .ch0_lpddr4_trip2_ck_c_a(ch0_lpddr4_trip2_ck_c_a),
    .ch0_lpddr4_trip2_ck_c_b(ch0_lpddr4_trip2_ck_c_b),
    .ch0_lpddr4_trip2_cke_a(ch0_lpddr4_trip2_cke_a),
    .ch0_lpddr4_trip2_cke_b(ch0_lpddr4_trip2_cke_b),
    .ch0_lpddr4_trip2_dmi_a(ch0_lpddr4_trip2_dmi_a),
    .ch0_lpddr4_trip2_dmi_b(ch0_lpddr4_trip2_dmi_b),
    .ch0_lpddr4_trip2_reset_n(ch0_lpddr4_trip2_reset_n),
    .ch1_lpddr4_trip2_dq_a(ch1_lpddr4_trip2_dq_a),
    .ch1_lpddr4_trip2_dq_b(ch1_lpddr4_trip2_dq_b),
    .ch1_lpddr4_trip2_dqs_t_a(ch1_lpddr4_trip2_dqs_t_a),
    .ch1_lpddr4_trip2_dqs_t_b(ch1_lpddr4_trip2_dqs_t_b),
    .ch1_lpddr4_trip2_dqs_c_a(ch1_lpddr4_trip2_dqs_c_a),
    .ch1_lpddr4_trip2_dqs_c_b(ch1_lpddr4_trip2_dqs_c_b),
    .ch1_lpddr4_trip2_ca_a(ch1_lpddr4_trip2_ca_a),
    .ch1_lpddr4_trip2_ca_b(ch1_lpddr4_trip2_ca_b),
    .ch1_lpddr4_trip2_cs_a(ch1_lpddr4_trip2_cs_a),
    .ch1_lpddr4_trip2_cs_b(ch1_lpddr4_trip2_cs_b),
    .ch1_lpddr4_trip2_ck_t_a(ch1_lpddr4_trip2_ck_t_a),
    .ch1_lpddr4_trip2_ck_t_b(ch1_lpddr4_trip2_ck_t_b),
    .ch1_lpddr4_trip2_ck_c_a(ch1_lpddr4_trip2_ck_c_a),
    .ch1_lpddr4_trip2_ck_c_b(ch1_lpddr4_trip2_ck_c_b),
    .ch1_lpddr4_trip2_cke_a(ch1_lpddr4_trip2_cke_a),
    .ch1_lpddr4_trip2_cke_b(ch1_lpddr4_trip2_cke_b),
    .ch1_lpddr4_trip2_dmi_a(ch1_lpddr4_trip2_dmi_a),
    .ch1_lpddr4_trip2_dmi_b(ch1_lpddr4_trip2_dmi_b),
    .ch1_lpddr4_trip2_reset_n(ch1_lpddr4_trip2_reset_n),
    .lpddr4_clk2_clk_p(lpddr4_clk2_clk_p),
    .lpddr4_clk2_clk_n(lpddr4_clk2_clk_n),
    .gt_refclk0_0_clk_n(gt_refclk0_0_clk_n),
    .gt_refclk0_0_clk_p(gt_refclk0_0_clk_p),
    .UART_0_rxd(UART_0_rxd),
    .UART_0_txd(UART_0_txd)
  );

endmodule
