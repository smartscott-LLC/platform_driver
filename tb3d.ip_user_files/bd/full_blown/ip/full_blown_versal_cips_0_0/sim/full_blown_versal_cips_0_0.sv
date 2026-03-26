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


// IP VLNV: xilinx.com:ip:versal_cips:3.4
// IP Revision: 8

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
(* DONT_TOUCH = "true" *)
module full_blown_versal_cips_0_0 (
  fpd_cci_noc_axi0_clk,
  fpd_cci_noc_axi1_clk,
  fpd_cci_noc_axi2_clk,
  fpd_cci_noc_axi3_clk,
  lpd_axi_noc_clk,
  pmc_axi_noc_axi0_clk,
  noc_pmc_axi_axi0_clk,
  gem0_tsu_timer_cnt,
  cpm_pcie_noc_axi0_clk,
  cpm_pcie_noc_axi1_clk,
  dma0_intrfc_clk,
  cpm_misc_irq,
  cpm_cor_irq,
  cpm_uncor_irq,
  cpm_irq0,
  cpm_irq1,
  dma0_axi_aresetn,
  dma0_intrfc_resetn,
  FPD_CCI_NOC_0_awid,
  FPD_CCI_NOC_0_awaddr,
  FPD_CCI_NOC_0_awlen,
  FPD_CCI_NOC_0_awsize,
  FPD_CCI_NOC_0_awburst,
  FPD_CCI_NOC_0_awlock,
  FPD_CCI_NOC_0_awcache,
  FPD_CCI_NOC_0_awprot,
  FPD_CCI_NOC_0_awvalid,
  FPD_CCI_NOC_0_awuser,
  FPD_CCI_NOC_0_awready,
  FPD_CCI_NOC_0_wdata,
  FPD_CCI_NOC_0_wstrb,
  FPD_CCI_NOC_0_wuser,
  FPD_CCI_NOC_0_wlast,
  FPD_CCI_NOC_0_wvalid,
  FPD_CCI_NOC_0_wready,
  FPD_CCI_NOC_0_bid,
  FPD_CCI_NOC_0_bresp,
  FPD_CCI_NOC_0_bvalid,
  FPD_CCI_NOC_0_bready,
  FPD_CCI_NOC_0_arid,
  FPD_CCI_NOC_0_araddr,
  FPD_CCI_NOC_0_arlen,
  FPD_CCI_NOC_0_arsize,
  FPD_CCI_NOC_0_arburst,
  FPD_CCI_NOC_0_arlock,
  FPD_CCI_NOC_0_arcache,
  FPD_CCI_NOC_0_arprot,
  FPD_CCI_NOC_0_arvalid,
  FPD_CCI_NOC_0_aruser,
  FPD_CCI_NOC_0_arready,
  FPD_CCI_NOC_0_rid,
  FPD_CCI_NOC_0_rdata,
  FPD_CCI_NOC_0_rresp,
  FPD_CCI_NOC_0_rlast,
  FPD_CCI_NOC_0_rvalid,
  FPD_CCI_NOC_0_rready,
  FPD_CCI_NOC_0_awqos,
  FPD_CCI_NOC_0_arqos,
  FPD_CCI_NOC_1_awid,
  FPD_CCI_NOC_1_awaddr,
  FPD_CCI_NOC_1_awlen,
  FPD_CCI_NOC_1_awsize,
  FPD_CCI_NOC_1_awburst,
  FPD_CCI_NOC_1_awlock,
  FPD_CCI_NOC_1_awcache,
  FPD_CCI_NOC_1_awprot,
  FPD_CCI_NOC_1_awvalid,
  FPD_CCI_NOC_1_awuser,
  FPD_CCI_NOC_1_awready,
  FPD_CCI_NOC_1_wdata,
  FPD_CCI_NOC_1_wstrb,
  FPD_CCI_NOC_1_wuser,
  FPD_CCI_NOC_1_wlast,
  FPD_CCI_NOC_1_wvalid,
  FPD_CCI_NOC_1_wready,
  FPD_CCI_NOC_1_bid,
  FPD_CCI_NOC_1_bresp,
  FPD_CCI_NOC_1_bvalid,
  FPD_CCI_NOC_1_bready,
  FPD_CCI_NOC_1_arid,
  FPD_CCI_NOC_1_araddr,
  FPD_CCI_NOC_1_arlen,
  FPD_CCI_NOC_1_arsize,
  FPD_CCI_NOC_1_arburst,
  FPD_CCI_NOC_1_arlock,
  FPD_CCI_NOC_1_arcache,
  FPD_CCI_NOC_1_arprot,
  FPD_CCI_NOC_1_arvalid,
  FPD_CCI_NOC_1_aruser,
  FPD_CCI_NOC_1_arready,
  FPD_CCI_NOC_1_rid,
  FPD_CCI_NOC_1_rdata,
  FPD_CCI_NOC_1_rresp,
  FPD_CCI_NOC_1_rlast,
  FPD_CCI_NOC_1_rvalid,
  FPD_CCI_NOC_1_rready,
  FPD_CCI_NOC_1_awqos,
  FPD_CCI_NOC_1_arqos,
  FPD_CCI_NOC_2_awid,
  FPD_CCI_NOC_2_awaddr,
  FPD_CCI_NOC_2_awlen,
  FPD_CCI_NOC_2_awsize,
  FPD_CCI_NOC_2_awburst,
  FPD_CCI_NOC_2_awlock,
  FPD_CCI_NOC_2_awcache,
  FPD_CCI_NOC_2_awprot,
  FPD_CCI_NOC_2_awvalid,
  FPD_CCI_NOC_2_awuser,
  FPD_CCI_NOC_2_awready,
  FPD_CCI_NOC_2_wdata,
  FPD_CCI_NOC_2_wstrb,
  FPD_CCI_NOC_2_wuser,
  FPD_CCI_NOC_2_wlast,
  FPD_CCI_NOC_2_wvalid,
  FPD_CCI_NOC_2_wready,
  FPD_CCI_NOC_2_bid,
  FPD_CCI_NOC_2_bresp,
  FPD_CCI_NOC_2_bvalid,
  FPD_CCI_NOC_2_bready,
  FPD_CCI_NOC_2_arid,
  FPD_CCI_NOC_2_araddr,
  FPD_CCI_NOC_2_arlen,
  FPD_CCI_NOC_2_arsize,
  FPD_CCI_NOC_2_arburst,
  FPD_CCI_NOC_2_arlock,
  FPD_CCI_NOC_2_arcache,
  FPD_CCI_NOC_2_arprot,
  FPD_CCI_NOC_2_arvalid,
  FPD_CCI_NOC_2_aruser,
  FPD_CCI_NOC_2_arready,
  FPD_CCI_NOC_2_rid,
  FPD_CCI_NOC_2_rdata,
  FPD_CCI_NOC_2_rresp,
  FPD_CCI_NOC_2_rlast,
  FPD_CCI_NOC_2_rvalid,
  FPD_CCI_NOC_2_rready,
  FPD_CCI_NOC_2_awqos,
  FPD_CCI_NOC_2_arqos,
  FPD_CCI_NOC_3_awid,
  FPD_CCI_NOC_3_awaddr,
  FPD_CCI_NOC_3_awlen,
  FPD_CCI_NOC_3_awsize,
  FPD_CCI_NOC_3_awburst,
  FPD_CCI_NOC_3_awlock,
  FPD_CCI_NOC_3_awcache,
  FPD_CCI_NOC_3_awprot,
  FPD_CCI_NOC_3_awvalid,
  FPD_CCI_NOC_3_awuser,
  FPD_CCI_NOC_3_awready,
  FPD_CCI_NOC_3_wdata,
  FPD_CCI_NOC_3_wstrb,
  FPD_CCI_NOC_3_wuser,
  FPD_CCI_NOC_3_wlast,
  FPD_CCI_NOC_3_wvalid,
  FPD_CCI_NOC_3_wready,
  FPD_CCI_NOC_3_bid,
  FPD_CCI_NOC_3_bresp,
  FPD_CCI_NOC_3_bvalid,
  FPD_CCI_NOC_3_bready,
  FPD_CCI_NOC_3_arid,
  FPD_CCI_NOC_3_araddr,
  FPD_CCI_NOC_3_arlen,
  FPD_CCI_NOC_3_arsize,
  FPD_CCI_NOC_3_arburst,
  FPD_CCI_NOC_3_arlock,
  FPD_CCI_NOC_3_arcache,
  FPD_CCI_NOC_3_arprot,
  FPD_CCI_NOC_3_arvalid,
  FPD_CCI_NOC_3_aruser,
  FPD_CCI_NOC_3_arready,
  FPD_CCI_NOC_3_rid,
  FPD_CCI_NOC_3_rdata,
  FPD_CCI_NOC_3_rresp,
  FPD_CCI_NOC_3_rlast,
  FPD_CCI_NOC_3_rvalid,
  FPD_CCI_NOC_3_rready,
  FPD_CCI_NOC_3_awqos,
  FPD_CCI_NOC_3_arqos,
  LPD_AXI_NOC_0_awid,
  LPD_AXI_NOC_0_awaddr,
  LPD_AXI_NOC_0_awlen,
  LPD_AXI_NOC_0_awsize,
  LPD_AXI_NOC_0_awburst,
  LPD_AXI_NOC_0_awlock,
  LPD_AXI_NOC_0_awcache,
  LPD_AXI_NOC_0_awprot,
  LPD_AXI_NOC_0_awvalid,
  LPD_AXI_NOC_0_awuser,
  LPD_AXI_NOC_0_awready,
  LPD_AXI_NOC_0_wdata,
  LPD_AXI_NOC_0_wstrb,
  LPD_AXI_NOC_0_wlast,
  LPD_AXI_NOC_0_wvalid,
  LPD_AXI_NOC_0_wready,
  LPD_AXI_NOC_0_bid,
  LPD_AXI_NOC_0_bresp,
  LPD_AXI_NOC_0_bvalid,
  LPD_AXI_NOC_0_bready,
  LPD_AXI_NOC_0_arid,
  LPD_AXI_NOC_0_araddr,
  LPD_AXI_NOC_0_arlen,
  LPD_AXI_NOC_0_arsize,
  LPD_AXI_NOC_0_arburst,
  LPD_AXI_NOC_0_arlock,
  LPD_AXI_NOC_0_arcache,
  LPD_AXI_NOC_0_arprot,
  LPD_AXI_NOC_0_arvalid,
  LPD_AXI_NOC_0_aruser,
  LPD_AXI_NOC_0_arready,
  LPD_AXI_NOC_0_rid,
  LPD_AXI_NOC_0_rdata,
  LPD_AXI_NOC_0_rresp,
  LPD_AXI_NOC_0_rlast,
  LPD_AXI_NOC_0_rvalid,
  LPD_AXI_NOC_0_rready,
  LPD_AXI_NOC_0_awqos,
  LPD_AXI_NOC_0_arqos,
  PMC_NOC_AXI_0_araddr,
  PMC_NOC_AXI_0_arburst,
  PMC_NOC_AXI_0_arcache,
  PMC_NOC_AXI_0_arid,
  PMC_NOC_AXI_0_arlen,
  PMC_NOC_AXI_0_arlock,
  PMC_NOC_AXI_0_arprot,
  PMC_NOC_AXI_0_arqos,
  PMC_NOC_AXI_0_arregion,
  PMC_NOC_AXI_0_arsize,
  PMC_NOC_AXI_0_aruser,
  PMC_NOC_AXI_0_arvalid,
  PMC_NOC_AXI_0_awaddr,
  PMC_NOC_AXI_0_awburst,
  PMC_NOC_AXI_0_awcache,
  PMC_NOC_AXI_0_awid,
  PMC_NOC_AXI_0_awlen,
  PMC_NOC_AXI_0_awlock,
  PMC_NOC_AXI_0_awprot,
  PMC_NOC_AXI_0_awqos,
  PMC_NOC_AXI_0_awregion,
  PMC_NOC_AXI_0_awsize,
  PMC_NOC_AXI_0_awuser,
  PMC_NOC_AXI_0_awvalid,
  PMC_NOC_AXI_0_bready,
  PMC_NOC_AXI_0_rready,
  PMC_NOC_AXI_0_wdata,
  PMC_NOC_AXI_0_wid,
  PMC_NOC_AXI_0_wlast,
  PMC_NOC_AXI_0_wstrb,
  PMC_NOC_AXI_0_wuser,
  PMC_NOC_AXI_0_wvalid,
  PMC_NOC_AXI_0_arready,
  PMC_NOC_AXI_0_awready,
  PMC_NOC_AXI_0_bid,
  PMC_NOC_AXI_0_bresp,
  PMC_NOC_AXI_0_buser,
  PMC_NOC_AXI_0_bvalid,
  PMC_NOC_AXI_0_rdata,
  PMC_NOC_AXI_0_rid,
  PMC_NOC_AXI_0_rlast,
  PMC_NOC_AXI_0_rresp,
  PMC_NOC_AXI_0_ruser,
  PMC_NOC_AXI_0_rvalid,
  PMC_NOC_AXI_0_wready,
  NOC_PMC_AXI_0_araddr,
  NOC_PMC_AXI_0_arburst,
  NOC_PMC_AXI_0_arcache,
  NOC_PMC_AXI_0_arid,
  NOC_PMC_AXI_0_arlen,
  NOC_PMC_AXI_0_arlock,
  NOC_PMC_AXI_0_arprot,
  NOC_PMC_AXI_0_arqos,
  NOC_PMC_AXI_0_arregion,
  NOC_PMC_AXI_0_arsize,
  NOC_PMC_AXI_0_aruser,
  NOC_PMC_AXI_0_arvalid,
  NOC_PMC_AXI_0_awaddr,
  NOC_PMC_AXI_0_awburst,
  NOC_PMC_AXI_0_awcache,
  NOC_PMC_AXI_0_awid,
  NOC_PMC_AXI_0_awlen,
  NOC_PMC_AXI_0_awlock,
  NOC_PMC_AXI_0_awprot,
  NOC_PMC_AXI_0_awqos,
  NOC_PMC_AXI_0_awregion,
  NOC_PMC_AXI_0_awsize,
  NOC_PMC_AXI_0_awuser,
  NOC_PMC_AXI_0_awvalid,
  NOC_PMC_AXI_0_bready,
  NOC_PMC_AXI_0_rready,
  NOC_PMC_AXI_0_wdata,
  NOC_PMC_AXI_0_wid,
  NOC_PMC_AXI_0_wlast,
  NOC_PMC_AXI_0_wstrb,
  NOC_PMC_AXI_0_wuser,
  NOC_PMC_AXI_0_wvalid,
  NOC_PMC_AXI_0_arready,
  NOC_PMC_AXI_0_awready,
  NOC_PMC_AXI_0_bid,
  NOC_PMC_AXI_0_bresp,
  NOC_PMC_AXI_0_buser,
  NOC_PMC_AXI_0_bvalid,
  NOC_PMC_AXI_0_rdata,
  NOC_PMC_AXI_0_rid,
  NOC_PMC_AXI_0_rlast,
  NOC_PMC_AXI_0_rresp,
  NOC_PMC_AXI_0_ruser,
  NOC_PMC_AXI_0_rvalid,
  NOC_PMC_AXI_0_wready,
  CPM_PCIE_NOC_0_araddr,
  CPM_PCIE_NOC_0_arburst,
  CPM_PCIE_NOC_0_arcache,
  CPM_PCIE_NOC_0_arid,
  CPM_PCIE_NOC_0_arlen,
  CPM_PCIE_NOC_0_arlock,
  CPM_PCIE_NOC_0_arprot,
  CPM_PCIE_NOC_0_arqos,
  CPM_PCIE_NOC_0_arsize,
  CPM_PCIE_NOC_0_aruser,
  CPM_PCIE_NOC_0_arvalid,
  CPM_PCIE_NOC_0_awaddr,
  CPM_PCIE_NOC_0_awburst,
  CPM_PCIE_NOC_0_awcache,
  CPM_PCIE_NOC_0_awid,
  CPM_PCIE_NOC_0_awlen,
  CPM_PCIE_NOC_0_awlock,
  CPM_PCIE_NOC_0_awprot,
  CPM_PCIE_NOC_0_awqos,
  CPM_PCIE_NOC_0_awsize,
  CPM_PCIE_NOC_0_awuser,
  CPM_PCIE_NOC_0_awvalid,
  CPM_PCIE_NOC_0_bready,
  CPM_PCIE_NOC_0_rready,
  CPM_PCIE_NOC_0_wdata,
  CPM_PCIE_NOC_0_wlast,
  CPM_PCIE_NOC_0_wstrb,
  CPM_PCIE_NOC_0_wvalid,
  CPM_PCIE_NOC_0_arready,
  CPM_PCIE_NOC_0_awready,
  CPM_PCIE_NOC_0_bid,
  CPM_PCIE_NOC_0_bresp,
  CPM_PCIE_NOC_0_bvalid,
  CPM_PCIE_NOC_0_rdata,
  CPM_PCIE_NOC_0_rid,
  CPM_PCIE_NOC_0_rlast,
  CPM_PCIE_NOC_0_rresp,
  CPM_PCIE_NOC_0_rvalid,
  CPM_PCIE_NOC_0_ruser,
  CPM_PCIE_NOC_0_wuser,
  CPM_PCIE_NOC_0_wready,
  CPM_PCIE_NOC_1_araddr,
  CPM_PCIE_NOC_1_arburst,
  CPM_PCIE_NOC_1_arcache,
  CPM_PCIE_NOC_1_arid,
  CPM_PCIE_NOC_1_arlen,
  CPM_PCIE_NOC_1_arlock,
  CPM_PCIE_NOC_1_arprot,
  CPM_PCIE_NOC_1_arqos,
  CPM_PCIE_NOC_1_arsize,
  CPM_PCIE_NOC_1_aruser,
  CPM_PCIE_NOC_1_arvalid,
  CPM_PCIE_NOC_1_awaddr,
  CPM_PCIE_NOC_1_awburst,
  CPM_PCIE_NOC_1_awcache,
  CPM_PCIE_NOC_1_awid,
  CPM_PCIE_NOC_1_awlen,
  CPM_PCIE_NOC_1_awlock,
  CPM_PCIE_NOC_1_awprot,
  CPM_PCIE_NOC_1_awqos,
  CPM_PCIE_NOC_1_awsize,
  CPM_PCIE_NOC_1_awuser,
  CPM_PCIE_NOC_1_awvalid,
  CPM_PCIE_NOC_1_bready,
  CPM_PCIE_NOC_1_rready,
  CPM_PCIE_NOC_1_wdata,
  CPM_PCIE_NOC_1_wlast,
  CPM_PCIE_NOC_1_wstrb,
  CPM_PCIE_NOC_1_wvalid,
  CPM_PCIE_NOC_1_arready,
  CPM_PCIE_NOC_1_awready,
  CPM_PCIE_NOC_1_bid,
  CPM_PCIE_NOC_1_bresp,
  CPM_PCIE_NOC_1_bvalid,
  CPM_PCIE_NOC_1_rdata,
  CPM_PCIE_NOC_1_rid,
  CPM_PCIE_NOC_1_rlast,
  CPM_PCIE_NOC_1_rresp,
  CPM_PCIE_NOC_1_rvalid,
  CPM_PCIE_NOC_1_ruser,
  CPM_PCIE_NOC_1_wuser,
  CPM_PCIE_NOC_1_wready,
  dma0_mgmt_cpl_vld,
  dma0_mgmt_req_rdy,
  dma0_mgmt_cpl_rdy,
  dma0_mgmt_req_vld,
  dma0_mgmt_cpl_sts,
  dma0_mgmt_cpl_dat,
  dma0_mgmt_req_cmd,
  dma0_mgmt_req_fnc,
  dma0_mgmt_req_msc,
  dma0_mgmt_req_adr,
  dma0_mgmt_req_dat,
  dma0_st_rx_msg_tlast,
  dma0_st_rx_msg_tvalid,
  dma0_st_rx_msg_tready,
  dma0_st_rx_msg_tdata,
  dma0_axis_c2h_dmawr_cmp,
  dma0_axis_c2h_dmawr_target_vch,
  dma0_axis_c2h_dmawr_port_id,
  dma0_s_axis_c2h_tready,
  dma0_s_axis_c2h_tlast,
  dma0_s_axis_c2h_tvalid,
  dma0_s_axis_c2h_tcrc,
  dma0_s_axis_c2h_tdata,
  dma0_s_axis_c2h_mty,
  dma0_s_axis_c2h_ecc,
  dma0_s_axis_c2h_ctrl_marker,
  dma0_s_axis_c2h_ctrl_has_cmpt,
  dma0_s_axis_c2h_ctrl_len,
  dma0_s_axis_c2h_ctrl_qid,
  dma0_s_axis_c2h_ctrl_port_id,
  dma0_s_axis_c2h_cmpt_marker,
  dma0_s_axis_c2h_cmpt_user_trig,
  dma0_s_axis_c2h_cmpt_size,
  dma0_s_axis_c2h_cmpt_qid,
  dma0_s_axis_c2h_cmpt_no_wrb_marker,
  dma0_s_axis_c2h_cmpt_port_id,
  dma0_s_axis_c2h_cmpt_col_idx,
  dma0_s_axis_c2h_cmpt_err_idx,
  dma0_s_axis_c2h_cmpt_wait_pld_pkt_id,
  dma0_s_axis_c2h_cmpt_tready,
  dma0_s_axis_c2h_cmpt_tvalid,
  dma0_s_axis_c2h_cmpt_dpar,
  dma0_s_axis_c2h_cmpt_data,
  dma0_s_axis_c2h_cmpt_cmpt_type,
  dma0_m_axis_h2c_tlast,
  dma0_m_axis_h2c_err,
  dma0_m_axis_h2c_tvalid,
  dma0_m_axis_h2c_tdata,
  dma0_m_axis_h2c_zero_byte,
  dma0_m_axis_h2c_tready,
  dma0_m_axis_h2c_tcrc,
  dma0_m_axis_h2c_mty,
  dma0_m_axis_h2c_qid,
  dma0_m_axis_h2c_mdata,
  dma0_m_axis_h2c_port_id,
  dma0_axis_c2h_status_last,
  dma0_axis_c2h_status_drop,
  dma0_axis_c2h_status_error,
  dma0_axis_c2h_status_valid,
  dma0_axis_c2h_status_status_cmp,
  dma0_axis_c2h_status_qid,
  dma0_qsts_out_vld,
  dma0_qsts_out_op,
  dma0_qsts_out_rdy,
  dma0_qsts_out_qid,
  dma0_qsts_out_data,
  dma0_qsts_out_port_id,
  dma0_dsc_crdt_in_rdy,
  dma0_dsc_crdt_in_dir,
  dma0_dsc_crdt_in_valid,
  dma0_dsc_crdt_in_fence,
  dma0_dsc_crdt_in_qid,
  dma0_dsc_crdt_in_crdt,
  dma0_usr_irq_ack,
  dma0_usr_irq_fail,
  dma0_usr_irq_valid,
  dma0_usr_irq_vec,
  dma0_usr_irq_fnc,
  dma0_tm_dsc_sts_mm,
  dma0_tm_dsc_sts_qen,
  dma0_tm_dsc_sts_byp,
  dma0_tm_dsc_sts_dir,
  dma0_tm_dsc_sts_error,
  dma0_tm_dsc_sts_valid,
  dma0_tm_dsc_sts_qinv,
  dma0_tm_dsc_sts_irq_arm,
  dma0_tm_dsc_sts_rdy,
  dma0_tm_dsc_sts_qid,
  dma0_tm_dsc_sts_avl,
  dma0_tm_dsc_sts_pidx,
  dma0_tm_dsc_sts_port_id,
  dma0_usr_flr_set,
  dma0_usr_flr_clear,
  dma0_usr_flr_fnc,
  dma0_usr_flr_done_vld,
  dma0_usr_flr_done_fnc,
  PCIE0_GT_grx_n,
  PCIE0_GT_gtx_n,
  PCIE0_GT_grx_p,
  PCIE0_GT_gtx_p,
  gt_refclk0_clk_n,
  gt_refclk0_clk_p
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.fpd_cci_noc_axi0_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.fpd_cci_noc_axi0_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk, ASSOCIATED_BUSIF FPD_CCI_NOC_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *)
output wire fpd_cci_noc_axi0_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.fpd_cci_noc_axi1_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.fpd_cci_noc_axi1_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk, ASSOCIATED_BUSIF FPD_CCI_NOC_1, INSERT_VIP 0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *)
output wire fpd_cci_noc_axi1_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.fpd_cci_noc_axi2_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.fpd_cci_noc_axi2_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk, ASSOCIATED_BUSIF FPD_CCI_NOC_2, INSERT_VIP 0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *)
output wire fpd_cci_noc_axi2_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.fpd_cci_noc_axi3_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.fpd_cci_noc_axi3_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk, ASSOCIATED_BUSIF FPD_CCI_NOC_3, INSERT_VIP 0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *)
output wire fpd_cci_noc_axi3_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.lpd_axi_noc_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.lpd_axi_noc_clk, FREQ_HZ 599999451, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_lpd_axi_noc_clk, ASSOCIATED_BUSIF LPD_AXI_NOC_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_RPU_TO_NOC_NMU" *)
output wire lpd_axi_noc_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.pmc_axi_noc_axi0_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.pmc_axi_noc_axi0_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk, ASSOCIATED_BUSIF PMC_NOC_AXI_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NMU" *)
output wire pmc_axi_noc_axi0_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.noc_pmc_axi_axi0_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.noc_pmc_axi_axi0_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk, ASSOCIATED_BUSIF NOC_PMC_AXI_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NSU" *)
output wire noc_pmc_axi_axi0_clk;
output wire [93 : 0] gem0_tsu_timer_cnt;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.cpm_pcie_noc_axi0_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.cpm_pcie_noc_axi0_clk, FREQ_HZ 1000000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
output wire cpm_pcie_noc_axi0_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.cpm_pcie_noc_axi1_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.cpm_pcie_noc_axi1_clk, FREQ_HZ 1000000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_1, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
output wire cpm_pcie_noc_axi1_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.dma0_intrfc_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.dma0_intrfc_clk, FREQ_HZ 300000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, ASSOCIATED_BUSIF dma0_m_axis_h2c:dma0_s_axis_c2h:dma0_s_axis_c2h_cmpt:dma0_st_rx_msg, ASSOCIATED_RESET dma0_axi_aresetn, INSERT_VIP 0" *)
input wire dma0_intrfc_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_misc_irq INTERRUPT" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_misc_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
output wire cpm_misc_irq;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_cor_irq INTERRUPT" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_cor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
output wire cpm_cor_irq;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_uncor_irq INTERRUPT" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_uncor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
output wire cpm_uncor_irq;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_irq0 INTERRUPT" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_irq0, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
input wire cpm_irq0;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_irq1 INTERRUPT" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_irq1, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
input wire cpm_irq1;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_axi_aresetn RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
output wire dma0_axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_intrfc_resetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_intrfc_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire dma0_intrfc_resetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 824999207, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk, NUM_REA\
D_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_cci, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, INDEX 0" *)
output wire [15 : 0] FPD_CCI_NOC_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWADDR" *)
output wire [63 : 0] FPD_CCI_NOC_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWLEN" *)
output wire [7 : 0] FPD_CCI_NOC_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWBURST" *)
output wire [1 : 0] FPD_CCI_NOC_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWLOCK" *)
output wire FPD_CCI_NOC_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWPROT" *)
output wire [2 : 0] FPD_CCI_NOC_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWVALID" *)
output wire FPD_CCI_NOC_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWUSER" *)
output wire [17 : 0] FPD_CCI_NOC_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWREADY" *)
input wire FPD_CCI_NOC_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WDATA" *)
output wire [127 : 0] FPD_CCI_NOC_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WSTRB" *)
output wire [15 : 0] FPD_CCI_NOC_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WUSER" *)
output wire [16 : 0] FPD_CCI_NOC_0_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WLAST" *)
output wire FPD_CCI_NOC_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WVALID" *)
output wire FPD_CCI_NOC_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WREADY" *)
input wire FPD_CCI_NOC_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BID" *)
input wire [15 : 0] FPD_CCI_NOC_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BRESP" *)
input wire [1 : 0] FPD_CCI_NOC_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BVALID" *)
input wire FPD_CCI_NOC_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BREADY" *)
output wire FPD_CCI_NOC_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARID" *)
output wire [15 : 0] FPD_CCI_NOC_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARADDR" *)
output wire [63 : 0] FPD_CCI_NOC_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARLEN" *)
output wire [7 : 0] FPD_CCI_NOC_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARBURST" *)
output wire [1 : 0] FPD_CCI_NOC_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARLOCK" *)
output wire FPD_CCI_NOC_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARPROT" *)
output wire [2 : 0] FPD_CCI_NOC_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARVALID" *)
output wire FPD_CCI_NOC_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARUSER" *)
output wire [17 : 0] FPD_CCI_NOC_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARREADY" *)
input wire FPD_CCI_NOC_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RID" *)
input wire [15 : 0] FPD_CCI_NOC_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RDATA" *)
input wire [127 : 0] FPD_CCI_NOC_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RRESP" *)
input wire [1 : 0] FPD_CCI_NOC_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RLAST" *)
input wire FPD_CCI_NOC_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RVALID" *)
input wire FPD_CCI_NOC_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RREADY" *)
output wire FPD_CCI_NOC_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWQOS" *)
output wire [3 : 0] FPD_CCI_NOC_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARQOS" *)
output wire [3 : 0] FPD_CCI_NOC_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_1, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 824999207, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk, NUM_REA\
D_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_cci, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, INDEX 1" *)
output wire [15 : 0] FPD_CCI_NOC_1_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWADDR" *)
output wire [63 : 0] FPD_CCI_NOC_1_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWLEN" *)
output wire [7 : 0] FPD_CCI_NOC_1_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_1_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWBURST" *)
output wire [1 : 0] FPD_CCI_NOC_1_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWLOCK" *)
output wire FPD_CCI_NOC_1_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_1_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWPROT" *)
output wire [2 : 0] FPD_CCI_NOC_1_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWVALID" *)
output wire FPD_CCI_NOC_1_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWUSER" *)
output wire [17 : 0] FPD_CCI_NOC_1_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWREADY" *)
input wire FPD_CCI_NOC_1_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WDATA" *)
output wire [127 : 0] FPD_CCI_NOC_1_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WSTRB" *)
output wire [15 : 0] FPD_CCI_NOC_1_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WUSER" *)
output wire [16 : 0] FPD_CCI_NOC_1_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WLAST" *)
output wire FPD_CCI_NOC_1_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WVALID" *)
output wire FPD_CCI_NOC_1_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WREADY" *)
input wire FPD_CCI_NOC_1_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BID" *)
input wire [15 : 0] FPD_CCI_NOC_1_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BRESP" *)
input wire [1 : 0] FPD_CCI_NOC_1_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BVALID" *)
input wire FPD_CCI_NOC_1_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BREADY" *)
output wire FPD_CCI_NOC_1_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARID" *)
output wire [15 : 0] FPD_CCI_NOC_1_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARADDR" *)
output wire [63 : 0] FPD_CCI_NOC_1_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARLEN" *)
output wire [7 : 0] FPD_CCI_NOC_1_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_1_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARBURST" *)
output wire [1 : 0] FPD_CCI_NOC_1_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARLOCK" *)
output wire FPD_CCI_NOC_1_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_1_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARPROT" *)
output wire [2 : 0] FPD_CCI_NOC_1_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARVALID" *)
output wire FPD_CCI_NOC_1_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARUSER" *)
output wire [17 : 0] FPD_CCI_NOC_1_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARREADY" *)
input wire FPD_CCI_NOC_1_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RID" *)
input wire [15 : 0] FPD_CCI_NOC_1_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RDATA" *)
input wire [127 : 0] FPD_CCI_NOC_1_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RRESP" *)
input wire [1 : 0] FPD_CCI_NOC_1_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RLAST" *)
input wire FPD_CCI_NOC_1_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RVALID" *)
input wire FPD_CCI_NOC_1_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RREADY" *)
output wire FPD_CCI_NOC_1_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWQOS" *)
output wire [3 : 0] FPD_CCI_NOC_1_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARQOS" *)
output wire [3 : 0] FPD_CCI_NOC_1_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_2, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 824999207, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk, NUM_REA\
D_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_cci, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, INDEX 2" *)
output wire [15 : 0] FPD_CCI_NOC_2_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWADDR" *)
output wire [63 : 0] FPD_CCI_NOC_2_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWLEN" *)
output wire [7 : 0] FPD_CCI_NOC_2_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_2_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWBURST" *)
output wire [1 : 0] FPD_CCI_NOC_2_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWLOCK" *)
output wire FPD_CCI_NOC_2_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_2_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWPROT" *)
output wire [2 : 0] FPD_CCI_NOC_2_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWVALID" *)
output wire FPD_CCI_NOC_2_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWUSER" *)
output wire [17 : 0] FPD_CCI_NOC_2_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWREADY" *)
input wire FPD_CCI_NOC_2_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WDATA" *)
output wire [127 : 0] FPD_CCI_NOC_2_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WSTRB" *)
output wire [15 : 0] FPD_CCI_NOC_2_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WUSER" *)
output wire [16 : 0] FPD_CCI_NOC_2_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WLAST" *)
output wire FPD_CCI_NOC_2_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WVALID" *)
output wire FPD_CCI_NOC_2_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WREADY" *)
input wire FPD_CCI_NOC_2_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BID" *)
input wire [15 : 0] FPD_CCI_NOC_2_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BRESP" *)
input wire [1 : 0] FPD_CCI_NOC_2_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BVALID" *)
input wire FPD_CCI_NOC_2_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BREADY" *)
output wire FPD_CCI_NOC_2_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARID" *)
output wire [15 : 0] FPD_CCI_NOC_2_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARADDR" *)
output wire [63 : 0] FPD_CCI_NOC_2_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARLEN" *)
output wire [7 : 0] FPD_CCI_NOC_2_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_2_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARBURST" *)
output wire [1 : 0] FPD_CCI_NOC_2_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARLOCK" *)
output wire FPD_CCI_NOC_2_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_2_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARPROT" *)
output wire [2 : 0] FPD_CCI_NOC_2_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARVALID" *)
output wire FPD_CCI_NOC_2_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARUSER" *)
output wire [17 : 0] FPD_CCI_NOC_2_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARREADY" *)
input wire FPD_CCI_NOC_2_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RID" *)
input wire [15 : 0] FPD_CCI_NOC_2_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RDATA" *)
input wire [127 : 0] FPD_CCI_NOC_2_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RRESP" *)
input wire [1 : 0] FPD_CCI_NOC_2_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RLAST" *)
input wire FPD_CCI_NOC_2_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RVALID" *)
input wire FPD_CCI_NOC_2_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RREADY" *)
output wire FPD_CCI_NOC_2_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWQOS" *)
output wire [3 : 0] FPD_CCI_NOC_2_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARQOS" *)
output wire [3 : 0] FPD_CCI_NOC_2_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_3, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 824999207, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk, NUM_REA\
D_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_cci, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, INDEX 3" *)
output wire [15 : 0] FPD_CCI_NOC_3_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWADDR" *)
output wire [63 : 0] FPD_CCI_NOC_3_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWLEN" *)
output wire [7 : 0] FPD_CCI_NOC_3_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_3_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWBURST" *)
output wire [1 : 0] FPD_CCI_NOC_3_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWLOCK" *)
output wire FPD_CCI_NOC_3_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_3_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWPROT" *)
output wire [2 : 0] FPD_CCI_NOC_3_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWVALID" *)
output wire FPD_CCI_NOC_3_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWUSER" *)
output wire [17 : 0] FPD_CCI_NOC_3_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWREADY" *)
input wire FPD_CCI_NOC_3_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WDATA" *)
output wire [127 : 0] FPD_CCI_NOC_3_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WSTRB" *)
output wire [15 : 0] FPD_CCI_NOC_3_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WUSER" *)
output wire [16 : 0] FPD_CCI_NOC_3_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WLAST" *)
output wire FPD_CCI_NOC_3_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WVALID" *)
output wire FPD_CCI_NOC_3_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WREADY" *)
input wire FPD_CCI_NOC_3_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BID" *)
input wire [15 : 0] FPD_CCI_NOC_3_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BRESP" *)
input wire [1 : 0] FPD_CCI_NOC_3_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BVALID" *)
input wire FPD_CCI_NOC_3_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BREADY" *)
output wire FPD_CCI_NOC_3_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARID" *)
output wire [15 : 0] FPD_CCI_NOC_3_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARADDR" *)
output wire [63 : 0] FPD_CCI_NOC_3_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARLEN" *)
output wire [7 : 0] FPD_CCI_NOC_3_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARSIZE" *)
output wire [2 : 0] FPD_CCI_NOC_3_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARBURST" *)
output wire [1 : 0] FPD_CCI_NOC_3_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARLOCK" *)
output wire FPD_CCI_NOC_3_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARCACHE" *)
output wire [3 : 0] FPD_CCI_NOC_3_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARPROT" *)
output wire [2 : 0] FPD_CCI_NOC_3_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARVALID" *)
output wire FPD_CCI_NOC_3_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARUSER" *)
output wire [17 : 0] FPD_CCI_NOC_3_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARREADY" *)
input wire FPD_CCI_NOC_3_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RID" *)
input wire [15 : 0] FPD_CCI_NOC_3_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RDATA" *)
input wire [127 : 0] FPD_CCI_NOC_3_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RRESP" *)
input wire [1 : 0] FPD_CCI_NOC_3_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RLAST" *)
input wire FPD_CCI_NOC_3_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RVALID" *)
input wire FPD_CCI_NOC_3_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RREADY" *)
output wire FPD_CCI_NOC_3_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWQOS" *)
output wire [3 : 0] FPD_CCI_NOC_3_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARQOS" *)
output wire [3 : 0] FPD_CCI_NOC_3_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LPD_AXI_NOC_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 599999451, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_lpd_axi_noc_clk, NUM_READ_THRE\
ADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_rpu, PHYSICAL_CHANNEL PS_RPU_TO_NOC_NMU, INDEX 0" *)
output wire [15 : 0] LPD_AXI_NOC_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWADDR" *)
output wire [63 : 0] LPD_AXI_NOC_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWLEN" *)
output wire [7 : 0] LPD_AXI_NOC_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWSIZE" *)
output wire [2 : 0] LPD_AXI_NOC_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWBURST" *)
output wire [1 : 0] LPD_AXI_NOC_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWLOCK" *)
output wire LPD_AXI_NOC_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWCACHE" *)
output wire [3 : 0] LPD_AXI_NOC_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWPROT" *)
output wire [2 : 0] LPD_AXI_NOC_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWVALID" *)
output wire LPD_AXI_NOC_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWUSER" *)
output wire [17 : 0] LPD_AXI_NOC_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWREADY" *)
input wire LPD_AXI_NOC_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WDATA" *)
output wire [127 : 0] LPD_AXI_NOC_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WSTRB" *)
output wire [15 : 0] LPD_AXI_NOC_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WLAST" *)
output wire LPD_AXI_NOC_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WVALID" *)
output wire LPD_AXI_NOC_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WREADY" *)
input wire LPD_AXI_NOC_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BID" *)
input wire [15 : 0] LPD_AXI_NOC_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BRESP" *)
input wire [1 : 0] LPD_AXI_NOC_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BVALID" *)
input wire LPD_AXI_NOC_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BREADY" *)
output wire LPD_AXI_NOC_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARID" *)
output wire [15 : 0] LPD_AXI_NOC_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARADDR" *)
output wire [63 : 0] LPD_AXI_NOC_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARLEN" *)
output wire [7 : 0] LPD_AXI_NOC_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARSIZE" *)
output wire [2 : 0] LPD_AXI_NOC_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARBURST" *)
output wire [1 : 0] LPD_AXI_NOC_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARLOCK" *)
output wire LPD_AXI_NOC_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARCACHE" *)
output wire [3 : 0] LPD_AXI_NOC_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARPROT" *)
output wire [2 : 0] LPD_AXI_NOC_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARVALID" *)
output wire LPD_AXI_NOC_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARUSER" *)
output wire [17 : 0] LPD_AXI_NOC_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARREADY" *)
input wire LPD_AXI_NOC_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RID" *)
input wire [15 : 0] LPD_AXI_NOC_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RDATA" *)
input wire [127 : 0] LPD_AXI_NOC_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RRESP" *)
input wire [1 : 0] LPD_AXI_NOC_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RLAST" *)
input wire LPD_AXI_NOC_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RVALID" *)
input wire LPD_AXI_NOC_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RREADY" *)
output wire LPD_AXI_NOC_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWQOS" *)
output wire [3 : 0] LPD_AXI_NOC_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARQOS" *)
output wire [3 : 0] LPD_AXI_NOC_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PMC_NOC_AXI_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 400000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 16, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk, NUM_R\
EAD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pmc, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NMU, HD_TANDEM 1, INDEX 0, SLR_INDEX 0" *)
output wire [63 : 0] PMC_NOC_AXI_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARBURST" *)
output wire [1 : 0] PMC_NOC_AXI_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARCACHE" *)
output wire [3 : 0] PMC_NOC_AXI_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARID" *)
output wire [15 : 0] PMC_NOC_AXI_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARLEN" *)
output wire [7 : 0] PMC_NOC_AXI_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARLOCK" *)
output wire PMC_NOC_AXI_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARPROT" *)
output wire [2 : 0] PMC_NOC_AXI_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARQOS" *)
output wire [3 : 0] PMC_NOC_AXI_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARREGION" *)
output wire [3 : 0] PMC_NOC_AXI_0_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARSIZE" *)
output wire [2 : 0] PMC_NOC_AXI_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARUSER" *)
output wire [17 : 0] PMC_NOC_AXI_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARVALID" *)
output wire PMC_NOC_AXI_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWADDR" *)
output wire [63 : 0] PMC_NOC_AXI_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWBURST" *)
output wire [1 : 0] PMC_NOC_AXI_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWCACHE" *)
output wire [3 : 0] PMC_NOC_AXI_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWID" *)
output wire [15 : 0] PMC_NOC_AXI_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWLEN" *)
output wire [7 : 0] PMC_NOC_AXI_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWLOCK" *)
output wire PMC_NOC_AXI_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWPROT" *)
output wire [2 : 0] PMC_NOC_AXI_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWQOS" *)
output wire [3 : 0] PMC_NOC_AXI_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWREGION" *)
output wire [3 : 0] PMC_NOC_AXI_0_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWSIZE" *)
output wire [2 : 0] PMC_NOC_AXI_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWUSER" *)
output wire [17 : 0] PMC_NOC_AXI_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWVALID" *)
output wire PMC_NOC_AXI_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BREADY" *)
output wire PMC_NOC_AXI_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RREADY" *)
output wire PMC_NOC_AXI_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WDATA" *)
output wire [127 : 0] PMC_NOC_AXI_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WID" *)
output wire [15 : 0] PMC_NOC_AXI_0_wid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WLAST" *)
output wire PMC_NOC_AXI_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WSTRB" *)
output wire [15 : 0] PMC_NOC_AXI_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WUSER" *)
output wire [16 : 0] PMC_NOC_AXI_0_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WVALID" *)
output wire PMC_NOC_AXI_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARREADY" *)
input wire PMC_NOC_AXI_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWREADY" *)
input wire PMC_NOC_AXI_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BID" *)
input wire [15 : 0] PMC_NOC_AXI_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BRESP" *)
input wire [1 : 0] PMC_NOC_AXI_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BUSER" *)
input wire [15 : 0] PMC_NOC_AXI_0_buser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BVALID" *)
input wire PMC_NOC_AXI_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RDATA" *)
input wire [127 : 0] PMC_NOC_AXI_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RID" *)
input wire [15 : 0] PMC_NOC_AXI_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RLAST" *)
input wire PMC_NOC_AXI_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RRESP" *)
input wire [1 : 0] PMC_NOC_AXI_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RUSER" *)
input wire [16 : 0] PMC_NOC_AXI_0_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RVALID" *)
input wire PMC_NOC_AXI_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WREADY" *)
input wire PMC_NOC_AXI_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARADDR" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NOC_PMC_AXI_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 400000000, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 16, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk, NUM_RE\
AD_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pmc, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PMC, HD_TANDEM 1, INDEX 0, SLR_INDEX 0" *)
input wire [63 : 0] NOC_PMC_AXI_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARBURST" *)
input wire [1 : 0] NOC_PMC_AXI_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARCACHE" *)
input wire [3 : 0] NOC_PMC_AXI_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARID" *)
input wire [1 : 0] NOC_PMC_AXI_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARLEN" *)
input wire [7 : 0] NOC_PMC_AXI_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARLOCK" *)
input wire NOC_PMC_AXI_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARPROT" *)
input wire [2 : 0] NOC_PMC_AXI_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARQOS" *)
input wire [3 : 0] NOC_PMC_AXI_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARREGION" *)
input wire [3 : 0] NOC_PMC_AXI_0_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARSIZE" *)
input wire [2 : 0] NOC_PMC_AXI_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARUSER" *)
input wire [17 : 0] NOC_PMC_AXI_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARVALID" *)
input wire NOC_PMC_AXI_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWADDR" *)
input wire [63 : 0] NOC_PMC_AXI_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWBURST" *)
input wire [1 : 0] NOC_PMC_AXI_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWCACHE" *)
input wire [3 : 0] NOC_PMC_AXI_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWID" *)
input wire [1 : 0] NOC_PMC_AXI_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWLEN" *)
input wire [7 : 0] NOC_PMC_AXI_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWLOCK" *)
input wire NOC_PMC_AXI_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWPROT" *)
input wire [2 : 0] NOC_PMC_AXI_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWQOS" *)
input wire [3 : 0] NOC_PMC_AXI_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWREGION" *)
input wire [3 : 0] NOC_PMC_AXI_0_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWSIZE" *)
input wire [2 : 0] NOC_PMC_AXI_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWUSER" *)
input wire [17 : 0] NOC_PMC_AXI_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWVALID" *)
input wire NOC_PMC_AXI_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BREADY" *)
input wire NOC_PMC_AXI_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RREADY" *)
input wire NOC_PMC_AXI_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WDATA" *)
input wire [127 : 0] NOC_PMC_AXI_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WID" *)
input wire [3 : 0] NOC_PMC_AXI_0_wid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WLAST" *)
input wire NOC_PMC_AXI_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WSTRB" *)
input wire [15 : 0] NOC_PMC_AXI_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WUSER" *)
input wire [16 : 0] NOC_PMC_AXI_0_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WVALID" *)
input wire NOC_PMC_AXI_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARREADY" *)
output wire NOC_PMC_AXI_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWREADY" *)
output wire NOC_PMC_AXI_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BID" *)
output wire [1 : 0] NOC_PMC_AXI_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BRESP" *)
output wire [1 : 0] NOC_PMC_AXI_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BUSER" *)
output wire [15 : 0] NOC_PMC_AXI_0_buser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BVALID" *)
output wire NOC_PMC_AXI_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RDATA" *)
output wire [127 : 0] NOC_PMC_AXI_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RID" *)
output wire [1 : 0] NOC_PMC_AXI_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RLAST" *)
output wire NOC_PMC_AXI_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RRESP" *)
output wire [1 : 0] NOC_PMC_AXI_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RUSER" *)
output wire [16 : 0] NOC_PMC_AXI_0_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RVALID" *)
output wire NOC_PMC_AXI_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WREADY" *)
output wire NOC_PMC_AXI_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 1000000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk, NUM_R\
EAD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 1, INDEX 0" *)
output wire [63 : 0] CPM_PCIE_NOC_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARID" *)
output wire [15 : 0] CPM_PCIE_NOC_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLOCK" *)
output wire CPM_PCIE_NOC_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARVALID" *)
output wire CPM_PCIE_NOC_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWID" *)
output wire [15 : 0] CPM_PCIE_NOC_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLOCK" *)
output wire CPM_PCIE_NOC_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWVALID" *)
output wire CPM_PCIE_NOC_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BREADY" *)
output wire CPM_PCIE_NOC_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RREADY" *)
output wire CPM_PCIE_NOC_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WDATA" *)
output wire [127 : 0] CPM_PCIE_NOC_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WLAST" *)
output wire CPM_PCIE_NOC_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WSTRB" *)
output wire [15 : 0] CPM_PCIE_NOC_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WVALID" *)
output wire CPM_PCIE_NOC_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARREADY" *)
input wire CPM_PCIE_NOC_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWREADY" *)
input wire CPM_PCIE_NOC_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BID" *)
input wire [15 : 0] CPM_PCIE_NOC_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BVALID" *)
input wire CPM_PCIE_NOC_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RDATA" *)
input wire [127 : 0] CPM_PCIE_NOC_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RID" *)
input wire [15 : 0] CPM_PCIE_NOC_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RLAST" *)
input wire CPM_PCIE_NOC_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RVALID" *)
input wire CPM_PCIE_NOC_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RUSER" *)
input wire [16 : 0] CPM_PCIE_NOC_0_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WUSER" *)
output wire [16 : 0] CPM_PCIE_NOC_0_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WREADY" *)
input wire CPM_PCIE_NOC_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_1, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 1000000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk, NUM_R\
EAD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 1, INDEX 1" *)
output wire [63 : 0] CPM_PCIE_NOC_1_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_1_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_1_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARID" *)
output wire [15 : 0] CPM_PCIE_NOC_1_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_1_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLOCK" *)
output wire CPM_PCIE_NOC_1_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_1_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_1_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_1_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_1_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARVALID" *)
output wire CPM_PCIE_NOC_1_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_1_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_1_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_1_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWID" *)
output wire [15 : 0] CPM_PCIE_NOC_1_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_1_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLOCK" *)
output wire CPM_PCIE_NOC_1_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_1_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_1_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_1_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_1_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWVALID" *)
output wire CPM_PCIE_NOC_1_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BREADY" *)
output wire CPM_PCIE_NOC_1_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RREADY" *)
output wire CPM_PCIE_NOC_1_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WDATA" *)
output wire [127 : 0] CPM_PCIE_NOC_1_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WLAST" *)
output wire CPM_PCIE_NOC_1_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WSTRB" *)
output wire [15 : 0] CPM_PCIE_NOC_1_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WVALID" *)
output wire CPM_PCIE_NOC_1_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARREADY" *)
input wire CPM_PCIE_NOC_1_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWREADY" *)
input wire CPM_PCIE_NOC_1_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BID" *)
input wire [15 : 0] CPM_PCIE_NOC_1_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_1_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BVALID" *)
input wire CPM_PCIE_NOC_1_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RDATA" *)
input wire [127 : 0] CPM_PCIE_NOC_1_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RID" *)
input wire [15 : 0] CPM_PCIE_NOC_1_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RLAST" *)
input wire CPM_PCIE_NOC_1_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_1_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RVALID" *)
input wire CPM_PCIE_NOC_1_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RUSER" *)
input wire [16 : 0] CPM_PCIE_NOC_1_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WUSER" *)
output wire [16 : 0] CPM_PCIE_NOC_1_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WREADY" *)
input wire CPM_PCIE_NOC_1_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_vld" *)
(* X_INTERFACE_MODE = "slave" *)
output wire dma0_mgmt_cpl_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_rdy" *)
output wire dma0_mgmt_req_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_rdy" *)
input wire dma0_mgmt_cpl_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_vld" *)
input wire dma0_mgmt_req_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_sts" *)
output wire [1 : 0] dma0_mgmt_cpl_sts;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_dat" *)
output wire [31 : 0] dma0_mgmt_cpl_dat;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_cmd" *)
input wire [1 : 0] dma0_mgmt_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_fnc" *)
input wire [12 : 0] dma0_mgmt_req_fnc;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_msc" *)
input wire [5 : 0] dma0_mgmt_req_msc;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_adr" *)
input wire [31 : 0] dma0_mgmt_req_adr;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_dat" *)
input wire [31 : 0] dma0_mgmt_req_dat;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TLAST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dma0_st_rx_msg, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire dma0_st_rx_msg_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TVALID" *)
output wire dma0_st_rx_msg_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TREADY" *)
input wire dma0_st_rx_msg_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TDATA" *)
output wire [31 : 0] dma0_st_rx_msg_tdata;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr cmp" *)
(* X_INTERFACE_MODE = "master" *)
output wire dma0_axis_c2h_dmawr_cmp;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr target_vch" *)
output wire dma0_axis_c2h_dmawr_target_vch;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr port_id" *)
output wire [2 : 0] dma0_axis_c2h_dmawr_port_id;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tready" *)
(* X_INTERFACE_MODE = "slave" *)
output wire dma0_s_axis_c2h_tready;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tlast" *)
input wire dma0_s_axis_c2h_tlast;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tvalid" *)
input wire dma0_s_axis_c2h_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tcrc" *)
input wire [31 : 0] dma0_s_axis_c2h_tcrc;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tdata" *)
input wire [511 : 0] dma0_s_axis_c2h_tdata;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h mty" *)
input wire [5 : 0] dma0_s_axis_c2h_mty;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ecc" *)
input wire [6 : 0] dma0_s_axis_c2h_ecc;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_marker" *)
input wire dma0_s_axis_c2h_ctrl_marker;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_has_cmpt" *)
input wire dma0_s_axis_c2h_ctrl_has_cmpt;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_len" *)
input wire [15 : 0] dma0_s_axis_c2h_ctrl_len;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_qid" *)
input wire [11 : 0] dma0_s_axis_c2h_ctrl_qid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_port_id" *)
input wire [2 : 0] dma0_s_axis_c2h_ctrl_port_id;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt marker" *)
(* X_INTERFACE_MODE = "slave" *)
input wire dma0_s_axis_c2h_cmpt_marker;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt user_trig" *)
input wire dma0_s_axis_c2h_cmpt_user_trig;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt size" *)
input wire [1 : 0] dma0_s_axis_c2h_cmpt_size;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt qid" *)
input wire [12 : 0] dma0_s_axis_c2h_cmpt_qid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt no_wrb_marker" *)
input wire dma0_s_axis_c2h_cmpt_no_wrb_marker;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt port_id" *)
input wire [2 : 0] dma0_s_axis_c2h_cmpt_port_id;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt col_idx" *)
input wire [2 : 0] dma0_s_axis_c2h_cmpt_col_idx;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt err_idx" *)
input wire [2 : 0] dma0_s_axis_c2h_cmpt_err_idx;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt wait_pld_pkt_id" *)
input wire [15 : 0] dma0_s_axis_c2h_cmpt_wait_pld_pkt_id;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt tready" *)
output wire dma0_s_axis_c2h_cmpt_tready;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt tvalid" *)
input wire dma0_s_axis_c2h_cmpt_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt dpar" *)
input wire [15 : 0] dma0_s_axis_c2h_cmpt_dpar;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt data" *)
input wire [511 : 0] dma0_s_axis_c2h_cmpt_data;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt cmpt_type" *)
input wire [1 : 0] dma0_s_axis_c2h_cmpt_cmpt_type;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tlast" *)
(* X_INTERFACE_MODE = "master" *)
output wire dma0_m_axis_h2c_tlast;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c err" *)
output wire dma0_m_axis_h2c_err;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tvalid" *)
output wire dma0_m_axis_h2c_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tdata" *)
output wire [511 : 0] dma0_m_axis_h2c_tdata;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c zero_byte" *)
output wire dma0_m_axis_h2c_zero_byte;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tready" *)
input wire dma0_m_axis_h2c_tready;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tcrc" *)
output wire [31 : 0] dma0_m_axis_h2c_tcrc;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c mty" *)
output wire [5 : 0] dma0_m_axis_h2c_mty;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c qid" *)
output wire [11 : 0] dma0_m_axis_h2c_qid;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c mdata" *)
output wire [31 : 0] dma0_m_axis_h2c_mdata;
(* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c port_id" *)
output wire [2 : 0] dma0_m_axis_h2c_port_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status last" *)
(* X_INTERFACE_MODE = "master" *)
output wire dma0_axis_c2h_status_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status drop" *)
output wire dma0_axis_c2h_status_drop;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status error" *)
output wire dma0_axis_c2h_status_error;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status valid" *)
output wire dma0_axis_c2h_status_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status status_cmp" *)
output wire dma0_axis_c2h_status_status_cmp;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status qid" *)
output wire [11 : 0] dma0_axis_c2h_status_qid;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out vld" *)
(* X_INTERFACE_MODE = "master" *)
output wire dma0_qsts_out_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out op" *)
output wire [7 : 0] dma0_qsts_out_op;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out rdy" *)
input wire dma0_qsts_out_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out qid" *)
output wire [12 : 0] dma0_qsts_out_qid;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out data" *)
output wire [63 : 0] dma0_qsts_out_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out port_id" *)
output wire [2 : 0] dma0_qsts_out_port_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in rdy" *)
(* X_INTERFACE_MODE = "slave" *)
output wire dma0_dsc_crdt_in_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in dir" *)
input wire dma0_dsc_crdt_in_dir;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in valid" *)
input wire dma0_dsc_crdt_in_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in fence" *)
input wire dma0_dsc_crdt_in_fence;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in qid" *)
input wire [11 : 0] dma0_dsc_crdt_in_qid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in crdt" *)
input wire [15 : 0] dma0_dsc_crdt_in_crdt;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq ack" *)
(* X_INTERFACE_MODE = "slave" *)
output wire dma0_usr_irq_ack;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq fail" *)
output wire dma0_usr_irq_fail;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq valid" *)
input wire dma0_usr_irq_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq vec" *)
input wire [10 : 0] dma0_usr_irq_vec;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq fnc" *)
input wire [12 : 0] dma0_usr_irq_fnc;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts mm" *)
(* X_INTERFACE_MODE = "master" *)
output wire dma0_tm_dsc_sts_mm;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qen" *)
output wire dma0_tm_dsc_sts_qen;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts byp" *)
output wire dma0_tm_dsc_sts_byp;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts dir" *)
output wire dma0_tm_dsc_sts_dir;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts error" *)
output wire dma0_tm_dsc_sts_error;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts valid" *)
output wire dma0_tm_dsc_sts_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qinv" *)
output wire dma0_tm_dsc_sts_qinv;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts irq_arm" *)
output wire dma0_tm_dsc_sts_irq_arm;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts rdy" *)
input wire dma0_tm_dsc_sts_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qid" *)
output wire [11 : 0] dma0_tm_dsc_sts_qid;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts avl" *)
output wire [15 : 0] dma0_tm_dsc_sts_avl;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts pidx" *)
output wire [15 : 0] dma0_tm_dsc_sts_pidx;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts port_id" *)
output wire [2 : 0] dma0_tm_dsc_sts_port_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr set" *)
(* X_INTERFACE_MODE = "slave" *)
output wire dma0_usr_flr_set;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr clear" *)
output wire dma0_usr_flr_clear;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr fnc" *)
output wire [12 : 0] dma0_usr_flr_fnc;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr done_vld" *)
input wire dma0_usr_flr_done_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr done_fnc" *)
input wire [12 : 0] dma0_usr_flr_done_fnc;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_N" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PCIE0_GT, CAN_DEBUG false" *)
input wire [7 : 0] PCIE0_GT_grx_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_N" *)
output wire [7 : 0] PCIE0_GT_gtx_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_P" *)
input wire [7 : 0] PCIE0_GT_grx_p;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_P" *)
output wire [7 : 0] PCIE0_GT_gtx_p;
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_N" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk0, CAN_DEBUG false, FREQ_HZ 100000000" *)
input wire gt_refclk0_clk_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_P" *)
input wire gt_refclk0_clk_p;

  bd_af1b inst (
    .fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk),
    .fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk),
    .fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk),
    .fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk),
    .lpd_axi_noc_clk(lpd_axi_noc_clk),
    .pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk),
    .noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk),
    .gem0_tsu_timer_cnt(gem0_tsu_timer_cnt),
    .cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk),
    .cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk),
    .dma0_intrfc_clk(dma0_intrfc_clk),
    .cpm_misc_irq(cpm_misc_irq),
    .cpm_cor_irq(cpm_cor_irq),
    .cpm_uncor_irq(cpm_uncor_irq),
    .cpm_irq0(cpm_irq0),
    .cpm_irq1(cpm_irq1),
    .dma0_axi_aresetn(dma0_axi_aresetn),
    .dma0_intrfc_resetn(dma0_intrfc_resetn),
    .FPD_CCI_NOC_0_awid(FPD_CCI_NOC_0_awid),
    .FPD_CCI_NOC_0_awaddr(FPD_CCI_NOC_0_awaddr),
    .FPD_CCI_NOC_0_awlen(FPD_CCI_NOC_0_awlen),
    .FPD_CCI_NOC_0_awsize(FPD_CCI_NOC_0_awsize),
    .FPD_CCI_NOC_0_awburst(FPD_CCI_NOC_0_awburst),
    .FPD_CCI_NOC_0_awlock(FPD_CCI_NOC_0_awlock),
    .FPD_CCI_NOC_0_awcache(FPD_CCI_NOC_0_awcache),
    .FPD_CCI_NOC_0_awprot(FPD_CCI_NOC_0_awprot),
    .FPD_CCI_NOC_0_awvalid(FPD_CCI_NOC_0_awvalid),
    .FPD_CCI_NOC_0_awuser(FPD_CCI_NOC_0_awuser),
    .FPD_CCI_NOC_0_awready(FPD_CCI_NOC_0_awready),
    .FPD_CCI_NOC_0_wdata(FPD_CCI_NOC_0_wdata),
    .FPD_CCI_NOC_0_wstrb(FPD_CCI_NOC_0_wstrb),
    .FPD_CCI_NOC_0_wuser(FPD_CCI_NOC_0_wuser),
    .FPD_CCI_NOC_0_wlast(FPD_CCI_NOC_0_wlast),
    .FPD_CCI_NOC_0_wvalid(FPD_CCI_NOC_0_wvalid),
    .FPD_CCI_NOC_0_wready(FPD_CCI_NOC_0_wready),
    .FPD_CCI_NOC_0_bid(FPD_CCI_NOC_0_bid),
    .FPD_CCI_NOC_0_bresp(FPD_CCI_NOC_0_bresp),
    .FPD_CCI_NOC_0_bvalid(FPD_CCI_NOC_0_bvalid),
    .FPD_CCI_NOC_0_bready(FPD_CCI_NOC_0_bready),
    .FPD_CCI_NOC_0_arid(FPD_CCI_NOC_0_arid),
    .FPD_CCI_NOC_0_araddr(FPD_CCI_NOC_0_araddr),
    .FPD_CCI_NOC_0_arlen(FPD_CCI_NOC_0_arlen),
    .FPD_CCI_NOC_0_arsize(FPD_CCI_NOC_0_arsize),
    .FPD_CCI_NOC_0_arburst(FPD_CCI_NOC_0_arburst),
    .FPD_CCI_NOC_0_arlock(FPD_CCI_NOC_0_arlock),
    .FPD_CCI_NOC_0_arcache(FPD_CCI_NOC_0_arcache),
    .FPD_CCI_NOC_0_arprot(FPD_CCI_NOC_0_arprot),
    .FPD_CCI_NOC_0_arvalid(FPD_CCI_NOC_0_arvalid),
    .FPD_CCI_NOC_0_aruser(FPD_CCI_NOC_0_aruser),
    .FPD_CCI_NOC_0_arready(FPD_CCI_NOC_0_arready),
    .FPD_CCI_NOC_0_rid(FPD_CCI_NOC_0_rid),
    .FPD_CCI_NOC_0_rdata(FPD_CCI_NOC_0_rdata),
    .FPD_CCI_NOC_0_rresp(FPD_CCI_NOC_0_rresp),
    .FPD_CCI_NOC_0_rlast(FPD_CCI_NOC_0_rlast),
    .FPD_CCI_NOC_0_rvalid(FPD_CCI_NOC_0_rvalid),
    .FPD_CCI_NOC_0_rready(FPD_CCI_NOC_0_rready),
    .FPD_CCI_NOC_0_awqos(FPD_CCI_NOC_0_awqos),
    .FPD_CCI_NOC_0_arqos(FPD_CCI_NOC_0_arqos),
    .FPD_CCI_NOC_1_awid(FPD_CCI_NOC_1_awid),
    .FPD_CCI_NOC_1_awaddr(FPD_CCI_NOC_1_awaddr),
    .FPD_CCI_NOC_1_awlen(FPD_CCI_NOC_1_awlen),
    .FPD_CCI_NOC_1_awsize(FPD_CCI_NOC_1_awsize),
    .FPD_CCI_NOC_1_awburst(FPD_CCI_NOC_1_awburst),
    .FPD_CCI_NOC_1_awlock(FPD_CCI_NOC_1_awlock),
    .FPD_CCI_NOC_1_awcache(FPD_CCI_NOC_1_awcache),
    .FPD_CCI_NOC_1_awprot(FPD_CCI_NOC_1_awprot),
    .FPD_CCI_NOC_1_awvalid(FPD_CCI_NOC_1_awvalid),
    .FPD_CCI_NOC_1_awuser(FPD_CCI_NOC_1_awuser),
    .FPD_CCI_NOC_1_awready(FPD_CCI_NOC_1_awready),
    .FPD_CCI_NOC_1_wdata(FPD_CCI_NOC_1_wdata),
    .FPD_CCI_NOC_1_wstrb(FPD_CCI_NOC_1_wstrb),
    .FPD_CCI_NOC_1_wuser(FPD_CCI_NOC_1_wuser),
    .FPD_CCI_NOC_1_wlast(FPD_CCI_NOC_1_wlast),
    .FPD_CCI_NOC_1_wvalid(FPD_CCI_NOC_1_wvalid),
    .FPD_CCI_NOC_1_wready(FPD_CCI_NOC_1_wready),
    .FPD_CCI_NOC_1_bid(FPD_CCI_NOC_1_bid),
    .FPD_CCI_NOC_1_bresp(FPD_CCI_NOC_1_bresp),
    .FPD_CCI_NOC_1_bvalid(FPD_CCI_NOC_1_bvalid),
    .FPD_CCI_NOC_1_bready(FPD_CCI_NOC_1_bready),
    .FPD_CCI_NOC_1_arid(FPD_CCI_NOC_1_arid),
    .FPD_CCI_NOC_1_araddr(FPD_CCI_NOC_1_araddr),
    .FPD_CCI_NOC_1_arlen(FPD_CCI_NOC_1_arlen),
    .FPD_CCI_NOC_1_arsize(FPD_CCI_NOC_1_arsize),
    .FPD_CCI_NOC_1_arburst(FPD_CCI_NOC_1_arburst),
    .FPD_CCI_NOC_1_arlock(FPD_CCI_NOC_1_arlock),
    .FPD_CCI_NOC_1_arcache(FPD_CCI_NOC_1_arcache),
    .FPD_CCI_NOC_1_arprot(FPD_CCI_NOC_1_arprot),
    .FPD_CCI_NOC_1_arvalid(FPD_CCI_NOC_1_arvalid),
    .FPD_CCI_NOC_1_aruser(FPD_CCI_NOC_1_aruser),
    .FPD_CCI_NOC_1_arready(FPD_CCI_NOC_1_arready),
    .FPD_CCI_NOC_1_rid(FPD_CCI_NOC_1_rid),
    .FPD_CCI_NOC_1_rdata(FPD_CCI_NOC_1_rdata),
    .FPD_CCI_NOC_1_rresp(FPD_CCI_NOC_1_rresp),
    .FPD_CCI_NOC_1_rlast(FPD_CCI_NOC_1_rlast),
    .FPD_CCI_NOC_1_rvalid(FPD_CCI_NOC_1_rvalid),
    .FPD_CCI_NOC_1_rready(FPD_CCI_NOC_1_rready),
    .FPD_CCI_NOC_1_awqos(FPD_CCI_NOC_1_awqos),
    .FPD_CCI_NOC_1_arqos(FPD_CCI_NOC_1_arqos),
    .FPD_CCI_NOC_2_awid(FPD_CCI_NOC_2_awid),
    .FPD_CCI_NOC_2_awaddr(FPD_CCI_NOC_2_awaddr),
    .FPD_CCI_NOC_2_awlen(FPD_CCI_NOC_2_awlen),
    .FPD_CCI_NOC_2_awsize(FPD_CCI_NOC_2_awsize),
    .FPD_CCI_NOC_2_awburst(FPD_CCI_NOC_2_awburst),
    .FPD_CCI_NOC_2_awlock(FPD_CCI_NOC_2_awlock),
    .FPD_CCI_NOC_2_awcache(FPD_CCI_NOC_2_awcache),
    .FPD_CCI_NOC_2_awprot(FPD_CCI_NOC_2_awprot),
    .FPD_CCI_NOC_2_awvalid(FPD_CCI_NOC_2_awvalid),
    .FPD_CCI_NOC_2_awuser(FPD_CCI_NOC_2_awuser),
    .FPD_CCI_NOC_2_awready(FPD_CCI_NOC_2_awready),
    .FPD_CCI_NOC_2_wdata(FPD_CCI_NOC_2_wdata),
    .FPD_CCI_NOC_2_wstrb(FPD_CCI_NOC_2_wstrb),
    .FPD_CCI_NOC_2_wuser(FPD_CCI_NOC_2_wuser),
    .FPD_CCI_NOC_2_wlast(FPD_CCI_NOC_2_wlast),
    .FPD_CCI_NOC_2_wvalid(FPD_CCI_NOC_2_wvalid),
    .FPD_CCI_NOC_2_wready(FPD_CCI_NOC_2_wready),
    .FPD_CCI_NOC_2_bid(FPD_CCI_NOC_2_bid),
    .FPD_CCI_NOC_2_bresp(FPD_CCI_NOC_2_bresp),
    .FPD_CCI_NOC_2_bvalid(FPD_CCI_NOC_2_bvalid),
    .FPD_CCI_NOC_2_bready(FPD_CCI_NOC_2_bready),
    .FPD_CCI_NOC_2_arid(FPD_CCI_NOC_2_arid),
    .FPD_CCI_NOC_2_araddr(FPD_CCI_NOC_2_araddr),
    .FPD_CCI_NOC_2_arlen(FPD_CCI_NOC_2_arlen),
    .FPD_CCI_NOC_2_arsize(FPD_CCI_NOC_2_arsize),
    .FPD_CCI_NOC_2_arburst(FPD_CCI_NOC_2_arburst),
    .FPD_CCI_NOC_2_arlock(FPD_CCI_NOC_2_arlock),
    .FPD_CCI_NOC_2_arcache(FPD_CCI_NOC_2_arcache),
    .FPD_CCI_NOC_2_arprot(FPD_CCI_NOC_2_arprot),
    .FPD_CCI_NOC_2_arvalid(FPD_CCI_NOC_2_arvalid),
    .FPD_CCI_NOC_2_aruser(FPD_CCI_NOC_2_aruser),
    .FPD_CCI_NOC_2_arready(FPD_CCI_NOC_2_arready),
    .FPD_CCI_NOC_2_rid(FPD_CCI_NOC_2_rid),
    .FPD_CCI_NOC_2_rdata(FPD_CCI_NOC_2_rdata),
    .FPD_CCI_NOC_2_rresp(FPD_CCI_NOC_2_rresp),
    .FPD_CCI_NOC_2_rlast(FPD_CCI_NOC_2_rlast),
    .FPD_CCI_NOC_2_rvalid(FPD_CCI_NOC_2_rvalid),
    .FPD_CCI_NOC_2_rready(FPD_CCI_NOC_2_rready),
    .FPD_CCI_NOC_2_awqos(FPD_CCI_NOC_2_awqos),
    .FPD_CCI_NOC_2_arqos(FPD_CCI_NOC_2_arqos),
    .FPD_CCI_NOC_3_awid(FPD_CCI_NOC_3_awid),
    .FPD_CCI_NOC_3_awaddr(FPD_CCI_NOC_3_awaddr),
    .FPD_CCI_NOC_3_awlen(FPD_CCI_NOC_3_awlen),
    .FPD_CCI_NOC_3_awsize(FPD_CCI_NOC_3_awsize),
    .FPD_CCI_NOC_3_awburst(FPD_CCI_NOC_3_awburst),
    .FPD_CCI_NOC_3_awlock(FPD_CCI_NOC_3_awlock),
    .FPD_CCI_NOC_3_awcache(FPD_CCI_NOC_3_awcache),
    .FPD_CCI_NOC_3_awprot(FPD_CCI_NOC_3_awprot),
    .FPD_CCI_NOC_3_awvalid(FPD_CCI_NOC_3_awvalid),
    .FPD_CCI_NOC_3_awuser(FPD_CCI_NOC_3_awuser),
    .FPD_CCI_NOC_3_awready(FPD_CCI_NOC_3_awready),
    .FPD_CCI_NOC_3_wdata(FPD_CCI_NOC_3_wdata),
    .FPD_CCI_NOC_3_wstrb(FPD_CCI_NOC_3_wstrb),
    .FPD_CCI_NOC_3_wuser(FPD_CCI_NOC_3_wuser),
    .FPD_CCI_NOC_3_wlast(FPD_CCI_NOC_3_wlast),
    .FPD_CCI_NOC_3_wvalid(FPD_CCI_NOC_3_wvalid),
    .FPD_CCI_NOC_3_wready(FPD_CCI_NOC_3_wready),
    .FPD_CCI_NOC_3_bid(FPD_CCI_NOC_3_bid),
    .FPD_CCI_NOC_3_bresp(FPD_CCI_NOC_3_bresp),
    .FPD_CCI_NOC_3_bvalid(FPD_CCI_NOC_3_bvalid),
    .FPD_CCI_NOC_3_bready(FPD_CCI_NOC_3_bready),
    .FPD_CCI_NOC_3_arid(FPD_CCI_NOC_3_arid),
    .FPD_CCI_NOC_3_araddr(FPD_CCI_NOC_3_araddr),
    .FPD_CCI_NOC_3_arlen(FPD_CCI_NOC_3_arlen),
    .FPD_CCI_NOC_3_arsize(FPD_CCI_NOC_3_arsize),
    .FPD_CCI_NOC_3_arburst(FPD_CCI_NOC_3_arburst),
    .FPD_CCI_NOC_3_arlock(FPD_CCI_NOC_3_arlock),
    .FPD_CCI_NOC_3_arcache(FPD_CCI_NOC_3_arcache),
    .FPD_CCI_NOC_3_arprot(FPD_CCI_NOC_3_arprot),
    .FPD_CCI_NOC_3_arvalid(FPD_CCI_NOC_3_arvalid),
    .FPD_CCI_NOC_3_aruser(FPD_CCI_NOC_3_aruser),
    .FPD_CCI_NOC_3_arready(FPD_CCI_NOC_3_arready),
    .FPD_CCI_NOC_3_rid(FPD_CCI_NOC_3_rid),
    .FPD_CCI_NOC_3_rdata(FPD_CCI_NOC_3_rdata),
    .FPD_CCI_NOC_3_rresp(FPD_CCI_NOC_3_rresp),
    .FPD_CCI_NOC_3_rlast(FPD_CCI_NOC_3_rlast),
    .FPD_CCI_NOC_3_rvalid(FPD_CCI_NOC_3_rvalid),
    .FPD_CCI_NOC_3_rready(FPD_CCI_NOC_3_rready),
    .FPD_CCI_NOC_3_awqos(FPD_CCI_NOC_3_awqos),
    .FPD_CCI_NOC_3_arqos(FPD_CCI_NOC_3_arqos),
    .LPD_AXI_NOC_0_awid(LPD_AXI_NOC_0_awid),
    .LPD_AXI_NOC_0_awaddr(LPD_AXI_NOC_0_awaddr),
    .LPD_AXI_NOC_0_awlen(LPD_AXI_NOC_0_awlen),
    .LPD_AXI_NOC_0_awsize(LPD_AXI_NOC_0_awsize),
    .LPD_AXI_NOC_0_awburst(LPD_AXI_NOC_0_awburst),
    .LPD_AXI_NOC_0_awlock(LPD_AXI_NOC_0_awlock),
    .LPD_AXI_NOC_0_awcache(LPD_AXI_NOC_0_awcache),
    .LPD_AXI_NOC_0_awprot(LPD_AXI_NOC_0_awprot),
    .LPD_AXI_NOC_0_awvalid(LPD_AXI_NOC_0_awvalid),
    .LPD_AXI_NOC_0_awuser(LPD_AXI_NOC_0_awuser),
    .LPD_AXI_NOC_0_awready(LPD_AXI_NOC_0_awready),
    .LPD_AXI_NOC_0_wdata(LPD_AXI_NOC_0_wdata),
    .LPD_AXI_NOC_0_wstrb(LPD_AXI_NOC_0_wstrb),
    .LPD_AXI_NOC_0_wlast(LPD_AXI_NOC_0_wlast),
    .LPD_AXI_NOC_0_wvalid(LPD_AXI_NOC_0_wvalid),
    .LPD_AXI_NOC_0_wready(LPD_AXI_NOC_0_wready),
    .LPD_AXI_NOC_0_bid(LPD_AXI_NOC_0_bid),
    .LPD_AXI_NOC_0_bresp(LPD_AXI_NOC_0_bresp),
    .LPD_AXI_NOC_0_bvalid(LPD_AXI_NOC_0_bvalid),
    .LPD_AXI_NOC_0_bready(LPD_AXI_NOC_0_bready),
    .LPD_AXI_NOC_0_arid(LPD_AXI_NOC_0_arid),
    .LPD_AXI_NOC_0_araddr(LPD_AXI_NOC_0_araddr),
    .LPD_AXI_NOC_0_arlen(LPD_AXI_NOC_0_arlen),
    .LPD_AXI_NOC_0_arsize(LPD_AXI_NOC_0_arsize),
    .LPD_AXI_NOC_0_arburst(LPD_AXI_NOC_0_arburst),
    .LPD_AXI_NOC_0_arlock(LPD_AXI_NOC_0_arlock),
    .LPD_AXI_NOC_0_arcache(LPD_AXI_NOC_0_arcache),
    .LPD_AXI_NOC_0_arprot(LPD_AXI_NOC_0_arprot),
    .LPD_AXI_NOC_0_arvalid(LPD_AXI_NOC_0_arvalid),
    .LPD_AXI_NOC_0_aruser(LPD_AXI_NOC_0_aruser),
    .LPD_AXI_NOC_0_arready(LPD_AXI_NOC_0_arready),
    .LPD_AXI_NOC_0_rid(LPD_AXI_NOC_0_rid),
    .LPD_AXI_NOC_0_rdata(LPD_AXI_NOC_0_rdata),
    .LPD_AXI_NOC_0_rresp(LPD_AXI_NOC_0_rresp),
    .LPD_AXI_NOC_0_rlast(LPD_AXI_NOC_0_rlast),
    .LPD_AXI_NOC_0_rvalid(LPD_AXI_NOC_0_rvalid),
    .LPD_AXI_NOC_0_rready(LPD_AXI_NOC_0_rready),
    .LPD_AXI_NOC_0_awqos(LPD_AXI_NOC_0_awqos),
    .LPD_AXI_NOC_0_arqos(LPD_AXI_NOC_0_arqos),
    .PMC_NOC_AXI_0_araddr(PMC_NOC_AXI_0_araddr),
    .PMC_NOC_AXI_0_arburst(PMC_NOC_AXI_0_arburst),
    .PMC_NOC_AXI_0_arcache(PMC_NOC_AXI_0_arcache),
    .PMC_NOC_AXI_0_arid(PMC_NOC_AXI_0_arid),
    .PMC_NOC_AXI_0_arlen(PMC_NOC_AXI_0_arlen),
    .PMC_NOC_AXI_0_arlock(PMC_NOC_AXI_0_arlock),
    .PMC_NOC_AXI_0_arprot(PMC_NOC_AXI_0_arprot),
    .PMC_NOC_AXI_0_arqos(PMC_NOC_AXI_0_arqos),
    .PMC_NOC_AXI_0_arregion(PMC_NOC_AXI_0_arregion),
    .PMC_NOC_AXI_0_arsize(PMC_NOC_AXI_0_arsize),
    .PMC_NOC_AXI_0_aruser(PMC_NOC_AXI_0_aruser),
    .PMC_NOC_AXI_0_arvalid(PMC_NOC_AXI_0_arvalid),
    .PMC_NOC_AXI_0_awaddr(PMC_NOC_AXI_0_awaddr),
    .PMC_NOC_AXI_0_awburst(PMC_NOC_AXI_0_awburst),
    .PMC_NOC_AXI_0_awcache(PMC_NOC_AXI_0_awcache),
    .PMC_NOC_AXI_0_awid(PMC_NOC_AXI_0_awid),
    .PMC_NOC_AXI_0_awlen(PMC_NOC_AXI_0_awlen),
    .PMC_NOC_AXI_0_awlock(PMC_NOC_AXI_0_awlock),
    .PMC_NOC_AXI_0_awprot(PMC_NOC_AXI_0_awprot),
    .PMC_NOC_AXI_0_awqos(PMC_NOC_AXI_0_awqos),
    .PMC_NOC_AXI_0_awregion(PMC_NOC_AXI_0_awregion),
    .PMC_NOC_AXI_0_awsize(PMC_NOC_AXI_0_awsize),
    .PMC_NOC_AXI_0_awuser(PMC_NOC_AXI_0_awuser),
    .PMC_NOC_AXI_0_awvalid(PMC_NOC_AXI_0_awvalid),
    .PMC_NOC_AXI_0_bready(PMC_NOC_AXI_0_bready),
    .PMC_NOC_AXI_0_rready(PMC_NOC_AXI_0_rready),
    .PMC_NOC_AXI_0_wdata(PMC_NOC_AXI_0_wdata),
    .PMC_NOC_AXI_0_wid(PMC_NOC_AXI_0_wid),
    .PMC_NOC_AXI_0_wlast(PMC_NOC_AXI_0_wlast),
    .PMC_NOC_AXI_0_wstrb(PMC_NOC_AXI_0_wstrb),
    .PMC_NOC_AXI_0_wuser(PMC_NOC_AXI_0_wuser),
    .PMC_NOC_AXI_0_wvalid(PMC_NOC_AXI_0_wvalid),
    .PMC_NOC_AXI_0_arready(PMC_NOC_AXI_0_arready),
    .PMC_NOC_AXI_0_awready(PMC_NOC_AXI_0_awready),
    .PMC_NOC_AXI_0_bid(PMC_NOC_AXI_0_bid),
    .PMC_NOC_AXI_0_bresp(PMC_NOC_AXI_0_bresp),
    .PMC_NOC_AXI_0_buser(PMC_NOC_AXI_0_buser),
    .PMC_NOC_AXI_0_bvalid(PMC_NOC_AXI_0_bvalid),
    .PMC_NOC_AXI_0_rdata(PMC_NOC_AXI_0_rdata),
    .PMC_NOC_AXI_0_rid(PMC_NOC_AXI_0_rid),
    .PMC_NOC_AXI_0_rlast(PMC_NOC_AXI_0_rlast),
    .PMC_NOC_AXI_0_rresp(PMC_NOC_AXI_0_rresp),
    .PMC_NOC_AXI_0_ruser(PMC_NOC_AXI_0_ruser),
    .PMC_NOC_AXI_0_rvalid(PMC_NOC_AXI_0_rvalid),
    .PMC_NOC_AXI_0_wready(PMC_NOC_AXI_0_wready),
    .NOC_PMC_AXI_0_araddr(NOC_PMC_AXI_0_araddr),
    .NOC_PMC_AXI_0_arburst(NOC_PMC_AXI_0_arburst),
    .NOC_PMC_AXI_0_arcache(NOC_PMC_AXI_0_arcache),
    .NOC_PMC_AXI_0_arid(NOC_PMC_AXI_0_arid),
    .NOC_PMC_AXI_0_arlen(NOC_PMC_AXI_0_arlen),
    .NOC_PMC_AXI_0_arlock(NOC_PMC_AXI_0_arlock),
    .NOC_PMC_AXI_0_arprot(NOC_PMC_AXI_0_arprot),
    .NOC_PMC_AXI_0_arqos(NOC_PMC_AXI_0_arqos),
    .NOC_PMC_AXI_0_arregion(NOC_PMC_AXI_0_arregion),
    .NOC_PMC_AXI_0_arsize(NOC_PMC_AXI_0_arsize),
    .NOC_PMC_AXI_0_aruser(NOC_PMC_AXI_0_aruser),
    .NOC_PMC_AXI_0_arvalid(NOC_PMC_AXI_0_arvalid),
    .NOC_PMC_AXI_0_awaddr(NOC_PMC_AXI_0_awaddr),
    .NOC_PMC_AXI_0_awburst(NOC_PMC_AXI_0_awburst),
    .NOC_PMC_AXI_0_awcache(NOC_PMC_AXI_0_awcache),
    .NOC_PMC_AXI_0_awid(NOC_PMC_AXI_0_awid),
    .NOC_PMC_AXI_0_awlen(NOC_PMC_AXI_0_awlen),
    .NOC_PMC_AXI_0_awlock(NOC_PMC_AXI_0_awlock),
    .NOC_PMC_AXI_0_awprot(NOC_PMC_AXI_0_awprot),
    .NOC_PMC_AXI_0_awqos(NOC_PMC_AXI_0_awqos),
    .NOC_PMC_AXI_0_awregion(NOC_PMC_AXI_0_awregion),
    .NOC_PMC_AXI_0_awsize(NOC_PMC_AXI_0_awsize),
    .NOC_PMC_AXI_0_awuser(NOC_PMC_AXI_0_awuser),
    .NOC_PMC_AXI_0_awvalid(NOC_PMC_AXI_0_awvalid),
    .NOC_PMC_AXI_0_bready(NOC_PMC_AXI_0_bready),
    .NOC_PMC_AXI_0_rready(NOC_PMC_AXI_0_rready),
    .NOC_PMC_AXI_0_wdata(NOC_PMC_AXI_0_wdata),
    .NOC_PMC_AXI_0_wid(NOC_PMC_AXI_0_wid),
    .NOC_PMC_AXI_0_wlast(NOC_PMC_AXI_0_wlast),
    .NOC_PMC_AXI_0_wstrb(NOC_PMC_AXI_0_wstrb),
    .NOC_PMC_AXI_0_wuser(NOC_PMC_AXI_0_wuser),
    .NOC_PMC_AXI_0_wvalid(NOC_PMC_AXI_0_wvalid),
    .NOC_PMC_AXI_0_arready(NOC_PMC_AXI_0_arready),
    .NOC_PMC_AXI_0_awready(NOC_PMC_AXI_0_awready),
    .NOC_PMC_AXI_0_bid(NOC_PMC_AXI_0_bid),
    .NOC_PMC_AXI_0_bresp(NOC_PMC_AXI_0_bresp),
    .NOC_PMC_AXI_0_buser(NOC_PMC_AXI_0_buser),
    .NOC_PMC_AXI_0_bvalid(NOC_PMC_AXI_0_bvalid),
    .NOC_PMC_AXI_0_rdata(NOC_PMC_AXI_0_rdata),
    .NOC_PMC_AXI_0_rid(NOC_PMC_AXI_0_rid),
    .NOC_PMC_AXI_0_rlast(NOC_PMC_AXI_0_rlast),
    .NOC_PMC_AXI_0_rresp(NOC_PMC_AXI_0_rresp),
    .NOC_PMC_AXI_0_ruser(NOC_PMC_AXI_0_ruser),
    .NOC_PMC_AXI_0_rvalid(NOC_PMC_AXI_0_rvalid),
    .NOC_PMC_AXI_0_wready(NOC_PMC_AXI_0_wready),
    .CPM_PCIE_NOC_0_araddr(CPM_PCIE_NOC_0_araddr),
    .CPM_PCIE_NOC_0_arburst(CPM_PCIE_NOC_0_arburst),
    .CPM_PCIE_NOC_0_arcache(CPM_PCIE_NOC_0_arcache),
    .CPM_PCIE_NOC_0_arid(CPM_PCIE_NOC_0_arid),
    .CPM_PCIE_NOC_0_arlen(CPM_PCIE_NOC_0_arlen),
    .CPM_PCIE_NOC_0_arlock(CPM_PCIE_NOC_0_arlock),
    .CPM_PCIE_NOC_0_arprot(CPM_PCIE_NOC_0_arprot),
    .CPM_PCIE_NOC_0_arqos(CPM_PCIE_NOC_0_arqos),
    .CPM_PCIE_NOC_0_arsize(CPM_PCIE_NOC_0_arsize),
    .CPM_PCIE_NOC_0_aruser(CPM_PCIE_NOC_0_aruser),
    .CPM_PCIE_NOC_0_arvalid(CPM_PCIE_NOC_0_arvalid),
    .CPM_PCIE_NOC_0_awaddr(CPM_PCIE_NOC_0_awaddr),
    .CPM_PCIE_NOC_0_awburst(CPM_PCIE_NOC_0_awburst),
    .CPM_PCIE_NOC_0_awcache(CPM_PCIE_NOC_0_awcache),
    .CPM_PCIE_NOC_0_awid(CPM_PCIE_NOC_0_awid),
    .CPM_PCIE_NOC_0_awlen(CPM_PCIE_NOC_0_awlen),
    .CPM_PCIE_NOC_0_awlock(CPM_PCIE_NOC_0_awlock),
    .CPM_PCIE_NOC_0_awprot(CPM_PCIE_NOC_0_awprot),
    .CPM_PCIE_NOC_0_awqos(CPM_PCIE_NOC_0_awqos),
    .CPM_PCIE_NOC_0_awsize(CPM_PCIE_NOC_0_awsize),
    .CPM_PCIE_NOC_0_awuser(CPM_PCIE_NOC_0_awuser),
    .CPM_PCIE_NOC_0_awvalid(CPM_PCIE_NOC_0_awvalid),
    .CPM_PCIE_NOC_0_bready(CPM_PCIE_NOC_0_bready),
    .CPM_PCIE_NOC_0_rready(CPM_PCIE_NOC_0_rready),
    .CPM_PCIE_NOC_0_wdata(CPM_PCIE_NOC_0_wdata),
    .CPM_PCIE_NOC_0_wlast(CPM_PCIE_NOC_0_wlast),
    .CPM_PCIE_NOC_0_wstrb(CPM_PCIE_NOC_0_wstrb),
    .CPM_PCIE_NOC_0_wvalid(CPM_PCIE_NOC_0_wvalid),
    .CPM_PCIE_NOC_0_arready(CPM_PCIE_NOC_0_arready),
    .CPM_PCIE_NOC_0_awready(CPM_PCIE_NOC_0_awready),
    .CPM_PCIE_NOC_0_bid(CPM_PCIE_NOC_0_bid),
    .CPM_PCIE_NOC_0_bresp(CPM_PCIE_NOC_0_bresp),
    .CPM_PCIE_NOC_0_bvalid(CPM_PCIE_NOC_0_bvalid),
    .CPM_PCIE_NOC_0_rdata(CPM_PCIE_NOC_0_rdata),
    .CPM_PCIE_NOC_0_rid(CPM_PCIE_NOC_0_rid),
    .CPM_PCIE_NOC_0_rlast(CPM_PCIE_NOC_0_rlast),
    .CPM_PCIE_NOC_0_rresp(CPM_PCIE_NOC_0_rresp),
    .CPM_PCIE_NOC_0_rvalid(CPM_PCIE_NOC_0_rvalid),
    .CPM_PCIE_NOC_0_ruser(CPM_PCIE_NOC_0_ruser),
    .CPM_PCIE_NOC_0_wuser(CPM_PCIE_NOC_0_wuser),
    .CPM_PCIE_NOC_0_wready(CPM_PCIE_NOC_0_wready),
    .CPM_PCIE_NOC_1_araddr(CPM_PCIE_NOC_1_araddr),
    .CPM_PCIE_NOC_1_arburst(CPM_PCIE_NOC_1_arburst),
    .CPM_PCIE_NOC_1_arcache(CPM_PCIE_NOC_1_arcache),
    .CPM_PCIE_NOC_1_arid(CPM_PCIE_NOC_1_arid),
    .CPM_PCIE_NOC_1_arlen(CPM_PCIE_NOC_1_arlen),
    .CPM_PCIE_NOC_1_arlock(CPM_PCIE_NOC_1_arlock),
    .CPM_PCIE_NOC_1_arprot(CPM_PCIE_NOC_1_arprot),
    .CPM_PCIE_NOC_1_arqos(CPM_PCIE_NOC_1_arqos),
    .CPM_PCIE_NOC_1_arsize(CPM_PCIE_NOC_1_arsize),
    .CPM_PCIE_NOC_1_aruser(CPM_PCIE_NOC_1_aruser),
    .CPM_PCIE_NOC_1_arvalid(CPM_PCIE_NOC_1_arvalid),
    .CPM_PCIE_NOC_1_awaddr(CPM_PCIE_NOC_1_awaddr),
    .CPM_PCIE_NOC_1_awburst(CPM_PCIE_NOC_1_awburst),
    .CPM_PCIE_NOC_1_awcache(CPM_PCIE_NOC_1_awcache),
    .CPM_PCIE_NOC_1_awid(CPM_PCIE_NOC_1_awid),
    .CPM_PCIE_NOC_1_awlen(CPM_PCIE_NOC_1_awlen),
    .CPM_PCIE_NOC_1_awlock(CPM_PCIE_NOC_1_awlock),
    .CPM_PCIE_NOC_1_awprot(CPM_PCIE_NOC_1_awprot),
    .CPM_PCIE_NOC_1_awqos(CPM_PCIE_NOC_1_awqos),
    .CPM_PCIE_NOC_1_awsize(CPM_PCIE_NOC_1_awsize),
    .CPM_PCIE_NOC_1_awuser(CPM_PCIE_NOC_1_awuser),
    .CPM_PCIE_NOC_1_awvalid(CPM_PCIE_NOC_1_awvalid),
    .CPM_PCIE_NOC_1_bready(CPM_PCIE_NOC_1_bready),
    .CPM_PCIE_NOC_1_rready(CPM_PCIE_NOC_1_rready),
    .CPM_PCIE_NOC_1_wdata(CPM_PCIE_NOC_1_wdata),
    .CPM_PCIE_NOC_1_wlast(CPM_PCIE_NOC_1_wlast),
    .CPM_PCIE_NOC_1_wstrb(CPM_PCIE_NOC_1_wstrb),
    .CPM_PCIE_NOC_1_wvalid(CPM_PCIE_NOC_1_wvalid),
    .CPM_PCIE_NOC_1_arready(CPM_PCIE_NOC_1_arready),
    .CPM_PCIE_NOC_1_awready(CPM_PCIE_NOC_1_awready),
    .CPM_PCIE_NOC_1_bid(CPM_PCIE_NOC_1_bid),
    .CPM_PCIE_NOC_1_bresp(CPM_PCIE_NOC_1_bresp),
    .CPM_PCIE_NOC_1_bvalid(CPM_PCIE_NOC_1_bvalid),
    .CPM_PCIE_NOC_1_rdata(CPM_PCIE_NOC_1_rdata),
    .CPM_PCIE_NOC_1_rid(CPM_PCIE_NOC_1_rid),
    .CPM_PCIE_NOC_1_rlast(CPM_PCIE_NOC_1_rlast),
    .CPM_PCIE_NOC_1_rresp(CPM_PCIE_NOC_1_rresp),
    .CPM_PCIE_NOC_1_rvalid(CPM_PCIE_NOC_1_rvalid),
    .CPM_PCIE_NOC_1_ruser(CPM_PCIE_NOC_1_ruser),
    .CPM_PCIE_NOC_1_wuser(CPM_PCIE_NOC_1_wuser),
    .CPM_PCIE_NOC_1_wready(CPM_PCIE_NOC_1_wready),
    .dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld),
    .dma0_mgmt_req_rdy(dma0_mgmt_req_rdy),
    .dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy),
    .dma0_mgmt_req_vld(dma0_mgmt_req_vld),
    .dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts),
    .dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat),
    .dma0_mgmt_req_cmd(dma0_mgmt_req_cmd),
    .dma0_mgmt_req_fnc(dma0_mgmt_req_fnc),
    .dma0_mgmt_req_msc(dma0_mgmt_req_msc),
    .dma0_mgmt_req_adr(dma0_mgmt_req_adr),
    .dma0_mgmt_req_dat(dma0_mgmt_req_dat),
    .dma0_st_rx_msg_tlast(dma0_st_rx_msg_tlast),
    .dma0_st_rx_msg_tvalid(dma0_st_rx_msg_tvalid),
    .dma0_st_rx_msg_tready(dma0_st_rx_msg_tready),
    .dma0_st_rx_msg_tdata(dma0_st_rx_msg_tdata),
    .dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp),
    .dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch),
    .dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id),
    .dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready),
    .dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast),
    .dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid),
    .dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc),
    .dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata),
    .dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty),
    .dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc),
    .dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker),
    .dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt),
    .dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len),
    .dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid),
    .dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id),
    .dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker),
    .dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig),
    .dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size),
    .dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid),
    .dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker),
    .dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id),
    .dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx),
    .dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx),
    .dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id),
    .dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready),
    .dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid),
    .dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar),
    .dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data),
    .dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type),
    .dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast),
    .dma0_m_axis_h2c_err(dma0_m_axis_h2c_err),
    .dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid),
    .dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata),
    .dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte),
    .dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready),
    .dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc),
    .dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty),
    .dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid),
    .dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata),
    .dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id),
    .dma0_axis_c2h_status_last(dma0_axis_c2h_status_last),
    .dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop),
    .dma0_axis_c2h_status_error(dma0_axis_c2h_status_error),
    .dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid),
    .dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp),
    .dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid),
    .dma0_qsts_out_vld(dma0_qsts_out_vld),
    .dma0_qsts_out_op(dma0_qsts_out_op),
    .dma0_qsts_out_rdy(dma0_qsts_out_rdy),
    .dma0_qsts_out_qid(dma0_qsts_out_qid),
    .dma0_qsts_out_data(dma0_qsts_out_data),
    .dma0_qsts_out_port_id(dma0_qsts_out_port_id),
    .dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy),
    .dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir),
    .dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid),
    .dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence),
    .dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid),
    .dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt),
    .dma0_usr_irq_ack(dma0_usr_irq_ack),
    .dma0_usr_irq_fail(dma0_usr_irq_fail),
    .dma0_usr_irq_valid(dma0_usr_irq_valid),
    .dma0_usr_irq_vec(dma0_usr_irq_vec),
    .dma0_usr_irq_fnc(dma0_usr_irq_fnc),
    .dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm),
    .dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen),
    .dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp),
    .dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir),
    .dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error),
    .dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid),
    .dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv),
    .dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm),
    .dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy),
    .dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid),
    .dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl),
    .dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx),
    .dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id),
    .dma0_usr_flr_set(dma0_usr_flr_set),
    .dma0_usr_flr_clear(dma0_usr_flr_clear),
    .dma0_usr_flr_fnc(dma0_usr_flr_fnc),
    .dma0_usr_flr_done_vld(dma0_usr_flr_done_vld),
    .dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc),
    .PCIE0_GT_grx_n(PCIE0_GT_grx_n),
    .PCIE0_GT_gtx_n(PCIE0_GT_gtx_n),
    .PCIE0_GT_grx_p(PCIE0_GT_grx_p),
    .PCIE0_GT_gtx_p(PCIE0_GT_gtx_p),
    .gt_refclk0_clk_n(gt_refclk0_clk_n),
    .gt_refclk0_clk_p(gt_refclk0_clk_p)
  );
endmodule
