// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
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


//------------------------------------------------------------------------------------
// Filename:    full_blown_versal_cips_0_0_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module full_blown_versal_cips_0_0 (
  output bit_as_bool fpd_cci_noc_axi0_clk,
  output bit_as_bool fpd_cci_noc_axi1_clk,
  output bit_as_bool fpd_cci_noc_axi2_clk,
  output bit_as_bool fpd_cci_noc_axi3_clk,
  output bit_as_bool lpd_axi_noc_clk,
  output bit_as_bool pmc_axi_noc_axi0_clk,
  output bit_as_bool noc_pmc_axi_axi0_clk,
  output bit [93 : 0] gem0_tsu_timer_cnt,
  output bit_as_bool cpm_pcie_noc_axi0_clk,
  output bit_as_bool cpm_pcie_noc_axi1_clk,
  input bit_as_bool dma0_intrfc_clk,
  output bit_as_bool cpm_misc_irq,
  output bit_as_bool cpm_cor_irq,
  output bit_as_bool cpm_uncor_irq,
  input bit_as_bool cpm_irq0,
  input bit_as_bool cpm_irq1,
  output bit_as_bool dma0_axi_aresetn,
  input bit_as_bool dma0_intrfc_resetn,
  output bit [15 : 0] FPD_CCI_NOC_0_awid,
  output bit [63 : 0] FPD_CCI_NOC_0_awaddr,
  output bit [7 : 0] FPD_CCI_NOC_0_awlen,
  output bit [2 : 0] FPD_CCI_NOC_0_awsize,
  output bit [1 : 0] FPD_CCI_NOC_0_awburst,
  output bit_as_bool FPD_CCI_NOC_0_awlock,
  output bit [3 : 0] FPD_CCI_NOC_0_awcache,
  output bit [2 : 0] FPD_CCI_NOC_0_awprot,
  output bit_as_bool FPD_CCI_NOC_0_awvalid,
  output bit [17 : 0] FPD_CCI_NOC_0_awuser,
  input bit_as_bool FPD_CCI_NOC_0_awready,
  output bit [127 : 0] FPD_CCI_NOC_0_wdata,
  output bit [15 : 0] FPD_CCI_NOC_0_wstrb,
  output bit [16 : 0] FPD_CCI_NOC_0_wuser,
  output bit_as_bool FPD_CCI_NOC_0_wlast,
  output bit_as_bool FPD_CCI_NOC_0_wvalid,
  input bit_as_bool FPD_CCI_NOC_0_wready,
  input bit [15 : 0] FPD_CCI_NOC_0_bid,
  input bit [1 : 0] FPD_CCI_NOC_0_bresp,
  input bit_as_bool FPD_CCI_NOC_0_bvalid,
  output bit_as_bool FPD_CCI_NOC_0_bready,
  output bit [15 : 0] FPD_CCI_NOC_0_arid,
  output bit [63 : 0] FPD_CCI_NOC_0_araddr,
  output bit [7 : 0] FPD_CCI_NOC_0_arlen,
  output bit [2 : 0] FPD_CCI_NOC_0_arsize,
  output bit [1 : 0] FPD_CCI_NOC_0_arburst,
  output bit_as_bool FPD_CCI_NOC_0_arlock,
  output bit [3 : 0] FPD_CCI_NOC_0_arcache,
  output bit [2 : 0] FPD_CCI_NOC_0_arprot,
  output bit_as_bool FPD_CCI_NOC_0_arvalid,
  output bit [17 : 0] FPD_CCI_NOC_0_aruser,
  input bit_as_bool FPD_CCI_NOC_0_arready,
  input bit [15 : 0] FPD_CCI_NOC_0_rid,
  input bit [127 : 0] FPD_CCI_NOC_0_rdata,
  input bit [1 : 0] FPD_CCI_NOC_0_rresp,
  input bit_as_bool FPD_CCI_NOC_0_rlast,
  input bit_as_bool FPD_CCI_NOC_0_rvalid,
  output bit_as_bool FPD_CCI_NOC_0_rready,
  output bit [3 : 0] FPD_CCI_NOC_0_awqos,
  output bit [3 : 0] FPD_CCI_NOC_0_arqos,
  output bit [15 : 0] FPD_CCI_NOC_1_awid,
  output bit [63 : 0] FPD_CCI_NOC_1_awaddr,
  output bit [7 : 0] FPD_CCI_NOC_1_awlen,
  output bit [2 : 0] FPD_CCI_NOC_1_awsize,
  output bit [1 : 0] FPD_CCI_NOC_1_awburst,
  output bit_as_bool FPD_CCI_NOC_1_awlock,
  output bit [3 : 0] FPD_CCI_NOC_1_awcache,
  output bit [2 : 0] FPD_CCI_NOC_1_awprot,
  output bit_as_bool FPD_CCI_NOC_1_awvalid,
  output bit [17 : 0] FPD_CCI_NOC_1_awuser,
  input bit_as_bool FPD_CCI_NOC_1_awready,
  output bit [127 : 0] FPD_CCI_NOC_1_wdata,
  output bit [15 : 0] FPD_CCI_NOC_1_wstrb,
  output bit [16 : 0] FPD_CCI_NOC_1_wuser,
  output bit_as_bool FPD_CCI_NOC_1_wlast,
  output bit_as_bool FPD_CCI_NOC_1_wvalid,
  input bit_as_bool FPD_CCI_NOC_1_wready,
  input bit [15 : 0] FPD_CCI_NOC_1_bid,
  input bit [1 : 0] FPD_CCI_NOC_1_bresp,
  input bit_as_bool FPD_CCI_NOC_1_bvalid,
  output bit_as_bool FPD_CCI_NOC_1_bready,
  output bit [15 : 0] FPD_CCI_NOC_1_arid,
  output bit [63 : 0] FPD_CCI_NOC_1_araddr,
  output bit [7 : 0] FPD_CCI_NOC_1_arlen,
  output bit [2 : 0] FPD_CCI_NOC_1_arsize,
  output bit [1 : 0] FPD_CCI_NOC_1_arburst,
  output bit_as_bool FPD_CCI_NOC_1_arlock,
  output bit [3 : 0] FPD_CCI_NOC_1_arcache,
  output bit [2 : 0] FPD_CCI_NOC_1_arprot,
  output bit_as_bool FPD_CCI_NOC_1_arvalid,
  output bit [17 : 0] FPD_CCI_NOC_1_aruser,
  input bit_as_bool FPD_CCI_NOC_1_arready,
  input bit [15 : 0] FPD_CCI_NOC_1_rid,
  input bit [127 : 0] FPD_CCI_NOC_1_rdata,
  input bit [1 : 0] FPD_CCI_NOC_1_rresp,
  input bit_as_bool FPD_CCI_NOC_1_rlast,
  input bit_as_bool FPD_CCI_NOC_1_rvalid,
  output bit_as_bool FPD_CCI_NOC_1_rready,
  output bit [3 : 0] FPD_CCI_NOC_1_awqos,
  output bit [3 : 0] FPD_CCI_NOC_1_arqos,
  output bit [15 : 0] FPD_CCI_NOC_2_awid,
  output bit [63 : 0] FPD_CCI_NOC_2_awaddr,
  output bit [7 : 0] FPD_CCI_NOC_2_awlen,
  output bit [2 : 0] FPD_CCI_NOC_2_awsize,
  output bit [1 : 0] FPD_CCI_NOC_2_awburst,
  output bit_as_bool FPD_CCI_NOC_2_awlock,
  output bit [3 : 0] FPD_CCI_NOC_2_awcache,
  output bit [2 : 0] FPD_CCI_NOC_2_awprot,
  output bit_as_bool FPD_CCI_NOC_2_awvalid,
  output bit [17 : 0] FPD_CCI_NOC_2_awuser,
  input bit_as_bool FPD_CCI_NOC_2_awready,
  output bit [127 : 0] FPD_CCI_NOC_2_wdata,
  output bit [15 : 0] FPD_CCI_NOC_2_wstrb,
  output bit [16 : 0] FPD_CCI_NOC_2_wuser,
  output bit_as_bool FPD_CCI_NOC_2_wlast,
  output bit_as_bool FPD_CCI_NOC_2_wvalid,
  input bit_as_bool FPD_CCI_NOC_2_wready,
  input bit [15 : 0] FPD_CCI_NOC_2_bid,
  input bit [1 : 0] FPD_CCI_NOC_2_bresp,
  input bit_as_bool FPD_CCI_NOC_2_bvalid,
  output bit_as_bool FPD_CCI_NOC_2_bready,
  output bit [15 : 0] FPD_CCI_NOC_2_arid,
  output bit [63 : 0] FPD_CCI_NOC_2_araddr,
  output bit [7 : 0] FPD_CCI_NOC_2_arlen,
  output bit [2 : 0] FPD_CCI_NOC_2_arsize,
  output bit [1 : 0] FPD_CCI_NOC_2_arburst,
  output bit_as_bool FPD_CCI_NOC_2_arlock,
  output bit [3 : 0] FPD_CCI_NOC_2_arcache,
  output bit [2 : 0] FPD_CCI_NOC_2_arprot,
  output bit_as_bool FPD_CCI_NOC_2_arvalid,
  output bit [17 : 0] FPD_CCI_NOC_2_aruser,
  input bit_as_bool FPD_CCI_NOC_2_arready,
  input bit [15 : 0] FPD_CCI_NOC_2_rid,
  input bit [127 : 0] FPD_CCI_NOC_2_rdata,
  input bit [1 : 0] FPD_CCI_NOC_2_rresp,
  input bit_as_bool FPD_CCI_NOC_2_rlast,
  input bit_as_bool FPD_CCI_NOC_2_rvalid,
  output bit_as_bool FPD_CCI_NOC_2_rready,
  output bit [3 : 0] FPD_CCI_NOC_2_awqos,
  output bit [3 : 0] FPD_CCI_NOC_2_arqos,
  output bit [15 : 0] FPD_CCI_NOC_3_awid,
  output bit [63 : 0] FPD_CCI_NOC_3_awaddr,
  output bit [7 : 0] FPD_CCI_NOC_3_awlen,
  output bit [2 : 0] FPD_CCI_NOC_3_awsize,
  output bit [1 : 0] FPD_CCI_NOC_3_awburst,
  output bit_as_bool FPD_CCI_NOC_3_awlock,
  output bit [3 : 0] FPD_CCI_NOC_3_awcache,
  output bit [2 : 0] FPD_CCI_NOC_3_awprot,
  output bit_as_bool FPD_CCI_NOC_3_awvalid,
  output bit [17 : 0] FPD_CCI_NOC_3_awuser,
  input bit_as_bool FPD_CCI_NOC_3_awready,
  output bit [127 : 0] FPD_CCI_NOC_3_wdata,
  output bit [15 : 0] FPD_CCI_NOC_3_wstrb,
  output bit [16 : 0] FPD_CCI_NOC_3_wuser,
  output bit_as_bool FPD_CCI_NOC_3_wlast,
  output bit_as_bool FPD_CCI_NOC_3_wvalid,
  input bit_as_bool FPD_CCI_NOC_3_wready,
  input bit [15 : 0] FPD_CCI_NOC_3_bid,
  input bit [1 : 0] FPD_CCI_NOC_3_bresp,
  input bit_as_bool FPD_CCI_NOC_3_bvalid,
  output bit_as_bool FPD_CCI_NOC_3_bready,
  output bit [15 : 0] FPD_CCI_NOC_3_arid,
  output bit [63 : 0] FPD_CCI_NOC_3_araddr,
  output bit [7 : 0] FPD_CCI_NOC_3_arlen,
  output bit [2 : 0] FPD_CCI_NOC_3_arsize,
  output bit [1 : 0] FPD_CCI_NOC_3_arburst,
  output bit_as_bool FPD_CCI_NOC_3_arlock,
  output bit [3 : 0] FPD_CCI_NOC_3_arcache,
  output bit [2 : 0] FPD_CCI_NOC_3_arprot,
  output bit_as_bool FPD_CCI_NOC_3_arvalid,
  output bit [17 : 0] FPD_CCI_NOC_3_aruser,
  input bit_as_bool FPD_CCI_NOC_3_arready,
  input bit [15 : 0] FPD_CCI_NOC_3_rid,
  input bit [127 : 0] FPD_CCI_NOC_3_rdata,
  input bit [1 : 0] FPD_CCI_NOC_3_rresp,
  input bit_as_bool FPD_CCI_NOC_3_rlast,
  input bit_as_bool FPD_CCI_NOC_3_rvalid,
  output bit_as_bool FPD_CCI_NOC_3_rready,
  output bit [3 : 0] FPD_CCI_NOC_3_awqos,
  output bit [3 : 0] FPD_CCI_NOC_3_arqos,
  output bit [15 : 0] LPD_AXI_NOC_0_awid,
  output bit [63 : 0] LPD_AXI_NOC_0_awaddr,
  output bit [7 : 0] LPD_AXI_NOC_0_awlen,
  output bit [2 : 0] LPD_AXI_NOC_0_awsize,
  output bit [1 : 0] LPD_AXI_NOC_0_awburst,
  output bit_as_bool LPD_AXI_NOC_0_awlock,
  output bit [3 : 0] LPD_AXI_NOC_0_awcache,
  output bit [2 : 0] LPD_AXI_NOC_0_awprot,
  output bit_as_bool LPD_AXI_NOC_0_awvalid,
  output bit [17 : 0] LPD_AXI_NOC_0_awuser,
  input bit_as_bool LPD_AXI_NOC_0_awready,
  output bit [127 : 0] LPD_AXI_NOC_0_wdata,
  output bit [15 : 0] LPD_AXI_NOC_0_wstrb,
  output bit_as_bool LPD_AXI_NOC_0_wlast,
  output bit_as_bool LPD_AXI_NOC_0_wvalid,
  input bit_as_bool LPD_AXI_NOC_0_wready,
  input bit [15 : 0] LPD_AXI_NOC_0_bid,
  input bit [1 : 0] LPD_AXI_NOC_0_bresp,
  input bit_as_bool LPD_AXI_NOC_0_bvalid,
  output bit_as_bool LPD_AXI_NOC_0_bready,
  output bit [15 : 0] LPD_AXI_NOC_0_arid,
  output bit [63 : 0] LPD_AXI_NOC_0_araddr,
  output bit [7 : 0] LPD_AXI_NOC_0_arlen,
  output bit [2 : 0] LPD_AXI_NOC_0_arsize,
  output bit [1 : 0] LPD_AXI_NOC_0_arburst,
  output bit_as_bool LPD_AXI_NOC_0_arlock,
  output bit [3 : 0] LPD_AXI_NOC_0_arcache,
  output bit [2 : 0] LPD_AXI_NOC_0_arprot,
  output bit_as_bool LPD_AXI_NOC_0_arvalid,
  output bit [17 : 0] LPD_AXI_NOC_0_aruser,
  input bit_as_bool LPD_AXI_NOC_0_arready,
  input bit [15 : 0] LPD_AXI_NOC_0_rid,
  input bit [127 : 0] LPD_AXI_NOC_0_rdata,
  input bit [1 : 0] LPD_AXI_NOC_0_rresp,
  input bit_as_bool LPD_AXI_NOC_0_rlast,
  input bit_as_bool LPD_AXI_NOC_0_rvalid,
  output bit_as_bool LPD_AXI_NOC_0_rready,
  output bit [3 : 0] LPD_AXI_NOC_0_awqos,
  output bit [3 : 0] LPD_AXI_NOC_0_arqos,
  output bit [63 : 0] PMC_NOC_AXI_0_araddr,
  output bit [1 : 0] PMC_NOC_AXI_0_arburst,
  output bit [3 : 0] PMC_NOC_AXI_0_arcache,
  output bit [15 : 0] PMC_NOC_AXI_0_arid,
  output bit [7 : 0] PMC_NOC_AXI_0_arlen,
  output bit_as_bool PMC_NOC_AXI_0_arlock,
  output bit [2 : 0] PMC_NOC_AXI_0_arprot,
  output bit [3 : 0] PMC_NOC_AXI_0_arqos,
  output bit [3 : 0] PMC_NOC_AXI_0_arregion,
  output bit [2 : 0] PMC_NOC_AXI_0_arsize,
  output bit [17 : 0] PMC_NOC_AXI_0_aruser,
  output bit_as_bool PMC_NOC_AXI_0_arvalid,
  output bit [63 : 0] PMC_NOC_AXI_0_awaddr,
  output bit [1 : 0] PMC_NOC_AXI_0_awburst,
  output bit [3 : 0] PMC_NOC_AXI_0_awcache,
  output bit [15 : 0] PMC_NOC_AXI_0_awid,
  output bit [7 : 0] PMC_NOC_AXI_0_awlen,
  output bit_as_bool PMC_NOC_AXI_0_awlock,
  output bit [2 : 0] PMC_NOC_AXI_0_awprot,
  output bit [3 : 0] PMC_NOC_AXI_0_awqos,
  output bit [3 : 0] PMC_NOC_AXI_0_awregion,
  output bit [2 : 0] PMC_NOC_AXI_0_awsize,
  output bit [17 : 0] PMC_NOC_AXI_0_awuser,
  output bit_as_bool PMC_NOC_AXI_0_awvalid,
  output bit_as_bool PMC_NOC_AXI_0_bready,
  output bit_as_bool PMC_NOC_AXI_0_rready,
  output bit [127 : 0] PMC_NOC_AXI_0_wdata,
  output bit [15 : 0] PMC_NOC_AXI_0_wid,
  output bit_as_bool PMC_NOC_AXI_0_wlast,
  output bit [15 : 0] PMC_NOC_AXI_0_wstrb,
  output bit [16 : 0] PMC_NOC_AXI_0_wuser,
  output bit_as_bool PMC_NOC_AXI_0_wvalid,
  input bit_as_bool PMC_NOC_AXI_0_arready,
  input bit_as_bool PMC_NOC_AXI_0_awready,
  input bit [15 : 0] PMC_NOC_AXI_0_bid,
  input bit [1 : 0] PMC_NOC_AXI_0_bresp,
  input bit [15 : 0] PMC_NOC_AXI_0_buser,
  input bit_as_bool PMC_NOC_AXI_0_bvalid,
  input bit [127 : 0] PMC_NOC_AXI_0_rdata,
  input bit [15 : 0] PMC_NOC_AXI_0_rid,
  input bit_as_bool PMC_NOC_AXI_0_rlast,
  input bit [1 : 0] PMC_NOC_AXI_0_rresp,
  input bit [16 : 0] PMC_NOC_AXI_0_ruser,
  input bit_as_bool PMC_NOC_AXI_0_rvalid,
  input bit_as_bool PMC_NOC_AXI_0_wready,
  input bit [63 : 0] NOC_PMC_AXI_0_araddr,
  input bit [1 : 0] NOC_PMC_AXI_0_arburst,
  input bit [3 : 0] NOC_PMC_AXI_0_arcache,
  input bit [1 : 0] NOC_PMC_AXI_0_arid,
  input bit [7 : 0] NOC_PMC_AXI_0_arlen,
  input bit_as_bool NOC_PMC_AXI_0_arlock,
  input bit [2 : 0] NOC_PMC_AXI_0_arprot,
  input bit [3 : 0] NOC_PMC_AXI_0_arqos,
  input bit [3 : 0] NOC_PMC_AXI_0_arregion,
  input bit [2 : 0] NOC_PMC_AXI_0_arsize,
  input bit [17 : 0] NOC_PMC_AXI_0_aruser,
  input bit_as_bool NOC_PMC_AXI_0_arvalid,
  input bit [63 : 0] NOC_PMC_AXI_0_awaddr,
  input bit [1 : 0] NOC_PMC_AXI_0_awburst,
  input bit [3 : 0] NOC_PMC_AXI_0_awcache,
  input bit [1 : 0] NOC_PMC_AXI_0_awid,
  input bit [7 : 0] NOC_PMC_AXI_0_awlen,
  input bit_as_bool NOC_PMC_AXI_0_awlock,
  input bit [2 : 0] NOC_PMC_AXI_0_awprot,
  input bit [3 : 0] NOC_PMC_AXI_0_awqos,
  input bit [3 : 0] NOC_PMC_AXI_0_awregion,
  input bit [2 : 0] NOC_PMC_AXI_0_awsize,
  input bit [17 : 0] NOC_PMC_AXI_0_awuser,
  input bit_as_bool NOC_PMC_AXI_0_awvalid,
  input bit_as_bool NOC_PMC_AXI_0_bready,
  input bit_as_bool NOC_PMC_AXI_0_rready,
  input bit [127 : 0] NOC_PMC_AXI_0_wdata,
  input bit [3 : 0] NOC_PMC_AXI_0_wid,
  input bit_as_bool NOC_PMC_AXI_0_wlast,
  input bit [15 : 0] NOC_PMC_AXI_0_wstrb,
  input bit [16 : 0] NOC_PMC_AXI_0_wuser,
  input bit_as_bool NOC_PMC_AXI_0_wvalid,
  output bit_as_bool NOC_PMC_AXI_0_arready,
  output bit_as_bool NOC_PMC_AXI_0_awready,
  output bit [1 : 0] NOC_PMC_AXI_0_bid,
  output bit [1 : 0] NOC_PMC_AXI_0_bresp,
  output bit [15 : 0] NOC_PMC_AXI_0_buser,
  output bit_as_bool NOC_PMC_AXI_0_bvalid,
  output bit [127 : 0] NOC_PMC_AXI_0_rdata,
  output bit [1 : 0] NOC_PMC_AXI_0_rid,
  output bit_as_bool NOC_PMC_AXI_0_rlast,
  output bit [1 : 0] NOC_PMC_AXI_0_rresp,
  output bit [16 : 0] NOC_PMC_AXI_0_ruser,
  output bit_as_bool NOC_PMC_AXI_0_rvalid,
  output bit_as_bool NOC_PMC_AXI_0_wready,
  output bit [63 : 0] CPM_PCIE_NOC_0_araddr,
  output bit [1 : 0] CPM_PCIE_NOC_0_arburst,
  output bit [3 : 0] CPM_PCIE_NOC_0_arcache,
  output bit [15 : 0] CPM_PCIE_NOC_0_arid,
  output bit [7 : 0] CPM_PCIE_NOC_0_arlen,
  output bit_as_bool CPM_PCIE_NOC_0_arlock,
  output bit [2 : 0] CPM_PCIE_NOC_0_arprot,
  output bit [3 : 0] CPM_PCIE_NOC_0_arqos,
  output bit [2 : 0] CPM_PCIE_NOC_0_arsize,
  output bit [17 : 0] CPM_PCIE_NOC_0_aruser,
  output bit_as_bool CPM_PCIE_NOC_0_arvalid,
  output bit [63 : 0] CPM_PCIE_NOC_0_awaddr,
  output bit [1 : 0] CPM_PCIE_NOC_0_awburst,
  output bit [3 : 0] CPM_PCIE_NOC_0_awcache,
  output bit [15 : 0] CPM_PCIE_NOC_0_awid,
  output bit [7 : 0] CPM_PCIE_NOC_0_awlen,
  output bit_as_bool CPM_PCIE_NOC_0_awlock,
  output bit [2 : 0] CPM_PCIE_NOC_0_awprot,
  output bit [3 : 0] CPM_PCIE_NOC_0_awqos,
  output bit [2 : 0] CPM_PCIE_NOC_0_awsize,
  output bit [17 : 0] CPM_PCIE_NOC_0_awuser,
  output bit_as_bool CPM_PCIE_NOC_0_awvalid,
  output bit_as_bool CPM_PCIE_NOC_0_bready,
  output bit_as_bool CPM_PCIE_NOC_0_rready,
  output bit [127 : 0] CPM_PCIE_NOC_0_wdata,
  output bit_as_bool CPM_PCIE_NOC_0_wlast,
  output bit [15 : 0] CPM_PCIE_NOC_0_wstrb,
  output bit_as_bool CPM_PCIE_NOC_0_wvalid,
  input bit_as_bool CPM_PCIE_NOC_0_arready,
  input bit_as_bool CPM_PCIE_NOC_0_awready,
  input bit [15 : 0] CPM_PCIE_NOC_0_bid,
  input bit [1 : 0] CPM_PCIE_NOC_0_bresp,
  input bit_as_bool CPM_PCIE_NOC_0_bvalid,
  input bit [127 : 0] CPM_PCIE_NOC_0_rdata,
  input bit [15 : 0] CPM_PCIE_NOC_0_rid,
  input bit_as_bool CPM_PCIE_NOC_0_rlast,
  input bit [1 : 0] CPM_PCIE_NOC_0_rresp,
  input bit_as_bool CPM_PCIE_NOC_0_rvalid,
  input bit [16 : 0] CPM_PCIE_NOC_0_ruser,
  output bit [16 : 0] CPM_PCIE_NOC_0_wuser,
  input bit_as_bool CPM_PCIE_NOC_0_wready,
  output bit [63 : 0] CPM_PCIE_NOC_1_araddr,
  output bit [1 : 0] CPM_PCIE_NOC_1_arburst,
  output bit [3 : 0] CPM_PCIE_NOC_1_arcache,
  output bit [15 : 0] CPM_PCIE_NOC_1_arid,
  output bit [7 : 0] CPM_PCIE_NOC_1_arlen,
  output bit_as_bool CPM_PCIE_NOC_1_arlock,
  output bit [2 : 0] CPM_PCIE_NOC_1_arprot,
  output bit [3 : 0] CPM_PCIE_NOC_1_arqos,
  output bit [2 : 0] CPM_PCIE_NOC_1_arsize,
  output bit [17 : 0] CPM_PCIE_NOC_1_aruser,
  output bit_as_bool CPM_PCIE_NOC_1_arvalid,
  output bit [63 : 0] CPM_PCIE_NOC_1_awaddr,
  output bit [1 : 0] CPM_PCIE_NOC_1_awburst,
  output bit [3 : 0] CPM_PCIE_NOC_1_awcache,
  output bit [15 : 0] CPM_PCIE_NOC_1_awid,
  output bit [7 : 0] CPM_PCIE_NOC_1_awlen,
  output bit_as_bool CPM_PCIE_NOC_1_awlock,
  output bit [2 : 0] CPM_PCIE_NOC_1_awprot,
  output bit [3 : 0] CPM_PCIE_NOC_1_awqos,
  output bit [2 : 0] CPM_PCIE_NOC_1_awsize,
  output bit [17 : 0] CPM_PCIE_NOC_1_awuser,
  output bit_as_bool CPM_PCIE_NOC_1_awvalid,
  output bit_as_bool CPM_PCIE_NOC_1_bready,
  output bit_as_bool CPM_PCIE_NOC_1_rready,
  output bit [127 : 0] CPM_PCIE_NOC_1_wdata,
  output bit_as_bool CPM_PCIE_NOC_1_wlast,
  output bit [15 : 0] CPM_PCIE_NOC_1_wstrb,
  output bit_as_bool CPM_PCIE_NOC_1_wvalid,
  input bit_as_bool CPM_PCIE_NOC_1_arready,
  input bit_as_bool CPM_PCIE_NOC_1_awready,
  input bit [15 : 0] CPM_PCIE_NOC_1_bid,
  input bit [1 : 0] CPM_PCIE_NOC_1_bresp,
  input bit_as_bool CPM_PCIE_NOC_1_bvalid,
  input bit [127 : 0] CPM_PCIE_NOC_1_rdata,
  input bit [15 : 0] CPM_PCIE_NOC_1_rid,
  input bit_as_bool CPM_PCIE_NOC_1_rlast,
  input bit [1 : 0] CPM_PCIE_NOC_1_rresp,
  input bit_as_bool CPM_PCIE_NOC_1_rvalid,
  input bit [16 : 0] CPM_PCIE_NOC_1_ruser,
  output bit [16 : 0] CPM_PCIE_NOC_1_wuser,
  input bit_as_bool CPM_PCIE_NOC_1_wready,
  output bit_as_bool dma0_mgmt_cpl_vld,
  output bit_as_bool dma0_mgmt_req_rdy,
  input bit_as_bool dma0_mgmt_cpl_rdy,
  input bit_as_bool dma0_mgmt_req_vld,
  output bit [1 : 0] dma0_mgmt_cpl_sts,
  output bit [31 : 0] dma0_mgmt_cpl_dat,
  input bit [1 : 0] dma0_mgmt_req_cmd,
  input bit [12 : 0] dma0_mgmt_req_fnc,
  input bit [5 : 0] dma0_mgmt_req_msc,
  input bit [31 : 0] dma0_mgmt_req_adr,
  input bit [31 : 0] dma0_mgmt_req_dat,
  output bit_as_bool dma0_st_rx_msg_tlast,
  output bit_as_bool dma0_st_rx_msg_tvalid,
  input bit_as_bool dma0_st_rx_msg_tready,
  output bit [31 : 0] dma0_st_rx_msg_tdata,
  output bit_as_bool dma0_axis_c2h_dmawr_cmp,
  output bit_as_bool dma0_axis_c2h_dmawr_target_vch,
  output bit [2 : 0] dma0_axis_c2h_dmawr_port_id,
  output bit_as_bool dma0_s_axis_c2h_tready,
  input bit_as_bool dma0_s_axis_c2h_tlast,
  input bit_as_bool dma0_s_axis_c2h_tvalid,
  input bit [31 : 0] dma0_s_axis_c2h_tcrc,
  input bit [511 : 0] dma0_s_axis_c2h_tdata,
  input bit [5 : 0] dma0_s_axis_c2h_mty,
  input bit [6 : 0] dma0_s_axis_c2h_ecc,
  input bit_as_bool dma0_s_axis_c2h_ctrl_marker,
  input bit_as_bool dma0_s_axis_c2h_ctrl_has_cmpt,
  input bit [15 : 0] dma0_s_axis_c2h_ctrl_len,
  input bit [11 : 0] dma0_s_axis_c2h_ctrl_qid,
  input bit [2 : 0] dma0_s_axis_c2h_ctrl_port_id,
  input bit_as_bool dma0_s_axis_c2h_cmpt_marker,
  input bit_as_bool dma0_s_axis_c2h_cmpt_user_trig,
  input bit [1 : 0] dma0_s_axis_c2h_cmpt_size,
  input bit [12 : 0] dma0_s_axis_c2h_cmpt_qid,
  input bit_as_bool dma0_s_axis_c2h_cmpt_no_wrb_marker,
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_port_id,
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_col_idx,
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_err_idx,
  input bit [15 : 0] dma0_s_axis_c2h_cmpt_wait_pld_pkt_id,
  output bit_as_bool dma0_s_axis_c2h_cmpt_tready,
  input bit_as_bool dma0_s_axis_c2h_cmpt_tvalid,
  input bit [15 : 0] dma0_s_axis_c2h_cmpt_dpar,
  input bit [511 : 0] dma0_s_axis_c2h_cmpt_data,
  input bit [1 : 0] dma0_s_axis_c2h_cmpt_cmpt_type,
  output bit_as_bool dma0_m_axis_h2c_tlast,
  output bit_as_bool dma0_m_axis_h2c_err,
  output bit_as_bool dma0_m_axis_h2c_tvalid,
  output bit [511 : 0] dma0_m_axis_h2c_tdata,
  output bit_as_bool dma0_m_axis_h2c_zero_byte,
  input bit_as_bool dma0_m_axis_h2c_tready,
  output bit [31 : 0] dma0_m_axis_h2c_tcrc,
  output bit [5 : 0] dma0_m_axis_h2c_mty,
  output bit [11 : 0] dma0_m_axis_h2c_qid,
  output bit [31 : 0] dma0_m_axis_h2c_mdata,
  output bit [2 : 0] dma0_m_axis_h2c_port_id,
  output bit_as_bool dma0_axis_c2h_status_last,
  output bit_as_bool dma0_axis_c2h_status_drop,
  output bit_as_bool dma0_axis_c2h_status_error,
  output bit_as_bool dma0_axis_c2h_status_valid,
  output bit_as_bool dma0_axis_c2h_status_status_cmp,
  output bit [11 : 0] dma0_axis_c2h_status_qid,
  output bit_as_bool dma0_qsts_out_vld,
  output bit [7 : 0] dma0_qsts_out_op,
  input bit_as_bool dma0_qsts_out_rdy,
  output bit [12 : 0] dma0_qsts_out_qid,
  output bit [63 : 0] dma0_qsts_out_data,
  output bit [2 : 0] dma0_qsts_out_port_id,
  output bit_as_bool dma0_dsc_crdt_in_rdy,
  input bit_as_bool dma0_dsc_crdt_in_dir,
  input bit_as_bool dma0_dsc_crdt_in_valid,
  input bit_as_bool dma0_dsc_crdt_in_fence,
  input bit [11 : 0] dma0_dsc_crdt_in_qid,
  input bit [15 : 0] dma0_dsc_crdt_in_crdt,
  output bit_as_bool dma0_usr_irq_ack,
  output bit_as_bool dma0_usr_irq_fail,
  input bit_as_bool dma0_usr_irq_valid,
  input bit [10 : 0] dma0_usr_irq_vec,
  input bit [12 : 0] dma0_usr_irq_fnc,
  output bit_as_bool dma0_tm_dsc_sts_mm,
  output bit_as_bool dma0_tm_dsc_sts_qen,
  output bit_as_bool dma0_tm_dsc_sts_byp,
  output bit_as_bool dma0_tm_dsc_sts_dir,
  output bit_as_bool dma0_tm_dsc_sts_error,
  output bit_as_bool dma0_tm_dsc_sts_valid,
  output bit_as_bool dma0_tm_dsc_sts_qinv,
  output bit_as_bool dma0_tm_dsc_sts_irq_arm,
  input bit_as_bool dma0_tm_dsc_sts_rdy,
  output bit [11 : 0] dma0_tm_dsc_sts_qid,
  output bit [15 : 0] dma0_tm_dsc_sts_avl,
  output bit [15 : 0] dma0_tm_dsc_sts_pidx,
  output bit [2 : 0] dma0_tm_dsc_sts_port_id,
  output bit_as_bool dma0_usr_flr_set,
  output bit_as_bool dma0_usr_flr_clear,
  output bit [12 : 0] dma0_usr_flr_fnc,
  input bit_as_bool dma0_usr_flr_done_vld,
  input bit [12 : 0] dma0_usr_flr_done_fnc,
  input bit [7 : 0] PCIE0_GT_grx_n,
  output bit [7 : 0] PCIE0_GT_gtx_n,
  input bit [7 : 0] PCIE0_GT_grx_p,
  output bit [7 : 0] PCIE0_GT_gtx_p,
  input bit_as_bool gt_refclk0_clk_n,
  input bit_as_bool gt_refclk0_clk_p
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module full_blown_versal_cips_0_0 (fpd_cci_noc_axi0_clk,fpd_cci_noc_axi1_clk,fpd_cci_noc_axi2_clk,fpd_cci_noc_axi3_clk,lpd_axi_noc_clk,pmc_axi_noc_axi0_clk,noc_pmc_axi_axi0_clk,gem0_tsu_timer_cnt,cpm_pcie_noc_axi0_clk,cpm_pcie_noc_axi1_clk,dma0_intrfc_clk,cpm_misc_irq,cpm_cor_irq,cpm_uncor_irq,cpm_irq0,cpm_irq1,dma0_axi_aresetn,dma0_intrfc_resetn,FPD_CCI_NOC_0_awid,FPD_CCI_NOC_0_awaddr,FPD_CCI_NOC_0_awlen,FPD_CCI_NOC_0_awsize,FPD_CCI_NOC_0_awburst,FPD_CCI_NOC_0_awlock,FPD_CCI_NOC_0_awcache,FPD_CCI_NOC_0_awprot,FPD_CCI_NOC_0_awvalid,FPD_CCI_NOC_0_awuser,FPD_CCI_NOC_0_awready,FPD_CCI_NOC_0_wdata,FPD_CCI_NOC_0_wstrb,FPD_CCI_NOC_0_wuser,FPD_CCI_NOC_0_wlast,FPD_CCI_NOC_0_wvalid,FPD_CCI_NOC_0_wready,FPD_CCI_NOC_0_bid,FPD_CCI_NOC_0_bresp,FPD_CCI_NOC_0_bvalid,FPD_CCI_NOC_0_bready,FPD_CCI_NOC_0_arid,FPD_CCI_NOC_0_araddr,FPD_CCI_NOC_0_arlen,FPD_CCI_NOC_0_arsize,FPD_CCI_NOC_0_arburst,FPD_CCI_NOC_0_arlock,FPD_CCI_NOC_0_arcache,FPD_CCI_NOC_0_arprot,FPD_CCI_NOC_0_arvalid,FPD_CCI_NOC_0_aruser,FPD_CCI_NOC_0_arready,FPD_CCI_NOC_0_rid,FPD_CCI_NOC_0_rdata,FPD_CCI_NOC_0_rresp,FPD_CCI_NOC_0_rlast,FPD_CCI_NOC_0_rvalid,FPD_CCI_NOC_0_rready,FPD_CCI_NOC_0_awqos,FPD_CCI_NOC_0_arqos,FPD_CCI_NOC_1_awid,FPD_CCI_NOC_1_awaddr,FPD_CCI_NOC_1_awlen,FPD_CCI_NOC_1_awsize,FPD_CCI_NOC_1_awburst,FPD_CCI_NOC_1_awlock,FPD_CCI_NOC_1_awcache,FPD_CCI_NOC_1_awprot,FPD_CCI_NOC_1_awvalid,FPD_CCI_NOC_1_awuser,FPD_CCI_NOC_1_awready,FPD_CCI_NOC_1_wdata,FPD_CCI_NOC_1_wstrb,FPD_CCI_NOC_1_wuser,FPD_CCI_NOC_1_wlast,FPD_CCI_NOC_1_wvalid,FPD_CCI_NOC_1_wready,FPD_CCI_NOC_1_bid,FPD_CCI_NOC_1_bresp,FPD_CCI_NOC_1_bvalid,FPD_CCI_NOC_1_bready,FPD_CCI_NOC_1_arid,FPD_CCI_NOC_1_araddr,FPD_CCI_NOC_1_arlen,FPD_CCI_NOC_1_arsize,FPD_CCI_NOC_1_arburst,FPD_CCI_NOC_1_arlock,FPD_CCI_NOC_1_arcache,FPD_CCI_NOC_1_arprot,FPD_CCI_NOC_1_arvalid,FPD_CCI_NOC_1_aruser,FPD_CCI_NOC_1_arready,FPD_CCI_NOC_1_rid,FPD_CCI_NOC_1_rdata,FPD_CCI_NOC_1_rresp,FPD_CCI_NOC_1_rlast,FPD_CCI_NOC_1_rvalid,FPD_CCI_NOC_1_rready,FPD_CCI_NOC_1_awqos,FPD_CCI_NOC_1_arqos,FPD_CCI_NOC_2_awid,FPD_CCI_NOC_2_awaddr,FPD_CCI_NOC_2_awlen,FPD_CCI_NOC_2_awsize,FPD_CCI_NOC_2_awburst,FPD_CCI_NOC_2_awlock,FPD_CCI_NOC_2_awcache,FPD_CCI_NOC_2_awprot,FPD_CCI_NOC_2_awvalid,FPD_CCI_NOC_2_awuser,FPD_CCI_NOC_2_awready,FPD_CCI_NOC_2_wdata,FPD_CCI_NOC_2_wstrb,FPD_CCI_NOC_2_wuser,FPD_CCI_NOC_2_wlast,FPD_CCI_NOC_2_wvalid,FPD_CCI_NOC_2_wready,FPD_CCI_NOC_2_bid,FPD_CCI_NOC_2_bresp,FPD_CCI_NOC_2_bvalid,FPD_CCI_NOC_2_bready,FPD_CCI_NOC_2_arid,FPD_CCI_NOC_2_araddr,FPD_CCI_NOC_2_arlen,FPD_CCI_NOC_2_arsize,FPD_CCI_NOC_2_arburst,FPD_CCI_NOC_2_arlock,FPD_CCI_NOC_2_arcache,FPD_CCI_NOC_2_arprot,FPD_CCI_NOC_2_arvalid,FPD_CCI_NOC_2_aruser,FPD_CCI_NOC_2_arready,FPD_CCI_NOC_2_rid,FPD_CCI_NOC_2_rdata,FPD_CCI_NOC_2_rresp,FPD_CCI_NOC_2_rlast,FPD_CCI_NOC_2_rvalid,FPD_CCI_NOC_2_rready,FPD_CCI_NOC_2_awqos,FPD_CCI_NOC_2_arqos,FPD_CCI_NOC_3_awid,FPD_CCI_NOC_3_awaddr,FPD_CCI_NOC_3_awlen,FPD_CCI_NOC_3_awsize,FPD_CCI_NOC_3_awburst,FPD_CCI_NOC_3_awlock,FPD_CCI_NOC_3_awcache,FPD_CCI_NOC_3_awprot,FPD_CCI_NOC_3_awvalid,FPD_CCI_NOC_3_awuser,FPD_CCI_NOC_3_awready,FPD_CCI_NOC_3_wdata,FPD_CCI_NOC_3_wstrb,FPD_CCI_NOC_3_wuser,FPD_CCI_NOC_3_wlast,FPD_CCI_NOC_3_wvalid,FPD_CCI_NOC_3_wready,FPD_CCI_NOC_3_bid,FPD_CCI_NOC_3_bresp,FPD_CCI_NOC_3_bvalid,FPD_CCI_NOC_3_bready,FPD_CCI_NOC_3_arid,FPD_CCI_NOC_3_araddr,FPD_CCI_NOC_3_arlen,FPD_CCI_NOC_3_arsize,FPD_CCI_NOC_3_arburst,FPD_CCI_NOC_3_arlock,FPD_CCI_NOC_3_arcache,FPD_CCI_NOC_3_arprot,FPD_CCI_NOC_3_arvalid,FPD_CCI_NOC_3_aruser,FPD_CCI_NOC_3_arready,FPD_CCI_NOC_3_rid,FPD_CCI_NOC_3_rdata,FPD_CCI_NOC_3_rresp,FPD_CCI_NOC_3_rlast,FPD_CCI_NOC_3_rvalid,FPD_CCI_NOC_3_rready,FPD_CCI_NOC_3_awqos,FPD_CCI_NOC_3_arqos,LPD_AXI_NOC_0_awid,LPD_AXI_NOC_0_awaddr,LPD_AXI_NOC_0_awlen,LPD_AXI_NOC_0_awsize,LPD_AXI_NOC_0_awburst,LPD_AXI_NOC_0_awlock,LPD_AXI_NOC_0_awcache,LPD_AXI_NOC_0_awprot,LPD_AXI_NOC_0_awvalid,LPD_AXI_NOC_0_awuser,LPD_AXI_NOC_0_awready,LPD_AXI_NOC_0_wdata,LPD_AXI_NOC_0_wstrb,LPD_AXI_NOC_0_wlast,LPD_AXI_NOC_0_wvalid,LPD_AXI_NOC_0_wready,LPD_AXI_NOC_0_bid,LPD_AXI_NOC_0_bresp,LPD_AXI_NOC_0_bvalid,LPD_AXI_NOC_0_bready,LPD_AXI_NOC_0_arid,LPD_AXI_NOC_0_araddr,LPD_AXI_NOC_0_arlen,LPD_AXI_NOC_0_arsize,LPD_AXI_NOC_0_arburst,LPD_AXI_NOC_0_arlock,LPD_AXI_NOC_0_arcache,LPD_AXI_NOC_0_arprot,LPD_AXI_NOC_0_arvalid,LPD_AXI_NOC_0_aruser,LPD_AXI_NOC_0_arready,LPD_AXI_NOC_0_rid,LPD_AXI_NOC_0_rdata,LPD_AXI_NOC_0_rresp,LPD_AXI_NOC_0_rlast,LPD_AXI_NOC_0_rvalid,LPD_AXI_NOC_0_rready,LPD_AXI_NOC_0_awqos,LPD_AXI_NOC_0_arqos,PMC_NOC_AXI_0_araddr,PMC_NOC_AXI_0_arburst,PMC_NOC_AXI_0_arcache,PMC_NOC_AXI_0_arid,PMC_NOC_AXI_0_arlen,PMC_NOC_AXI_0_arlock,PMC_NOC_AXI_0_arprot,PMC_NOC_AXI_0_arqos,PMC_NOC_AXI_0_arregion,PMC_NOC_AXI_0_arsize,PMC_NOC_AXI_0_aruser,PMC_NOC_AXI_0_arvalid,PMC_NOC_AXI_0_awaddr,PMC_NOC_AXI_0_awburst,PMC_NOC_AXI_0_awcache,PMC_NOC_AXI_0_awid,PMC_NOC_AXI_0_awlen,PMC_NOC_AXI_0_awlock,PMC_NOC_AXI_0_awprot,PMC_NOC_AXI_0_awqos,PMC_NOC_AXI_0_awregion,PMC_NOC_AXI_0_awsize,PMC_NOC_AXI_0_awuser,PMC_NOC_AXI_0_awvalid,PMC_NOC_AXI_0_bready,PMC_NOC_AXI_0_rready,PMC_NOC_AXI_0_wdata,PMC_NOC_AXI_0_wid,PMC_NOC_AXI_0_wlast,PMC_NOC_AXI_0_wstrb,PMC_NOC_AXI_0_wuser,PMC_NOC_AXI_0_wvalid,PMC_NOC_AXI_0_arready,PMC_NOC_AXI_0_awready,PMC_NOC_AXI_0_bid,PMC_NOC_AXI_0_bresp,PMC_NOC_AXI_0_buser,PMC_NOC_AXI_0_bvalid,PMC_NOC_AXI_0_rdata,PMC_NOC_AXI_0_rid,PMC_NOC_AXI_0_rlast,PMC_NOC_AXI_0_rresp,PMC_NOC_AXI_0_ruser,PMC_NOC_AXI_0_rvalid,PMC_NOC_AXI_0_wready,NOC_PMC_AXI_0_araddr,NOC_PMC_AXI_0_arburst,NOC_PMC_AXI_0_arcache,NOC_PMC_AXI_0_arid,NOC_PMC_AXI_0_arlen,NOC_PMC_AXI_0_arlock,NOC_PMC_AXI_0_arprot,NOC_PMC_AXI_0_arqos,NOC_PMC_AXI_0_arregion,NOC_PMC_AXI_0_arsize,NOC_PMC_AXI_0_aruser,NOC_PMC_AXI_0_arvalid,NOC_PMC_AXI_0_awaddr,NOC_PMC_AXI_0_awburst,NOC_PMC_AXI_0_awcache,NOC_PMC_AXI_0_awid,NOC_PMC_AXI_0_awlen,NOC_PMC_AXI_0_awlock,NOC_PMC_AXI_0_awprot,NOC_PMC_AXI_0_awqos,NOC_PMC_AXI_0_awregion,NOC_PMC_AXI_0_awsize,NOC_PMC_AXI_0_awuser,NOC_PMC_AXI_0_awvalid,NOC_PMC_AXI_0_bready,NOC_PMC_AXI_0_rready,NOC_PMC_AXI_0_wdata,NOC_PMC_AXI_0_wid,NOC_PMC_AXI_0_wlast,NOC_PMC_AXI_0_wstrb,NOC_PMC_AXI_0_wuser,NOC_PMC_AXI_0_wvalid,NOC_PMC_AXI_0_arready,NOC_PMC_AXI_0_awready,NOC_PMC_AXI_0_bid,NOC_PMC_AXI_0_bresp,NOC_PMC_AXI_0_buser,NOC_PMC_AXI_0_bvalid,NOC_PMC_AXI_0_rdata,NOC_PMC_AXI_0_rid,NOC_PMC_AXI_0_rlast,NOC_PMC_AXI_0_rresp,NOC_PMC_AXI_0_ruser,NOC_PMC_AXI_0_rvalid,NOC_PMC_AXI_0_wready,CPM_PCIE_NOC_0_araddr,CPM_PCIE_NOC_0_arburst,CPM_PCIE_NOC_0_arcache,CPM_PCIE_NOC_0_arid,CPM_PCIE_NOC_0_arlen,CPM_PCIE_NOC_0_arlock,CPM_PCIE_NOC_0_arprot,CPM_PCIE_NOC_0_arqos,CPM_PCIE_NOC_0_arsize,CPM_PCIE_NOC_0_aruser,CPM_PCIE_NOC_0_arvalid,CPM_PCIE_NOC_0_awaddr,CPM_PCIE_NOC_0_awburst,CPM_PCIE_NOC_0_awcache,CPM_PCIE_NOC_0_awid,CPM_PCIE_NOC_0_awlen,CPM_PCIE_NOC_0_awlock,CPM_PCIE_NOC_0_awprot,CPM_PCIE_NOC_0_awqos,CPM_PCIE_NOC_0_awsize,CPM_PCIE_NOC_0_awuser,CPM_PCIE_NOC_0_awvalid,CPM_PCIE_NOC_0_bready,CPM_PCIE_NOC_0_rready,CPM_PCIE_NOC_0_wdata,CPM_PCIE_NOC_0_wlast,CPM_PCIE_NOC_0_wstrb,CPM_PCIE_NOC_0_wvalid,CPM_PCIE_NOC_0_arready,CPM_PCIE_NOC_0_awready,CPM_PCIE_NOC_0_bid,CPM_PCIE_NOC_0_bresp,CPM_PCIE_NOC_0_bvalid,CPM_PCIE_NOC_0_rdata,CPM_PCIE_NOC_0_rid,CPM_PCIE_NOC_0_rlast,CPM_PCIE_NOC_0_rresp,CPM_PCIE_NOC_0_rvalid,CPM_PCIE_NOC_0_ruser,CPM_PCIE_NOC_0_wuser,CPM_PCIE_NOC_0_wready,CPM_PCIE_NOC_1_araddr,CPM_PCIE_NOC_1_arburst,CPM_PCIE_NOC_1_arcache,CPM_PCIE_NOC_1_arid,CPM_PCIE_NOC_1_arlen,CPM_PCIE_NOC_1_arlock,CPM_PCIE_NOC_1_arprot,CPM_PCIE_NOC_1_arqos,CPM_PCIE_NOC_1_arsize,CPM_PCIE_NOC_1_aruser,CPM_PCIE_NOC_1_arvalid,CPM_PCIE_NOC_1_awaddr,CPM_PCIE_NOC_1_awburst,CPM_PCIE_NOC_1_awcache,CPM_PCIE_NOC_1_awid,CPM_PCIE_NOC_1_awlen,CPM_PCIE_NOC_1_awlock,CPM_PCIE_NOC_1_awprot,CPM_PCIE_NOC_1_awqos,CPM_PCIE_NOC_1_awsize,CPM_PCIE_NOC_1_awuser,CPM_PCIE_NOC_1_awvalid,CPM_PCIE_NOC_1_bready,CPM_PCIE_NOC_1_rready,CPM_PCIE_NOC_1_wdata,CPM_PCIE_NOC_1_wlast,CPM_PCIE_NOC_1_wstrb,CPM_PCIE_NOC_1_wvalid,CPM_PCIE_NOC_1_arready,CPM_PCIE_NOC_1_awready,CPM_PCIE_NOC_1_bid,CPM_PCIE_NOC_1_bresp,CPM_PCIE_NOC_1_bvalid,CPM_PCIE_NOC_1_rdata,CPM_PCIE_NOC_1_rid,CPM_PCIE_NOC_1_rlast,CPM_PCIE_NOC_1_rresp,CPM_PCIE_NOC_1_rvalid,CPM_PCIE_NOC_1_ruser,CPM_PCIE_NOC_1_wuser,CPM_PCIE_NOC_1_wready,dma0_mgmt_cpl_vld,dma0_mgmt_req_rdy,dma0_mgmt_cpl_rdy,dma0_mgmt_req_vld,dma0_mgmt_cpl_sts,dma0_mgmt_cpl_dat,dma0_mgmt_req_cmd,dma0_mgmt_req_fnc,dma0_mgmt_req_msc,dma0_mgmt_req_adr,dma0_mgmt_req_dat,dma0_st_rx_msg_tlast,dma0_st_rx_msg_tvalid,dma0_st_rx_msg_tready,dma0_st_rx_msg_tdata,dma0_axis_c2h_dmawr_cmp,dma0_axis_c2h_dmawr_target_vch,dma0_axis_c2h_dmawr_port_id,dma0_s_axis_c2h_tready,dma0_s_axis_c2h_tlast,dma0_s_axis_c2h_tvalid,dma0_s_axis_c2h_tcrc,dma0_s_axis_c2h_tdata,dma0_s_axis_c2h_mty,dma0_s_axis_c2h_ecc,dma0_s_axis_c2h_ctrl_marker,dma0_s_axis_c2h_ctrl_has_cmpt,dma0_s_axis_c2h_ctrl_len,dma0_s_axis_c2h_ctrl_qid,dma0_s_axis_c2h_ctrl_port_id,dma0_s_axis_c2h_cmpt_marker,dma0_s_axis_c2h_cmpt_user_trig,dma0_s_axis_c2h_cmpt_size,dma0_s_axis_c2h_cmpt_qid,dma0_s_axis_c2h_cmpt_no_wrb_marker,dma0_s_axis_c2h_cmpt_port_id,dma0_s_axis_c2h_cmpt_col_idx,dma0_s_axis_c2h_cmpt_err_idx,dma0_s_axis_c2h_cmpt_wait_pld_pkt_id,dma0_s_axis_c2h_cmpt_tready,dma0_s_axis_c2h_cmpt_tvalid,dma0_s_axis_c2h_cmpt_dpar,dma0_s_axis_c2h_cmpt_data,dma0_s_axis_c2h_cmpt_cmpt_type,dma0_m_axis_h2c_tlast,dma0_m_axis_h2c_err,dma0_m_axis_h2c_tvalid,dma0_m_axis_h2c_tdata,dma0_m_axis_h2c_zero_byte,dma0_m_axis_h2c_tready,dma0_m_axis_h2c_tcrc,dma0_m_axis_h2c_mty,dma0_m_axis_h2c_qid,dma0_m_axis_h2c_mdata,dma0_m_axis_h2c_port_id,dma0_axis_c2h_status_last,dma0_axis_c2h_status_drop,dma0_axis_c2h_status_error,dma0_axis_c2h_status_valid,dma0_axis_c2h_status_status_cmp,dma0_axis_c2h_status_qid,dma0_qsts_out_vld,dma0_qsts_out_op,dma0_qsts_out_rdy,dma0_qsts_out_qid,dma0_qsts_out_data,dma0_qsts_out_port_id,dma0_dsc_crdt_in_rdy,dma0_dsc_crdt_in_dir,dma0_dsc_crdt_in_valid,dma0_dsc_crdt_in_fence,dma0_dsc_crdt_in_qid,dma0_dsc_crdt_in_crdt,dma0_usr_irq_ack,dma0_usr_irq_fail,dma0_usr_irq_valid,dma0_usr_irq_vec,dma0_usr_irq_fnc,dma0_tm_dsc_sts_mm,dma0_tm_dsc_sts_qen,dma0_tm_dsc_sts_byp,dma0_tm_dsc_sts_dir,dma0_tm_dsc_sts_error,dma0_tm_dsc_sts_valid,dma0_tm_dsc_sts_qinv,dma0_tm_dsc_sts_irq_arm,dma0_tm_dsc_sts_rdy,dma0_tm_dsc_sts_qid,dma0_tm_dsc_sts_avl,dma0_tm_dsc_sts_pidx,dma0_tm_dsc_sts_port_id,dma0_usr_flr_set,dma0_usr_flr_clear,dma0_usr_flr_fnc,dma0_usr_flr_done_vld,dma0_usr_flr_done_fnc,PCIE0_GT_grx_n,PCIE0_GT_gtx_n,PCIE0_GT_grx_p,PCIE0_GT_gtx_p,gt_refclk0_clk_n,gt_refclk0_clk_p)
(* integer foreign = "SystemC";
*);
  output wire fpd_cci_noc_axi0_clk;
  output wire fpd_cci_noc_axi1_clk;
  output wire fpd_cci_noc_axi2_clk;
  output wire fpd_cci_noc_axi3_clk;
  output wire lpd_axi_noc_clk;
  output wire pmc_axi_noc_axi0_clk;
  output wire noc_pmc_axi_axi0_clk;
  output wire [93 : 0] gem0_tsu_timer_cnt;
  output wire cpm_pcie_noc_axi0_clk;
  output wire cpm_pcie_noc_axi1_clk;
  input bit dma0_intrfc_clk;
  output wire cpm_misc_irq;
  output wire cpm_cor_irq;
  output wire cpm_uncor_irq;
  input bit cpm_irq0;
  input bit cpm_irq1;
  output wire dma0_axi_aresetn;
  input bit dma0_intrfc_resetn;
  output wire [15 : 0] FPD_CCI_NOC_0_awid;
  output wire [63 : 0] FPD_CCI_NOC_0_awaddr;
  output wire [7 : 0] FPD_CCI_NOC_0_awlen;
  output wire [2 : 0] FPD_CCI_NOC_0_awsize;
  output wire [1 : 0] FPD_CCI_NOC_0_awburst;
  output wire FPD_CCI_NOC_0_awlock;
  output wire [3 : 0] FPD_CCI_NOC_0_awcache;
  output wire [2 : 0] FPD_CCI_NOC_0_awprot;
  output wire FPD_CCI_NOC_0_awvalid;
  output wire [17 : 0] FPD_CCI_NOC_0_awuser;
  input bit FPD_CCI_NOC_0_awready;
  output wire [127 : 0] FPD_CCI_NOC_0_wdata;
  output wire [15 : 0] FPD_CCI_NOC_0_wstrb;
  output wire [16 : 0] FPD_CCI_NOC_0_wuser;
  output wire FPD_CCI_NOC_0_wlast;
  output wire FPD_CCI_NOC_0_wvalid;
  input bit FPD_CCI_NOC_0_wready;
  input bit [15 : 0] FPD_CCI_NOC_0_bid;
  input bit [1 : 0] FPD_CCI_NOC_0_bresp;
  input bit FPD_CCI_NOC_0_bvalid;
  output wire FPD_CCI_NOC_0_bready;
  output wire [15 : 0] FPD_CCI_NOC_0_arid;
  output wire [63 : 0] FPD_CCI_NOC_0_araddr;
  output wire [7 : 0] FPD_CCI_NOC_0_arlen;
  output wire [2 : 0] FPD_CCI_NOC_0_arsize;
  output wire [1 : 0] FPD_CCI_NOC_0_arburst;
  output wire FPD_CCI_NOC_0_arlock;
  output wire [3 : 0] FPD_CCI_NOC_0_arcache;
  output wire [2 : 0] FPD_CCI_NOC_0_arprot;
  output wire FPD_CCI_NOC_0_arvalid;
  output wire [17 : 0] FPD_CCI_NOC_0_aruser;
  input bit FPD_CCI_NOC_0_arready;
  input bit [15 : 0] FPD_CCI_NOC_0_rid;
  input bit [127 : 0] FPD_CCI_NOC_0_rdata;
  input bit [1 : 0] FPD_CCI_NOC_0_rresp;
  input bit FPD_CCI_NOC_0_rlast;
  input bit FPD_CCI_NOC_0_rvalid;
  output wire FPD_CCI_NOC_0_rready;
  output wire [3 : 0] FPD_CCI_NOC_0_awqos;
  output wire [3 : 0] FPD_CCI_NOC_0_arqos;
  output wire [15 : 0] FPD_CCI_NOC_1_awid;
  output wire [63 : 0] FPD_CCI_NOC_1_awaddr;
  output wire [7 : 0] FPD_CCI_NOC_1_awlen;
  output wire [2 : 0] FPD_CCI_NOC_1_awsize;
  output wire [1 : 0] FPD_CCI_NOC_1_awburst;
  output wire FPD_CCI_NOC_1_awlock;
  output wire [3 : 0] FPD_CCI_NOC_1_awcache;
  output wire [2 : 0] FPD_CCI_NOC_1_awprot;
  output wire FPD_CCI_NOC_1_awvalid;
  output wire [17 : 0] FPD_CCI_NOC_1_awuser;
  input bit FPD_CCI_NOC_1_awready;
  output wire [127 : 0] FPD_CCI_NOC_1_wdata;
  output wire [15 : 0] FPD_CCI_NOC_1_wstrb;
  output wire [16 : 0] FPD_CCI_NOC_1_wuser;
  output wire FPD_CCI_NOC_1_wlast;
  output wire FPD_CCI_NOC_1_wvalid;
  input bit FPD_CCI_NOC_1_wready;
  input bit [15 : 0] FPD_CCI_NOC_1_bid;
  input bit [1 : 0] FPD_CCI_NOC_1_bresp;
  input bit FPD_CCI_NOC_1_bvalid;
  output wire FPD_CCI_NOC_1_bready;
  output wire [15 : 0] FPD_CCI_NOC_1_arid;
  output wire [63 : 0] FPD_CCI_NOC_1_araddr;
  output wire [7 : 0] FPD_CCI_NOC_1_arlen;
  output wire [2 : 0] FPD_CCI_NOC_1_arsize;
  output wire [1 : 0] FPD_CCI_NOC_1_arburst;
  output wire FPD_CCI_NOC_1_arlock;
  output wire [3 : 0] FPD_CCI_NOC_1_arcache;
  output wire [2 : 0] FPD_CCI_NOC_1_arprot;
  output wire FPD_CCI_NOC_1_arvalid;
  output wire [17 : 0] FPD_CCI_NOC_1_aruser;
  input bit FPD_CCI_NOC_1_arready;
  input bit [15 : 0] FPD_CCI_NOC_1_rid;
  input bit [127 : 0] FPD_CCI_NOC_1_rdata;
  input bit [1 : 0] FPD_CCI_NOC_1_rresp;
  input bit FPD_CCI_NOC_1_rlast;
  input bit FPD_CCI_NOC_1_rvalid;
  output wire FPD_CCI_NOC_1_rready;
  output wire [3 : 0] FPD_CCI_NOC_1_awqos;
  output wire [3 : 0] FPD_CCI_NOC_1_arqos;
  output wire [15 : 0] FPD_CCI_NOC_2_awid;
  output wire [63 : 0] FPD_CCI_NOC_2_awaddr;
  output wire [7 : 0] FPD_CCI_NOC_2_awlen;
  output wire [2 : 0] FPD_CCI_NOC_2_awsize;
  output wire [1 : 0] FPD_CCI_NOC_2_awburst;
  output wire FPD_CCI_NOC_2_awlock;
  output wire [3 : 0] FPD_CCI_NOC_2_awcache;
  output wire [2 : 0] FPD_CCI_NOC_2_awprot;
  output wire FPD_CCI_NOC_2_awvalid;
  output wire [17 : 0] FPD_CCI_NOC_2_awuser;
  input bit FPD_CCI_NOC_2_awready;
  output wire [127 : 0] FPD_CCI_NOC_2_wdata;
  output wire [15 : 0] FPD_CCI_NOC_2_wstrb;
  output wire [16 : 0] FPD_CCI_NOC_2_wuser;
  output wire FPD_CCI_NOC_2_wlast;
  output wire FPD_CCI_NOC_2_wvalid;
  input bit FPD_CCI_NOC_2_wready;
  input bit [15 : 0] FPD_CCI_NOC_2_bid;
  input bit [1 : 0] FPD_CCI_NOC_2_bresp;
  input bit FPD_CCI_NOC_2_bvalid;
  output wire FPD_CCI_NOC_2_bready;
  output wire [15 : 0] FPD_CCI_NOC_2_arid;
  output wire [63 : 0] FPD_CCI_NOC_2_araddr;
  output wire [7 : 0] FPD_CCI_NOC_2_arlen;
  output wire [2 : 0] FPD_CCI_NOC_2_arsize;
  output wire [1 : 0] FPD_CCI_NOC_2_arburst;
  output wire FPD_CCI_NOC_2_arlock;
  output wire [3 : 0] FPD_CCI_NOC_2_arcache;
  output wire [2 : 0] FPD_CCI_NOC_2_arprot;
  output wire FPD_CCI_NOC_2_arvalid;
  output wire [17 : 0] FPD_CCI_NOC_2_aruser;
  input bit FPD_CCI_NOC_2_arready;
  input bit [15 : 0] FPD_CCI_NOC_2_rid;
  input bit [127 : 0] FPD_CCI_NOC_2_rdata;
  input bit [1 : 0] FPD_CCI_NOC_2_rresp;
  input bit FPD_CCI_NOC_2_rlast;
  input bit FPD_CCI_NOC_2_rvalid;
  output wire FPD_CCI_NOC_2_rready;
  output wire [3 : 0] FPD_CCI_NOC_2_awqos;
  output wire [3 : 0] FPD_CCI_NOC_2_arqos;
  output wire [15 : 0] FPD_CCI_NOC_3_awid;
  output wire [63 : 0] FPD_CCI_NOC_3_awaddr;
  output wire [7 : 0] FPD_CCI_NOC_3_awlen;
  output wire [2 : 0] FPD_CCI_NOC_3_awsize;
  output wire [1 : 0] FPD_CCI_NOC_3_awburst;
  output wire FPD_CCI_NOC_3_awlock;
  output wire [3 : 0] FPD_CCI_NOC_3_awcache;
  output wire [2 : 0] FPD_CCI_NOC_3_awprot;
  output wire FPD_CCI_NOC_3_awvalid;
  output wire [17 : 0] FPD_CCI_NOC_3_awuser;
  input bit FPD_CCI_NOC_3_awready;
  output wire [127 : 0] FPD_CCI_NOC_3_wdata;
  output wire [15 : 0] FPD_CCI_NOC_3_wstrb;
  output wire [16 : 0] FPD_CCI_NOC_3_wuser;
  output wire FPD_CCI_NOC_3_wlast;
  output wire FPD_CCI_NOC_3_wvalid;
  input bit FPD_CCI_NOC_3_wready;
  input bit [15 : 0] FPD_CCI_NOC_3_bid;
  input bit [1 : 0] FPD_CCI_NOC_3_bresp;
  input bit FPD_CCI_NOC_3_bvalid;
  output wire FPD_CCI_NOC_3_bready;
  output wire [15 : 0] FPD_CCI_NOC_3_arid;
  output wire [63 : 0] FPD_CCI_NOC_3_araddr;
  output wire [7 : 0] FPD_CCI_NOC_3_arlen;
  output wire [2 : 0] FPD_CCI_NOC_3_arsize;
  output wire [1 : 0] FPD_CCI_NOC_3_arburst;
  output wire FPD_CCI_NOC_3_arlock;
  output wire [3 : 0] FPD_CCI_NOC_3_arcache;
  output wire [2 : 0] FPD_CCI_NOC_3_arprot;
  output wire FPD_CCI_NOC_3_arvalid;
  output wire [17 : 0] FPD_CCI_NOC_3_aruser;
  input bit FPD_CCI_NOC_3_arready;
  input bit [15 : 0] FPD_CCI_NOC_3_rid;
  input bit [127 : 0] FPD_CCI_NOC_3_rdata;
  input bit [1 : 0] FPD_CCI_NOC_3_rresp;
  input bit FPD_CCI_NOC_3_rlast;
  input bit FPD_CCI_NOC_3_rvalid;
  output wire FPD_CCI_NOC_3_rready;
  output wire [3 : 0] FPD_CCI_NOC_3_awqos;
  output wire [3 : 0] FPD_CCI_NOC_3_arqos;
  output wire [15 : 0] LPD_AXI_NOC_0_awid;
  output wire [63 : 0] LPD_AXI_NOC_0_awaddr;
  output wire [7 : 0] LPD_AXI_NOC_0_awlen;
  output wire [2 : 0] LPD_AXI_NOC_0_awsize;
  output wire [1 : 0] LPD_AXI_NOC_0_awburst;
  output wire LPD_AXI_NOC_0_awlock;
  output wire [3 : 0] LPD_AXI_NOC_0_awcache;
  output wire [2 : 0] LPD_AXI_NOC_0_awprot;
  output wire LPD_AXI_NOC_0_awvalid;
  output wire [17 : 0] LPD_AXI_NOC_0_awuser;
  input bit LPD_AXI_NOC_0_awready;
  output wire [127 : 0] LPD_AXI_NOC_0_wdata;
  output wire [15 : 0] LPD_AXI_NOC_0_wstrb;
  output wire LPD_AXI_NOC_0_wlast;
  output wire LPD_AXI_NOC_0_wvalid;
  input bit LPD_AXI_NOC_0_wready;
  input bit [15 : 0] LPD_AXI_NOC_0_bid;
  input bit [1 : 0] LPD_AXI_NOC_0_bresp;
  input bit LPD_AXI_NOC_0_bvalid;
  output wire LPD_AXI_NOC_0_bready;
  output wire [15 : 0] LPD_AXI_NOC_0_arid;
  output wire [63 : 0] LPD_AXI_NOC_0_araddr;
  output wire [7 : 0] LPD_AXI_NOC_0_arlen;
  output wire [2 : 0] LPD_AXI_NOC_0_arsize;
  output wire [1 : 0] LPD_AXI_NOC_0_arburst;
  output wire LPD_AXI_NOC_0_arlock;
  output wire [3 : 0] LPD_AXI_NOC_0_arcache;
  output wire [2 : 0] LPD_AXI_NOC_0_arprot;
  output wire LPD_AXI_NOC_0_arvalid;
  output wire [17 : 0] LPD_AXI_NOC_0_aruser;
  input bit LPD_AXI_NOC_0_arready;
  input bit [15 : 0] LPD_AXI_NOC_0_rid;
  input bit [127 : 0] LPD_AXI_NOC_0_rdata;
  input bit [1 : 0] LPD_AXI_NOC_0_rresp;
  input bit LPD_AXI_NOC_0_rlast;
  input bit LPD_AXI_NOC_0_rvalid;
  output wire LPD_AXI_NOC_0_rready;
  output wire [3 : 0] LPD_AXI_NOC_0_awqos;
  output wire [3 : 0] LPD_AXI_NOC_0_arqos;
  output wire [63 : 0] PMC_NOC_AXI_0_araddr;
  output wire [1 : 0] PMC_NOC_AXI_0_arburst;
  output wire [3 : 0] PMC_NOC_AXI_0_arcache;
  output wire [15 : 0] PMC_NOC_AXI_0_arid;
  output wire [7 : 0] PMC_NOC_AXI_0_arlen;
  output wire PMC_NOC_AXI_0_arlock;
  output wire [2 : 0] PMC_NOC_AXI_0_arprot;
  output wire [3 : 0] PMC_NOC_AXI_0_arqos;
  output wire [3 : 0] PMC_NOC_AXI_0_arregion;
  output wire [2 : 0] PMC_NOC_AXI_0_arsize;
  output wire [17 : 0] PMC_NOC_AXI_0_aruser;
  output wire PMC_NOC_AXI_0_arvalid;
  output wire [63 : 0] PMC_NOC_AXI_0_awaddr;
  output wire [1 : 0] PMC_NOC_AXI_0_awburst;
  output wire [3 : 0] PMC_NOC_AXI_0_awcache;
  output wire [15 : 0] PMC_NOC_AXI_0_awid;
  output wire [7 : 0] PMC_NOC_AXI_0_awlen;
  output wire PMC_NOC_AXI_0_awlock;
  output wire [2 : 0] PMC_NOC_AXI_0_awprot;
  output wire [3 : 0] PMC_NOC_AXI_0_awqos;
  output wire [3 : 0] PMC_NOC_AXI_0_awregion;
  output wire [2 : 0] PMC_NOC_AXI_0_awsize;
  output wire [17 : 0] PMC_NOC_AXI_0_awuser;
  output wire PMC_NOC_AXI_0_awvalid;
  output wire PMC_NOC_AXI_0_bready;
  output wire PMC_NOC_AXI_0_rready;
  output wire [127 : 0] PMC_NOC_AXI_0_wdata;
  output wire [15 : 0] PMC_NOC_AXI_0_wid;
  output wire PMC_NOC_AXI_0_wlast;
  output wire [15 : 0] PMC_NOC_AXI_0_wstrb;
  output wire [16 : 0] PMC_NOC_AXI_0_wuser;
  output wire PMC_NOC_AXI_0_wvalid;
  input bit PMC_NOC_AXI_0_arready;
  input bit PMC_NOC_AXI_0_awready;
  input bit [15 : 0] PMC_NOC_AXI_0_bid;
  input bit [1 : 0] PMC_NOC_AXI_0_bresp;
  input bit [15 : 0] PMC_NOC_AXI_0_buser;
  input bit PMC_NOC_AXI_0_bvalid;
  input bit [127 : 0] PMC_NOC_AXI_0_rdata;
  input bit [15 : 0] PMC_NOC_AXI_0_rid;
  input bit PMC_NOC_AXI_0_rlast;
  input bit [1 : 0] PMC_NOC_AXI_0_rresp;
  input bit [16 : 0] PMC_NOC_AXI_0_ruser;
  input bit PMC_NOC_AXI_0_rvalid;
  input bit PMC_NOC_AXI_0_wready;
  input bit [63 : 0] NOC_PMC_AXI_0_araddr;
  input bit [1 : 0] NOC_PMC_AXI_0_arburst;
  input bit [3 : 0] NOC_PMC_AXI_0_arcache;
  input bit [1 : 0] NOC_PMC_AXI_0_arid;
  input bit [7 : 0] NOC_PMC_AXI_0_arlen;
  input bit NOC_PMC_AXI_0_arlock;
  input bit [2 : 0] NOC_PMC_AXI_0_arprot;
  input bit [3 : 0] NOC_PMC_AXI_0_arqos;
  input bit [3 : 0] NOC_PMC_AXI_0_arregion;
  input bit [2 : 0] NOC_PMC_AXI_0_arsize;
  input bit [17 : 0] NOC_PMC_AXI_0_aruser;
  input bit NOC_PMC_AXI_0_arvalid;
  input bit [63 : 0] NOC_PMC_AXI_0_awaddr;
  input bit [1 : 0] NOC_PMC_AXI_0_awburst;
  input bit [3 : 0] NOC_PMC_AXI_0_awcache;
  input bit [1 : 0] NOC_PMC_AXI_0_awid;
  input bit [7 : 0] NOC_PMC_AXI_0_awlen;
  input bit NOC_PMC_AXI_0_awlock;
  input bit [2 : 0] NOC_PMC_AXI_0_awprot;
  input bit [3 : 0] NOC_PMC_AXI_0_awqos;
  input bit [3 : 0] NOC_PMC_AXI_0_awregion;
  input bit [2 : 0] NOC_PMC_AXI_0_awsize;
  input bit [17 : 0] NOC_PMC_AXI_0_awuser;
  input bit NOC_PMC_AXI_0_awvalid;
  input bit NOC_PMC_AXI_0_bready;
  input bit NOC_PMC_AXI_0_rready;
  input bit [127 : 0] NOC_PMC_AXI_0_wdata;
  input bit [3 : 0] NOC_PMC_AXI_0_wid;
  input bit NOC_PMC_AXI_0_wlast;
  input bit [15 : 0] NOC_PMC_AXI_0_wstrb;
  input bit [16 : 0] NOC_PMC_AXI_0_wuser;
  input bit NOC_PMC_AXI_0_wvalid;
  output wire NOC_PMC_AXI_0_arready;
  output wire NOC_PMC_AXI_0_awready;
  output wire [1 : 0] NOC_PMC_AXI_0_bid;
  output wire [1 : 0] NOC_PMC_AXI_0_bresp;
  output wire [15 : 0] NOC_PMC_AXI_0_buser;
  output wire NOC_PMC_AXI_0_bvalid;
  output wire [127 : 0] NOC_PMC_AXI_0_rdata;
  output wire [1 : 0] NOC_PMC_AXI_0_rid;
  output wire NOC_PMC_AXI_0_rlast;
  output wire [1 : 0] NOC_PMC_AXI_0_rresp;
  output wire [16 : 0] NOC_PMC_AXI_0_ruser;
  output wire NOC_PMC_AXI_0_rvalid;
  output wire NOC_PMC_AXI_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_0_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_arid;
  output wire [7 : 0] CPM_PCIE_NOC_0_arlen;
  output wire CPM_PCIE_NOC_0_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_aruser;
  output wire CPM_PCIE_NOC_0_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_0_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_awid;
  output wire [7 : 0] CPM_PCIE_NOC_0_awlen;
  output wire CPM_PCIE_NOC_0_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_awuser;
  output wire CPM_PCIE_NOC_0_awvalid;
  output wire CPM_PCIE_NOC_0_bready;
  output wire CPM_PCIE_NOC_0_rready;
  output wire [127 : 0] CPM_PCIE_NOC_0_wdata;
  output wire CPM_PCIE_NOC_0_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_0_wstrb;
  output wire CPM_PCIE_NOC_0_wvalid;
  input bit CPM_PCIE_NOC_0_arready;
  input bit CPM_PCIE_NOC_0_awready;
  input bit [15 : 0] CPM_PCIE_NOC_0_bid;
  input bit [1 : 0] CPM_PCIE_NOC_0_bresp;
  input bit CPM_PCIE_NOC_0_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_0_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_0_rid;
  input bit CPM_PCIE_NOC_0_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_0_rresp;
  input bit CPM_PCIE_NOC_0_rvalid;
  input bit [16 : 0] CPM_PCIE_NOC_0_ruser;
  output wire [16 : 0] CPM_PCIE_NOC_0_wuser;
  input bit CPM_PCIE_NOC_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_1_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_arid;
  output wire [7 : 0] CPM_PCIE_NOC_1_arlen;
  output wire CPM_PCIE_NOC_1_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_aruser;
  output wire CPM_PCIE_NOC_1_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_1_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_awid;
  output wire [7 : 0] CPM_PCIE_NOC_1_awlen;
  output wire CPM_PCIE_NOC_1_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_awuser;
  output wire CPM_PCIE_NOC_1_awvalid;
  output wire CPM_PCIE_NOC_1_bready;
  output wire CPM_PCIE_NOC_1_rready;
  output wire [127 : 0] CPM_PCIE_NOC_1_wdata;
  output wire CPM_PCIE_NOC_1_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_1_wstrb;
  output wire CPM_PCIE_NOC_1_wvalid;
  input bit CPM_PCIE_NOC_1_arready;
  input bit CPM_PCIE_NOC_1_awready;
  input bit [15 : 0] CPM_PCIE_NOC_1_bid;
  input bit [1 : 0] CPM_PCIE_NOC_1_bresp;
  input bit CPM_PCIE_NOC_1_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_1_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_1_rid;
  input bit CPM_PCIE_NOC_1_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_1_rresp;
  input bit CPM_PCIE_NOC_1_rvalid;
  input bit [16 : 0] CPM_PCIE_NOC_1_ruser;
  output wire [16 : 0] CPM_PCIE_NOC_1_wuser;
  input bit CPM_PCIE_NOC_1_wready;
  output wire dma0_mgmt_cpl_vld;
  output wire dma0_mgmt_req_rdy;
  input bit dma0_mgmt_cpl_rdy;
  input bit dma0_mgmt_req_vld;
  output wire [1 : 0] dma0_mgmt_cpl_sts;
  output wire [31 : 0] dma0_mgmt_cpl_dat;
  input bit [1 : 0] dma0_mgmt_req_cmd;
  input bit [12 : 0] dma0_mgmt_req_fnc;
  input bit [5 : 0] dma0_mgmt_req_msc;
  input bit [31 : 0] dma0_mgmt_req_adr;
  input bit [31 : 0] dma0_mgmt_req_dat;
  output wire dma0_st_rx_msg_tlast;
  output wire dma0_st_rx_msg_tvalid;
  input bit dma0_st_rx_msg_tready;
  output wire [31 : 0] dma0_st_rx_msg_tdata;
  output wire dma0_axis_c2h_dmawr_cmp;
  output wire dma0_axis_c2h_dmawr_target_vch;
  output wire [2 : 0] dma0_axis_c2h_dmawr_port_id;
  output wire dma0_s_axis_c2h_tready;
  input bit dma0_s_axis_c2h_tlast;
  input bit dma0_s_axis_c2h_tvalid;
  input bit [31 : 0] dma0_s_axis_c2h_tcrc;
  input bit [511 : 0] dma0_s_axis_c2h_tdata;
  input bit [5 : 0] dma0_s_axis_c2h_mty;
  input bit [6 : 0] dma0_s_axis_c2h_ecc;
  input bit dma0_s_axis_c2h_ctrl_marker;
  input bit dma0_s_axis_c2h_ctrl_has_cmpt;
  input bit [15 : 0] dma0_s_axis_c2h_ctrl_len;
  input bit [11 : 0] dma0_s_axis_c2h_ctrl_qid;
  input bit [2 : 0] dma0_s_axis_c2h_ctrl_port_id;
  input bit dma0_s_axis_c2h_cmpt_marker;
  input bit dma0_s_axis_c2h_cmpt_user_trig;
  input bit [1 : 0] dma0_s_axis_c2h_cmpt_size;
  input bit [12 : 0] dma0_s_axis_c2h_cmpt_qid;
  input bit dma0_s_axis_c2h_cmpt_no_wrb_marker;
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_port_id;
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_col_idx;
  input bit [2 : 0] dma0_s_axis_c2h_cmpt_err_idx;
  input bit [15 : 0] dma0_s_axis_c2h_cmpt_wait_pld_pkt_id;
  output wire dma0_s_axis_c2h_cmpt_tready;
  input bit dma0_s_axis_c2h_cmpt_tvalid;
  input bit [15 : 0] dma0_s_axis_c2h_cmpt_dpar;
  input bit [511 : 0] dma0_s_axis_c2h_cmpt_data;
  input bit [1 : 0] dma0_s_axis_c2h_cmpt_cmpt_type;
  output wire dma0_m_axis_h2c_tlast;
  output wire dma0_m_axis_h2c_err;
  output wire dma0_m_axis_h2c_tvalid;
  output wire [511 : 0] dma0_m_axis_h2c_tdata;
  output wire dma0_m_axis_h2c_zero_byte;
  input bit dma0_m_axis_h2c_tready;
  output wire [31 : 0] dma0_m_axis_h2c_tcrc;
  output wire [5 : 0] dma0_m_axis_h2c_mty;
  output wire [11 : 0] dma0_m_axis_h2c_qid;
  output wire [31 : 0] dma0_m_axis_h2c_mdata;
  output wire [2 : 0] dma0_m_axis_h2c_port_id;
  output wire dma0_axis_c2h_status_last;
  output wire dma0_axis_c2h_status_drop;
  output wire dma0_axis_c2h_status_error;
  output wire dma0_axis_c2h_status_valid;
  output wire dma0_axis_c2h_status_status_cmp;
  output wire [11 : 0] dma0_axis_c2h_status_qid;
  output wire dma0_qsts_out_vld;
  output wire [7 : 0] dma0_qsts_out_op;
  input bit dma0_qsts_out_rdy;
  output wire [12 : 0] dma0_qsts_out_qid;
  output wire [63 : 0] dma0_qsts_out_data;
  output wire [2 : 0] dma0_qsts_out_port_id;
  output wire dma0_dsc_crdt_in_rdy;
  input bit dma0_dsc_crdt_in_dir;
  input bit dma0_dsc_crdt_in_valid;
  input bit dma0_dsc_crdt_in_fence;
  input bit [11 : 0] dma0_dsc_crdt_in_qid;
  input bit [15 : 0] dma0_dsc_crdt_in_crdt;
  output wire dma0_usr_irq_ack;
  output wire dma0_usr_irq_fail;
  input bit dma0_usr_irq_valid;
  input bit [10 : 0] dma0_usr_irq_vec;
  input bit [12 : 0] dma0_usr_irq_fnc;
  output wire dma0_tm_dsc_sts_mm;
  output wire dma0_tm_dsc_sts_qen;
  output wire dma0_tm_dsc_sts_byp;
  output wire dma0_tm_dsc_sts_dir;
  output wire dma0_tm_dsc_sts_error;
  output wire dma0_tm_dsc_sts_valid;
  output wire dma0_tm_dsc_sts_qinv;
  output wire dma0_tm_dsc_sts_irq_arm;
  input bit dma0_tm_dsc_sts_rdy;
  output wire [11 : 0] dma0_tm_dsc_sts_qid;
  output wire [15 : 0] dma0_tm_dsc_sts_avl;
  output wire [15 : 0] dma0_tm_dsc_sts_pidx;
  output wire [2 : 0] dma0_tm_dsc_sts_port_id;
  output wire dma0_usr_flr_set;
  output wire dma0_usr_flr_clear;
  output wire [12 : 0] dma0_usr_flr_fnc;
  input bit dma0_usr_flr_done_vld;
  input bit [12 : 0] dma0_usr_flr_done_fnc;
  input bit [7 : 0] PCIE0_GT_grx_n;
  output wire [7 : 0] PCIE0_GT_gtx_n;
  input bit [7 : 0] PCIE0_GT_grx_p;
  output wire [7 : 0] PCIE0_GT_gtx_p;
  input bit gt_refclk0_clk_n;
  input bit gt_refclk0_clk_p;
endmodule
`endif
