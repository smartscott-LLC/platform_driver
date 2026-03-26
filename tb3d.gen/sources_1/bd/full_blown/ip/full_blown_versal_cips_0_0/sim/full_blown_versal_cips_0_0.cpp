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


#include "full_blown_versal_cips_0_0_sc.h"

#include "full_blown_versal_cips_0_0.h"

#include "versal_cips_v3_4_8_tlm.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
full_blown_versal_cips_0_0::full_blown_versal_cips_0_0(const sc_core::sc_module_name& nm) : full_blown_versal_cips_0_0_sc(nm), fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk"), fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk"), fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk"), fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk"), lpd_axi_noc_clk("lpd_axi_noc_clk"), pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk"), noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk"), gem0_tsu_timer_cnt("gem0_tsu_timer_cnt"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), dma0_intrfc_clk("dma0_intrfc_clk"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_intrfc_resetn("dma0_intrfc_resetn"), FPD_CCI_NOC_0_awid("FPD_CCI_NOC_0_awid"), FPD_CCI_NOC_0_awaddr("FPD_CCI_NOC_0_awaddr"), FPD_CCI_NOC_0_awlen("FPD_CCI_NOC_0_awlen"), FPD_CCI_NOC_0_awsize("FPD_CCI_NOC_0_awsize"), FPD_CCI_NOC_0_awburst("FPD_CCI_NOC_0_awburst"), FPD_CCI_NOC_0_awlock("FPD_CCI_NOC_0_awlock"), FPD_CCI_NOC_0_awcache("FPD_CCI_NOC_0_awcache"), FPD_CCI_NOC_0_awprot("FPD_CCI_NOC_0_awprot"), FPD_CCI_NOC_0_awvalid("FPD_CCI_NOC_0_awvalid"), FPD_CCI_NOC_0_awuser("FPD_CCI_NOC_0_awuser"), FPD_CCI_NOC_0_awready("FPD_CCI_NOC_0_awready"), FPD_CCI_NOC_0_wdata("FPD_CCI_NOC_0_wdata"), FPD_CCI_NOC_0_wstrb("FPD_CCI_NOC_0_wstrb"), FPD_CCI_NOC_0_wuser("FPD_CCI_NOC_0_wuser"), FPD_CCI_NOC_0_wlast("FPD_CCI_NOC_0_wlast"), FPD_CCI_NOC_0_wvalid("FPD_CCI_NOC_0_wvalid"), FPD_CCI_NOC_0_wready("FPD_CCI_NOC_0_wready"), FPD_CCI_NOC_0_bid("FPD_CCI_NOC_0_bid"), FPD_CCI_NOC_0_bresp("FPD_CCI_NOC_0_bresp"), FPD_CCI_NOC_0_bvalid("FPD_CCI_NOC_0_bvalid"), FPD_CCI_NOC_0_bready("FPD_CCI_NOC_0_bready"), FPD_CCI_NOC_0_arid("FPD_CCI_NOC_0_arid"), FPD_CCI_NOC_0_araddr("FPD_CCI_NOC_0_araddr"), FPD_CCI_NOC_0_arlen("FPD_CCI_NOC_0_arlen"), FPD_CCI_NOC_0_arsize("FPD_CCI_NOC_0_arsize"), FPD_CCI_NOC_0_arburst("FPD_CCI_NOC_0_arburst"), FPD_CCI_NOC_0_arlock("FPD_CCI_NOC_0_arlock"), FPD_CCI_NOC_0_arcache("FPD_CCI_NOC_0_arcache"), FPD_CCI_NOC_0_arprot("FPD_CCI_NOC_0_arprot"), FPD_CCI_NOC_0_arvalid("FPD_CCI_NOC_0_arvalid"), FPD_CCI_NOC_0_aruser("FPD_CCI_NOC_0_aruser"), FPD_CCI_NOC_0_arready("FPD_CCI_NOC_0_arready"), FPD_CCI_NOC_0_rid("FPD_CCI_NOC_0_rid"), FPD_CCI_NOC_0_rdata("FPD_CCI_NOC_0_rdata"), FPD_CCI_NOC_0_rresp("FPD_CCI_NOC_0_rresp"), FPD_CCI_NOC_0_rlast("FPD_CCI_NOC_0_rlast"), FPD_CCI_NOC_0_rvalid("FPD_CCI_NOC_0_rvalid"), FPD_CCI_NOC_0_rready("FPD_CCI_NOC_0_rready"), FPD_CCI_NOC_0_awqos("FPD_CCI_NOC_0_awqos"), FPD_CCI_NOC_0_arqos("FPD_CCI_NOC_0_arqos"), FPD_CCI_NOC_1_awid("FPD_CCI_NOC_1_awid"), FPD_CCI_NOC_1_awaddr("FPD_CCI_NOC_1_awaddr"), FPD_CCI_NOC_1_awlen("FPD_CCI_NOC_1_awlen"), FPD_CCI_NOC_1_awsize("FPD_CCI_NOC_1_awsize"), FPD_CCI_NOC_1_awburst("FPD_CCI_NOC_1_awburst"), FPD_CCI_NOC_1_awlock("FPD_CCI_NOC_1_awlock"), FPD_CCI_NOC_1_awcache("FPD_CCI_NOC_1_awcache"), FPD_CCI_NOC_1_awprot("FPD_CCI_NOC_1_awprot"), FPD_CCI_NOC_1_awvalid("FPD_CCI_NOC_1_awvalid"), FPD_CCI_NOC_1_awuser("FPD_CCI_NOC_1_awuser"), FPD_CCI_NOC_1_awready("FPD_CCI_NOC_1_awready"), FPD_CCI_NOC_1_wdata("FPD_CCI_NOC_1_wdata"), FPD_CCI_NOC_1_wstrb("FPD_CCI_NOC_1_wstrb"), FPD_CCI_NOC_1_wuser("FPD_CCI_NOC_1_wuser"), FPD_CCI_NOC_1_wlast("FPD_CCI_NOC_1_wlast"), FPD_CCI_NOC_1_wvalid("FPD_CCI_NOC_1_wvalid"), FPD_CCI_NOC_1_wready("FPD_CCI_NOC_1_wready"), FPD_CCI_NOC_1_bid("FPD_CCI_NOC_1_bid"), FPD_CCI_NOC_1_bresp("FPD_CCI_NOC_1_bresp"), FPD_CCI_NOC_1_bvalid("FPD_CCI_NOC_1_bvalid"), FPD_CCI_NOC_1_bready("FPD_CCI_NOC_1_bready"), FPD_CCI_NOC_1_arid("FPD_CCI_NOC_1_arid"), FPD_CCI_NOC_1_araddr("FPD_CCI_NOC_1_araddr"), FPD_CCI_NOC_1_arlen("FPD_CCI_NOC_1_arlen"), FPD_CCI_NOC_1_arsize("FPD_CCI_NOC_1_arsize"), FPD_CCI_NOC_1_arburst("FPD_CCI_NOC_1_arburst"), FPD_CCI_NOC_1_arlock("FPD_CCI_NOC_1_arlock"), FPD_CCI_NOC_1_arcache("FPD_CCI_NOC_1_arcache"), FPD_CCI_NOC_1_arprot("FPD_CCI_NOC_1_arprot"), FPD_CCI_NOC_1_arvalid("FPD_CCI_NOC_1_arvalid"), FPD_CCI_NOC_1_aruser("FPD_CCI_NOC_1_aruser"), FPD_CCI_NOC_1_arready("FPD_CCI_NOC_1_arready"), FPD_CCI_NOC_1_rid("FPD_CCI_NOC_1_rid"), FPD_CCI_NOC_1_rdata("FPD_CCI_NOC_1_rdata"), FPD_CCI_NOC_1_rresp("FPD_CCI_NOC_1_rresp"), FPD_CCI_NOC_1_rlast("FPD_CCI_NOC_1_rlast"), FPD_CCI_NOC_1_rvalid("FPD_CCI_NOC_1_rvalid"), FPD_CCI_NOC_1_rready("FPD_CCI_NOC_1_rready"), FPD_CCI_NOC_1_awqos("FPD_CCI_NOC_1_awqos"), FPD_CCI_NOC_1_arqos("FPD_CCI_NOC_1_arqos"), FPD_CCI_NOC_2_awid("FPD_CCI_NOC_2_awid"), FPD_CCI_NOC_2_awaddr("FPD_CCI_NOC_2_awaddr"), FPD_CCI_NOC_2_awlen("FPD_CCI_NOC_2_awlen"), FPD_CCI_NOC_2_awsize("FPD_CCI_NOC_2_awsize"), FPD_CCI_NOC_2_awburst("FPD_CCI_NOC_2_awburst"), FPD_CCI_NOC_2_awlock("FPD_CCI_NOC_2_awlock"), FPD_CCI_NOC_2_awcache("FPD_CCI_NOC_2_awcache"), FPD_CCI_NOC_2_awprot("FPD_CCI_NOC_2_awprot"), FPD_CCI_NOC_2_awvalid("FPD_CCI_NOC_2_awvalid"), FPD_CCI_NOC_2_awuser("FPD_CCI_NOC_2_awuser"), FPD_CCI_NOC_2_awready("FPD_CCI_NOC_2_awready"), FPD_CCI_NOC_2_wdata("FPD_CCI_NOC_2_wdata"), FPD_CCI_NOC_2_wstrb("FPD_CCI_NOC_2_wstrb"), FPD_CCI_NOC_2_wuser("FPD_CCI_NOC_2_wuser"), FPD_CCI_NOC_2_wlast("FPD_CCI_NOC_2_wlast"), FPD_CCI_NOC_2_wvalid("FPD_CCI_NOC_2_wvalid"), FPD_CCI_NOC_2_wready("FPD_CCI_NOC_2_wready"), FPD_CCI_NOC_2_bid("FPD_CCI_NOC_2_bid"), FPD_CCI_NOC_2_bresp("FPD_CCI_NOC_2_bresp"), FPD_CCI_NOC_2_bvalid("FPD_CCI_NOC_2_bvalid"), FPD_CCI_NOC_2_bready("FPD_CCI_NOC_2_bready"), FPD_CCI_NOC_2_arid("FPD_CCI_NOC_2_arid"), FPD_CCI_NOC_2_araddr("FPD_CCI_NOC_2_araddr"), FPD_CCI_NOC_2_arlen("FPD_CCI_NOC_2_arlen"), FPD_CCI_NOC_2_arsize("FPD_CCI_NOC_2_arsize"), FPD_CCI_NOC_2_arburst("FPD_CCI_NOC_2_arburst"), FPD_CCI_NOC_2_arlock("FPD_CCI_NOC_2_arlock"), FPD_CCI_NOC_2_arcache("FPD_CCI_NOC_2_arcache"), FPD_CCI_NOC_2_arprot("FPD_CCI_NOC_2_arprot"), FPD_CCI_NOC_2_arvalid("FPD_CCI_NOC_2_arvalid"), FPD_CCI_NOC_2_aruser("FPD_CCI_NOC_2_aruser"), FPD_CCI_NOC_2_arready("FPD_CCI_NOC_2_arready"), FPD_CCI_NOC_2_rid("FPD_CCI_NOC_2_rid"), FPD_CCI_NOC_2_rdata("FPD_CCI_NOC_2_rdata"), FPD_CCI_NOC_2_rresp("FPD_CCI_NOC_2_rresp"), FPD_CCI_NOC_2_rlast("FPD_CCI_NOC_2_rlast"), FPD_CCI_NOC_2_rvalid("FPD_CCI_NOC_2_rvalid"), FPD_CCI_NOC_2_rready("FPD_CCI_NOC_2_rready"), FPD_CCI_NOC_2_awqos("FPD_CCI_NOC_2_awqos"), FPD_CCI_NOC_2_arqos("FPD_CCI_NOC_2_arqos"), FPD_CCI_NOC_3_awid("FPD_CCI_NOC_3_awid"), FPD_CCI_NOC_3_awaddr("FPD_CCI_NOC_3_awaddr"), FPD_CCI_NOC_3_awlen("FPD_CCI_NOC_3_awlen"), FPD_CCI_NOC_3_awsize("FPD_CCI_NOC_3_awsize"), FPD_CCI_NOC_3_awburst("FPD_CCI_NOC_3_awburst"), FPD_CCI_NOC_3_awlock("FPD_CCI_NOC_3_awlock"), FPD_CCI_NOC_3_awcache("FPD_CCI_NOC_3_awcache"), FPD_CCI_NOC_3_awprot("FPD_CCI_NOC_3_awprot"), FPD_CCI_NOC_3_awvalid("FPD_CCI_NOC_3_awvalid"), FPD_CCI_NOC_3_awuser("FPD_CCI_NOC_3_awuser"), FPD_CCI_NOC_3_awready("FPD_CCI_NOC_3_awready"), FPD_CCI_NOC_3_wdata("FPD_CCI_NOC_3_wdata"), FPD_CCI_NOC_3_wstrb("FPD_CCI_NOC_3_wstrb"), FPD_CCI_NOC_3_wuser("FPD_CCI_NOC_3_wuser"), FPD_CCI_NOC_3_wlast("FPD_CCI_NOC_3_wlast"), FPD_CCI_NOC_3_wvalid("FPD_CCI_NOC_3_wvalid"), FPD_CCI_NOC_3_wready("FPD_CCI_NOC_3_wready"), FPD_CCI_NOC_3_bid("FPD_CCI_NOC_3_bid"), FPD_CCI_NOC_3_bresp("FPD_CCI_NOC_3_bresp"), FPD_CCI_NOC_3_bvalid("FPD_CCI_NOC_3_bvalid"), FPD_CCI_NOC_3_bready("FPD_CCI_NOC_3_bready"), FPD_CCI_NOC_3_arid("FPD_CCI_NOC_3_arid"), FPD_CCI_NOC_3_araddr("FPD_CCI_NOC_3_araddr"), FPD_CCI_NOC_3_arlen("FPD_CCI_NOC_3_arlen"), FPD_CCI_NOC_3_arsize("FPD_CCI_NOC_3_arsize"), FPD_CCI_NOC_3_arburst("FPD_CCI_NOC_3_arburst"), FPD_CCI_NOC_3_arlock("FPD_CCI_NOC_3_arlock"), FPD_CCI_NOC_3_arcache("FPD_CCI_NOC_3_arcache"), FPD_CCI_NOC_3_arprot("FPD_CCI_NOC_3_arprot"), FPD_CCI_NOC_3_arvalid("FPD_CCI_NOC_3_arvalid"), FPD_CCI_NOC_3_aruser("FPD_CCI_NOC_3_aruser"), FPD_CCI_NOC_3_arready("FPD_CCI_NOC_3_arready"), FPD_CCI_NOC_3_rid("FPD_CCI_NOC_3_rid"), FPD_CCI_NOC_3_rdata("FPD_CCI_NOC_3_rdata"), FPD_CCI_NOC_3_rresp("FPD_CCI_NOC_3_rresp"), FPD_CCI_NOC_3_rlast("FPD_CCI_NOC_3_rlast"), FPD_CCI_NOC_3_rvalid("FPD_CCI_NOC_3_rvalid"), FPD_CCI_NOC_3_rready("FPD_CCI_NOC_3_rready"), FPD_CCI_NOC_3_awqos("FPD_CCI_NOC_3_awqos"), FPD_CCI_NOC_3_arqos("FPD_CCI_NOC_3_arqos"), LPD_AXI_NOC_0_awid("LPD_AXI_NOC_0_awid"), LPD_AXI_NOC_0_awaddr("LPD_AXI_NOC_0_awaddr"), LPD_AXI_NOC_0_awlen("LPD_AXI_NOC_0_awlen"), LPD_AXI_NOC_0_awsize("LPD_AXI_NOC_0_awsize"), LPD_AXI_NOC_0_awburst("LPD_AXI_NOC_0_awburst"), LPD_AXI_NOC_0_awlock("LPD_AXI_NOC_0_awlock"), LPD_AXI_NOC_0_awcache("LPD_AXI_NOC_0_awcache"), LPD_AXI_NOC_0_awprot("LPD_AXI_NOC_0_awprot"), LPD_AXI_NOC_0_awvalid("LPD_AXI_NOC_0_awvalid"), LPD_AXI_NOC_0_awuser("LPD_AXI_NOC_0_awuser"), LPD_AXI_NOC_0_awready("LPD_AXI_NOC_0_awready"), LPD_AXI_NOC_0_wdata("LPD_AXI_NOC_0_wdata"), LPD_AXI_NOC_0_wstrb("LPD_AXI_NOC_0_wstrb"), LPD_AXI_NOC_0_wlast("LPD_AXI_NOC_0_wlast"), LPD_AXI_NOC_0_wvalid("LPD_AXI_NOC_0_wvalid"), LPD_AXI_NOC_0_wready("LPD_AXI_NOC_0_wready"), LPD_AXI_NOC_0_bid("LPD_AXI_NOC_0_bid"), LPD_AXI_NOC_0_bresp("LPD_AXI_NOC_0_bresp"), LPD_AXI_NOC_0_bvalid("LPD_AXI_NOC_0_bvalid"), LPD_AXI_NOC_0_bready("LPD_AXI_NOC_0_bready"), LPD_AXI_NOC_0_arid("LPD_AXI_NOC_0_arid"), LPD_AXI_NOC_0_araddr("LPD_AXI_NOC_0_araddr"), LPD_AXI_NOC_0_arlen("LPD_AXI_NOC_0_arlen"), LPD_AXI_NOC_0_arsize("LPD_AXI_NOC_0_arsize"), LPD_AXI_NOC_0_arburst("LPD_AXI_NOC_0_arburst"), LPD_AXI_NOC_0_arlock("LPD_AXI_NOC_0_arlock"), LPD_AXI_NOC_0_arcache("LPD_AXI_NOC_0_arcache"), LPD_AXI_NOC_0_arprot("LPD_AXI_NOC_0_arprot"), LPD_AXI_NOC_0_arvalid("LPD_AXI_NOC_0_arvalid"), LPD_AXI_NOC_0_aruser("LPD_AXI_NOC_0_aruser"), LPD_AXI_NOC_0_arready("LPD_AXI_NOC_0_arready"), LPD_AXI_NOC_0_rid("LPD_AXI_NOC_0_rid"), LPD_AXI_NOC_0_rdata("LPD_AXI_NOC_0_rdata"), LPD_AXI_NOC_0_rresp("LPD_AXI_NOC_0_rresp"), LPD_AXI_NOC_0_rlast("LPD_AXI_NOC_0_rlast"), LPD_AXI_NOC_0_rvalid("LPD_AXI_NOC_0_rvalid"), LPD_AXI_NOC_0_rready("LPD_AXI_NOC_0_rready"), LPD_AXI_NOC_0_awqos("LPD_AXI_NOC_0_awqos"), LPD_AXI_NOC_0_arqos("LPD_AXI_NOC_0_arqos"), PMC_NOC_AXI_0_araddr("PMC_NOC_AXI_0_araddr"), PMC_NOC_AXI_0_arburst("PMC_NOC_AXI_0_arburst"), PMC_NOC_AXI_0_arcache("PMC_NOC_AXI_0_arcache"), PMC_NOC_AXI_0_arid("PMC_NOC_AXI_0_arid"), PMC_NOC_AXI_0_arlen("PMC_NOC_AXI_0_arlen"), PMC_NOC_AXI_0_arlock("PMC_NOC_AXI_0_arlock"), PMC_NOC_AXI_0_arprot("PMC_NOC_AXI_0_arprot"), PMC_NOC_AXI_0_arqos("PMC_NOC_AXI_0_arqos"), PMC_NOC_AXI_0_arregion("PMC_NOC_AXI_0_arregion"), PMC_NOC_AXI_0_arsize("PMC_NOC_AXI_0_arsize"), PMC_NOC_AXI_0_aruser("PMC_NOC_AXI_0_aruser"), PMC_NOC_AXI_0_arvalid("PMC_NOC_AXI_0_arvalid"), PMC_NOC_AXI_0_awaddr("PMC_NOC_AXI_0_awaddr"), PMC_NOC_AXI_0_awburst("PMC_NOC_AXI_0_awburst"), PMC_NOC_AXI_0_awcache("PMC_NOC_AXI_0_awcache"), PMC_NOC_AXI_0_awid("PMC_NOC_AXI_0_awid"), PMC_NOC_AXI_0_awlen("PMC_NOC_AXI_0_awlen"), PMC_NOC_AXI_0_awlock("PMC_NOC_AXI_0_awlock"), PMC_NOC_AXI_0_awprot("PMC_NOC_AXI_0_awprot"), PMC_NOC_AXI_0_awqos("PMC_NOC_AXI_0_awqos"), PMC_NOC_AXI_0_awregion("PMC_NOC_AXI_0_awregion"), PMC_NOC_AXI_0_awsize("PMC_NOC_AXI_0_awsize"), PMC_NOC_AXI_0_awuser("PMC_NOC_AXI_0_awuser"), PMC_NOC_AXI_0_awvalid("PMC_NOC_AXI_0_awvalid"), PMC_NOC_AXI_0_bready("PMC_NOC_AXI_0_bready"), PMC_NOC_AXI_0_rready("PMC_NOC_AXI_0_rready"), PMC_NOC_AXI_0_wdata("PMC_NOC_AXI_0_wdata"), PMC_NOC_AXI_0_wid("PMC_NOC_AXI_0_wid"), PMC_NOC_AXI_0_wlast("PMC_NOC_AXI_0_wlast"), PMC_NOC_AXI_0_wstrb("PMC_NOC_AXI_0_wstrb"), PMC_NOC_AXI_0_wuser("PMC_NOC_AXI_0_wuser"), PMC_NOC_AXI_0_wvalid("PMC_NOC_AXI_0_wvalid"), PMC_NOC_AXI_0_arready("PMC_NOC_AXI_0_arready"), PMC_NOC_AXI_0_awready("PMC_NOC_AXI_0_awready"), PMC_NOC_AXI_0_bid("PMC_NOC_AXI_0_bid"), PMC_NOC_AXI_0_bresp("PMC_NOC_AXI_0_bresp"), PMC_NOC_AXI_0_buser("PMC_NOC_AXI_0_buser"), PMC_NOC_AXI_0_bvalid("PMC_NOC_AXI_0_bvalid"), PMC_NOC_AXI_0_rdata("PMC_NOC_AXI_0_rdata"), PMC_NOC_AXI_0_rid("PMC_NOC_AXI_0_rid"), PMC_NOC_AXI_0_rlast("PMC_NOC_AXI_0_rlast"), PMC_NOC_AXI_0_rresp("PMC_NOC_AXI_0_rresp"), PMC_NOC_AXI_0_ruser("PMC_NOC_AXI_0_ruser"), PMC_NOC_AXI_0_rvalid("PMC_NOC_AXI_0_rvalid"), PMC_NOC_AXI_0_wready("PMC_NOC_AXI_0_wready"), NOC_PMC_AXI_0_araddr("NOC_PMC_AXI_0_araddr"), NOC_PMC_AXI_0_arburst("NOC_PMC_AXI_0_arburst"), NOC_PMC_AXI_0_arcache("NOC_PMC_AXI_0_arcache"), NOC_PMC_AXI_0_arid("NOC_PMC_AXI_0_arid"), NOC_PMC_AXI_0_arlen("NOC_PMC_AXI_0_arlen"), NOC_PMC_AXI_0_arlock("NOC_PMC_AXI_0_arlock"), NOC_PMC_AXI_0_arprot("NOC_PMC_AXI_0_arprot"), NOC_PMC_AXI_0_arqos("NOC_PMC_AXI_0_arqos"), NOC_PMC_AXI_0_arregion("NOC_PMC_AXI_0_arregion"), NOC_PMC_AXI_0_arsize("NOC_PMC_AXI_0_arsize"), NOC_PMC_AXI_0_aruser("NOC_PMC_AXI_0_aruser"), NOC_PMC_AXI_0_arvalid("NOC_PMC_AXI_0_arvalid"), NOC_PMC_AXI_0_awaddr("NOC_PMC_AXI_0_awaddr"), NOC_PMC_AXI_0_awburst("NOC_PMC_AXI_0_awburst"), NOC_PMC_AXI_0_awcache("NOC_PMC_AXI_0_awcache"), NOC_PMC_AXI_0_awid("NOC_PMC_AXI_0_awid"), NOC_PMC_AXI_0_awlen("NOC_PMC_AXI_0_awlen"), NOC_PMC_AXI_0_awlock("NOC_PMC_AXI_0_awlock"), NOC_PMC_AXI_0_awprot("NOC_PMC_AXI_0_awprot"), NOC_PMC_AXI_0_awqos("NOC_PMC_AXI_0_awqos"), NOC_PMC_AXI_0_awregion("NOC_PMC_AXI_0_awregion"), NOC_PMC_AXI_0_awsize("NOC_PMC_AXI_0_awsize"), NOC_PMC_AXI_0_awuser("NOC_PMC_AXI_0_awuser"), NOC_PMC_AXI_0_awvalid("NOC_PMC_AXI_0_awvalid"), NOC_PMC_AXI_0_bready("NOC_PMC_AXI_0_bready"), NOC_PMC_AXI_0_rready("NOC_PMC_AXI_0_rready"), NOC_PMC_AXI_0_wdata("NOC_PMC_AXI_0_wdata"), NOC_PMC_AXI_0_wid("NOC_PMC_AXI_0_wid"), NOC_PMC_AXI_0_wlast("NOC_PMC_AXI_0_wlast"), NOC_PMC_AXI_0_wstrb("NOC_PMC_AXI_0_wstrb"), NOC_PMC_AXI_0_wuser("NOC_PMC_AXI_0_wuser"), NOC_PMC_AXI_0_wvalid("NOC_PMC_AXI_0_wvalid"), NOC_PMC_AXI_0_arready("NOC_PMC_AXI_0_arready"), NOC_PMC_AXI_0_awready("NOC_PMC_AXI_0_awready"), NOC_PMC_AXI_0_bid("NOC_PMC_AXI_0_bid"), NOC_PMC_AXI_0_bresp("NOC_PMC_AXI_0_bresp"), NOC_PMC_AXI_0_buser("NOC_PMC_AXI_0_buser"), NOC_PMC_AXI_0_bvalid("NOC_PMC_AXI_0_bvalid"), NOC_PMC_AXI_0_rdata("NOC_PMC_AXI_0_rdata"), NOC_PMC_AXI_0_rid("NOC_PMC_AXI_0_rid"), NOC_PMC_AXI_0_rlast("NOC_PMC_AXI_0_rlast"), NOC_PMC_AXI_0_rresp("NOC_PMC_AXI_0_rresp"), NOC_PMC_AXI_0_ruser("NOC_PMC_AXI_0_ruser"), NOC_PMC_AXI_0_rvalid("NOC_PMC_AXI_0_rvalid"), NOC_PMC_AXI_0_wready("NOC_PMC_AXI_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_ruser("CPM_PCIE_NOC_0_ruser"), CPM_PCIE_NOC_0_wuser("CPM_PCIE_NOC_0_wuser"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_ruser("CPM_PCIE_NOC_1_ruser"), CPM_PCIE_NOC_1_wuser("CPM_PCIE_NOC_1_wuser"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp"), dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch"), dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id"), dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready"), dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast"), dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid"), dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc"), dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata"), dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty"), dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc"), dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker"), dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt"), dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len"), dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid"), dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id"), dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker"), dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig"), dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size"), dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid"), dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker"), dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id"), dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx"), dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx"), dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id"), dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready"), dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid"), dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar"), dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data"), dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type"), dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast"), dma0_m_axis_h2c_err("dma0_m_axis_h2c_err"), dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid"), dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata"), dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte"), dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready"), dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc"), dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty"), dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid"), dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata"), dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id"), dma0_axis_c2h_status_last("dma0_axis_c2h_status_last"), dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop"), dma0_axis_c2h_status_error("dma0_axis_c2h_status_error"), dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid"), dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp"), dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid"), dma0_qsts_out_vld("dma0_qsts_out_vld"), dma0_qsts_out_op("dma0_qsts_out_op"), dma0_qsts_out_rdy("dma0_qsts_out_rdy"), dma0_qsts_out_qid("dma0_qsts_out_qid"), dma0_qsts_out_data("dma0_qsts_out_data"), dma0_qsts_out_port_id("dma0_qsts_out_port_id"), dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy"), dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir"), dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid"), dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence"), dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid"), dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt"), dma0_usr_irq_ack("dma0_usr_irq_ack"), dma0_usr_irq_fail("dma0_usr_irq_fail"), dma0_usr_irq_valid("dma0_usr_irq_valid"), dma0_usr_irq_vec("dma0_usr_irq_vec"), dma0_usr_irq_fnc("dma0_usr_irq_fnc"), dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm"), dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen"), dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp"), dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir"), dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error"), dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid"), dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv"), dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm"), dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy"), dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid"), dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl"), dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx"), dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id"), dma0_usr_flr_set("dma0_usr_flr_set"), dma0_usr_flr_clear("dma0_usr_flr_clear"), dma0_usr_flr_fnc("dma0_usr_flr_fnc"), dma0_usr_flr_done_vld("dma0_usr_flr_done_vld"), dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk);
  mp_impl->fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk);
  mp_impl->fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk);
  mp_impl->fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk);
  mp_impl->lpd_axi_noc_clk(lpd_axi_noc_clk);
  mp_impl->pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk);
  mp_impl->noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk);
  mp_impl->gem0_tsu_timer_cnt(gem0_tsu_timer_cnt);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->dma0_intrfc_clk(dma0_intrfc_clk);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_intrfc_resetn(dma0_intrfc_resetn);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp);
  mp_impl->dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch);
  mp_impl->dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id);
  mp_impl->dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready);
  mp_impl->dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast);
  mp_impl->dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid);
  mp_impl->dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc);
  mp_impl->dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata);
  mp_impl->dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty);
  mp_impl->dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc);
  mp_impl->dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker);
  mp_impl->dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt);
  mp_impl->dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len);
  mp_impl->dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid);
  mp_impl->dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig);
  mp_impl->dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size);
  mp_impl->dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid);
  mp_impl->dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id);
  mp_impl->dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready);
  mp_impl->dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid);
  mp_impl->dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar);
  mp_impl->dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data);
  mp_impl->dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type);
  mp_impl->dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast);
  mp_impl->dma0_m_axis_h2c_err(dma0_m_axis_h2c_err);
  mp_impl->dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid);
  mp_impl->dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata);
  mp_impl->dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte);
  mp_impl->dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready);
  mp_impl->dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc);
  mp_impl->dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty);
  mp_impl->dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid);
  mp_impl->dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata);
  mp_impl->dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id);
  mp_impl->dma0_axis_c2h_status_last(dma0_axis_c2h_status_last);
  mp_impl->dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop);
  mp_impl->dma0_axis_c2h_status_error(dma0_axis_c2h_status_error);
  mp_impl->dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid);
  mp_impl->dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp);
  mp_impl->dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid);
  mp_impl->dma0_qsts_out_vld(dma0_qsts_out_vld);
  mp_impl->dma0_qsts_out_op(dma0_qsts_out_op);
  mp_impl->dma0_qsts_out_rdy(dma0_qsts_out_rdy);
  mp_impl->dma0_qsts_out_qid(dma0_qsts_out_qid);
  mp_impl->dma0_qsts_out_data(dma0_qsts_out_data);
  mp_impl->dma0_qsts_out_port_id(dma0_qsts_out_port_id);
  mp_impl->dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy);
  mp_impl->dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir);
  mp_impl->dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid);
  mp_impl->dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence);
  mp_impl->dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid);
  mp_impl->dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt);
  mp_impl->dma0_usr_irq_ack(dma0_usr_irq_ack);
  mp_impl->dma0_usr_irq_fail(dma0_usr_irq_fail);
  mp_impl->dma0_usr_irq_valid(dma0_usr_irq_valid);
  mp_impl->dma0_usr_irq_vec(dma0_usr_irq_vec);
  mp_impl->dma0_usr_irq_fnc(dma0_usr_irq_fnc);
  mp_impl->dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm);
  mp_impl->dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen);
  mp_impl->dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp);
  mp_impl->dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir);
  mp_impl->dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error);
  mp_impl->dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid);
  mp_impl->dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv);
  mp_impl->dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm);
  mp_impl->dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy);
  mp_impl->dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid);
  mp_impl->dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl);
  mp_impl->dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx);
  mp_impl->dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id);
  mp_impl->dma0_usr_flr_set(dma0_usr_flr_set);
  mp_impl->dma0_usr_flr_clear(dma0_usr_flr_clear);
  mp_impl->dma0_usr_flr_fnc(dma0_usr_flr_fnc);
  mp_impl->dma0_usr_flr_done_vld(dma0_usr_flr_done_vld);
  mp_impl->dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_FPD_CCI_NOC_0_transactor = NULL;
  mp_FPD_CCI_NOC_1_transactor = NULL;
  mp_FPD_CCI_NOC_2_transactor = NULL;
  mp_FPD_CCI_NOC_3_transactor = NULL;
  mp_LPD_AXI_NOC_0_transactor = NULL;
  mp_PMC_NOC_AXI_0_transactor = NULL;
  mp_NOC_PMC_AXI_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void full_blown_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'FPD_CCI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_0' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_0_transactor_param_props;
    FPD_CCI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk");
    FPD_CCI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_FPD_CCI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_0_transactor", FPD_CCI_NOC_0_transactor_param_props);

    // FPD_CCI_NOC_0' transactor ports

    mp_FPD_CCI_NOC_0_transactor->AWID(FPD_CCI_NOC_0_awid);
    mp_FPD_CCI_NOC_0_transactor->AWADDR(FPD_CCI_NOC_0_awaddr);
    mp_FPD_CCI_NOC_0_transactor->AWLEN(FPD_CCI_NOC_0_awlen);
    mp_FPD_CCI_NOC_0_transactor->AWSIZE(FPD_CCI_NOC_0_awsize);
    mp_FPD_CCI_NOC_0_transactor->AWBURST(FPD_CCI_NOC_0_awburst);
    mp_FPD_CCI_NOC_0_transactor->AWLOCK(FPD_CCI_NOC_0_awlock);
    mp_FPD_CCI_NOC_0_transactor->AWCACHE(FPD_CCI_NOC_0_awcache);
    mp_FPD_CCI_NOC_0_transactor->AWPROT(FPD_CCI_NOC_0_awprot);
    mp_FPD_CCI_NOC_0_transactor->AWVALID(FPD_CCI_NOC_0_awvalid);
    mp_FPD_CCI_NOC_0_transactor->AWUSER(FPD_CCI_NOC_0_awuser);
    mp_FPD_CCI_NOC_0_transactor->AWREADY(FPD_CCI_NOC_0_awready);
    mp_FPD_CCI_NOC_0_transactor->WDATA(FPD_CCI_NOC_0_wdata);
    mp_FPD_CCI_NOC_0_transactor->WSTRB(FPD_CCI_NOC_0_wstrb);
    mp_FPD_CCI_NOC_0_transactor->WUSER(FPD_CCI_NOC_0_wuser);
    mp_FPD_CCI_NOC_0_transactor->WLAST(FPD_CCI_NOC_0_wlast);
    mp_FPD_CCI_NOC_0_transactor->WVALID(FPD_CCI_NOC_0_wvalid);
    mp_FPD_CCI_NOC_0_transactor->WREADY(FPD_CCI_NOC_0_wready);
    mp_FPD_CCI_NOC_0_transactor->BID(FPD_CCI_NOC_0_bid);
    mp_FPD_CCI_NOC_0_transactor->BRESP(FPD_CCI_NOC_0_bresp);
    mp_FPD_CCI_NOC_0_transactor->BVALID(FPD_CCI_NOC_0_bvalid);
    mp_FPD_CCI_NOC_0_transactor->BREADY(FPD_CCI_NOC_0_bready);
    mp_FPD_CCI_NOC_0_transactor->ARID(FPD_CCI_NOC_0_arid);
    mp_FPD_CCI_NOC_0_transactor->ARADDR(FPD_CCI_NOC_0_araddr);
    mp_FPD_CCI_NOC_0_transactor->ARLEN(FPD_CCI_NOC_0_arlen);
    mp_FPD_CCI_NOC_0_transactor->ARSIZE(FPD_CCI_NOC_0_arsize);
    mp_FPD_CCI_NOC_0_transactor->ARBURST(FPD_CCI_NOC_0_arburst);
    mp_FPD_CCI_NOC_0_transactor->ARLOCK(FPD_CCI_NOC_0_arlock);
    mp_FPD_CCI_NOC_0_transactor->ARCACHE(FPD_CCI_NOC_0_arcache);
    mp_FPD_CCI_NOC_0_transactor->ARPROT(FPD_CCI_NOC_0_arprot);
    mp_FPD_CCI_NOC_0_transactor->ARVALID(FPD_CCI_NOC_0_arvalid);
    mp_FPD_CCI_NOC_0_transactor->ARUSER(FPD_CCI_NOC_0_aruser);
    mp_FPD_CCI_NOC_0_transactor->ARREADY(FPD_CCI_NOC_0_arready);
    mp_FPD_CCI_NOC_0_transactor->RID(FPD_CCI_NOC_0_rid);
    mp_FPD_CCI_NOC_0_transactor->RDATA(FPD_CCI_NOC_0_rdata);
    mp_FPD_CCI_NOC_0_transactor->RRESP(FPD_CCI_NOC_0_rresp);
    mp_FPD_CCI_NOC_0_transactor->RLAST(FPD_CCI_NOC_0_rlast);
    mp_FPD_CCI_NOC_0_transactor->RVALID(FPD_CCI_NOC_0_rvalid);
    mp_FPD_CCI_NOC_0_transactor->RREADY(FPD_CCI_NOC_0_rready);
    mp_FPD_CCI_NOC_0_transactor->AWQOS(FPD_CCI_NOC_0_awqos);
    mp_FPD_CCI_NOC_0_transactor->ARQOS(FPD_CCI_NOC_0_arqos);
    mp_FPD_CCI_NOC_0_transactor->CLK(fpd_cci_noc_axi0_clk);
    m_FPD_CCI_NOC_0_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_0_transactor->RST(m_FPD_CCI_NOC_0_transactor_rst_signal);

    // FPD_CCI_NOC_0' transactor sockets

    mp_impl->FPD_CCI_NOC_0_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_1' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_1_transactor_param_props;
    FPD_CCI_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_1_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk");
    FPD_CCI_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_FPD_CCI_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_1_transactor", FPD_CCI_NOC_1_transactor_param_props);

    // FPD_CCI_NOC_1' transactor ports

    mp_FPD_CCI_NOC_1_transactor->AWID(FPD_CCI_NOC_1_awid);
    mp_FPD_CCI_NOC_1_transactor->AWADDR(FPD_CCI_NOC_1_awaddr);
    mp_FPD_CCI_NOC_1_transactor->AWLEN(FPD_CCI_NOC_1_awlen);
    mp_FPD_CCI_NOC_1_transactor->AWSIZE(FPD_CCI_NOC_1_awsize);
    mp_FPD_CCI_NOC_1_transactor->AWBURST(FPD_CCI_NOC_1_awburst);
    mp_FPD_CCI_NOC_1_transactor->AWLOCK(FPD_CCI_NOC_1_awlock);
    mp_FPD_CCI_NOC_1_transactor->AWCACHE(FPD_CCI_NOC_1_awcache);
    mp_FPD_CCI_NOC_1_transactor->AWPROT(FPD_CCI_NOC_1_awprot);
    mp_FPD_CCI_NOC_1_transactor->AWVALID(FPD_CCI_NOC_1_awvalid);
    mp_FPD_CCI_NOC_1_transactor->AWUSER(FPD_CCI_NOC_1_awuser);
    mp_FPD_CCI_NOC_1_transactor->AWREADY(FPD_CCI_NOC_1_awready);
    mp_FPD_CCI_NOC_1_transactor->WDATA(FPD_CCI_NOC_1_wdata);
    mp_FPD_CCI_NOC_1_transactor->WSTRB(FPD_CCI_NOC_1_wstrb);
    mp_FPD_CCI_NOC_1_transactor->WUSER(FPD_CCI_NOC_1_wuser);
    mp_FPD_CCI_NOC_1_transactor->WLAST(FPD_CCI_NOC_1_wlast);
    mp_FPD_CCI_NOC_1_transactor->WVALID(FPD_CCI_NOC_1_wvalid);
    mp_FPD_CCI_NOC_1_transactor->WREADY(FPD_CCI_NOC_1_wready);
    mp_FPD_CCI_NOC_1_transactor->BID(FPD_CCI_NOC_1_bid);
    mp_FPD_CCI_NOC_1_transactor->BRESP(FPD_CCI_NOC_1_bresp);
    mp_FPD_CCI_NOC_1_transactor->BVALID(FPD_CCI_NOC_1_bvalid);
    mp_FPD_CCI_NOC_1_transactor->BREADY(FPD_CCI_NOC_1_bready);
    mp_FPD_CCI_NOC_1_transactor->ARID(FPD_CCI_NOC_1_arid);
    mp_FPD_CCI_NOC_1_transactor->ARADDR(FPD_CCI_NOC_1_araddr);
    mp_FPD_CCI_NOC_1_transactor->ARLEN(FPD_CCI_NOC_1_arlen);
    mp_FPD_CCI_NOC_1_transactor->ARSIZE(FPD_CCI_NOC_1_arsize);
    mp_FPD_CCI_NOC_1_transactor->ARBURST(FPD_CCI_NOC_1_arburst);
    mp_FPD_CCI_NOC_1_transactor->ARLOCK(FPD_CCI_NOC_1_arlock);
    mp_FPD_CCI_NOC_1_transactor->ARCACHE(FPD_CCI_NOC_1_arcache);
    mp_FPD_CCI_NOC_1_transactor->ARPROT(FPD_CCI_NOC_1_arprot);
    mp_FPD_CCI_NOC_1_transactor->ARVALID(FPD_CCI_NOC_1_arvalid);
    mp_FPD_CCI_NOC_1_transactor->ARUSER(FPD_CCI_NOC_1_aruser);
    mp_FPD_CCI_NOC_1_transactor->ARREADY(FPD_CCI_NOC_1_arready);
    mp_FPD_CCI_NOC_1_transactor->RID(FPD_CCI_NOC_1_rid);
    mp_FPD_CCI_NOC_1_transactor->RDATA(FPD_CCI_NOC_1_rdata);
    mp_FPD_CCI_NOC_1_transactor->RRESP(FPD_CCI_NOC_1_rresp);
    mp_FPD_CCI_NOC_1_transactor->RLAST(FPD_CCI_NOC_1_rlast);
    mp_FPD_CCI_NOC_1_transactor->RVALID(FPD_CCI_NOC_1_rvalid);
    mp_FPD_CCI_NOC_1_transactor->RREADY(FPD_CCI_NOC_1_rready);
    mp_FPD_CCI_NOC_1_transactor->AWQOS(FPD_CCI_NOC_1_awqos);
    mp_FPD_CCI_NOC_1_transactor->ARQOS(FPD_CCI_NOC_1_arqos);
    mp_FPD_CCI_NOC_1_transactor->CLK(fpd_cci_noc_axi1_clk);
    m_FPD_CCI_NOC_1_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_1_transactor->RST(m_FPD_CCI_NOC_1_transactor_rst_signal);

    // FPD_CCI_NOC_1' transactor sockets

    mp_impl->FPD_CCI_NOC_1_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_2' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_2_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_2' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_2_transactor_param_props;
    FPD_CCI_NOC_2_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_2_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_2_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_2_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_2_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_2_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk");
    FPD_CCI_NOC_2_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_2_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_2_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_2_transactor_param_props.addString("INDEX", "2");

    mp_FPD_CCI_NOC_2_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_2_transactor", FPD_CCI_NOC_2_transactor_param_props);

    // FPD_CCI_NOC_2' transactor ports

    mp_FPD_CCI_NOC_2_transactor->AWID(FPD_CCI_NOC_2_awid);
    mp_FPD_CCI_NOC_2_transactor->AWADDR(FPD_CCI_NOC_2_awaddr);
    mp_FPD_CCI_NOC_2_transactor->AWLEN(FPD_CCI_NOC_2_awlen);
    mp_FPD_CCI_NOC_2_transactor->AWSIZE(FPD_CCI_NOC_2_awsize);
    mp_FPD_CCI_NOC_2_transactor->AWBURST(FPD_CCI_NOC_2_awburst);
    mp_FPD_CCI_NOC_2_transactor->AWLOCK(FPD_CCI_NOC_2_awlock);
    mp_FPD_CCI_NOC_2_transactor->AWCACHE(FPD_CCI_NOC_2_awcache);
    mp_FPD_CCI_NOC_2_transactor->AWPROT(FPD_CCI_NOC_2_awprot);
    mp_FPD_CCI_NOC_2_transactor->AWVALID(FPD_CCI_NOC_2_awvalid);
    mp_FPD_CCI_NOC_2_transactor->AWUSER(FPD_CCI_NOC_2_awuser);
    mp_FPD_CCI_NOC_2_transactor->AWREADY(FPD_CCI_NOC_2_awready);
    mp_FPD_CCI_NOC_2_transactor->WDATA(FPD_CCI_NOC_2_wdata);
    mp_FPD_CCI_NOC_2_transactor->WSTRB(FPD_CCI_NOC_2_wstrb);
    mp_FPD_CCI_NOC_2_transactor->WUSER(FPD_CCI_NOC_2_wuser);
    mp_FPD_CCI_NOC_2_transactor->WLAST(FPD_CCI_NOC_2_wlast);
    mp_FPD_CCI_NOC_2_transactor->WVALID(FPD_CCI_NOC_2_wvalid);
    mp_FPD_CCI_NOC_2_transactor->WREADY(FPD_CCI_NOC_2_wready);
    mp_FPD_CCI_NOC_2_transactor->BID(FPD_CCI_NOC_2_bid);
    mp_FPD_CCI_NOC_2_transactor->BRESP(FPD_CCI_NOC_2_bresp);
    mp_FPD_CCI_NOC_2_transactor->BVALID(FPD_CCI_NOC_2_bvalid);
    mp_FPD_CCI_NOC_2_transactor->BREADY(FPD_CCI_NOC_2_bready);
    mp_FPD_CCI_NOC_2_transactor->ARID(FPD_CCI_NOC_2_arid);
    mp_FPD_CCI_NOC_2_transactor->ARADDR(FPD_CCI_NOC_2_araddr);
    mp_FPD_CCI_NOC_2_transactor->ARLEN(FPD_CCI_NOC_2_arlen);
    mp_FPD_CCI_NOC_2_transactor->ARSIZE(FPD_CCI_NOC_2_arsize);
    mp_FPD_CCI_NOC_2_transactor->ARBURST(FPD_CCI_NOC_2_arburst);
    mp_FPD_CCI_NOC_2_transactor->ARLOCK(FPD_CCI_NOC_2_arlock);
    mp_FPD_CCI_NOC_2_transactor->ARCACHE(FPD_CCI_NOC_2_arcache);
    mp_FPD_CCI_NOC_2_transactor->ARPROT(FPD_CCI_NOC_2_arprot);
    mp_FPD_CCI_NOC_2_transactor->ARVALID(FPD_CCI_NOC_2_arvalid);
    mp_FPD_CCI_NOC_2_transactor->ARUSER(FPD_CCI_NOC_2_aruser);
    mp_FPD_CCI_NOC_2_transactor->ARREADY(FPD_CCI_NOC_2_arready);
    mp_FPD_CCI_NOC_2_transactor->RID(FPD_CCI_NOC_2_rid);
    mp_FPD_CCI_NOC_2_transactor->RDATA(FPD_CCI_NOC_2_rdata);
    mp_FPD_CCI_NOC_2_transactor->RRESP(FPD_CCI_NOC_2_rresp);
    mp_FPD_CCI_NOC_2_transactor->RLAST(FPD_CCI_NOC_2_rlast);
    mp_FPD_CCI_NOC_2_transactor->RVALID(FPD_CCI_NOC_2_rvalid);
    mp_FPD_CCI_NOC_2_transactor->RREADY(FPD_CCI_NOC_2_rready);
    mp_FPD_CCI_NOC_2_transactor->AWQOS(FPD_CCI_NOC_2_awqos);
    mp_FPD_CCI_NOC_2_transactor->ARQOS(FPD_CCI_NOC_2_arqos);
    mp_FPD_CCI_NOC_2_transactor->CLK(fpd_cci_noc_axi2_clk);
    m_FPD_CCI_NOC_2_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_2_transactor->RST(m_FPD_CCI_NOC_2_transactor_rst_signal);

    // FPD_CCI_NOC_2' transactor sockets

    mp_impl->FPD_CCI_NOC_2_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_3' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_3_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_3' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_3_transactor_param_props;
    FPD_CCI_NOC_3_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_3_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_3_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_3_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_3_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_3_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk");
    FPD_CCI_NOC_3_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_3_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_3_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_3_transactor_param_props.addString("INDEX", "3");

    mp_FPD_CCI_NOC_3_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_3_transactor", FPD_CCI_NOC_3_transactor_param_props);

    // FPD_CCI_NOC_3' transactor ports

    mp_FPD_CCI_NOC_3_transactor->AWID(FPD_CCI_NOC_3_awid);
    mp_FPD_CCI_NOC_3_transactor->AWADDR(FPD_CCI_NOC_3_awaddr);
    mp_FPD_CCI_NOC_3_transactor->AWLEN(FPD_CCI_NOC_3_awlen);
    mp_FPD_CCI_NOC_3_transactor->AWSIZE(FPD_CCI_NOC_3_awsize);
    mp_FPD_CCI_NOC_3_transactor->AWBURST(FPD_CCI_NOC_3_awburst);
    mp_FPD_CCI_NOC_3_transactor->AWLOCK(FPD_CCI_NOC_3_awlock);
    mp_FPD_CCI_NOC_3_transactor->AWCACHE(FPD_CCI_NOC_3_awcache);
    mp_FPD_CCI_NOC_3_transactor->AWPROT(FPD_CCI_NOC_3_awprot);
    mp_FPD_CCI_NOC_3_transactor->AWVALID(FPD_CCI_NOC_3_awvalid);
    mp_FPD_CCI_NOC_3_transactor->AWUSER(FPD_CCI_NOC_3_awuser);
    mp_FPD_CCI_NOC_3_transactor->AWREADY(FPD_CCI_NOC_3_awready);
    mp_FPD_CCI_NOC_3_transactor->WDATA(FPD_CCI_NOC_3_wdata);
    mp_FPD_CCI_NOC_3_transactor->WSTRB(FPD_CCI_NOC_3_wstrb);
    mp_FPD_CCI_NOC_3_transactor->WUSER(FPD_CCI_NOC_3_wuser);
    mp_FPD_CCI_NOC_3_transactor->WLAST(FPD_CCI_NOC_3_wlast);
    mp_FPD_CCI_NOC_3_transactor->WVALID(FPD_CCI_NOC_3_wvalid);
    mp_FPD_CCI_NOC_3_transactor->WREADY(FPD_CCI_NOC_3_wready);
    mp_FPD_CCI_NOC_3_transactor->BID(FPD_CCI_NOC_3_bid);
    mp_FPD_CCI_NOC_3_transactor->BRESP(FPD_CCI_NOC_3_bresp);
    mp_FPD_CCI_NOC_3_transactor->BVALID(FPD_CCI_NOC_3_bvalid);
    mp_FPD_CCI_NOC_3_transactor->BREADY(FPD_CCI_NOC_3_bready);
    mp_FPD_CCI_NOC_3_transactor->ARID(FPD_CCI_NOC_3_arid);
    mp_FPD_CCI_NOC_3_transactor->ARADDR(FPD_CCI_NOC_3_araddr);
    mp_FPD_CCI_NOC_3_transactor->ARLEN(FPD_CCI_NOC_3_arlen);
    mp_FPD_CCI_NOC_3_transactor->ARSIZE(FPD_CCI_NOC_3_arsize);
    mp_FPD_CCI_NOC_3_transactor->ARBURST(FPD_CCI_NOC_3_arburst);
    mp_FPD_CCI_NOC_3_transactor->ARLOCK(FPD_CCI_NOC_3_arlock);
    mp_FPD_CCI_NOC_3_transactor->ARCACHE(FPD_CCI_NOC_3_arcache);
    mp_FPD_CCI_NOC_3_transactor->ARPROT(FPD_CCI_NOC_3_arprot);
    mp_FPD_CCI_NOC_3_transactor->ARVALID(FPD_CCI_NOC_3_arvalid);
    mp_FPD_CCI_NOC_3_transactor->ARUSER(FPD_CCI_NOC_3_aruser);
    mp_FPD_CCI_NOC_3_transactor->ARREADY(FPD_CCI_NOC_3_arready);
    mp_FPD_CCI_NOC_3_transactor->RID(FPD_CCI_NOC_3_rid);
    mp_FPD_CCI_NOC_3_transactor->RDATA(FPD_CCI_NOC_3_rdata);
    mp_FPD_CCI_NOC_3_transactor->RRESP(FPD_CCI_NOC_3_rresp);
    mp_FPD_CCI_NOC_3_transactor->RLAST(FPD_CCI_NOC_3_rlast);
    mp_FPD_CCI_NOC_3_transactor->RVALID(FPD_CCI_NOC_3_rvalid);
    mp_FPD_CCI_NOC_3_transactor->RREADY(FPD_CCI_NOC_3_rready);
    mp_FPD_CCI_NOC_3_transactor->AWQOS(FPD_CCI_NOC_3_awqos);
    mp_FPD_CCI_NOC_3_transactor->ARQOS(FPD_CCI_NOC_3_arqos);
    mp_FPD_CCI_NOC_3_transactor->CLK(fpd_cci_noc_axi3_clk);
    m_FPD_CCI_NOC_3_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_3_transactor->RST(m_FPD_CCI_NOC_3_transactor_rst_signal);

    // FPD_CCI_NOC_3' transactor sockets

    mp_impl->FPD_CCI_NOC_3_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'LPD_AXI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "LPD_AXI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'LPD_AXI_NOC_0' transactor parameters
    xsc::common_cpp::properties LPD_AXI_NOC_0_transactor_param_props;
    LPD_AXI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    LPD_AXI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "599999451");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    LPD_AXI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    LPD_AXI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    LPD_AXI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    LPD_AXI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_lpd_axi_noc_clk");
    LPD_AXI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    LPD_AXI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_rpu");
    LPD_AXI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_RPU_TO_NOC_NMU");
    LPD_AXI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_LPD_AXI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("LPD_AXI_NOC_0_transactor", LPD_AXI_NOC_0_transactor_param_props);

    // LPD_AXI_NOC_0' transactor ports

    mp_LPD_AXI_NOC_0_transactor->AWID(LPD_AXI_NOC_0_awid);
    mp_LPD_AXI_NOC_0_transactor->AWADDR(LPD_AXI_NOC_0_awaddr);
    mp_LPD_AXI_NOC_0_transactor->AWLEN(LPD_AXI_NOC_0_awlen);
    mp_LPD_AXI_NOC_0_transactor->AWSIZE(LPD_AXI_NOC_0_awsize);
    mp_LPD_AXI_NOC_0_transactor->AWBURST(LPD_AXI_NOC_0_awburst);
    mp_LPD_AXI_NOC_0_transactor->AWLOCK(LPD_AXI_NOC_0_awlock);
    mp_LPD_AXI_NOC_0_transactor->AWCACHE(LPD_AXI_NOC_0_awcache);
    mp_LPD_AXI_NOC_0_transactor->AWPROT(LPD_AXI_NOC_0_awprot);
    mp_LPD_AXI_NOC_0_transactor->AWVALID(LPD_AXI_NOC_0_awvalid);
    mp_LPD_AXI_NOC_0_transactor->AWUSER(LPD_AXI_NOC_0_awuser);
    mp_LPD_AXI_NOC_0_transactor->AWREADY(LPD_AXI_NOC_0_awready);
    mp_LPD_AXI_NOC_0_transactor->WDATA(LPD_AXI_NOC_0_wdata);
    mp_LPD_AXI_NOC_0_transactor->WSTRB(LPD_AXI_NOC_0_wstrb);
    mp_LPD_AXI_NOC_0_transactor->WLAST(LPD_AXI_NOC_0_wlast);
    mp_LPD_AXI_NOC_0_transactor->WVALID(LPD_AXI_NOC_0_wvalid);
    mp_LPD_AXI_NOC_0_transactor->WREADY(LPD_AXI_NOC_0_wready);
    mp_LPD_AXI_NOC_0_transactor->BID(LPD_AXI_NOC_0_bid);
    mp_LPD_AXI_NOC_0_transactor->BRESP(LPD_AXI_NOC_0_bresp);
    mp_LPD_AXI_NOC_0_transactor->BVALID(LPD_AXI_NOC_0_bvalid);
    mp_LPD_AXI_NOC_0_transactor->BREADY(LPD_AXI_NOC_0_bready);
    mp_LPD_AXI_NOC_0_transactor->ARID(LPD_AXI_NOC_0_arid);
    mp_LPD_AXI_NOC_0_transactor->ARADDR(LPD_AXI_NOC_0_araddr);
    mp_LPD_AXI_NOC_0_transactor->ARLEN(LPD_AXI_NOC_0_arlen);
    mp_LPD_AXI_NOC_0_transactor->ARSIZE(LPD_AXI_NOC_0_arsize);
    mp_LPD_AXI_NOC_0_transactor->ARBURST(LPD_AXI_NOC_0_arburst);
    mp_LPD_AXI_NOC_0_transactor->ARLOCK(LPD_AXI_NOC_0_arlock);
    mp_LPD_AXI_NOC_0_transactor->ARCACHE(LPD_AXI_NOC_0_arcache);
    mp_LPD_AXI_NOC_0_transactor->ARPROT(LPD_AXI_NOC_0_arprot);
    mp_LPD_AXI_NOC_0_transactor->ARVALID(LPD_AXI_NOC_0_arvalid);
    mp_LPD_AXI_NOC_0_transactor->ARUSER(LPD_AXI_NOC_0_aruser);
    mp_LPD_AXI_NOC_0_transactor->ARREADY(LPD_AXI_NOC_0_arready);
    mp_LPD_AXI_NOC_0_transactor->RID(LPD_AXI_NOC_0_rid);
    mp_LPD_AXI_NOC_0_transactor->RDATA(LPD_AXI_NOC_0_rdata);
    mp_LPD_AXI_NOC_0_transactor->RRESP(LPD_AXI_NOC_0_rresp);
    mp_LPD_AXI_NOC_0_transactor->RLAST(LPD_AXI_NOC_0_rlast);
    mp_LPD_AXI_NOC_0_transactor->RVALID(LPD_AXI_NOC_0_rvalid);
    mp_LPD_AXI_NOC_0_transactor->RREADY(LPD_AXI_NOC_0_rready);
    mp_LPD_AXI_NOC_0_transactor->AWQOS(LPD_AXI_NOC_0_awqos);
    mp_LPD_AXI_NOC_0_transactor->ARQOS(LPD_AXI_NOC_0_arqos);
    mp_LPD_AXI_NOC_0_transactor->CLK(lpd_axi_noc_clk);
    m_LPD_AXI_NOC_0_transactor_rst_signal.write(1);
    mp_LPD_AXI_NOC_0_transactor->RST(m_LPD_AXI_NOC_0_transactor_rst_signal);

    // LPD_AXI_NOC_0' transactor sockets

    mp_impl->LPD_AXI_NOC_0_tlm_aximm_read_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_write_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'PMC_NOC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "PMC_NOC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'PMC_NOC_AXI_0' transactor parameters
    xsc::common_cpp::properties PMC_NOC_AXI_0_transactor_param_props;
    PMC_NOC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    PMC_NOC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    PMC_NOC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    PMC_NOC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    PMC_NOC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    PMC_NOC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk");
    PMC_NOC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    PMC_NOC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    PMC_NOC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PMC_TO_NOC_NMU");
    PMC_NOC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    PMC_NOC_AXI_0_transactor_param_props.addString("INDEX", "0");
    PMC_NOC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_PMC_NOC_AXI_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,16,18,17>("PMC_NOC_AXI_0_transactor", PMC_NOC_AXI_0_transactor_param_props);

    // PMC_NOC_AXI_0' transactor ports

    mp_PMC_NOC_AXI_0_transactor->ARADDR(PMC_NOC_AXI_0_araddr);
    mp_PMC_NOC_AXI_0_transactor->ARBURST(PMC_NOC_AXI_0_arburst);
    mp_PMC_NOC_AXI_0_transactor->ARCACHE(PMC_NOC_AXI_0_arcache);
    mp_PMC_NOC_AXI_0_transactor->ARID(PMC_NOC_AXI_0_arid);
    mp_PMC_NOC_AXI_0_transactor->ARLEN(PMC_NOC_AXI_0_arlen);
    mp_PMC_NOC_AXI_0_transactor->ARLOCK(PMC_NOC_AXI_0_arlock);
    mp_PMC_NOC_AXI_0_transactor->ARPROT(PMC_NOC_AXI_0_arprot);
    mp_PMC_NOC_AXI_0_transactor->ARQOS(PMC_NOC_AXI_0_arqos);
    mp_PMC_NOC_AXI_0_transactor->ARREGION(PMC_NOC_AXI_0_arregion);
    mp_PMC_NOC_AXI_0_transactor->ARSIZE(PMC_NOC_AXI_0_arsize);
    mp_PMC_NOC_AXI_0_transactor->ARUSER(PMC_NOC_AXI_0_aruser);
    mp_PMC_NOC_AXI_0_transactor->ARVALID(PMC_NOC_AXI_0_arvalid);
    mp_PMC_NOC_AXI_0_transactor->AWADDR(PMC_NOC_AXI_0_awaddr);
    mp_PMC_NOC_AXI_0_transactor->AWBURST(PMC_NOC_AXI_0_awburst);
    mp_PMC_NOC_AXI_0_transactor->AWCACHE(PMC_NOC_AXI_0_awcache);
    mp_PMC_NOC_AXI_0_transactor->AWID(PMC_NOC_AXI_0_awid);
    mp_PMC_NOC_AXI_0_transactor->AWLEN(PMC_NOC_AXI_0_awlen);
    mp_PMC_NOC_AXI_0_transactor->AWLOCK(PMC_NOC_AXI_0_awlock);
    mp_PMC_NOC_AXI_0_transactor->AWPROT(PMC_NOC_AXI_0_awprot);
    mp_PMC_NOC_AXI_0_transactor->AWQOS(PMC_NOC_AXI_0_awqos);
    mp_PMC_NOC_AXI_0_transactor->AWREGION(PMC_NOC_AXI_0_awregion);
    mp_PMC_NOC_AXI_0_transactor->AWSIZE(PMC_NOC_AXI_0_awsize);
    mp_PMC_NOC_AXI_0_transactor->AWUSER(PMC_NOC_AXI_0_awuser);
    mp_PMC_NOC_AXI_0_transactor->AWVALID(PMC_NOC_AXI_0_awvalid);
    mp_PMC_NOC_AXI_0_transactor->BREADY(PMC_NOC_AXI_0_bready);
    mp_PMC_NOC_AXI_0_transactor->RREADY(PMC_NOC_AXI_0_rready);
    mp_PMC_NOC_AXI_0_transactor->WDATA(PMC_NOC_AXI_0_wdata);
    mp_PMC_NOC_AXI_0_transactor->WLAST(PMC_NOC_AXI_0_wlast);
    mp_PMC_NOC_AXI_0_transactor->WSTRB(PMC_NOC_AXI_0_wstrb);
    mp_PMC_NOC_AXI_0_transactor->WUSER(PMC_NOC_AXI_0_wuser);
    mp_PMC_NOC_AXI_0_transactor->WVALID(PMC_NOC_AXI_0_wvalid);
    mp_PMC_NOC_AXI_0_transactor->ARREADY(PMC_NOC_AXI_0_arready);
    mp_PMC_NOC_AXI_0_transactor->AWREADY(PMC_NOC_AXI_0_awready);
    mp_PMC_NOC_AXI_0_transactor->BID(PMC_NOC_AXI_0_bid);
    mp_PMC_NOC_AXI_0_transactor->BRESP(PMC_NOC_AXI_0_bresp);
    mp_PMC_NOC_AXI_0_transactor->BUSER(PMC_NOC_AXI_0_buser);
    mp_PMC_NOC_AXI_0_transactor->BVALID(PMC_NOC_AXI_0_bvalid);
    mp_PMC_NOC_AXI_0_transactor->RDATA(PMC_NOC_AXI_0_rdata);
    mp_PMC_NOC_AXI_0_transactor->RID(PMC_NOC_AXI_0_rid);
    mp_PMC_NOC_AXI_0_transactor->RLAST(PMC_NOC_AXI_0_rlast);
    mp_PMC_NOC_AXI_0_transactor->RRESP(PMC_NOC_AXI_0_rresp);
    mp_PMC_NOC_AXI_0_transactor->RUSER(PMC_NOC_AXI_0_ruser);
    mp_PMC_NOC_AXI_0_transactor->RVALID(PMC_NOC_AXI_0_rvalid);
    mp_PMC_NOC_AXI_0_transactor->WREADY(PMC_NOC_AXI_0_wready);
    mp_PMC_NOC_AXI_0_transactor->CLK(pmc_axi_noc_axi0_clk);
    m_PMC_NOC_AXI_0_transactor_rst_signal.write(1);
    mp_PMC_NOC_AXI_0_transactor->RST(m_PMC_NOC_AXI_0_transactor_rst_signal);

    // PMC_NOC_AXI_0' transactor sockets

    mp_impl->PMC_NOC_AXI_0_tlm_aximm_read_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_write_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'NOC_PMC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "NOC_PMC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_PMC_AXI_0' transactor parameters
    xsc::common_cpp::properties NOC_PMC_AXI_0_transactor_param_props;
    NOC_PMC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_PMC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_PMC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_PMC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_PMC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_PMC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_PMC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk");
    NOC_PMC_AXI_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_PMC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_PMC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    NOC_PMC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PMC");
    NOC_PMC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    NOC_PMC_AXI_0_transactor_param_props.addString("INDEX", "0");
    NOC_PMC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_NOC_PMC_AXI_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,17,16,18,17>("NOC_PMC_AXI_0_transactor", NOC_PMC_AXI_0_transactor_param_props);

    // NOC_PMC_AXI_0' transactor ports

    mp_NOC_PMC_AXI_0_transactor->ARADDR(NOC_PMC_AXI_0_araddr);
    mp_NOC_PMC_AXI_0_transactor->ARBURST(NOC_PMC_AXI_0_arburst);
    mp_NOC_PMC_AXI_0_transactor->ARCACHE(NOC_PMC_AXI_0_arcache);
    mp_NOC_PMC_AXI_0_transactor->ARID(NOC_PMC_AXI_0_arid);
    mp_NOC_PMC_AXI_0_transactor->ARLEN(NOC_PMC_AXI_0_arlen);
    mp_NOC_PMC_AXI_0_transactor->ARLOCK(NOC_PMC_AXI_0_arlock);
    mp_NOC_PMC_AXI_0_transactor->ARPROT(NOC_PMC_AXI_0_arprot);
    mp_NOC_PMC_AXI_0_transactor->ARQOS(NOC_PMC_AXI_0_arqos);
    mp_NOC_PMC_AXI_0_transactor->ARREGION(NOC_PMC_AXI_0_arregion);
    mp_NOC_PMC_AXI_0_transactor->ARSIZE(NOC_PMC_AXI_0_arsize);
    mp_NOC_PMC_AXI_0_transactor->ARUSER(NOC_PMC_AXI_0_aruser);
    mp_NOC_PMC_AXI_0_transactor->ARVALID(NOC_PMC_AXI_0_arvalid);
    mp_NOC_PMC_AXI_0_transactor->AWADDR(NOC_PMC_AXI_0_awaddr);
    mp_NOC_PMC_AXI_0_transactor->AWBURST(NOC_PMC_AXI_0_awburst);
    mp_NOC_PMC_AXI_0_transactor->AWCACHE(NOC_PMC_AXI_0_awcache);
    mp_NOC_PMC_AXI_0_transactor->AWID(NOC_PMC_AXI_0_awid);
    mp_NOC_PMC_AXI_0_transactor->AWLEN(NOC_PMC_AXI_0_awlen);
    mp_NOC_PMC_AXI_0_transactor->AWLOCK(NOC_PMC_AXI_0_awlock);
    mp_NOC_PMC_AXI_0_transactor->AWPROT(NOC_PMC_AXI_0_awprot);
    mp_NOC_PMC_AXI_0_transactor->AWQOS(NOC_PMC_AXI_0_awqos);
    mp_NOC_PMC_AXI_0_transactor->AWREGION(NOC_PMC_AXI_0_awregion);
    mp_NOC_PMC_AXI_0_transactor->AWSIZE(NOC_PMC_AXI_0_awsize);
    mp_NOC_PMC_AXI_0_transactor->AWUSER(NOC_PMC_AXI_0_awuser);
    mp_NOC_PMC_AXI_0_transactor->AWVALID(NOC_PMC_AXI_0_awvalid);
    mp_NOC_PMC_AXI_0_transactor->BREADY(NOC_PMC_AXI_0_bready);
    mp_NOC_PMC_AXI_0_transactor->RREADY(NOC_PMC_AXI_0_rready);
    mp_NOC_PMC_AXI_0_transactor->WDATA(NOC_PMC_AXI_0_wdata);
    mp_NOC_PMC_AXI_0_transactor->WLAST(NOC_PMC_AXI_0_wlast);
    mp_NOC_PMC_AXI_0_transactor->WSTRB(NOC_PMC_AXI_0_wstrb);
    mp_NOC_PMC_AXI_0_transactor->WUSER(NOC_PMC_AXI_0_wuser);
    mp_NOC_PMC_AXI_0_transactor->WVALID(NOC_PMC_AXI_0_wvalid);
    mp_NOC_PMC_AXI_0_transactor->ARREADY(NOC_PMC_AXI_0_arready);
    mp_NOC_PMC_AXI_0_transactor->AWREADY(NOC_PMC_AXI_0_awready);
    mp_NOC_PMC_AXI_0_transactor->BID(NOC_PMC_AXI_0_bid);
    mp_NOC_PMC_AXI_0_transactor->BRESP(NOC_PMC_AXI_0_bresp);
    mp_NOC_PMC_AXI_0_transactor->BUSER(NOC_PMC_AXI_0_buser);
    mp_NOC_PMC_AXI_0_transactor->BVALID(NOC_PMC_AXI_0_bvalid);
    mp_NOC_PMC_AXI_0_transactor->RDATA(NOC_PMC_AXI_0_rdata);
    mp_NOC_PMC_AXI_0_transactor->RID(NOC_PMC_AXI_0_rid);
    mp_NOC_PMC_AXI_0_transactor->RLAST(NOC_PMC_AXI_0_rlast);
    mp_NOC_PMC_AXI_0_transactor->RRESP(NOC_PMC_AXI_0_rresp);
    mp_NOC_PMC_AXI_0_transactor->RUSER(NOC_PMC_AXI_0_ruser);
    mp_NOC_PMC_AXI_0_transactor->RVALID(NOC_PMC_AXI_0_rvalid);
    mp_NOC_PMC_AXI_0_transactor->WREADY(NOC_PMC_AXI_0_wready);
    mp_NOC_PMC_AXI_0_transactor->CLK(noc_pmc_axi_axi0_clk);
    m_NOC_PMC_AXI_0_transactor_rst_signal.write(1);
    mp_NOC_PMC_AXI_0_transactor->RST(m_NOC_PMC_AXI_0_transactor_rst_signal);

    // NOC_PMC_AXI_0' transactor sockets

    mp_impl->NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->RUSER(CPM_PCIE_NOC_0_ruser);
    mp_CPM_PCIE_NOC_0_transactor->WUSER(CPM_PCIE_NOC_0_wuser);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->RUSER(CPM_PCIE_NOC_1_ruser);
    mp_CPM_PCIE_NOC_1_transactor->WUSER(CPM_PCIE_NOC_1_wuser);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "300000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "full_blown_noc_clk_gen_0_axi_clk_0");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(dma0_intrfc_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
full_blown_versal_cips_0_0::full_blown_versal_cips_0_0(const sc_core::sc_module_name& nm) : full_blown_versal_cips_0_0_sc(nm), fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk"), fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk"), fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk"), fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk"), lpd_axi_noc_clk("lpd_axi_noc_clk"), pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk"), noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk"), gem0_tsu_timer_cnt("gem0_tsu_timer_cnt"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), dma0_intrfc_clk("dma0_intrfc_clk"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_intrfc_resetn("dma0_intrfc_resetn"), FPD_CCI_NOC_0_awid("FPD_CCI_NOC_0_awid"), FPD_CCI_NOC_0_awaddr("FPD_CCI_NOC_0_awaddr"), FPD_CCI_NOC_0_awlen("FPD_CCI_NOC_0_awlen"), FPD_CCI_NOC_0_awsize("FPD_CCI_NOC_0_awsize"), FPD_CCI_NOC_0_awburst("FPD_CCI_NOC_0_awburst"), FPD_CCI_NOC_0_awlock("FPD_CCI_NOC_0_awlock"), FPD_CCI_NOC_0_awcache("FPD_CCI_NOC_0_awcache"), FPD_CCI_NOC_0_awprot("FPD_CCI_NOC_0_awprot"), FPD_CCI_NOC_0_awvalid("FPD_CCI_NOC_0_awvalid"), FPD_CCI_NOC_0_awuser("FPD_CCI_NOC_0_awuser"), FPD_CCI_NOC_0_awready("FPD_CCI_NOC_0_awready"), FPD_CCI_NOC_0_wdata("FPD_CCI_NOC_0_wdata"), FPD_CCI_NOC_0_wstrb("FPD_CCI_NOC_0_wstrb"), FPD_CCI_NOC_0_wuser("FPD_CCI_NOC_0_wuser"), FPD_CCI_NOC_0_wlast("FPD_CCI_NOC_0_wlast"), FPD_CCI_NOC_0_wvalid("FPD_CCI_NOC_0_wvalid"), FPD_CCI_NOC_0_wready("FPD_CCI_NOC_0_wready"), FPD_CCI_NOC_0_bid("FPD_CCI_NOC_0_bid"), FPD_CCI_NOC_0_bresp("FPD_CCI_NOC_0_bresp"), FPD_CCI_NOC_0_bvalid("FPD_CCI_NOC_0_bvalid"), FPD_CCI_NOC_0_bready("FPD_CCI_NOC_0_bready"), FPD_CCI_NOC_0_arid("FPD_CCI_NOC_0_arid"), FPD_CCI_NOC_0_araddr("FPD_CCI_NOC_0_araddr"), FPD_CCI_NOC_0_arlen("FPD_CCI_NOC_0_arlen"), FPD_CCI_NOC_0_arsize("FPD_CCI_NOC_0_arsize"), FPD_CCI_NOC_0_arburst("FPD_CCI_NOC_0_arburst"), FPD_CCI_NOC_0_arlock("FPD_CCI_NOC_0_arlock"), FPD_CCI_NOC_0_arcache("FPD_CCI_NOC_0_arcache"), FPD_CCI_NOC_0_arprot("FPD_CCI_NOC_0_arprot"), FPD_CCI_NOC_0_arvalid("FPD_CCI_NOC_0_arvalid"), FPD_CCI_NOC_0_aruser("FPD_CCI_NOC_0_aruser"), FPD_CCI_NOC_0_arready("FPD_CCI_NOC_0_arready"), FPD_CCI_NOC_0_rid("FPD_CCI_NOC_0_rid"), FPD_CCI_NOC_0_rdata("FPD_CCI_NOC_0_rdata"), FPD_CCI_NOC_0_rresp("FPD_CCI_NOC_0_rresp"), FPD_CCI_NOC_0_rlast("FPD_CCI_NOC_0_rlast"), FPD_CCI_NOC_0_rvalid("FPD_CCI_NOC_0_rvalid"), FPD_CCI_NOC_0_rready("FPD_CCI_NOC_0_rready"), FPD_CCI_NOC_0_awqos("FPD_CCI_NOC_0_awqos"), FPD_CCI_NOC_0_arqos("FPD_CCI_NOC_0_arqos"), FPD_CCI_NOC_1_awid("FPD_CCI_NOC_1_awid"), FPD_CCI_NOC_1_awaddr("FPD_CCI_NOC_1_awaddr"), FPD_CCI_NOC_1_awlen("FPD_CCI_NOC_1_awlen"), FPD_CCI_NOC_1_awsize("FPD_CCI_NOC_1_awsize"), FPD_CCI_NOC_1_awburst("FPD_CCI_NOC_1_awburst"), FPD_CCI_NOC_1_awlock("FPD_CCI_NOC_1_awlock"), FPD_CCI_NOC_1_awcache("FPD_CCI_NOC_1_awcache"), FPD_CCI_NOC_1_awprot("FPD_CCI_NOC_1_awprot"), FPD_CCI_NOC_1_awvalid("FPD_CCI_NOC_1_awvalid"), FPD_CCI_NOC_1_awuser("FPD_CCI_NOC_1_awuser"), FPD_CCI_NOC_1_awready("FPD_CCI_NOC_1_awready"), FPD_CCI_NOC_1_wdata("FPD_CCI_NOC_1_wdata"), FPD_CCI_NOC_1_wstrb("FPD_CCI_NOC_1_wstrb"), FPD_CCI_NOC_1_wuser("FPD_CCI_NOC_1_wuser"), FPD_CCI_NOC_1_wlast("FPD_CCI_NOC_1_wlast"), FPD_CCI_NOC_1_wvalid("FPD_CCI_NOC_1_wvalid"), FPD_CCI_NOC_1_wready("FPD_CCI_NOC_1_wready"), FPD_CCI_NOC_1_bid("FPD_CCI_NOC_1_bid"), FPD_CCI_NOC_1_bresp("FPD_CCI_NOC_1_bresp"), FPD_CCI_NOC_1_bvalid("FPD_CCI_NOC_1_bvalid"), FPD_CCI_NOC_1_bready("FPD_CCI_NOC_1_bready"), FPD_CCI_NOC_1_arid("FPD_CCI_NOC_1_arid"), FPD_CCI_NOC_1_araddr("FPD_CCI_NOC_1_araddr"), FPD_CCI_NOC_1_arlen("FPD_CCI_NOC_1_arlen"), FPD_CCI_NOC_1_arsize("FPD_CCI_NOC_1_arsize"), FPD_CCI_NOC_1_arburst("FPD_CCI_NOC_1_arburst"), FPD_CCI_NOC_1_arlock("FPD_CCI_NOC_1_arlock"), FPD_CCI_NOC_1_arcache("FPD_CCI_NOC_1_arcache"), FPD_CCI_NOC_1_arprot("FPD_CCI_NOC_1_arprot"), FPD_CCI_NOC_1_arvalid("FPD_CCI_NOC_1_arvalid"), FPD_CCI_NOC_1_aruser("FPD_CCI_NOC_1_aruser"), FPD_CCI_NOC_1_arready("FPD_CCI_NOC_1_arready"), FPD_CCI_NOC_1_rid("FPD_CCI_NOC_1_rid"), FPD_CCI_NOC_1_rdata("FPD_CCI_NOC_1_rdata"), FPD_CCI_NOC_1_rresp("FPD_CCI_NOC_1_rresp"), FPD_CCI_NOC_1_rlast("FPD_CCI_NOC_1_rlast"), FPD_CCI_NOC_1_rvalid("FPD_CCI_NOC_1_rvalid"), FPD_CCI_NOC_1_rready("FPD_CCI_NOC_1_rready"), FPD_CCI_NOC_1_awqos("FPD_CCI_NOC_1_awqos"), FPD_CCI_NOC_1_arqos("FPD_CCI_NOC_1_arqos"), FPD_CCI_NOC_2_awid("FPD_CCI_NOC_2_awid"), FPD_CCI_NOC_2_awaddr("FPD_CCI_NOC_2_awaddr"), FPD_CCI_NOC_2_awlen("FPD_CCI_NOC_2_awlen"), FPD_CCI_NOC_2_awsize("FPD_CCI_NOC_2_awsize"), FPD_CCI_NOC_2_awburst("FPD_CCI_NOC_2_awburst"), FPD_CCI_NOC_2_awlock("FPD_CCI_NOC_2_awlock"), FPD_CCI_NOC_2_awcache("FPD_CCI_NOC_2_awcache"), FPD_CCI_NOC_2_awprot("FPD_CCI_NOC_2_awprot"), FPD_CCI_NOC_2_awvalid("FPD_CCI_NOC_2_awvalid"), FPD_CCI_NOC_2_awuser("FPD_CCI_NOC_2_awuser"), FPD_CCI_NOC_2_awready("FPD_CCI_NOC_2_awready"), FPD_CCI_NOC_2_wdata("FPD_CCI_NOC_2_wdata"), FPD_CCI_NOC_2_wstrb("FPD_CCI_NOC_2_wstrb"), FPD_CCI_NOC_2_wuser("FPD_CCI_NOC_2_wuser"), FPD_CCI_NOC_2_wlast("FPD_CCI_NOC_2_wlast"), FPD_CCI_NOC_2_wvalid("FPD_CCI_NOC_2_wvalid"), FPD_CCI_NOC_2_wready("FPD_CCI_NOC_2_wready"), FPD_CCI_NOC_2_bid("FPD_CCI_NOC_2_bid"), FPD_CCI_NOC_2_bresp("FPD_CCI_NOC_2_bresp"), FPD_CCI_NOC_2_bvalid("FPD_CCI_NOC_2_bvalid"), FPD_CCI_NOC_2_bready("FPD_CCI_NOC_2_bready"), FPD_CCI_NOC_2_arid("FPD_CCI_NOC_2_arid"), FPD_CCI_NOC_2_araddr("FPD_CCI_NOC_2_araddr"), FPD_CCI_NOC_2_arlen("FPD_CCI_NOC_2_arlen"), FPD_CCI_NOC_2_arsize("FPD_CCI_NOC_2_arsize"), FPD_CCI_NOC_2_arburst("FPD_CCI_NOC_2_arburst"), FPD_CCI_NOC_2_arlock("FPD_CCI_NOC_2_arlock"), FPD_CCI_NOC_2_arcache("FPD_CCI_NOC_2_arcache"), FPD_CCI_NOC_2_arprot("FPD_CCI_NOC_2_arprot"), FPD_CCI_NOC_2_arvalid("FPD_CCI_NOC_2_arvalid"), FPD_CCI_NOC_2_aruser("FPD_CCI_NOC_2_aruser"), FPD_CCI_NOC_2_arready("FPD_CCI_NOC_2_arready"), FPD_CCI_NOC_2_rid("FPD_CCI_NOC_2_rid"), FPD_CCI_NOC_2_rdata("FPD_CCI_NOC_2_rdata"), FPD_CCI_NOC_2_rresp("FPD_CCI_NOC_2_rresp"), FPD_CCI_NOC_2_rlast("FPD_CCI_NOC_2_rlast"), FPD_CCI_NOC_2_rvalid("FPD_CCI_NOC_2_rvalid"), FPD_CCI_NOC_2_rready("FPD_CCI_NOC_2_rready"), FPD_CCI_NOC_2_awqos("FPD_CCI_NOC_2_awqos"), FPD_CCI_NOC_2_arqos("FPD_CCI_NOC_2_arqos"), FPD_CCI_NOC_3_awid("FPD_CCI_NOC_3_awid"), FPD_CCI_NOC_3_awaddr("FPD_CCI_NOC_3_awaddr"), FPD_CCI_NOC_3_awlen("FPD_CCI_NOC_3_awlen"), FPD_CCI_NOC_3_awsize("FPD_CCI_NOC_3_awsize"), FPD_CCI_NOC_3_awburst("FPD_CCI_NOC_3_awburst"), FPD_CCI_NOC_3_awlock("FPD_CCI_NOC_3_awlock"), FPD_CCI_NOC_3_awcache("FPD_CCI_NOC_3_awcache"), FPD_CCI_NOC_3_awprot("FPD_CCI_NOC_3_awprot"), FPD_CCI_NOC_3_awvalid("FPD_CCI_NOC_3_awvalid"), FPD_CCI_NOC_3_awuser("FPD_CCI_NOC_3_awuser"), FPD_CCI_NOC_3_awready("FPD_CCI_NOC_3_awready"), FPD_CCI_NOC_3_wdata("FPD_CCI_NOC_3_wdata"), FPD_CCI_NOC_3_wstrb("FPD_CCI_NOC_3_wstrb"), FPD_CCI_NOC_3_wuser("FPD_CCI_NOC_3_wuser"), FPD_CCI_NOC_3_wlast("FPD_CCI_NOC_3_wlast"), FPD_CCI_NOC_3_wvalid("FPD_CCI_NOC_3_wvalid"), FPD_CCI_NOC_3_wready("FPD_CCI_NOC_3_wready"), FPD_CCI_NOC_3_bid("FPD_CCI_NOC_3_bid"), FPD_CCI_NOC_3_bresp("FPD_CCI_NOC_3_bresp"), FPD_CCI_NOC_3_bvalid("FPD_CCI_NOC_3_bvalid"), FPD_CCI_NOC_3_bready("FPD_CCI_NOC_3_bready"), FPD_CCI_NOC_3_arid("FPD_CCI_NOC_3_arid"), FPD_CCI_NOC_3_araddr("FPD_CCI_NOC_3_araddr"), FPD_CCI_NOC_3_arlen("FPD_CCI_NOC_3_arlen"), FPD_CCI_NOC_3_arsize("FPD_CCI_NOC_3_arsize"), FPD_CCI_NOC_3_arburst("FPD_CCI_NOC_3_arburst"), FPD_CCI_NOC_3_arlock("FPD_CCI_NOC_3_arlock"), FPD_CCI_NOC_3_arcache("FPD_CCI_NOC_3_arcache"), FPD_CCI_NOC_3_arprot("FPD_CCI_NOC_3_arprot"), FPD_CCI_NOC_3_arvalid("FPD_CCI_NOC_3_arvalid"), FPD_CCI_NOC_3_aruser("FPD_CCI_NOC_3_aruser"), FPD_CCI_NOC_3_arready("FPD_CCI_NOC_3_arready"), FPD_CCI_NOC_3_rid("FPD_CCI_NOC_3_rid"), FPD_CCI_NOC_3_rdata("FPD_CCI_NOC_3_rdata"), FPD_CCI_NOC_3_rresp("FPD_CCI_NOC_3_rresp"), FPD_CCI_NOC_3_rlast("FPD_CCI_NOC_3_rlast"), FPD_CCI_NOC_3_rvalid("FPD_CCI_NOC_3_rvalid"), FPD_CCI_NOC_3_rready("FPD_CCI_NOC_3_rready"), FPD_CCI_NOC_3_awqos("FPD_CCI_NOC_3_awqos"), FPD_CCI_NOC_3_arqos("FPD_CCI_NOC_3_arqos"), LPD_AXI_NOC_0_awid("LPD_AXI_NOC_0_awid"), LPD_AXI_NOC_0_awaddr("LPD_AXI_NOC_0_awaddr"), LPD_AXI_NOC_0_awlen("LPD_AXI_NOC_0_awlen"), LPD_AXI_NOC_0_awsize("LPD_AXI_NOC_0_awsize"), LPD_AXI_NOC_0_awburst("LPD_AXI_NOC_0_awburst"), LPD_AXI_NOC_0_awlock("LPD_AXI_NOC_0_awlock"), LPD_AXI_NOC_0_awcache("LPD_AXI_NOC_0_awcache"), LPD_AXI_NOC_0_awprot("LPD_AXI_NOC_0_awprot"), LPD_AXI_NOC_0_awvalid("LPD_AXI_NOC_0_awvalid"), LPD_AXI_NOC_0_awuser("LPD_AXI_NOC_0_awuser"), LPD_AXI_NOC_0_awready("LPD_AXI_NOC_0_awready"), LPD_AXI_NOC_0_wdata("LPD_AXI_NOC_0_wdata"), LPD_AXI_NOC_0_wstrb("LPD_AXI_NOC_0_wstrb"), LPD_AXI_NOC_0_wlast("LPD_AXI_NOC_0_wlast"), LPD_AXI_NOC_0_wvalid("LPD_AXI_NOC_0_wvalid"), LPD_AXI_NOC_0_wready("LPD_AXI_NOC_0_wready"), LPD_AXI_NOC_0_bid("LPD_AXI_NOC_0_bid"), LPD_AXI_NOC_0_bresp("LPD_AXI_NOC_0_bresp"), LPD_AXI_NOC_0_bvalid("LPD_AXI_NOC_0_bvalid"), LPD_AXI_NOC_0_bready("LPD_AXI_NOC_0_bready"), LPD_AXI_NOC_0_arid("LPD_AXI_NOC_0_arid"), LPD_AXI_NOC_0_araddr("LPD_AXI_NOC_0_araddr"), LPD_AXI_NOC_0_arlen("LPD_AXI_NOC_0_arlen"), LPD_AXI_NOC_0_arsize("LPD_AXI_NOC_0_arsize"), LPD_AXI_NOC_0_arburst("LPD_AXI_NOC_0_arburst"), LPD_AXI_NOC_0_arlock("LPD_AXI_NOC_0_arlock"), LPD_AXI_NOC_0_arcache("LPD_AXI_NOC_0_arcache"), LPD_AXI_NOC_0_arprot("LPD_AXI_NOC_0_arprot"), LPD_AXI_NOC_0_arvalid("LPD_AXI_NOC_0_arvalid"), LPD_AXI_NOC_0_aruser("LPD_AXI_NOC_0_aruser"), LPD_AXI_NOC_0_arready("LPD_AXI_NOC_0_arready"), LPD_AXI_NOC_0_rid("LPD_AXI_NOC_0_rid"), LPD_AXI_NOC_0_rdata("LPD_AXI_NOC_0_rdata"), LPD_AXI_NOC_0_rresp("LPD_AXI_NOC_0_rresp"), LPD_AXI_NOC_0_rlast("LPD_AXI_NOC_0_rlast"), LPD_AXI_NOC_0_rvalid("LPD_AXI_NOC_0_rvalid"), LPD_AXI_NOC_0_rready("LPD_AXI_NOC_0_rready"), LPD_AXI_NOC_0_awqos("LPD_AXI_NOC_0_awqos"), LPD_AXI_NOC_0_arqos("LPD_AXI_NOC_0_arqos"), PMC_NOC_AXI_0_araddr("PMC_NOC_AXI_0_araddr"), PMC_NOC_AXI_0_arburst("PMC_NOC_AXI_0_arburst"), PMC_NOC_AXI_0_arcache("PMC_NOC_AXI_0_arcache"), PMC_NOC_AXI_0_arid("PMC_NOC_AXI_0_arid"), PMC_NOC_AXI_0_arlen("PMC_NOC_AXI_0_arlen"), PMC_NOC_AXI_0_arlock("PMC_NOC_AXI_0_arlock"), PMC_NOC_AXI_0_arprot("PMC_NOC_AXI_0_arprot"), PMC_NOC_AXI_0_arqos("PMC_NOC_AXI_0_arqos"), PMC_NOC_AXI_0_arregion("PMC_NOC_AXI_0_arregion"), PMC_NOC_AXI_0_arsize("PMC_NOC_AXI_0_arsize"), PMC_NOC_AXI_0_aruser("PMC_NOC_AXI_0_aruser"), PMC_NOC_AXI_0_arvalid("PMC_NOC_AXI_0_arvalid"), PMC_NOC_AXI_0_awaddr("PMC_NOC_AXI_0_awaddr"), PMC_NOC_AXI_0_awburst("PMC_NOC_AXI_0_awburst"), PMC_NOC_AXI_0_awcache("PMC_NOC_AXI_0_awcache"), PMC_NOC_AXI_0_awid("PMC_NOC_AXI_0_awid"), PMC_NOC_AXI_0_awlen("PMC_NOC_AXI_0_awlen"), PMC_NOC_AXI_0_awlock("PMC_NOC_AXI_0_awlock"), PMC_NOC_AXI_0_awprot("PMC_NOC_AXI_0_awprot"), PMC_NOC_AXI_0_awqos("PMC_NOC_AXI_0_awqos"), PMC_NOC_AXI_0_awregion("PMC_NOC_AXI_0_awregion"), PMC_NOC_AXI_0_awsize("PMC_NOC_AXI_0_awsize"), PMC_NOC_AXI_0_awuser("PMC_NOC_AXI_0_awuser"), PMC_NOC_AXI_0_awvalid("PMC_NOC_AXI_0_awvalid"), PMC_NOC_AXI_0_bready("PMC_NOC_AXI_0_bready"), PMC_NOC_AXI_0_rready("PMC_NOC_AXI_0_rready"), PMC_NOC_AXI_0_wdata("PMC_NOC_AXI_0_wdata"), PMC_NOC_AXI_0_wid("PMC_NOC_AXI_0_wid"), PMC_NOC_AXI_0_wlast("PMC_NOC_AXI_0_wlast"), PMC_NOC_AXI_0_wstrb("PMC_NOC_AXI_0_wstrb"), PMC_NOC_AXI_0_wuser("PMC_NOC_AXI_0_wuser"), PMC_NOC_AXI_0_wvalid("PMC_NOC_AXI_0_wvalid"), PMC_NOC_AXI_0_arready("PMC_NOC_AXI_0_arready"), PMC_NOC_AXI_0_awready("PMC_NOC_AXI_0_awready"), PMC_NOC_AXI_0_bid("PMC_NOC_AXI_0_bid"), PMC_NOC_AXI_0_bresp("PMC_NOC_AXI_0_bresp"), PMC_NOC_AXI_0_buser("PMC_NOC_AXI_0_buser"), PMC_NOC_AXI_0_bvalid("PMC_NOC_AXI_0_bvalid"), PMC_NOC_AXI_0_rdata("PMC_NOC_AXI_0_rdata"), PMC_NOC_AXI_0_rid("PMC_NOC_AXI_0_rid"), PMC_NOC_AXI_0_rlast("PMC_NOC_AXI_0_rlast"), PMC_NOC_AXI_0_rresp("PMC_NOC_AXI_0_rresp"), PMC_NOC_AXI_0_ruser("PMC_NOC_AXI_0_ruser"), PMC_NOC_AXI_0_rvalid("PMC_NOC_AXI_0_rvalid"), PMC_NOC_AXI_0_wready("PMC_NOC_AXI_0_wready"), NOC_PMC_AXI_0_araddr("NOC_PMC_AXI_0_araddr"), NOC_PMC_AXI_0_arburst("NOC_PMC_AXI_0_arburst"), NOC_PMC_AXI_0_arcache("NOC_PMC_AXI_0_arcache"), NOC_PMC_AXI_0_arid("NOC_PMC_AXI_0_arid"), NOC_PMC_AXI_0_arlen("NOC_PMC_AXI_0_arlen"), NOC_PMC_AXI_0_arlock("NOC_PMC_AXI_0_arlock"), NOC_PMC_AXI_0_arprot("NOC_PMC_AXI_0_arprot"), NOC_PMC_AXI_0_arqos("NOC_PMC_AXI_0_arqos"), NOC_PMC_AXI_0_arregion("NOC_PMC_AXI_0_arregion"), NOC_PMC_AXI_0_arsize("NOC_PMC_AXI_0_arsize"), NOC_PMC_AXI_0_aruser("NOC_PMC_AXI_0_aruser"), NOC_PMC_AXI_0_arvalid("NOC_PMC_AXI_0_arvalid"), NOC_PMC_AXI_0_awaddr("NOC_PMC_AXI_0_awaddr"), NOC_PMC_AXI_0_awburst("NOC_PMC_AXI_0_awburst"), NOC_PMC_AXI_0_awcache("NOC_PMC_AXI_0_awcache"), NOC_PMC_AXI_0_awid("NOC_PMC_AXI_0_awid"), NOC_PMC_AXI_0_awlen("NOC_PMC_AXI_0_awlen"), NOC_PMC_AXI_0_awlock("NOC_PMC_AXI_0_awlock"), NOC_PMC_AXI_0_awprot("NOC_PMC_AXI_0_awprot"), NOC_PMC_AXI_0_awqos("NOC_PMC_AXI_0_awqos"), NOC_PMC_AXI_0_awregion("NOC_PMC_AXI_0_awregion"), NOC_PMC_AXI_0_awsize("NOC_PMC_AXI_0_awsize"), NOC_PMC_AXI_0_awuser("NOC_PMC_AXI_0_awuser"), NOC_PMC_AXI_0_awvalid("NOC_PMC_AXI_0_awvalid"), NOC_PMC_AXI_0_bready("NOC_PMC_AXI_0_bready"), NOC_PMC_AXI_0_rready("NOC_PMC_AXI_0_rready"), NOC_PMC_AXI_0_wdata("NOC_PMC_AXI_0_wdata"), NOC_PMC_AXI_0_wid("NOC_PMC_AXI_0_wid"), NOC_PMC_AXI_0_wlast("NOC_PMC_AXI_0_wlast"), NOC_PMC_AXI_0_wstrb("NOC_PMC_AXI_0_wstrb"), NOC_PMC_AXI_0_wuser("NOC_PMC_AXI_0_wuser"), NOC_PMC_AXI_0_wvalid("NOC_PMC_AXI_0_wvalid"), NOC_PMC_AXI_0_arready("NOC_PMC_AXI_0_arready"), NOC_PMC_AXI_0_awready("NOC_PMC_AXI_0_awready"), NOC_PMC_AXI_0_bid("NOC_PMC_AXI_0_bid"), NOC_PMC_AXI_0_bresp("NOC_PMC_AXI_0_bresp"), NOC_PMC_AXI_0_buser("NOC_PMC_AXI_0_buser"), NOC_PMC_AXI_0_bvalid("NOC_PMC_AXI_0_bvalid"), NOC_PMC_AXI_0_rdata("NOC_PMC_AXI_0_rdata"), NOC_PMC_AXI_0_rid("NOC_PMC_AXI_0_rid"), NOC_PMC_AXI_0_rlast("NOC_PMC_AXI_0_rlast"), NOC_PMC_AXI_0_rresp("NOC_PMC_AXI_0_rresp"), NOC_PMC_AXI_0_ruser("NOC_PMC_AXI_0_ruser"), NOC_PMC_AXI_0_rvalid("NOC_PMC_AXI_0_rvalid"), NOC_PMC_AXI_0_wready("NOC_PMC_AXI_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_ruser("CPM_PCIE_NOC_0_ruser"), CPM_PCIE_NOC_0_wuser("CPM_PCIE_NOC_0_wuser"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_ruser("CPM_PCIE_NOC_1_ruser"), CPM_PCIE_NOC_1_wuser("CPM_PCIE_NOC_1_wuser"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp"), dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch"), dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id"), dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready"), dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast"), dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid"), dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc"), dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata"), dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty"), dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc"), dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker"), dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt"), dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len"), dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid"), dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id"), dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker"), dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig"), dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size"), dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid"), dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker"), dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id"), dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx"), dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx"), dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id"), dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready"), dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid"), dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar"), dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data"), dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type"), dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast"), dma0_m_axis_h2c_err("dma0_m_axis_h2c_err"), dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid"), dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata"), dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte"), dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready"), dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc"), dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty"), dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid"), dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata"), dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id"), dma0_axis_c2h_status_last("dma0_axis_c2h_status_last"), dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop"), dma0_axis_c2h_status_error("dma0_axis_c2h_status_error"), dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid"), dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp"), dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid"), dma0_qsts_out_vld("dma0_qsts_out_vld"), dma0_qsts_out_op("dma0_qsts_out_op"), dma0_qsts_out_rdy("dma0_qsts_out_rdy"), dma0_qsts_out_qid("dma0_qsts_out_qid"), dma0_qsts_out_data("dma0_qsts_out_data"), dma0_qsts_out_port_id("dma0_qsts_out_port_id"), dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy"), dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir"), dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid"), dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence"), dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid"), dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt"), dma0_usr_irq_ack("dma0_usr_irq_ack"), dma0_usr_irq_fail("dma0_usr_irq_fail"), dma0_usr_irq_valid("dma0_usr_irq_valid"), dma0_usr_irq_vec("dma0_usr_irq_vec"), dma0_usr_irq_fnc("dma0_usr_irq_fnc"), dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm"), dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen"), dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp"), dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir"), dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error"), dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid"), dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv"), dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm"), dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy"), dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid"), dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl"), dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx"), dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id"), dma0_usr_flr_set("dma0_usr_flr_set"), dma0_usr_flr_clear("dma0_usr_flr_clear"), dma0_usr_flr_fnc("dma0_usr_flr_fnc"), dma0_usr_flr_done_vld("dma0_usr_flr_done_vld"), dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk);
  mp_impl->fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk);
  mp_impl->fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk);
  mp_impl->fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk);
  mp_impl->lpd_axi_noc_clk(lpd_axi_noc_clk);
  mp_impl->pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk);
  mp_impl->noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk);
  mp_impl->gem0_tsu_timer_cnt(gem0_tsu_timer_cnt);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->dma0_intrfc_clk(dma0_intrfc_clk);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_intrfc_resetn(dma0_intrfc_resetn);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp);
  mp_impl->dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch);
  mp_impl->dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id);
  mp_impl->dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready);
  mp_impl->dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast);
  mp_impl->dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid);
  mp_impl->dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc);
  mp_impl->dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata);
  mp_impl->dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty);
  mp_impl->dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc);
  mp_impl->dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker);
  mp_impl->dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt);
  mp_impl->dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len);
  mp_impl->dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid);
  mp_impl->dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig);
  mp_impl->dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size);
  mp_impl->dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid);
  mp_impl->dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id);
  mp_impl->dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready);
  mp_impl->dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid);
  mp_impl->dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar);
  mp_impl->dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data);
  mp_impl->dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type);
  mp_impl->dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast);
  mp_impl->dma0_m_axis_h2c_err(dma0_m_axis_h2c_err);
  mp_impl->dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid);
  mp_impl->dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata);
  mp_impl->dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte);
  mp_impl->dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready);
  mp_impl->dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc);
  mp_impl->dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty);
  mp_impl->dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid);
  mp_impl->dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata);
  mp_impl->dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id);
  mp_impl->dma0_axis_c2h_status_last(dma0_axis_c2h_status_last);
  mp_impl->dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop);
  mp_impl->dma0_axis_c2h_status_error(dma0_axis_c2h_status_error);
  mp_impl->dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid);
  mp_impl->dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp);
  mp_impl->dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid);
  mp_impl->dma0_qsts_out_vld(dma0_qsts_out_vld);
  mp_impl->dma0_qsts_out_op(dma0_qsts_out_op);
  mp_impl->dma0_qsts_out_rdy(dma0_qsts_out_rdy);
  mp_impl->dma0_qsts_out_qid(dma0_qsts_out_qid);
  mp_impl->dma0_qsts_out_data(dma0_qsts_out_data);
  mp_impl->dma0_qsts_out_port_id(dma0_qsts_out_port_id);
  mp_impl->dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy);
  mp_impl->dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir);
  mp_impl->dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid);
  mp_impl->dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence);
  mp_impl->dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid);
  mp_impl->dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt);
  mp_impl->dma0_usr_irq_ack(dma0_usr_irq_ack);
  mp_impl->dma0_usr_irq_fail(dma0_usr_irq_fail);
  mp_impl->dma0_usr_irq_valid(dma0_usr_irq_valid);
  mp_impl->dma0_usr_irq_vec(dma0_usr_irq_vec);
  mp_impl->dma0_usr_irq_fnc(dma0_usr_irq_fnc);
  mp_impl->dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm);
  mp_impl->dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen);
  mp_impl->dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp);
  mp_impl->dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir);
  mp_impl->dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error);
  mp_impl->dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid);
  mp_impl->dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv);
  mp_impl->dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm);
  mp_impl->dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy);
  mp_impl->dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid);
  mp_impl->dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl);
  mp_impl->dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx);
  mp_impl->dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id);
  mp_impl->dma0_usr_flr_set(dma0_usr_flr_set);
  mp_impl->dma0_usr_flr_clear(dma0_usr_flr_clear);
  mp_impl->dma0_usr_flr_fnc(dma0_usr_flr_fnc);
  mp_impl->dma0_usr_flr_done_vld(dma0_usr_flr_done_vld);
  mp_impl->dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_FPD_CCI_NOC_0_transactor = NULL;
  mp_FPD_CCI_NOC_1_transactor = NULL;
  mp_FPD_CCI_NOC_2_transactor = NULL;
  mp_FPD_CCI_NOC_3_transactor = NULL;
  mp_LPD_AXI_NOC_0_transactor = NULL;
  mp_PMC_NOC_AXI_0_transactor = NULL;
  mp_NOC_PMC_AXI_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void full_blown_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'FPD_CCI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_0' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_0_transactor_param_props;
    FPD_CCI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk");
    FPD_CCI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_FPD_CCI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_0_transactor", FPD_CCI_NOC_0_transactor_param_props);

    // FPD_CCI_NOC_0' transactor ports

    mp_FPD_CCI_NOC_0_transactor->AWID(FPD_CCI_NOC_0_awid);
    mp_FPD_CCI_NOC_0_transactor->AWADDR(FPD_CCI_NOC_0_awaddr);
    mp_FPD_CCI_NOC_0_transactor->AWLEN(FPD_CCI_NOC_0_awlen);
    mp_FPD_CCI_NOC_0_transactor->AWSIZE(FPD_CCI_NOC_0_awsize);
    mp_FPD_CCI_NOC_0_transactor->AWBURST(FPD_CCI_NOC_0_awburst);
    mp_FPD_CCI_NOC_0_transactor->AWLOCK(FPD_CCI_NOC_0_awlock);
    mp_FPD_CCI_NOC_0_transactor->AWCACHE(FPD_CCI_NOC_0_awcache);
    mp_FPD_CCI_NOC_0_transactor->AWPROT(FPD_CCI_NOC_0_awprot);
    mp_FPD_CCI_NOC_0_transactor->AWVALID(FPD_CCI_NOC_0_awvalid);
    mp_FPD_CCI_NOC_0_transactor->AWUSER(FPD_CCI_NOC_0_awuser);
    mp_FPD_CCI_NOC_0_transactor->AWREADY(FPD_CCI_NOC_0_awready);
    mp_FPD_CCI_NOC_0_transactor->WDATA(FPD_CCI_NOC_0_wdata);
    mp_FPD_CCI_NOC_0_transactor->WSTRB(FPD_CCI_NOC_0_wstrb);
    mp_FPD_CCI_NOC_0_transactor->WUSER(FPD_CCI_NOC_0_wuser);
    mp_FPD_CCI_NOC_0_transactor->WLAST(FPD_CCI_NOC_0_wlast);
    mp_FPD_CCI_NOC_0_transactor->WVALID(FPD_CCI_NOC_0_wvalid);
    mp_FPD_CCI_NOC_0_transactor->WREADY(FPD_CCI_NOC_0_wready);
    mp_FPD_CCI_NOC_0_transactor->BID(FPD_CCI_NOC_0_bid);
    mp_FPD_CCI_NOC_0_transactor->BRESP(FPD_CCI_NOC_0_bresp);
    mp_FPD_CCI_NOC_0_transactor->BVALID(FPD_CCI_NOC_0_bvalid);
    mp_FPD_CCI_NOC_0_transactor->BREADY(FPD_CCI_NOC_0_bready);
    mp_FPD_CCI_NOC_0_transactor->ARID(FPD_CCI_NOC_0_arid);
    mp_FPD_CCI_NOC_0_transactor->ARADDR(FPD_CCI_NOC_0_araddr);
    mp_FPD_CCI_NOC_0_transactor->ARLEN(FPD_CCI_NOC_0_arlen);
    mp_FPD_CCI_NOC_0_transactor->ARSIZE(FPD_CCI_NOC_0_arsize);
    mp_FPD_CCI_NOC_0_transactor->ARBURST(FPD_CCI_NOC_0_arburst);
    mp_FPD_CCI_NOC_0_transactor->ARLOCK(FPD_CCI_NOC_0_arlock);
    mp_FPD_CCI_NOC_0_transactor->ARCACHE(FPD_CCI_NOC_0_arcache);
    mp_FPD_CCI_NOC_0_transactor->ARPROT(FPD_CCI_NOC_0_arprot);
    mp_FPD_CCI_NOC_0_transactor->ARVALID(FPD_CCI_NOC_0_arvalid);
    mp_FPD_CCI_NOC_0_transactor->ARUSER(FPD_CCI_NOC_0_aruser);
    mp_FPD_CCI_NOC_0_transactor->ARREADY(FPD_CCI_NOC_0_arready);
    mp_FPD_CCI_NOC_0_transactor->RID(FPD_CCI_NOC_0_rid);
    mp_FPD_CCI_NOC_0_transactor->RDATA(FPD_CCI_NOC_0_rdata);
    mp_FPD_CCI_NOC_0_transactor->RRESP(FPD_CCI_NOC_0_rresp);
    mp_FPD_CCI_NOC_0_transactor->RLAST(FPD_CCI_NOC_0_rlast);
    mp_FPD_CCI_NOC_0_transactor->RVALID(FPD_CCI_NOC_0_rvalid);
    mp_FPD_CCI_NOC_0_transactor->RREADY(FPD_CCI_NOC_0_rready);
    mp_FPD_CCI_NOC_0_transactor->AWQOS(FPD_CCI_NOC_0_awqos);
    mp_FPD_CCI_NOC_0_transactor->ARQOS(FPD_CCI_NOC_0_arqos);
    mp_FPD_CCI_NOC_0_transactor->CLK(fpd_cci_noc_axi0_clk);
    m_FPD_CCI_NOC_0_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_0_transactor->RST(m_FPD_CCI_NOC_0_transactor_rst_signal);

    // FPD_CCI_NOC_0' transactor sockets

    mp_impl->FPD_CCI_NOC_0_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_1' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_1_transactor_param_props;
    FPD_CCI_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_1_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk");
    FPD_CCI_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_FPD_CCI_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_1_transactor", FPD_CCI_NOC_1_transactor_param_props);

    // FPD_CCI_NOC_1' transactor ports

    mp_FPD_CCI_NOC_1_transactor->AWID(FPD_CCI_NOC_1_awid);
    mp_FPD_CCI_NOC_1_transactor->AWADDR(FPD_CCI_NOC_1_awaddr);
    mp_FPD_CCI_NOC_1_transactor->AWLEN(FPD_CCI_NOC_1_awlen);
    mp_FPD_CCI_NOC_1_transactor->AWSIZE(FPD_CCI_NOC_1_awsize);
    mp_FPD_CCI_NOC_1_transactor->AWBURST(FPD_CCI_NOC_1_awburst);
    mp_FPD_CCI_NOC_1_transactor->AWLOCK(FPD_CCI_NOC_1_awlock);
    mp_FPD_CCI_NOC_1_transactor->AWCACHE(FPD_CCI_NOC_1_awcache);
    mp_FPD_CCI_NOC_1_transactor->AWPROT(FPD_CCI_NOC_1_awprot);
    mp_FPD_CCI_NOC_1_transactor->AWVALID(FPD_CCI_NOC_1_awvalid);
    mp_FPD_CCI_NOC_1_transactor->AWUSER(FPD_CCI_NOC_1_awuser);
    mp_FPD_CCI_NOC_1_transactor->AWREADY(FPD_CCI_NOC_1_awready);
    mp_FPD_CCI_NOC_1_transactor->WDATA(FPD_CCI_NOC_1_wdata);
    mp_FPD_CCI_NOC_1_transactor->WSTRB(FPD_CCI_NOC_1_wstrb);
    mp_FPD_CCI_NOC_1_transactor->WUSER(FPD_CCI_NOC_1_wuser);
    mp_FPD_CCI_NOC_1_transactor->WLAST(FPD_CCI_NOC_1_wlast);
    mp_FPD_CCI_NOC_1_transactor->WVALID(FPD_CCI_NOC_1_wvalid);
    mp_FPD_CCI_NOC_1_transactor->WREADY(FPD_CCI_NOC_1_wready);
    mp_FPD_CCI_NOC_1_transactor->BID(FPD_CCI_NOC_1_bid);
    mp_FPD_CCI_NOC_1_transactor->BRESP(FPD_CCI_NOC_1_bresp);
    mp_FPD_CCI_NOC_1_transactor->BVALID(FPD_CCI_NOC_1_bvalid);
    mp_FPD_CCI_NOC_1_transactor->BREADY(FPD_CCI_NOC_1_bready);
    mp_FPD_CCI_NOC_1_transactor->ARID(FPD_CCI_NOC_1_arid);
    mp_FPD_CCI_NOC_1_transactor->ARADDR(FPD_CCI_NOC_1_araddr);
    mp_FPD_CCI_NOC_1_transactor->ARLEN(FPD_CCI_NOC_1_arlen);
    mp_FPD_CCI_NOC_1_transactor->ARSIZE(FPD_CCI_NOC_1_arsize);
    mp_FPD_CCI_NOC_1_transactor->ARBURST(FPD_CCI_NOC_1_arburst);
    mp_FPD_CCI_NOC_1_transactor->ARLOCK(FPD_CCI_NOC_1_arlock);
    mp_FPD_CCI_NOC_1_transactor->ARCACHE(FPD_CCI_NOC_1_arcache);
    mp_FPD_CCI_NOC_1_transactor->ARPROT(FPD_CCI_NOC_1_arprot);
    mp_FPD_CCI_NOC_1_transactor->ARVALID(FPD_CCI_NOC_1_arvalid);
    mp_FPD_CCI_NOC_1_transactor->ARUSER(FPD_CCI_NOC_1_aruser);
    mp_FPD_CCI_NOC_1_transactor->ARREADY(FPD_CCI_NOC_1_arready);
    mp_FPD_CCI_NOC_1_transactor->RID(FPD_CCI_NOC_1_rid);
    mp_FPD_CCI_NOC_1_transactor->RDATA(FPD_CCI_NOC_1_rdata);
    mp_FPD_CCI_NOC_1_transactor->RRESP(FPD_CCI_NOC_1_rresp);
    mp_FPD_CCI_NOC_1_transactor->RLAST(FPD_CCI_NOC_1_rlast);
    mp_FPD_CCI_NOC_1_transactor->RVALID(FPD_CCI_NOC_1_rvalid);
    mp_FPD_CCI_NOC_1_transactor->RREADY(FPD_CCI_NOC_1_rready);
    mp_FPD_CCI_NOC_1_transactor->AWQOS(FPD_CCI_NOC_1_awqos);
    mp_FPD_CCI_NOC_1_transactor->ARQOS(FPD_CCI_NOC_1_arqos);
    mp_FPD_CCI_NOC_1_transactor->CLK(fpd_cci_noc_axi1_clk);
    m_FPD_CCI_NOC_1_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_1_transactor->RST(m_FPD_CCI_NOC_1_transactor_rst_signal);

    // FPD_CCI_NOC_1' transactor sockets

    mp_impl->FPD_CCI_NOC_1_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_2' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_2_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_2' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_2_transactor_param_props;
    FPD_CCI_NOC_2_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_2_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_2_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_2_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_2_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_2_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk");
    FPD_CCI_NOC_2_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_2_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_2_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_2_transactor_param_props.addString("INDEX", "2");

    mp_FPD_CCI_NOC_2_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_2_transactor", FPD_CCI_NOC_2_transactor_param_props);

    // FPD_CCI_NOC_2' transactor ports

    mp_FPD_CCI_NOC_2_transactor->AWID(FPD_CCI_NOC_2_awid);
    mp_FPD_CCI_NOC_2_transactor->AWADDR(FPD_CCI_NOC_2_awaddr);
    mp_FPD_CCI_NOC_2_transactor->AWLEN(FPD_CCI_NOC_2_awlen);
    mp_FPD_CCI_NOC_2_transactor->AWSIZE(FPD_CCI_NOC_2_awsize);
    mp_FPD_CCI_NOC_2_transactor->AWBURST(FPD_CCI_NOC_2_awburst);
    mp_FPD_CCI_NOC_2_transactor->AWLOCK(FPD_CCI_NOC_2_awlock);
    mp_FPD_CCI_NOC_2_transactor->AWCACHE(FPD_CCI_NOC_2_awcache);
    mp_FPD_CCI_NOC_2_transactor->AWPROT(FPD_CCI_NOC_2_awprot);
    mp_FPD_CCI_NOC_2_transactor->AWVALID(FPD_CCI_NOC_2_awvalid);
    mp_FPD_CCI_NOC_2_transactor->AWUSER(FPD_CCI_NOC_2_awuser);
    mp_FPD_CCI_NOC_2_transactor->AWREADY(FPD_CCI_NOC_2_awready);
    mp_FPD_CCI_NOC_2_transactor->WDATA(FPD_CCI_NOC_2_wdata);
    mp_FPD_CCI_NOC_2_transactor->WSTRB(FPD_CCI_NOC_2_wstrb);
    mp_FPD_CCI_NOC_2_transactor->WUSER(FPD_CCI_NOC_2_wuser);
    mp_FPD_CCI_NOC_2_transactor->WLAST(FPD_CCI_NOC_2_wlast);
    mp_FPD_CCI_NOC_2_transactor->WVALID(FPD_CCI_NOC_2_wvalid);
    mp_FPD_CCI_NOC_2_transactor->WREADY(FPD_CCI_NOC_2_wready);
    mp_FPD_CCI_NOC_2_transactor->BID(FPD_CCI_NOC_2_bid);
    mp_FPD_CCI_NOC_2_transactor->BRESP(FPD_CCI_NOC_2_bresp);
    mp_FPD_CCI_NOC_2_transactor->BVALID(FPD_CCI_NOC_2_bvalid);
    mp_FPD_CCI_NOC_2_transactor->BREADY(FPD_CCI_NOC_2_bready);
    mp_FPD_CCI_NOC_2_transactor->ARID(FPD_CCI_NOC_2_arid);
    mp_FPD_CCI_NOC_2_transactor->ARADDR(FPD_CCI_NOC_2_araddr);
    mp_FPD_CCI_NOC_2_transactor->ARLEN(FPD_CCI_NOC_2_arlen);
    mp_FPD_CCI_NOC_2_transactor->ARSIZE(FPD_CCI_NOC_2_arsize);
    mp_FPD_CCI_NOC_2_transactor->ARBURST(FPD_CCI_NOC_2_arburst);
    mp_FPD_CCI_NOC_2_transactor->ARLOCK(FPD_CCI_NOC_2_arlock);
    mp_FPD_CCI_NOC_2_transactor->ARCACHE(FPD_CCI_NOC_2_arcache);
    mp_FPD_CCI_NOC_2_transactor->ARPROT(FPD_CCI_NOC_2_arprot);
    mp_FPD_CCI_NOC_2_transactor->ARVALID(FPD_CCI_NOC_2_arvalid);
    mp_FPD_CCI_NOC_2_transactor->ARUSER(FPD_CCI_NOC_2_aruser);
    mp_FPD_CCI_NOC_2_transactor->ARREADY(FPD_CCI_NOC_2_arready);
    mp_FPD_CCI_NOC_2_transactor->RID(FPD_CCI_NOC_2_rid);
    mp_FPD_CCI_NOC_2_transactor->RDATA(FPD_CCI_NOC_2_rdata);
    mp_FPD_CCI_NOC_2_transactor->RRESP(FPD_CCI_NOC_2_rresp);
    mp_FPD_CCI_NOC_2_transactor->RLAST(FPD_CCI_NOC_2_rlast);
    mp_FPD_CCI_NOC_2_transactor->RVALID(FPD_CCI_NOC_2_rvalid);
    mp_FPD_CCI_NOC_2_transactor->RREADY(FPD_CCI_NOC_2_rready);
    mp_FPD_CCI_NOC_2_transactor->AWQOS(FPD_CCI_NOC_2_awqos);
    mp_FPD_CCI_NOC_2_transactor->ARQOS(FPD_CCI_NOC_2_arqos);
    mp_FPD_CCI_NOC_2_transactor->CLK(fpd_cci_noc_axi2_clk);
    m_FPD_CCI_NOC_2_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_2_transactor->RST(m_FPD_CCI_NOC_2_transactor_rst_signal);

    // FPD_CCI_NOC_2' transactor sockets

    mp_impl->FPD_CCI_NOC_2_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_3' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_3_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_3' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_3_transactor_param_props;
    FPD_CCI_NOC_3_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_3_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_3_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_3_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_3_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_3_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk");
    FPD_CCI_NOC_3_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_3_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_3_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_3_transactor_param_props.addString("INDEX", "3");

    mp_FPD_CCI_NOC_3_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_3_transactor", FPD_CCI_NOC_3_transactor_param_props);

    // FPD_CCI_NOC_3' transactor ports

    mp_FPD_CCI_NOC_3_transactor->AWID(FPD_CCI_NOC_3_awid);
    mp_FPD_CCI_NOC_3_transactor->AWADDR(FPD_CCI_NOC_3_awaddr);
    mp_FPD_CCI_NOC_3_transactor->AWLEN(FPD_CCI_NOC_3_awlen);
    mp_FPD_CCI_NOC_3_transactor->AWSIZE(FPD_CCI_NOC_3_awsize);
    mp_FPD_CCI_NOC_3_transactor->AWBURST(FPD_CCI_NOC_3_awburst);
    mp_FPD_CCI_NOC_3_transactor->AWLOCK(FPD_CCI_NOC_3_awlock);
    mp_FPD_CCI_NOC_3_transactor->AWCACHE(FPD_CCI_NOC_3_awcache);
    mp_FPD_CCI_NOC_3_transactor->AWPROT(FPD_CCI_NOC_3_awprot);
    mp_FPD_CCI_NOC_3_transactor->AWVALID(FPD_CCI_NOC_3_awvalid);
    mp_FPD_CCI_NOC_3_transactor->AWUSER(FPD_CCI_NOC_3_awuser);
    mp_FPD_CCI_NOC_3_transactor->AWREADY(FPD_CCI_NOC_3_awready);
    mp_FPD_CCI_NOC_3_transactor->WDATA(FPD_CCI_NOC_3_wdata);
    mp_FPD_CCI_NOC_3_transactor->WSTRB(FPD_CCI_NOC_3_wstrb);
    mp_FPD_CCI_NOC_3_transactor->WUSER(FPD_CCI_NOC_3_wuser);
    mp_FPD_CCI_NOC_3_transactor->WLAST(FPD_CCI_NOC_3_wlast);
    mp_FPD_CCI_NOC_3_transactor->WVALID(FPD_CCI_NOC_3_wvalid);
    mp_FPD_CCI_NOC_3_transactor->WREADY(FPD_CCI_NOC_3_wready);
    mp_FPD_CCI_NOC_3_transactor->BID(FPD_CCI_NOC_3_bid);
    mp_FPD_CCI_NOC_3_transactor->BRESP(FPD_CCI_NOC_3_bresp);
    mp_FPD_CCI_NOC_3_transactor->BVALID(FPD_CCI_NOC_3_bvalid);
    mp_FPD_CCI_NOC_3_transactor->BREADY(FPD_CCI_NOC_3_bready);
    mp_FPD_CCI_NOC_3_transactor->ARID(FPD_CCI_NOC_3_arid);
    mp_FPD_CCI_NOC_3_transactor->ARADDR(FPD_CCI_NOC_3_araddr);
    mp_FPD_CCI_NOC_3_transactor->ARLEN(FPD_CCI_NOC_3_arlen);
    mp_FPD_CCI_NOC_3_transactor->ARSIZE(FPD_CCI_NOC_3_arsize);
    mp_FPD_CCI_NOC_3_transactor->ARBURST(FPD_CCI_NOC_3_arburst);
    mp_FPD_CCI_NOC_3_transactor->ARLOCK(FPD_CCI_NOC_3_arlock);
    mp_FPD_CCI_NOC_3_transactor->ARCACHE(FPD_CCI_NOC_3_arcache);
    mp_FPD_CCI_NOC_3_transactor->ARPROT(FPD_CCI_NOC_3_arprot);
    mp_FPD_CCI_NOC_3_transactor->ARVALID(FPD_CCI_NOC_3_arvalid);
    mp_FPD_CCI_NOC_3_transactor->ARUSER(FPD_CCI_NOC_3_aruser);
    mp_FPD_CCI_NOC_3_transactor->ARREADY(FPD_CCI_NOC_3_arready);
    mp_FPD_CCI_NOC_3_transactor->RID(FPD_CCI_NOC_3_rid);
    mp_FPD_CCI_NOC_3_transactor->RDATA(FPD_CCI_NOC_3_rdata);
    mp_FPD_CCI_NOC_3_transactor->RRESP(FPD_CCI_NOC_3_rresp);
    mp_FPD_CCI_NOC_3_transactor->RLAST(FPD_CCI_NOC_3_rlast);
    mp_FPD_CCI_NOC_3_transactor->RVALID(FPD_CCI_NOC_3_rvalid);
    mp_FPD_CCI_NOC_3_transactor->RREADY(FPD_CCI_NOC_3_rready);
    mp_FPD_CCI_NOC_3_transactor->AWQOS(FPD_CCI_NOC_3_awqos);
    mp_FPD_CCI_NOC_3_transactor->ARQOS(FPD_CCI_NOC_3_arqos);
    mp_FPD_CCI_NOC_3_transactor->CLK(fpd_cci_noc_axi3_clk);
    m_FPD_CCI_NOC_3_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_3_transactor->RST(m_FPD_CCI_NOC_3_transactor_rst_signal);

    // FPD_CCI_NOC_3' transactor sockets

    mp_impl->FPD_CCI_NOC_3_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'LPD_AXI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "LPD_AXI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'LPD_AXI_NOC_0' transactor parameters
    xsc::common_cpp::properties LPD_AXI_NOC_0_transactor_param_props;
    LPD_AXI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    LPD_AXI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "599999451");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    LPD_AXI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    LPD_AXI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    LPD_AXI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    LPD_AXI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_lpd_axi_noc_clk");
    LPD_AXI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    LPD_AXI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_rpu");
    LPD_AXI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_RPU_TO_NOC_NMU");
    LPD_AXI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_LPD_AXI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("LPD_AXI_NOC_0_transactor", LPD_AXI_NOC_0_transactor_param_props);

    // LPD_AXI_NOC_0' transactor ports

    mp_LPD_AXI_NOC_0_transactor->AWID(LPD_AXI_NOC_0_awid);
    mp_LPD_AXI_NOC_0_transactor->AWADDR(LPD_AXI_NOC_0_awaddr);
    mp_LPD_AXI_NOC_0_transactor->AWLEN(LPD_AXI_NOC_0_awlen);
    mp_LPD_AXI_NOC_0_transactor->AWSIZE(LPD_AXI_NOC_0_awsize);
    mp_LPD_AXI_NOC_0_transactor->AWBURST(LPD_AXI_NOC_0_awburst);
    mp_LPD_AXI_NOC_0_transactor->AWLOCK(LPD_AXI_NOC_0_awlock);
    mp_LPD_AXI_NOC_0_transactor->AWCACHE(LPD_AXI_NOC_0_awcache);
    mp_LPD_AXI_NOC_0_transactor->AWPROT(LPD_AXI_NOC_0_awprot);
    mp_LPD_AXI_NOC_0_transactor->AWVALID(LPD_AXI_NOC_0_awvalid);
    mp_LPD_AXI_NOC_0_transactor->AWUSER(LPD_AXI_NOC_0_awuser);
    mp_LPD_AXI_NOC_0_transactor->AWREADY(LPD_AXI_NOC_0_awready);
    mp_LPD_AXI_NOC_0_transactor->WDATA(LPD_AXI_NOC_0_wdata);
    mp_LPD_AXI_NOC_0_transactor->WSTRB(LPD_AXI_NOC_0_wstrb);
    mp_LPD_AXI_NOC_0_transactor->WLAST(LPD_AXI_NOC_0_wlast);
    mp_LPD_AXI_NOC_0_transactor->WVALID(LPD_AXI_NOC_0_wvalid);
    mp_LPD_AXI_NOC_0_transactor->WREADY(LPD_AXI_NOC_0_wready);
    mp_LPD_AXI_NOC_0_transactor->BID(LPD_AXI_NOC_0_bid);
    mp_LPD_AXI_NOC_0_transactor->BRESP(LPD_AXI_NOC_0_bresp);
    mp_LPD_AXI_NOC_0_transactor->BVALID(LPD_AXI_NOC_0_bvalid);
    mp_LPD_AXI_NOC_0_transactor->BREADY(LPD_AXI_NOC_0_bready);
    mp_LPD_AXI_NOC_0_transactor->ARID(LPD_AXI_NOC_0_arid);
    mp_LPD_AXI_NOC_0_transactor->ARADDR(LPD_AXI_NOC_0_araddr);
    mp_LPD_AXI_NOC_0_transactor->ARLEN(LPD_AXI_NOC_0_arlen);
    mp_LPD_AXI_NOC_0_transactor->ARSIZE(LPD_AXI_NOC_0_arsize);
    mp_LPD_AXI_NOC_0_transactor->ARBURST(LPD_AXI_NOC_0_arburst);
    mp_LPD_AXI_NOC_0_transactor->ARLOCK(LPD_AXI_NOC_0_arlock);
    mp_LPD_AXI_NOC_0_transactor->ARCACHE(LPD_AXI_NOC_0_arcache);
    mp_LPD_AXI_NOC_0_transactor->ARPROT(LPD_AXI_NOC_0_arprot);
    mp_LPD_AXI_NOC_0_transactor->ARVALID(LPD_AXI_NOC_0_arvalid);
    mp_LPD_AXI_NOC_0_transactor->ARUSER(LPD_AXI_NOC_0_aruser);
    mp_LPD_AXI_NOC_0_transactor->ARREADY(LPD_AXI_NOC_0_arready);
    mp_LPD_AXI_NOC_0_transactor->RID(LPD_AXI_NOC_0_rid);
    mp_LPD_AXI_NOC_0_transactor->RDATA(LPD_AXI_NOC_0_rdata);
    mp_LPD_AXI_NOC_0_transactor->RRESP(LPD_AXI_NOC_0_rresp);
    mp_LPD_AXI_NOC_0_transactor->RLAST(LPD_AXI_NOC_0_rlast);
    mp_LPD_AXI_NOC_0_transactor->RVALID(LPD_AXI_NOC_0_rvalid);
    mp_LPD_AXI_NOC_0_transactor->RREADY(LPD_AXI_NOC_0_rready);
    mp_LPD_AXI_NOC_0_transactor->AWQOS(LPD_AXI_NOC_0_awqos);
    mp_LPD_AXI_NOC_0_transactor->ARQOS(LPD_AXI_NOC_0_arqos);
    mp_LPD_AXI_NOC_0_transactor->CLK(lpd_axi_noc_clk);
    m_LPD_AXI_NOC_0_transactor_rst_signal.write(1);
    mp_LPD_AXI_NOC_0_transactor->RST(m_LPD_AXI_NOC_0_transactor_rst_signal);

    // LPD_AXI_NOC_0' transactor sockets

    mp_impl->LPD_AXI_NOC_0_tlm_aximm_read_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_write_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'PMC_NOC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "PMC_NOC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'PMC_NOC_AXI_0' transactor parameters
    xsc::common_cpp::properties PMC_NOC_AXI_0_transactor_param_props;
    PMC_NOC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    PMC_NOC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    PMC_NOC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    PMC_NOC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    PMC_NOC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    PMC_NOC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk");
    PMC_NOC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    PMC_NOC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    PMC_NOC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PMC_TO_NOC_NMU");
    PMC_NOC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    PMC_NOC_AXI_0_transactor_param_props.addString("INDEX", "0");
    PMC_NOC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_PMC_NOC_AXI_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,16,18,17>("PMC_NOC_AXI_0_transactor", PMC_NOC_AXI_0_transactor_param_props);

    // PMC_NOC_AXI_0' transactor ports

    mp_PMC_NOC_AXI_0_transactor->ARADDR(PMC_NOC_AXI_0_araddr);
    mp_PMC_NOC_AXI_0_transactor->ARBURST(PMC_NOC_AXI_0_arburst);
    mp_PMC_NOC_AXI_0_transactor->ARCACHE(PMC_NOC_AXI_0_arcache);
    mp_PMC_NOC_AXI_0_transactor->ARID(PMC_NOC_AXI_0_arid);
    mp_PMC_NOC_AXI_0_transactor->ARLEN(PMC_NOC_AXI_0_arlen);
    mp_PMC_NOC_AXI_0_transactor->ARLOCK(PMC_NOC_AXI_0_arlock);
    mp_PMC_NOC_AXI_0_transactor->ARPROT(PMC_NOC_AXI_0_arprot);
    mp_PMC_NOC_AXI_0_transactor->ARQOS(PMC_NOC_AXI_0_arqos);
    mp_PMC_NOC_AXI_0_transactor->ARREGION(PMC_NOC_AXI_0_arregion);
    mp_PMC_NOC_AXI_0_transactor->ARSIZE(PMC_NOC_AXI_0_arsize);
    mp_PMC_NOC_AXI_0_transactor->ARUSER(PMC_NOC_AXI_0_aruser);
    mp_PMC_NOC_AXI_0_transactor->ARVALID(PMC_NOC_AXI_0_arvalid);
    mp_PMC_NOC_AXI_0_transactor->AWADDR(PMC_NOC_AXI_0_awaddr);
    mp_PMC_NOC_AXI_0_transactor->AWBURST(PMC_NOC_AXI_0_awburst);
    mp_PMC_NOC_AXI_0_transactor->AWCACHE(PMC_NOC_AXI_0_awcache);
    mp_PMC_NOC_AXI_0_transactor->AWID(PMC_NOC_AXI_0_awid);
    mp_PMC_NOC_AXI_0_transactor->AWLEN(PMC_NOC_AXI_0_awlen);
    mp_PMC_NOC_AXI_0_transactor->AWLOCK(PMC_NOC_AXI_0_awlock);
    mp_PMC_NOC_AXI_0_transactor->AWPROT(PMC_NOC_AXI_0_awprot);
    mp_PMC_NOC_AXI_0_transactor->AWQOS(PMC_NOC_AXI_0_awqos);
    mp_PMC_NOC_AXI_0_transactor->AWREGION(PMC_NOC_AXI_0_awregion);
    mp_PMC_NOC_AXI_0_transactor->AWSIZE(PMC_NOC_AXI_0_awsize);
    mp_PMC_NOC_AXI_0_transactor->AWUSER(PMC_NOC_AXI_0_awuser);
    mp_PMC_NOC_AXI_0_transactor->AWVALID(PMC_NOC_AXI_0_awvalid);
    mp_PMC_NOC_AXI_0_transactor->BREADY(PMC_NOC_AXI_0_bready);
    mp_PMC_NOC_AXI_0_transactor->RREADY(PMC_NOC_AXI_0_rready);
    mp_PMC_NOC_AXI_0_transactor->WDATA(PMC_NOC_AXI_0_wdata);
    mp_PMC_NOC_AXI_0_transactor->WLAST(PMC_NOC_AXI_0_wlast);
    mp_PMC_NOC_AXI_0_transactor->WSTRB(PMC_NOC_AXI_0_wstrb);
    mp_PMC_NOC_AXI_0_transactor->WUSER(PMC_NOC_AXI_0_wuser);
    mp_PMC_NOC_AXI_0_transactor->WVALID(PMC_NOC_AXI_0_wvalid);
    mp_PMC_NOC_AXI_0_transactor->ARREADY(PMC_NOC_AXI_0_arready);
    mp_PMC_NOC_AXI_0_transactor->AWREADY(PMC_NOC_AXI_0_awready);
    mp_PMC_NOC_AXI_0_transactor->BID(PMC_NOC_AXI_0_bid);
    mp_PMC_NOC_AXI_0_transactor->BRESP(PMC_NOC_AXI_0_bresp);
    mp_PMC_NOC_AXI_0_transactor->BUSER(PMC_NOC_AXI_0_buser);
    mp_PMC_NOC_AXI_0_transactor->BVALID(PMC_NOC_AXI_0_bvalid);
    mp_PMC_NOC_AXI_0_transactor->RDATA(PMC_NOC_AXI_0_rdata);
    mp_PMC_NOC_AXI_0_transactor->RID(PMC_NOC_AXI_0_rid);
    mp_PMC_NOC_AXI_0_transactor->RLAST(PMC_NOC_AXI_0_rlast);
    mp_PMC_NOC_AXI_0_transactor->RRESP(PMC_NOC_AXI_0_rresp);
    mp_PMC_NOC_AXI_0_transactor->RUSER(PMC_NOC_AXI_0_ruser);
    mp_PMC_NOC_AXI_0_transactor->RVALID(PMC_NOC_AXI_0_rvalid);
    mp_PMC_NOC_AXI_0_transactor->WREADY(PMC_NOC_AXI_0_wready);
    mp_PMC_NOC_AXI_0_transactor->CLK(pmc_axi_noc_axi0_clk);
    m_PMC_NOC_AXI_0_transactor_rst_signal.write(1);
    mp_PMC_NOC_AXI_0_transactor->RST(m_PMC_NOC_AXI_0_transactor_rst_signal);

    // PMC_NOC_AXI_0' transactor sockets

    mp_impl->PMC_NOC_AXI_0_tlm_aximm_read_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_write_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'NOC_PMC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "NOC_PMC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_PMC_AXI_0' transactor parameters
    xsc::common_cpp::properties NOC_PMC_AXI_0_transactor_param_props;
    NOC_PMC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_PMC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_PMC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_PMC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_PMC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_PMC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_PMC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk");
    NOC_PMC_AXI_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_PMC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_PMC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    NOC_PMC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PMC");
    NOC_PMC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    NOC_PMC_AXI_0_transactor_param_props.addString("INDEX", "0");
    NOC_PMC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_NOC_PMC_AXI_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,17,16,18,17>("NOC_PMC_AXI_0_transactor", NOC_PMC_AXI_0_transactor_param_props);

    // NOC_PMC_AXI_0' transactor ports

    mp_NOC_PMC_AXI_0_transactor->ARADDR(NOC_PMC_AXI_0_araddr);
    mp_NOC_PMC_AXI_0_transactor->ARBURST(NOC_PMC_AXI_0_arburst);
    mp_NOC_PMC_AXI_0_transactor->ARCACHE(NOC_PMC_AXI_0_arcache);
    mp_NOC_PMC_AXI_0_transactor->ARID(NOC_PMC_AXI_0_arid);
    mp_NOC_PMC_AXI_0_transactor->ARLEN(NOC_PMC_AXI_0_arlen);
    mp_NOC_PMC_AXI_0_transactor->ARLOCK(NOC_PMC_AXI_0_arlock);
    mp_NOC_PMC_AXI_0_transactor->ARPROT(NOC_PMC_AXI_0_arprot);
    mp_NOC_PMC_AXI_0_transactor->ARQOS(NOC_PMC_AXI_0_arqos);
    mp_NOC_PMC_AXI_0_transactor->ARREGION(NOC_PMC_AXI_0_arregion);
    mp_NOC_PMC_AXI_0_transactor->ARSIZE(NOC_PMC_AXI_0_arsize);
    mp_NOC_PMC_AXI_0_transactor->ARUSER(NOC_PMC_AXI_0_aruser);
    mp_NOC_PMC_AXI_0_transactor->ARVALID(NOC_PMC_AXI_0_arvalid);
    mp_NOC_PMC_AXI_0_transactor->AWADDR(NOC_PMC_AXI_0_awaddr);
    mp_NOC_PMC_AXI_0_transactor->AWBURST(NOC_PMC_AXI_0_awburst);
    mp_NOC_PMC_AXI_0_transactor->AWCACHE(NOC_PMC_AXI_0_awcache);
    mp_NOC_PMC_AXI_0_transactor->AWID(NOC_PMC_AXI_0_awid);
    mp_NOC_PMC_AXI_0_transactor->AWLEN(NOC_PMC_AXI_0_awlen);
    mp_NOC_PMC_AXI_0_transactor->AWLOCK(NOC_PMC_AXI_0_awlock);
    mp_NOC_PMC_AXI_0_transactor->AWPROT(NOC_PMC_AXI_0_awprot);
    mp_NOC_PMC_AXI_0_transactor->AWQOS(NOC_PMC_AXI_0_awqos);
    mp_NOC_PMC_AXI_0_transactor->AWREGION(NOC_PMC_AXI_0_awregion);
    mp_NOC_PMC_AXI_0_transactor->AWSIZE(NOC_PMC_AXI_0_awsize);
    mp_NOC_PMC_AXI_0_transactor->AWUSER(NOC_PMC_AXI_0_awuser);
    mp_NOC_PMC_AXI_0_transactor->AWVALID(NOC_PMC_AXI_0_awvalid);
    mp_NOC_PMC_AXI_0_transactor->BREADY(NOC_PMC_AXI_0_bready);
    mp_NOC_PMC_AXI_0_transactor->RREADY(NOC_PMC_AXI_0_rready);
    mp_NOC_PMC_AXI_0_transactor->WDATA(NOC_PMC_AXI_0_wdata);
    mp_NOC_PMC_AXI_0_transactor->WLAST(NOC_PMC_AXI_0_wlast);
    mp_NOC_PMC_AXI_0_transactor->WSTRB(NOC_PMC_AXI_0_wstrb);
    mp_NOC_PMC_AXI_0_transactor->WUSER(NOC_PMC_AXI_0_wuser);
    mp_NOC_PMC_AXI_0_transactor->WVALID(NOC_PMC_AXI_0_wvalid);
    mp_NOC_PMC_AXI_0_transactor->ARREADY(NOC_PMC_AXI_0_arready);
    mp_NOC_PMC_AXI_0_transactor->AWREADY(NOC_PMC_AXI_0_awready);
    mp_NOC_PMC_AXI_0_transactor->BID(NOC_PMC_AXI_0_bid);
    mp_NOC_PMC_AXI_0_transactor->BRESP(NOC_PMC_AXI_0_bresp);
    mp_NOC_PMC_AXI_0_transactor->BUSER(NOC_PMC_AXI_0_buser);
    mp_NOC_PMC_AXI_0_transactor->BVALID(NOC_PMC_AXI_0_bvalid);
    mp_NOC_PMC_AXI_0_transactor->RDATA(NOC_PMC_AXI_0_rdata);
    mp_NOC_PMC_AXI_0_transactor->RID(NOC_PMC_AXI_0_rid);
    mp_NOC_PMC_AXI_0_transactor->RLAST(NOC_PMC_AXI_0_rlast);
    mp_NOC_PMC_AXI_0_transactor->RRESP(NOC_PMC_AXI_0_rresp);
    mp_NOC_PMC_AXI_0_transactor->RUSER(NOC_PMC_AXI_0_ruser);
    mp_NOC_PMC_AXI_0_transactor->RVALID(NOC_PMC_AXI_0_rvalid);
    mp_NOC_PMC_AXI_0_transactor->WREADY(NOC_PMC_AXI_0_wready);
    mp_NOC_PMC_AXI_0_transactor->CLK(noc_pmc_axi_axi0_clk);
    m_NOC_PMC_AXI_0_transactor_rst_signal.write(1);
    mp_NOC_PMC_AXI_0_transactor->RST(m_NOC_PMC_AXI_0_transactor_rst_signal);

    // NOC_PMC_AXI_0' transactor sockets

    mp_impl->NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->RUSER(CPM_PCIE_NOC_0_ruser);
    mp_CPM_PCIE_NOC_0_transactor->WUSER(CPM_PCIE_NOC_0_wuser);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->RUSER(CPM_PCIE_NOC_1_ruser);
    mp_CPM_PCIE_NOC_1_transactor->WUSER(CPM_PCIE_NOC_1_wuser);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "300000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "full_blown_noc_clk_gen_0_axi_clk_0");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(dma0_intrfc_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
full_blown_versal_cips_0_0::full_blown_versal_cips_0_0(const sc_core::sc_module_name& nm) : full_blown_versal_cips_0_0_sc(nm), fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk"), fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk"), fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk"), fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk"), lpd_axi_noc_clk("lpd_axi_noc_clk"), pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk"), noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk"), gem0_tsu_timer_cnt("gem0_tsu_timer_cnt"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), dma0_intrfc_clk("dma0_intrfc_clk"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_intrfc_resetn("dma0_intrfc_resetn"), FPD_CCI_NOC_0_awid("FPD_CCI_NOC_0_awid"), FPD_CCI_NOC_0_awaddr("FPD_CCI_NOC_0_awaddr"), FPD_CCI_NOC_0_awlen("FPD_CCI_NOC_0_awlen"), FPD_CCI_NOC_0_awsize("FPD_CCI_NOC_0_awsize"), FPD_CCI_NOC_0_awburst("FPD_CCI_NOC_0_awburst"), FPD_CCI_NOC_0_awlock("FPD_CCI_NOC_0_awlock"), FPD_CCI_NOC_0_awcache("FPD_CCI_NOC_0_awcache"), FPD_CCI_NOC_0_awprot("FPD_CCI_NOC_0_awprot"), FPD_CCI_NOC_0_awvalid("FPD_CCI_NOC_0_awvalid"), FPD_CCI_NOC_0_awuser("FPD_CCI_NOC_0_awuser"), FPD_CCI_NOC_0_awready("FPD_CCI_NOC_0_awready"), FPD_CCI_NOC_0_wdata("FPD_CCI_NOC_0_wdata"), FPD_CCI_NOC_0_wstrb("FPD_CCI_NOC_0_wstrb"), FPD_CCI_NOC_0_wuser("FPD_CCI_NOC_0_wuser"), FPD_CCI_NOC_0_wlast("FPD_CCI_NOC_0_wlast"), FPD_CCI_NOC_0_wvalid("FPD_CCI_NOC_0_wvalid"), FPD_CCI_NOC_0_wready("FPD_CCI_NOC_0_wready"), FPD_CCI_NOC_0_bid("FPD_CCI_NOC_0_bid"), FPD_CCI_NOC_0_bresp("FPD_CCI_NOC_0_bresp"), FPD_CCI_NOC_0_bvalid("FPD_CCI_NOC_0_bvalid"), FPD_CCI_NOC_0_bready("FPD_CCI_NOC_0_bready"), FPD_CCI_NOC_0_arid("FPD_CCI_NOC_0_arid"), FPD_CCI_NOC_0_araddr("FPD_CCI_NOC_0_araddr"), FPD_CCI_NOC_0_arlen("FPD_CCI_NOC_0_arlen"), FPD_CCI_NOC_0_arsize("FPD_CCI_NOC_0_arsize"), FPD_CCI_NOC_0_arburst("FPD_CCI_NOC_0_arburst"), FPD_CCI_NOC_0_arlock("FPD_CCI_NOC_0_arlock"), FPD_CCI_NOC_0_arcache("FPD_CCI_NOC_0_arcache"), FPD_CCI_NOC_0_arprot("FPD_CCI_NOC_0_arprot"), FPD_CCI_NOC_0_arvalid("FPD_CCI_NOC_0_arvalid"), FPD_CCI_NOC_0_aruser("FPD_CCI_NOC_0_aruser"), FPD_CCI_NOC_0_arready("FPD_CCI_NOC_0_arready"), FPD_CCI_NOC_0_rid("FPD_CCI_NOC_0_rid"), FPD_CCI_NOC_0_rdata("FPD_CCI_NOC_0_rdata"), FPD_CCI_NOC_0_rresp("FPD_CCI_NOC_0_rresp"), FPD_CCI_NOC_0_rlast("FPD_CCI_NOC_0_rlast"), FPD_CCI_NOC_0_rvalid("FPD_CCI_NOC_0_rvalid"), FPD_CCI_NOC_0_rready("FPD_CCI_NOC_0_rready"), FPD_CCI_NOC_0_awqos("FPD_CCI_NOC_0_awqos"), FPD_CCI_NOC_0_arqos("FPD_CCI_NOC_0_arqos"), FPD_CCI_NOC_1_awid("FPD_CCI_NOC_1_awid"), FPD_CCI_NOC_1_awaddr("FPD_CCI_NOC_1_awaddr"), FPD_CCI_NOC_1_awlen("FPD_CCI_NOC_1_awlen"), FPD_CCI_NOC_1_awsize("FPD_CCI_NOC_1_awsize"), FPD_CCI_NOC_1_awburst("FPD_CCI_NOC_1_awburst"), FPD_CCI_NOC_1_awlock("FPD_CCI_NOC_1_awlock"), FPD_CCI_NOC_1_awcache("FPD_CCI_NOC_1_awcache"), FPD_CCI_NOC_1_awprot("FPD_CCI_NOC_1_awprot"), FPD_CCI_NOC_1_awvalid("FPD_CCI_NOC_1_awvalid"), FPD_CCI_NOC_1_awuser("FPD_CCI_NOC_1_awuser"), FPD_CCI_NOC_1_awready("FPD_CCI_NOC_1_awready"), FPD_CCI_NOC_1_wdata("FPD_CCI_NOC_1_wdata"), FPD_CCI_NOC_1_wstrb("FPD_CCI_NOC_1_wstrb"), FPD_CCI_NOC_1_wuser("FPD_CCI_NOC_1_wuser"), FPD_CCI_NOC_1_wlast("FPD_CCI_NOC_1_wlast"), FPD_CCI_NOC_1_wvalid("FPD_CCI_NOC_1_wvalid"), FPD_CCI_NOC_1_wready("FPD_CCI_NOC_1_wready"), FPD_CCI_NOC_1_bid("FPD_CCI_NOC_1_bid"), FPD_CCI_NOC_1_bresp("FPD_CCI_NOC_1_bresp"), FPD_CCI_NOC_1_bvalid("FPD_CCI_NOC_1_bvalid"), FPD_CCI_NOC_1_bready("FPD_CCI_NOC_1_bready"), FPD_CCI_NOC_1_arid("FPD_CCI_NOC_1_arid"), FPD_CCI_NOC_1_araddr("FPD_CCI_NOC_1_araddr"), FPD_CCI_NOC_1_arlen("FPD_CCI_NOC_1_arlen"), FPD_CCI_NOC_1_arsize("FPD_CCI_NOC_1_arsize"), FPD_CCI_NOC_1_arburst("FPD_CCI_NOC_1_arburst"), FPD_CCI_NOC_1_arlock("FPD_CCI_NOC_1_arlock"), FPD_CCI_NOC_1_arcache("FPD_CCI_NOC_1_arcache"), FPD_CCI_NOC_1_arprot("FPD_CCI_NOC_1_arprot"), FPD_CCI_NOC_1_arvalid("FPD_CCI_NOC_1_arvalid"), FPD_CCI_NOC_1_aruser("FPD_CCI_NOC_1_aruser"), FPD_CCI_NOC_1_arready("FPD_CCI_NOC_1_arready"), FPD_CCI_NOC_1_rid("FPD_CCI_NOC_1_rid"), FPD_CCI_NOC_1_rdata("FPD_CCI_NOC_1_rdata"), FPD_CCI_NOC_1_rresp("FPD_CCI_NOC_1_rresp"), FPD_CCI_NOC_1_rlast("FPD_CCI_NOC_1_rlast"), FPD_CCI_NOC_1_rvalid("FPD_CCI_NOC_1_rvalid"), FPD_CCI_NOC_1_rready("FPD_CCI_NOC_1_rready"), FPD_CCI_NOC_1_awqos("FPD_CCI_NOC_1_awqos"), FPD_CCI_NOC_1_arqos("FPD_CCI_NOC_1_arqos"), FPD_CCI_NOC_2_awid("FPD_CCI_NOC_2_awid"), FPD_CCI_NOC_2_awaddr("FPD_CCI_NOC_2_awaddr"), FPD_CCI_NOC_2_awlen("FPD_CCI_NOC_2_awlen"), FPD_CCI_NOC_2_awsize("FPD_CCI_NOC_2_awsize"), FPD_CCI_NOC_2_awburst("FPD_CCI_NOC_2_awburst"), FPD_CCI_NOC_2_awlock("FPD_CCI_NOC_2_awlock"), FPD_CCI_NOC_2_awcache("FPD_CCI_NOC_2_awcache"), FPD_CCI_NOC_2_awprot("FPD_CCI_NOC_2_awprot"), FPD_CCI_NOC_2_awvalid("FPD_CCI_NOC_2_awvalid"), FPD_CCI_NOC_2_awuser("FPD_CCI_NOC_2_awuser"), FPD_CCI_NOC_2_awready("FPD_CCI_NOC_2_awready"), FPD_CCI_NOC_2_wdata("FPD_CCI_NOC_2_wdata"), FPD_CCI_NOC_2_wstrb("FPD_CCI_NOC_2_wstrb"), FPD_CCI_NOC_2_wuser("FPD_CCI_NOC_2_wuser"), FPD_CCI_NOC_2_wlast("FPD_CCI_NOC_2_wlast"), FPD_CCI_NOC_2_wvalid("FPD_CCI_NOC_2_wvalid"), FPD_CCI_NOC_2_wready("FPD_CCI_NOC_2_wready"), FPD_CCI_NOC_2_bid("FPD_CCI_NOC_2_bid"), FPD_CCI_NOC_2_bresp("FPD_CCI_NOC_2_bresp"), FPD_CCI_NOC_2_bvalid("FPD_CCI_NOC_2_bvalid"), FPD_CCI_NOC_2_bready("FPD_CCI_NOC_2_bready"), FPD_CCI_NOC_2_arid("FPD_CCI_NOC_2_arid"), FPD_CCI_NOC_2_araddr("FPD_CCI_NOC_2_araddr"), FPD_CCI_NOC_2_arlen("FPD_CCI_NOC_2_arlen"), FPD_CCI_NOC_2_arsize("FPD_CCI_NOC_2_arsize"), FPD_CCI_NOC_2_arburst("FPD_CCI_NOC_2_arburst"), FPD_CCI_NOC_2_arlock("FPD_CCI_NOC_2_arlock"), FPD_CCI_NOC_2_arcache("FPD_CCI_NOC_2_arcache"), FPD_CCI_NOC_2_arprot("FPD_CCI_NOC_2_arprot"), FPD_CCI_NOC_2_arvalid("FPD_CCI_NOC_2_arvalid"), FPD_CCI_NOC_2_aruser("FPD_CCI_NOC_2_aruser"), FPD_CCI_NOC_2_arready("FPD_CCI_NOC_2_arready"), FPD_CCI_NOC_2_rid("FPD_CCI_NOC_2_rid"), FPD_CCI_NOC_2_rdata("FPD_CCI_NOC_2_rdata"), FPD_CCI_NOC_2_rresp("FPD_CCI_NOC_2_rresp"), FPD_CCI_NOC_2_rlast("FPD_CCI_NOC_2_rlast"), FPD_CCI_NOC_2_rvalid("FPD_CCI_NOC_2_rvalid"), FPD_CCI_NOC_2_rready("FPD_CCI_NOC_2_rready"), FPD_CCI_NOC_2_awqos("FPD_CCI_NOC_2_awqos"), FPD_CCI_NOC_2_arqos("FPD_CCI_NOC_2_arqos"), FPD_CCI_NOC_3_awid("FPD_CCI_NOC_3_awid"), FPD_CCI_NOC_3_awaddr("FPD_CCI_NOC_3_awaddr"), FPD_CCI_NOC_3_awlen("FPD_CCI_NOC_3_awlen"), FPD_CCI_NOC_3_awsize("FPD_CCI_NOC_3_awsize"), FPD_CCI_NOC_3_awburst("FPD_CCI_NOC_3_awburst"), FPD_CCI_NOC_3_awlock("FPD_CCI_NOC_3_awlock"), FPD_CCI_NOC_3_awcache("FPD_CCI_NOC_3_awcache"), FPD_CCI_NOC_3_awprot("FPD_CCI_NOC_3_awprot"), FPD_CCI_NOC_3_awvalid("FPD_CCI_NOC_3_awvalid"), FPD_CCI_NOC_3_awuser("FPD_CCI_NOC_3_awuser"), FPD_CCI_NOC_3_awready("FPD_CCI_NOC_3_awready"), FPD_CCI_NOC_3_wdata("FPD_CCI_NOC_3_wdata"), FPD_CCI_NOC_3_wstrb("FPD_CCI_NOC_3_wstrb"), FPD_CCI_NOC_3_wuser("FPD_CCI_NOC_3_wuser"), FPD_CCI_NOC_3_wlast("FPD_CCI_NOC_3_wlast"), FPD_CCI_NOC_3_wvalid("FPD_CCI_NOC_3_wvalid"), FPD_CCI_NOC_3_wready("FPD_CCI_NOC_3_wready"), FPD_CCI_NOC_3_bid("FPD_CCI_NOC_3_bid"), FPD_CCI_NOC_3_bresp("FPD_CCI_NOC_3_bresp"), FPD_CCI_NOC_3_bvalid("FPD_CCI_NOC_3_bvalid"), FPD_CCI_NOC_3_bready("FPD_CCI_NOC_3_bready"), FPD_CCI_NOC_3_arid("FPD_CCI_NOC_3_arid"), FPD_CCI_NOC_3_araddr("FPD_CCI_NOC_3_araddr"), FPD_CCI_NOC_3_arlen("FPD_CCI_NOC_3_arlen"), FPD_CCI_NOC_3_arsize("FPD_CCI_NOC_3_arsize"), FPD_CCI_NOC_3_arburst("FPD_CCI_NOC_3_arburst"), FPD_CCI_NOC_3_arlock("FPD_CCI_NOC_3_arlock"), FPD_CCI_NOC_3_arcache("FPD_CCI_NOC_3_arcache"), FPD_CCI_NOC_3_arprot("FPD_CCI_NOC_3_arprot"), FPD_CCI_NOC_3_arvalid("FPD_CCI_NOC_3_arvalid"), FPD_CCI_NOC_3_aruser("FPD_CCI_NOC_3_aruser"), FPD_CCI_NOC_3_arready("FPD_CCI_NOC_3_arready"), FPD_CCI_NOC_3_rid("FPD_CCI_NOC_3_rid"), FPD_CCI_NOC_3_rdata("FPD_CCI_NOC_3_rdata"), FPD_CCI_NOC_3_rresp("FPD_CCI_NOC_3_rresp"), FPD_CCI_NOC_3_rlast("FPD_CCI_NOC_3_rlast"), FPD_CCI_NOC_3_rvalid("FPD_CCI_NOC_3_rvalid"), FPD_CCI_NOC_3_rready("FPD_CCI_NOC_3_rready"), FPD_CCI_NOC_3_awqos("FPD_CCI_NOC_3_awqos"), FPD_CCI_NOC_3_arqos("FPD_CCI_NOC_3_arqos"), LPD_AXI_NOC_0_awid("LPD_AXI_NOC_0_awid"), LPD_AXI_NOC_0_awaddr("LPD_AXI_NOC_0_awaddr"), LPD_AXI_NOC_0_awlen("LPD_AXI_NOC_0_awlen"), LPD_AXI_NOC_0_awsize("LPD_AXI_NOC_0_awsize"), LPD_AXI_NOC_0_awburst("LPD_AXI_NOC_0_awburst"), LPD_AXI_NOC_0_awlock("LPD_AXI_NOC_0_awlock"), LPD_AXI_NOC_0_awcache("LPD_AXI_NOC_0_awcache"), LPD_AXI_NOC_0_awprot("LPD_AXI_NOC_0_awprot"), LPD_AXI_NOC_0_awvalid("LPD_AXI_NOC_0_awvalid"), LPD_AXI_NOC_0_awuser("LPD_AXI_NOC_0_awuser"), LPD_AXI_NOC_0_awready("LPD_AXI_NOC_0_awready"), LPD_AXI_NOC_0_wdata("LPD_AXI_NOC_0_wdata"), LPD_AXI_NOC_0_wstrb("LPD_AXI_NOC_0_wstrb"), LPD_AXI_NOC_0_wlast("LPD_AXI_NOC_0_wlast"), LPD_AXI_NOC_0_wvalid("LPD_AXI_NOC_0_wvalid"), LPD_AXI_NOC_0_wready("LPD_AXI_NOC_0_wready"), LPD_AXI_NOC_0_bid("LPD_AXI_NOC_0_bid"), LPD_AXI_NOC_0_bresp("LPD_AXI_NOC_0_bresp"), LPD_AXI_NOC_0_bvalid("LPD_AXI_NOC_0_bvalid"), LPD_AXI_NOC_0_bready("LPD_AXI_NOC_0_bready"), LPD_AXI_NOC_0_arid("LPD_AXI_NOC_0_arid"), LPD_AXI_NOC_0_araddr("LPD_AXI_NOC_0_araddr"), LPD_AXI_NOC_0_arlen("LPD_AXI_NOC_0_arlen"), LPD_AXI_NOC_0_arsize("LPD_AXI_NOC_0_arsize"), LPD_AXI_NOC_0_arburst("LPD_AXI_NOC_0_arburst"), LPD_AXI_NOC_0_arlock("LPD_AXI_NOC_0_arlock"), LPD_AXI_NOC_0_arcache("LPD_AXI_NOC_0_arcache"), LPD_AXI_NOC_0_arprot("LPD_AXI_NOC_0_arprot"), LPD_AXI_NOC_0_arvalid("LPD_AXI_NOC_0_arvalid"), LPD_AXI_NOC_0_aruser("LPD_AXI_NOC_0_aruser"), LPD_AXI_NOC_0_arready("LPD_AXI_NOC_0_arready"), LPD_AXI_NOC_0_rid("LPD_AXI_NOC_0_rid"), LPD_AXI_NOC_0_rdata("LPD_AXI_NOC_0_rdata"), LPD_AXI_NOC_0_rresp("LPD_AXI_NOC_0_rresp"), LPD_AXI_NOC_0_rlast("LPD_AXI_NOC_0_rlast"), LPD_AXI_NOC_0_rvalid("LPD_AXI_NOC_0_rvalid"), LPD_AXI_NOC_0_rready("LPD_AXI_NOC_0_rready"), LPD_AXI_NOC_0_awqos("LPD_AXI_NOC_0_awqos"), LPD_AXI_NOC_0_arqos("LPD_AXI_NOC_0_arqos"), PMC_NOC_AXI_0_araddr("PMC_NOC_AXI_0_araddr"), PMC_NOC_AXI_0_arburst("PMC_NOC_AXI_0_arburst"), PMC_NOC_AXI_0_arcache("PMC_NOC_AXI_0_arcache"), PMC_NOC_AXI_0_arid("PMC_NOC_AXI_0_arid"), PMC_NOC_AXI_0_arlen("PMC_NOC_AXI_0_arlen"), PMC_NOC_AXI_0_arlock("PMC_NOC_AXI_0_arlock"), PMC_NOC_AXI_0_arprot("PMC_NOC_AXI_0_arprot"), PMC_NOC_AXI_0_arqos("PMC_NOC_AXI_0_arqos"), PMC_NOC_AXI_0_arregion("PMC_NOC_AXI_0_arregion"), PMC_NOC_AXI_0_arsize("PMC_NOC_AXI_0_arsize"), PMC_NOC_AXI_0_aruser("PMC_NOC_AXI_0_aruser"), PMC_NOC_AXI_0_arvalid("PMC_NOC_AXI_0_arvalid"), PMC_NOC_AXI_0_awaddr("PMC_NOC_AXI_0_awaddr"), PMC_NOC_AXI_0_awburst("PMC_NOC_AXI_0_awburst"), PMC_NOC_AXI_0_awcache("PMC_NOC_AXI_0_awcache"), PMC_NOC_AXI_0_awid("PMC_NOC_AXI_0_awid"), PMC_NOC_AXI_0_awlen("PMC_NOC_AXI_0_awlen"), PMC_NOC_AXI_0_awlock("PMC_NOC_AXI_0_awlock"), PMC_NOC_AXI_0_awprot("PMC_NOC_AXI_0_awprot"), PMC_NOC_AXI_0_awqos("PMC_NOC_AXI_0_awqos"), PMC_NOC_AXI_0_awregion("PMC_NOC_AXI_0_awregion"), PMC_NOC_AXI_0_awsize("PMC_NOC_AXI_0_awsize"), PMC_NOC_AXI_0_awuser("PMC_NOC_AXI_0_awuser"), PMC_NOC_AXI_0_awvalid("PMC_NOC_AXI_0_awvalid"), PMC_NOC_AXI_0_bready("PMC_NOC_AXI_0_bready"), PMC_NOC_AXI_0_rready("PMC_NOC_AXI_0_rready"), PMC_NOC_AXI_0_wdata("PMC_NOC_AXI_0_wdata"), PMC_NOC_AXI_0_wid("PMC_NOC_AXI_0_wid"), PMC_NOC_AXI_0_wlast("PMC_NOC_AXI_0_wlast"), PMC_NOC_AXI_0_wstrb("PMC_NOC_AXI_0_wstrb"), PMC_NOC_AXI_0_wuser("PMC_NOC_AXI_0_wuser"), PMC_NOC_AXI_0_wvalid("PMC_NOC_AXI_0_wvalid"), PMC_NOC_AXI_0_arready("PMC_NOC_AXI_0_arready"), PMC_NOC_AXI_0_awready("PMC_NOC_AXI_0_awready"), PMC_NOC_AXI_0_bid("PMC_NOC_AXI_0_bid"), PMC_NOC_AXI_0_bresp("PMC_NOC_AXI_0_bresp"), PMC_NOC_AXI_0_buser("PMC_NOC_AXI_0_buser"), PMC_NOC_AXI_0_bvalid("PMC_NOC_AXI_0_bvalid"), PMC_NOC_AXI_0_rdata("PMC_NOC_AXI_0_rdata"), PMC_NOC_AXI_0_rid("PMC_NOC_AXI_0_rid"), PMC_NOC_AXI_0_rlast("PMC_NOC_AXI_0_rlast"), PMC_NOC_AXI_0_rresp("PMC_NOC_AXI_0_rresp"), PMC_NOC_AXI_0_ruser("PMC_NOC_AXI_0_ruser"), PMC_NOC_AXI_0_rvalid("PMC_NOC_AXI_0_rvalid"), PMC_NOC_AXI_0_wready("PMC_NOC_AXI_0_wready"), NOC_PMC_AXI_0_araddr("NOC_PMC_AXI_0_araddr"), NOC_PMC_AXI_0_arburst("NOC_PMC_AXI_0_arburst"), NOC_PMC_AXI_0_arcache("NOC_PMC_AXI_0_arcache"), NOC_PMC_AXI_0_arid("NOC_PMC_AXI_0_arid"), NOC_PMC_AXI_0_arlen("NOC_PMC_AXI_0_arlen"), NOC_PMC_AXI_0_arlock("NOC_PMC_AXI_0_arlock"), NOC_PMC_AXI_0_arprot("NOC_PMC_AXI_0_arprot"), NOC_PMC_AXI_0_arqos("NOC_PMC_AXI_0_arqos"), NOC_PMC_AXI_0_arregion("NOC_PMC_AXI_0_arregion"), NOC_PMC_AXI_0_arsize("NOC_PMC_AXI_0_arsize"), NOC_PMC_AXI_0_aruser("NOC_PMC_AXI_0_aruser"), NOC_PMC_AXI_0_arvalid("NOC_PMC_AXI_0_arvalid"), NOC_PMC_AXI_0_awaddr("NOC_PMC_AXI_0_awaddr"), NOC_PMC_AXI_0_awburst("NOC_PMC_AXI_0_awburst"), NOC_PMC_AXI_0_awcache("NOC_PMC_AXI_0_awcache"), NOC_PMC_AXI_0_awid("NOC_PMC_AXI_0_awid"), NOC_PMC_AXI_0_awlen("NOC_PMC_AXI_0_awlen"), NOC_PMC_AXI_0_awlock("NOC_PMC_AXI_0_awlock"), NOC_PMC_AXI_0_awprot("NOC_PMC_AXI_0_awprot"), NOC_PMC_AXI_0_awqos("NOC_PMC_AXI_0_awqos"), NOC_PMC_AXI_0_awregion("NOC_PMC_AXI_0_awregion"), NOC_PMC_AXI_0_awsize("NOC_PMC_AXI_0_awsize"), NOC_PMC_AXI_0_awuser("NOC_PMC_AXI_0_awuser"), NOC_PMC_AXI_0_awvalid("NOC_PMC_AXI_0_awvalid"), NOC_PMC_AXI_0_bready("NOC_PMC_AXI_0_bready"), NOC_PMC_AXI_0_rready("NOC_PMC_AXI_0_rready"), NOC_PMC_AXI_0_wdata("NOC_PMC_AXI_0_wdata"), NOC_PMC_AXI_0_wid("NOC_PMC_AXI_0_wid"), NOC_PMC_AXI_0_wlast("NOC_PMC_AXI_0_wlast"), NOC_PMC_AXI_0_wstrb("NOC_PMC_AXI_0_wstrb"), NOC_PMC_AXI_0_wuser("NOC_PMC_AXI_0_wuser"), NOC_PMC_AXI_0_wvalid("NOC_PMC_AXI_0_wvalid"), NOC_PMC_AXI_0_arready("NOC_PMC_AXI_0_arready"), NOC_PMC_AXI_0_awready("NOC_PMC_AXI_0_awready"), NOC_PMC_AXI_0_bid("NOC_PMC_AXI_0_bid"), NOC_PMC_AXI_0_bresp("NOC_PMC_AXI_0_bresp"), NOC_PMC_AXI_0_buser("NOC_PMC_AXI_0_buser"), NOC_PMC_AXI_0_bvalid("NOC_PMC_AXI_0_bvalid"), NOC_PMC_AXI_0_rdata("NOC_PMC_AXI_0_rdata"), NOC_PMC_AXI_0_rid("NOC_PMC_AXI_0_rid"), NOC_PMC_AXI_0_rlast("NOC_PMC_AXI_0_rlast"), NOC_PMC_AXI_0_rresp("NOC_PMC_AXI_0_rresp"), NOC_PMC_AXI_0_ruser("NOC_PMC_AXI_0_ruser"), NOC_PMC_AXI_0_rvalid("NOC_PMC_AXI_0_rvalid"), NOC_PMC_AXI_0_wready("NOC_PMC_AXI_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_ruser("CPM_PCIE_NOC_0_ruser"), CPM_PCIE_NOC_0_wuser("CPM_PCIE_NOC_0_wuser"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_ruser("CPM_PCIE_NOC_1_ruser"), CPM_PCIE_NOC_1_wuser("CPM_PCIE_NOC_1_wuser"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp"), dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch"), dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id"), dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready"), dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast"), dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid"), dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc"), dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata"), dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty"), dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc"), dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker"), dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt"), dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len"), dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid"), dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id"), dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker"), dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig"), dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size"), dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid"), dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker"), dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id"), dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx"), dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx"), dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id"), dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready"), dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid"), dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar"), dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data"), dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type"), dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast"), dma0_m_axis_h2c_err("dma0_m_axis_h2c_err"), dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid"), dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata"), dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte"), dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready"), dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc"), dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty"), dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid"), dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata"), dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id"), dma0_axis_c2h_status_last("dma0_axis_c2h_status_last"), dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop"), dma0_axis_c2h_status_error("dma0_axis_c2h_status_error"), dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid"), dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp"), dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid"), dma0_qsts_out_vld("dma0_qsts_out_vld"), dma0_qsts_out_op("dma0_qsts_out_op"), dma0_qsts_out_rdy("dma0_qsts_out_rdy"), dma0_qsts_out_qid("dma0_qsts_out_qid"), dma0_qsts_out_data("dma0_qsts_out_data"), dma0_qsts_out_port_id("dma0_qsts_out_port_id"), dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy"), dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir"), dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid"), dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence"), dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid"), dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt"), dma0_usr_irq_ack("dma0_usr_irq_ack"), dma0_usr_irq_fail("dma0_usr_irq_fail"), dma0_usr_irq_valid("dma0_usr_irq_valid"), dma0_usr_irq_vec("dma0_usr_irq_vec"), dma0_usr_irq_fnc("dma0_usr_irq_fnc"), dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm"), dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen"), dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp"), dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir"), dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error"), dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid"), dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv"), dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm"), dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy"), dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid"), dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl"), dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx"), dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id"), dma0_usr_flr_set("dma0_usr_flr_set"), dma0_usr_flr_clear("dma0_usr_flr_clear"), dma0_usr_flr_fnc("dma0_usr_flr_fnc"), dma0_usr_flr_done_vld("dma0_usr_flr_done_vld"), dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk);
  mp_impl->fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk);
  mp_impl->fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk);
  mp_impl->fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk);
  mp_impl->lpd_axi_noc_clk(lpd_axi_noc_clk);
  mp_impl->pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk);
  mp_impl->noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk);
  mp_impl->gem0_tsu_timer_cnt(gem0_tsu_timer_cnt);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->dma0_intrfc_clk(dma0_intrfc_clk);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_intrfc_resetn(dma0_intrfc_resetn);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp);
  mp_impl->dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch);
  mp_impl->dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id);
  mp_impl->dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready);
  mp_impl->dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast);
  mp_impl->dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid);
  mp_impl->dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc);
  mp_impl->dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata);
  mp_impl->dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty);
  mp_impl->dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc);
  mp_impl->dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker);
  mp_impl->dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt);
  mp_impl->dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len);
  mp_impl->dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid);
  mp_impl->dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig);
  mp_impl->dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size);
  mp_impl->dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid);
  mp_impl->dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id);
  mp_impl->dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready);
  mp_impl->dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid);
  mp_impl->dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar);
  mp_impl->dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data);
  mp_impl->dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type);
  mp_impl->dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast);
  mp_impl->dma0_m_axis_h2c_err(dma0_m_axis_h2c_err);
  mp_impl->dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid);
  mp_impl->dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata);
  mp_impl->dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte);
  mp_impl->dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready);
  mp_impl->dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc);
  mp_impl->dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty);
  mp_impl->dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid);
  mp_impl->dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata);
  mp_impl->dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id);
  mp_impl->dma0_axis_c2h_status_last(dma0_axis_c2h_status_last);
  mp_impl->dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop);
  mp_impl->dma0_axis_c2h_status_error(dma0_axis_c2h_status_error);
  mp_impl->dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid);
  mp_impl->dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp);
  mp_impl->dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid);
  mp_impl->dma0_qsts_out_vld(dma0_qsts_out_vld);
  mp_impl->dma0_qsts_out_op(dma0_qsts_out_op);
  mp_impl->dma0_qsts_out_rdy(dma0_qsts_out_rdy);
  mp_impl->dma0_qsts_out_qid(dma0_qsts_out_qid);
  mp_impl->dma0_qsts_out_data(dma0_qsts_out_data);
  mp_impl->dma0_qsts_out_port_id(dma0_qsts_out_port_id);
  mp_impl->dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy);
  mp_impl->dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir);
  mp_impl->dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid);
  mp_impl->dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence);
  mp_impl->dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid);
  mp_impl->dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt);
  mp_impl->dma0_usr_irq_ack(dma0_usr_irq_ack);
  mp_impl->dma0_usr_irq_fail(dma0_usr_irq_fail);
  mp_impl->dma0_usr_irq_valid(dma0_usr_irq_valid);
  mp_impl->dma0_usr_irq_vec(dma0_usr_irq_vec);
  mp_impl->dma0_usr_irq_fnc(dma0_usr_irq_fnc);
  mp_impl->dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm);
  mp_impl->dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen);
  mp_impl->dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp);
  mp_impl->dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir);
  mp_impl->dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error);
  mp_impl->dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid);
  mp_impl->dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv);
  mp_impl->dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm);
  mp_impl->dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy);
  mp_impl->dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid);
  mp_impl->dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl);
  mp_impl->dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx);
  mp_impl->dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id);
  mp_impl->dma0_usr_flr_set(dma0_usr_flr_set);
  mp_impl->dma0_usr_flr_clear(dma0_usr_flr_clear);
  mp_impl->dma0_usr_flr_fnc(dma0_usr_flr_fnc);
  mp_impl->dma0_usr_flr_done_vld(dma0_usr_flr_done_vld);
  mp_impl->dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_FPD_CCI_NOC_0_transactor = NULL;
  mp_FPD_CCI_NOC_1_transactor = NULL;
  mp_FPD_CCI_NOC_2_transactor = NULL;
  mp_FPD_CCI_NOC_3_transactor = NULL;
  mp_LPD_AXI_NOC_0_transactor = NULL;
  mp_PMC_NOC_AXI_0_transactor = NULL;
  mp_NOC_PMC_AXI_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void full_blown_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'FPD_CCI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_0' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_0_transactor_param_props;
    FPD_CCI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk");
    FPD_CCI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_FPD_CCI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_0_transactor", FPD_CCI_NOC_0_transactor_param_props);

    // FPD_CCI_NOC_0' transactor ports

    mp_FPD_CCI_NOC_0_transactor->AWID(FPD_CCI_NOC_0_awid);
    mp_FPD_CCI_NOC_0_transactor->AWADDR(FPD_CCI_NOC_0_awaddr);
    mp_FPD_CCI_NOC_0_transactor->AWLEN(FPD_CCI_NOC_0_awlen);
    mp_FPD_CCI_NOC_0_transactor->AWSIZE(FPD_CCI_NOC_0_awsize);
    mp_FPD_CCI_NOC_0_transactor->AWBURST(FPD_CCI_NOC_0_awburst);
    mp_FPD_CCI_NOC_0_transactor->AWLOCK(FPD_CCI_NOC_0_awlock);
    mp_FPD_CCI_NOC_0_transactor->AWCACHE(FPD_CCI_NOC_0_awcache);
    mp_FPD_CCI_NOC_0_transactor->AWPROT(FPD_CCI_NOC_0_awprot);
    mp_FPD_CCI_NOC_0_transactor->AWVALID(FPD_CCI_NOC_0_awvalid);
    mp_FPD_CCI_NOC_0_transactor->AWUSER(FPD_CCI_NOC_0_awuser);
    mp_FPD_CCI_NOC_0_transactor->AWREADY(FPD_CCI_NOC_0_awready);
    mp_FPD_CCI_NOC_0_transactor->WDATA(FPD_CCI_NOC_0_wdata);
    mp_FPD_CCI_NOC_0_transactor->WSTRB(FPD_CCI_NOC_0_wstrb);
    mp_FPD_CCI_NOC_0_transactor->WUSER(FPD_CCI_NOC_0_wuser);
    mp_FPD_CCI_NOC_0_transactor->WLAST(FPD_CCI_NOC_0_wlast);
    mp_FPD_CCI_NOC_0_transactor->WVALID(FPD_CCI_NOC_0_wvalid);
    mp_FPD_CCI_NOC_0_transactor->WREADY(FPD_CCI_NOC_0_wready);
    mp_FPD_CCI_NOC_0_transactor->BID(FPD_CCI_NOC_0_bid);
    mp_FPD_CCI_NOC_0_transactor->BRESP(FPD_CCI_NOC_0_bresp);
    mp_FPD_CCI_NOC_0_transactor->BVALID(FPD_CCI_NOC_0_bvalid);
    mp_FPD_CCI_NOC_0_transactor->BREADY(FPD_CCI_NOC_0_bready);
    mp_FPD_CCI_NOC_0_transactor->ARID(FPD_CCI_NOC_0_arid);
    mp_FPD_CCI_NOC_0_transactor->ARADDR(FPD_CCI_NOC_0_araddr);
    mp_FPD_CCI_NOC_0_transactor->ARLEN(FPD_CCI_NOC_0_arlen);
    mp_FPD_CCI_NOC_0_transactor->ARSIZE(FPD_CCI_NOC_0_arsize);
    mp_FPD_CCI_NOC_0_transactor->ARBURST(FPD_CCI_NOC_0_arburst);
    mp_FPD_CCI_NOC_0_transactor->ARLOCK(FPD_CCI_NOC_0_arlock);
    mp_FPD_CCI_NOC_0_transactor->ARCACHE(FPD_CCI_NOC_0_arcache);
    mp_FPD_CCI_NOC_0_transactor->ARPROT(FPD_CCI_NOC_0_arprot);
    mp_FPD_CCI_NOC_0_transactor->ARVALID(FPD_CCI_NOC_0_arvalid);
    mp_FPD_CCI_NOC_0_transactor->ARUSER(FPD_CCI_NOC_0_aruser);
    mp_FPD_CCI_NOC_0_transactor->ARREADY(FPD_CCI_NOC_0_arready);
    mp_FPD_CCI_NOC_0_transactor->RID(FPD_CCI_NOC_0_rid);
    mp_FPD_CCI_NOC_0_transactor->RDATA(FPD_CCI_NOC_0_rdata);
    mp_FPD_CCI_NOC_0_transactor->RRESP(FPD_CCI_NOC_0_rresp);
    mp_FPD_CCI_NOC_0_transactor->RLAST(FPD_CCI_NOC_0_rlast);
    mp_FPD_CCI_NOC_0_transactor->RVALID(FPD_CCI_NOC_0_rvalid);
    mp_FPD_CCI_NOC_0_transactor->RREADY(FPD_CCI_NOC_0_rready);
    mp_FPD_CCI_NOC_0_transactor->AWQOS(FPD_CCI_NOC_0_awqos);
    mp_FPD_CCI_NOC_0_transactor->ARQOS(FPD_CCI_NOC_0_arqos);
    mp_FPD_CCI_NOC_0_transactor->CLK(fpd_cci_noc_axi0_clk);
    m_FPD_CCI_NOC_0_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_0_transactor->RST(m_FPD_CCI_NOC_0_transactor_rst_signal);

    // FPD_CCI_NOC_0' transactor sockets

    mp_impl->FPD_CCI_NOC_0_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_1' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_1_transactor_param_props;
    FPD_CCI_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_1_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk");
    FPD_CCI_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_FPD_CCI_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_1_transactor", FPD_CCI_NOC_1_transactor_param_props);

    // FPD_CCI_NOC_1' transactor ports

    mp_FPD_CCI_NOC_1_transactor->AWID(FPD_CCI_NOC_1_awid);
    mp_FPD_CCI_NOC_1_transactor->AWADDR(FPD_CCI_NOC_1_awaddr);
    mp_FPD_CCI_NOC_1_transactor->AWLEN(FPD_CCI_NOC_1_awlen);
    mp_FPD_CCI_NOC_1_transactor->AWSIZE(FPD_CCI_NOC_1_awsize);
    mp_FPD_CCI_NOC_1_transactor->AWBURST(FPD_CCI_NOC_1_awburst);
    mp_FPD_CCI_NOC_1_transactor->AWLOCK(FPD_CCI_NOC_1_awlock);
    mp_FPD_CCI_NOC_1_transactor->AWCACHE(FPD_CCI_NOC_1_awcache);
    mp_FPD_CCI_NOC_1_transactor->AWPROT(FPD_CCI_NOC_1_awprot);
    mp_FPD_CCI_NOC_1_transactor->AWVALID(FPD_CCI_NOC_1_awvalid);
    mp_FPD_CCI_NOC_1_transactor->AWUSER(FPD_CCI_NOC_1_awuser);
    mp_FPD_CCI_NOC_1_transactor->AWREADY(FPD_CCI_NOC_1_awready);
    mp_FPD_CCI_NOC_1_transactor->WDATA(FPD_CCI_NOC_1_wdata);
    mp_FPD_CCI_NOC_1_transactor->WSTRB(FPD_CCI_NOC_1_wstrb);
    mp_FPD_CCI_NOC_1_transactor->WUSER(FPD_CCI_NOC_1_wuser);
    mp_FPD_CCI_NOC_1_transactor->WLAST(FPD_CCI_NOC_1_wlast);
    mp_FPD_CCI_NOC_1_transactor->WVALID(FPD_CCI_NOC_1_wvalid);
    mp_FPD_CCI_NOC_1_transactor->WREADY(FPD_CCI_NOC_1_wready);
    mp_FPD_CCI_NOC_1_transactor->BID(FPD_CCI_NOC_1_bid);
    mp_FPD_CCI_NOC_1_transactor->BRESP(FPD_CCI_NOC_1_bresp);
    mp_FPD_CCI_NOC_1_transactor->BVALID(FPD_CCI_NOC_1_bvalid);
    mp_FPD_CCI_NOC_1_transactor->BREADY(FPD_CCI_NOC_1_bready);
    mp_FPD_CCI_NOC_1_transactor->ARID(FPD_CCI_NOC_1_arid);
    mp_FPD_CCI_NOC_1_transactor->ARADDR(FPD_CCI_NOC_1_araddr);
    mp_FPD_CCI_NOC_1_transactor->ARLEN(FPD_CCI_NOC_1_arlen);
    mp_FPD_CCI_NOC_1_transactor->ARSIZE(FPD_CCI_NOC_1_arsize);
    mp_FPD_CCI_NOC_1_transactor->ARBURST(FPD_CCI_NOC_1_arburst);
    mp_FPD_CCI_NOC_1_transactor->ARLOCK(FPD_CCI_NOC_1_arlock);
    mp_FPD_CCI_NOC_1_transactor->ARCACHE(FPD_CCI_NOC_1_arcache);
    mp_FPD_CCI_NOC_1_transactor->ARPROT(FPD_CCI_NOC_1_arprot);
    mp_FPD_CCI_NOC_1_transactor->ARVALID(FPD_CCI_NOC_1_arvalid);
    mp_FPD_CCI_NOC_1_transactor->ARUSER(FPD_CCI_NOC_1_aruser);
    mp_FPD_CCI_NOC_1_transactor->ARREADY(FPD_CCI_NOC_1_arready);
    mp_FPD_CCI_NOC_1_transactor->RID(FPD_CCI_NOC_1_rid);
    mp_FPD_CCI_NOC_1_transactor->RDATA(FPD_CCI_NOC_1_rdata);
    mp_FPD_CCI_NOC_1_transactor->RRESP(FPD_CCI_NOC_1_rresp);
    mp_FPD_CCI_NOC_1_transactor->RLAST(FPD_CCI_NOC_1_rlast);
    mp_FPD_CCI_NOC_1_transactor->RVALID(FPD_CCI_NOC_1_rvalid);
    mp_FPD_CCI_NOC_1_transactor->RREADY(FPD_CCI_NOC_1_rready);
    mp_FPD_CCI_NOC_1_transactor->AWQOS(FPD_CCI_NOC_1_awqos);
    mp_FPD_CCI_NOC_1_transactor->ARQOS(FPD_CCI_NOC_1_arqos);
    mp_FPD_CCI_NOC_1_transactor->CLK(fpd_cci_noc_axi1_clk);
    m_FPD_CCI_NOC_1_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_1_transactor->RST(m_FPD_CCI_NOC_1_transactor_rst_signal);

    // FPD_CCI_NOC_1' transactor sockets

    mp_impl->FPD_CCI_NOC_1_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_2' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_2_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_2' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_2_transactor_param_props;
    FPD_CCI_NOC_2_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_2_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_2_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_2_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_2_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_2_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk");
    FPD_CCI_NOC_2_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_2_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_2_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_2_transactor_param_props.addString("INDEX", "2");

    mp_FPD_CCI_NOC_2_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_2_transactor", FPD_CCI_NOC_2_transactor_param_props);

    // FPD_CCI_NOC_2' transactor ports

    mp_FPD_CCI_NOC_2_transactor->AWID(FPD_CCI_NOC_2_awid);
    mp_FPD_CCI_NOC_2_transactor->AWADDR(FPD_CCI_NOC_2_awaddr);
    mp_FPD_CCI_NOC_2_transactor->AWLEN(FPD_CCI_NOC_2_awlen);
    mp_FPD_CCI_NOC_2_transactor->AWSIZE(FPD_CCI_NOC_2_awsize);
    mp_FPD_CCI_NOC_2_transactor->AWBURST(FPD_CCI_NOC_2_awburst);
    mp_FPD_CCI_NOC_2_transactor->AWLOCK(FPD_CCI_NOC_2_awlock);
    mp_FPD_CCI_NOC_2_transactor->AWCACHE(FPD_CCI_NOC_2_awcache);
    mp_FPD_CCI_NOC_2_transactor->AWPROT(FPD_CCI_NOC_2_awprot);
    mp_FPD_CCI_NOC_2_transactor->AWVALID(FPD_CCI_NOC_2_awvalid);
    mp_FPD_CCI_NOC_2_transactor->AWUSER(FPD_CCI_NOC_2_awuser);
    mp_FPD_CCI_NOC_2_transactor->AWREADY(FPD_CCI_NOC_2_awready);
    mp_FPD_CCI_NOC_2_transactor->WDATA(FPD_CCI_NOC_2_wdata);
    mp_FPD_CCI_NOC_2_transactor->WSTRB(FPD_CCI_NOC_2_wstrb);
    mp_FPD_CCI_NOC_2_transactor->WUSER(FPD_CCI_NOC_2_wuser);
    mp_FPD_CCI_NOC_2_transactor->WLAST(FPD_CCI_NOC_2_wlast);
    mp_FPD_CCI_NOC_2_transactor->WVALID(FPD_CCI_NOC_2_wvalid);
    mp_FPD_CCI_NOC_2_transactor->WREADY(FPD_CCI_NOC_2_wready);
    mp_FPD_CCI_NOC_2_transactor->BID(FPD_CCI_NOC_2_bid);
    mp_FPD_CCI_NOC_2_transactor->BRESP(FPD_CCI_NOC_2_bresp);
    mp_FPD_CCI_NOC_2_transactor->BVALID(FPD_CCI_NOC_2_bvalid);
    mp_FPD_CCI_NOC_2_transactor->BREADY(FPD_CCI_NOC_2_bready);
    mp_FPD_CCI_NOC_2_transactor->ARID(FPD_CCI_NOC_2_arid);
    mp_FPD_CCI_NOC_2_transactor->ARADDR(FPD_CCI_NOC_2_araddr);
    mp_FPD_CCI_NOC_2_transactor->ARLEN(FPD_CCI_NOC_2_arlen);
    mp_FPD_CCI_NOC_2_transactor->ARSIZE(FPD_CCI_NOC_2_arsize);
    mp_FPD_CCI_NOC_2_transactor->ARBURST(FPD_CCI_NOC_2_arburst);
    mp_FPD_CCI_NOC_2_transactor->ARLOCK(FPD_CCI_NOC_2_arlock);
    mp_FPD_CCI_NOC_2_transactor->ARCACHE(FPD_CCI_NOC_2_arcache);
    mp_FPD_CCI_NOC_2_transactor->ARPROT(FPD_CCI_NOC_2_arprot);
    mp_FPD_CCI_NOC_2_transactor->ARVALID(FPD_CCI_NOC_2_arvalid);
    mp_FPD_CCI_NOC_2_transactor->ARUSER(FPD_CCI_NOC_2_aruser);
    mp_FPD_CCI_NOC_2_transactor->ARREADY(FPD_CCI_NOC_2_arready);
    mp_FPD_CCI_NOC_2_transactor->RID(FPD_CCI_NOC_2_rid);
    mp_FPD_CCI_NOC_2_transactor->RDATA(FPD_CCI_NOC_2_rdata);
    mp_FPD_CCI_NOC_2_transactor->RRESP(FPD_CCI_NOC_2_rresp);
    mp_FPD_CCI_NOC_2_transactor->RLAST(FPD_CCI_NOC_2_rlast);
    mp_FPD_CCI_NOC_2_transactor->RVALID(FPD_CCI_NOC_2_rvalid);
    mp_FPD_CCI_NOC_2_transactor->RREADY(FPD_CCI_NOC_2_rready);
    mp_FPD_CCI_NOC_2_transactor->AWQOS(FPD_CCI_NOC_2_awqos);
    mp_FPD_CCI_NOC_2_transactor->ARQOS(FPD_CCI_NOC_2_arqos);
    mp_FPD_CCI_NOC_2_transactor->CLK(fpd_cci_noc_axi2_clk);
    m_FPD_CCI_NOC_2_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_2_transactor->RST(m_FPD_CCI_NOC_2_transactor_rst_signal);

    // FPD_CCI_NOC_2' transactor sockets

    mp_impl->FPD_CCI_NOC_2_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'FPD_CCI_NOC_3' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_3_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'FPD_CCI_NOC_3' transactor parameters
    xsc::common_cpp::properties FPD_CCI_NOC_3_transactor_param_props;
    FPD_CCI_NOC_3_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_3_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_3_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_3_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_3_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_3_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk");
    FPD_CCI_NOC_3_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_3_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_3_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_3_transactor_param_props.addString("INDEX", "3");

    mp_FPD_CCI_NOC_3_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_3_transactor", FPD_CCI_NOC_3_transactor_param_props);

    // FPD_CCI_NOC_3' transactor ports

    mp_FPD_CCI_NOC_3_transactor->AWID(FPD_CCI_NOC_3_awid);
    mp_FPD_CCI_NOC_3_transactor->AWADDR(FPD_CCI_NOC_3_awaddr);
    mp_FPD_CCI_NOC_3_transactor->AWLEN(FPD_CCI_NOC_3_awlen);
    mp_FPD_CCI_NOC_3_transactor->AWSIZE(FPD_CCI_NOC_3_awsize);
    mp_FPD_CCI_NOC_3_transactor->AWBURST(FPD_CCI_NOC_3_awburst);
    mp_FPD_CCI_NOC_3_transactor->AWLOCK(FPD_CCI_NOC_3_awlock);
    mp_FPD_CCI_NOC_3_transactor->AWCACHE(FPD_CCI_NOC_3_awcache);
    mp_FPD_CCI_NOC_3_transactor->AWPROT(FPD_CCI_NOC_3_awprot);
    mp_FPD_CCI_NOC_3_transactor->AWVALID(FPD_CCI_NOC_3_awvalid);
    mp_FPD_CCI_NOC_3_transactor->AWUSER(FPD_CCI_NOC_3_awuser);
    mp_FPD_CCI_NOC_3_transactor->AWREADY(FPD_CCI_NOC_3_awready);
    mp_FPD_CCI_NOC_3_transactor->WDATA(FPD_CCI_NOC_3_wdata);
    mp_FPD_CCI_NOC_3_transactor->WSTRB(FPD_CCI_NOC_3_wstrb);
    mp_FPD_CCI_NOC_3_transactor->WUSER(FPD_CCI_NOC_3_wuser);
    mp_FPD_CCI_NOC_3_transactor->WLAST(FPD_CCI_NOC_3_wlast);
    mp_FPD_CCI_NOC_3_transactor->WVALID(FPD_CCI_NOC_3_wvalid);
    mp_FPD_CCI_NOC_3_transactor->WREADY(FPD_CCI_NOC_3_wready);
    mp_FPD_CCI_NOC_3_transactor->BID(FPD_CCI_NOC_3_bid);
    mp_FPD_CCI_NOC_3_transactor->BRESP(FPD_CCI_NOC_3_bresp);
    mp_FPD_CCI_NOC_3_transactor->BVALID(FPD_CCI_NOC_3_bvalid);
    mp_FPD_CCI_NOC_3_transactor->BREADY(FPD_CCI_NOC_3_bready);
    mp_FPD_CCI_NOC_3_transactor->ARID(FPD_CCI_NOC_3_arid);
    mp_FPD_CCI_NOC_3_transactor->ARADDR(FPD_CCI_NOC_3_araddr);
    mp_FPD_CCI_NOC_3_transactor->ARLEN(FPD_CCI_NOC_3_arlen);
    mp_FPD_CCI_NOC_3_transactor->ARSIZE(FPD_CCI_NOC_3_arsize);
    mp_FPD_CCI_NOC_3_transactor->ARBURST(FPD_CCI_NOC_3_arburst);
    mp_FPD_CCI_NOC_3_transactor->ARLOCK(FPD_CCI_NOC_3_arlock);
    mp_FPD_CCI_NOC_3_transactor->ARCACHE(FPD_CCI_NOC_3_arcache);
    mp_FPD_CCI_NOC_3_transactor->ARPROT(FPD_CCI_NOC_3_arprot);
    mp_FPD_CCI_NOC_3_transactor->ARVALID(FPD_CCI_NOC_3_arvalid);
    mp_FPD_CCI_NOC_3_transactor->ARUSER(FPD_CCI_NOC_3_aruser);
    mp_FPD_CCI_NOC_3_transactor->ARREADY(FPD_CCI_NOC_3_arready);
    mp_FPD_CCI_NOC_3_transactor->RID(FPD_CCI_NOC_3_rid);
    mp_FPD_CCI_NOC_3_transactor->RDATA(FPD_CCI_NOC_3_rdata);
    mp_FPD_CCI_NOC_3_transactor->RRESP(FPD_CCI_NOC_3_rresp);
    mp_FPD_CCI_NOC_3_transactor->RLAST(FPD_CCI_NOC_3_rlast);
    mp_FPD_CCI_NOC_3_transactor->RVALID(FPD_CCI_NOC_3_rvalid);
    mp_FPD_CCI_NOC_3_transactor->RREADY(FPD_CCI_NOC_3_rready);
    mp_FPD_CCI_NOC_3_transactor->AWQOS(FPD_CCI_NOC_3_awqos);
    mp_FPD_CCI_NOC_3_transactor->ARQOS(FPD_CCI_NOC_3_arqos);
    mp_FPD_CCI_NOC_3_transactor->CLK(fpd_cci_noc_axi3_clk);
    m_FPD_CCI_NOC_3_transactor_rst_signal.write(1);
    mp_FPD_CCI_NOC_3_transactor->RST(m_FPD_CCI_NOC_3_transactor_rst_signal);

    // FPD_CCI_NOC_3' transactor sockets

    mp_impl->FPD_CCI_NOC_3_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'LPD_AXI_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "LPD_AXI_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'LPD_AXI_NOC_0' transactor parameters
    xsc::common_cpp::properties LPD_AXI_NOC_0_transactor_param_props;
    LPD_AXI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    LPD_AXI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "599999451");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    LPD_AXI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    LPD_AXI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    LPD_AXI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    LPD_AXI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_lpd_axi_noc_clk");
    LPD_AXI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    LPD_AXI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_rpu");
    LPD_AXI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_RPU_TO_NOC_NMU");
    LPD_AXI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_LPD_AXI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("LPD_AXI_NOC_0_transactor", LPD_AXI_NOC_0_transactor_param_props);

    // LPD_AXI_NOC_0' transactor ports

    mp_LPD_AXI_NOC_0_transactor->AWID(LPD_AXI_NOC_0_awid);
    mp_LPD_AXI_NOC_0_transactor->AWADDR(LPD_AXI_NOC_0_awaddr);
    mp_LPD_AXI_NOC_0_transactor->AWLEN(LPD_AXI_NOC_0_awlen);
    mp_LPD_AXI_NOC_0_transactor->AWSIZE(LPD_AXI_NOC_0_awsize);
    mp_LPD_AXI_NOC_0_transactor->AWBURST(LPD_AXI_NOC_0_awburst);
    mp_LPD_AXI_NOC_0_transactor->AWLOCK(LPD_AXI_NOC_0_awlock);
    mp_LPD_AXI_NOC_0_transactor->AWCACHE(LPD_AXI_NOC_0_awcache);
    mp_LPD_AXI_NOC_0_transactor->AWPROT(LPD_AXI_NOC_0_awprot);
    mp_LPD_AXI_NOC_0_transactor->AWVALID(LPD_AXI_NOC_0_awvalid);
    mp_LPD_AXI_NOC_0_transactor->AWUSER(LPD_AXI_NOC_0_awuser);
    mp_LPD_AXI_NOC_0_transactor->AWREADY(LPD_AXI_NOC_0_awready);
    mp_LPD_AXI_NOC_0_transactor->WDATA(LPD_AXI_NOC_0_wdata);
    mp_LPD_AXI_NOC_0_transactor->WSTRB(LPD_AXI_NOC_0_wstrb);
    mp_LPD_AXI_NOC_0_transactor->WLAST(LPD_AXI_NOC_0_wlast);
    mp_LPD_AXI_NOC_0_transactor->WVALID(LPD_AXI_NOC_0_wvalid);
    mp_LPD_AXI_NOC_0_transactor->WREADY(LPD_AXI_NOC_0_wready);
    mp_LPD_AXI_NOC_0_transactor->BID(LPD_AXI_NOC_0_bid);
    mp_LPD_AXI_NOC_0_transactor->BRESP(LPD_AXI_NOC_0_bresp);
    mp_LPD_AXI_NOC_0_transactor->BVALID(LPD_AXI_NOC_0_bvalid);
    mp_LPD_AXI_NOC_0_transactor->BREADY(LPD_AXI_NOC_0_bready);
    mp_LPD_AXI_NOC_0_transactor->ARID(LPD_AXI_NOC_0_arid);
    mp_LPD_AXI_NOC_0_transactor->ARADDR(LPD_AXI_NOC_0_araddr);
    mp_LPD_AXI_NOC_0_transactor->ARLEN(LPD_AXI_NOC_0_arlen);
    mp_LPD_AXI_NOC_0_transactor->ARSIZE(LPD_AXI_NOC_0_arsize);
    mp_LPD_AXI_NOC_0_transactor->ARBURST(LPD_AXI_NOC_0_arburst);
    mp_LPD_AXI_NOC_0_transactor->ARLOCK(LPD_AXI_NOC_0_arlock);
    mp_LPD_AXI_NOC_0_transactor->ARCACHE(LPD_AXI_NOC_0_arcache);
    mp_LPD_AXI_NOC_0_transactor->ARPROT(LPD_AXI_NOC_0_arprot);
    mp_LPD_AXI_NOC_0_transactor->ARVALID(LPD_AXI_NOC_0_arvalid);
    mp_LPD_AXI_NOC_0_transactor->ARUSER(LPD_AXI_NOC_0_aruser);
    mp_LPD_AXI_NOC_0_transactor->ARREADY(LPD_AXI_NOC_0_arready);
    mp_LPD_AXI_NOC_0_transactor->RID(LPD_AXI_NOC_0_rid);
    mp_LPD_AXI_NOC_0_transactor->RDATA(LPD_AXI_NOC_0_rdata);
    mp_LPD_AXI_NOC_0_transactor->RRESP(LPD_AXI_NOC_0_rresp);
    mp_LPD_AXI_NOC_0_transactor->RLAST(LPD_AXI_NOC_0_rlast);
    mp_LPD_AXI_NOC_0_transactor->RVALID(LPD_AXI_NOC_0_rvalid);
    mp_LPD_AXI_NOC_0_transactor->RREADY(LPD_AXI_NOC_0_rready);
    mp_LPD_AXI_NOC_0_transactor->AWQOS(LPD_AXI_NOC_0_awqos);
    mp_LPD_AXI_NOC_0_transactor->ARQOS(LPD_AXI_NOC_0_arqos);
    mp_LPD_AXI_NOC_0_transactor->CLK(lpd_axi_noc_clk);
    m_LPD_AXI_NOC_0_transactor_rst_signal.write(1);
    mp_LPD_AXI_NOC_0_transactor->RST(m_LPD_AXI_NOC_0_transactor_rst_signal);

    // LPD_AXI_NOC_0' transactor sockets

    mp_impl->LPD_AXI_NOC_0_tlm_aximm_read_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_write_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'PMC_NOC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "PMC_NOC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'PMC_NOC_AXI_0' transactor parameters
    xsc::common_cpp::properties PMC_NOC_AXI_0_transactor_param_props;
    PMC_NOC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    PMC_NOC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    PMC_NOC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    PMC_NOC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    PMC_NOC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    PMC_NOC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk");
    PMC_NOC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    PMC_NOC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    PMC_NOC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PMC_TO_NOC_NMU");
    PMC_NOC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    PMC_NOC_AXI_0_transactor_param_props.addString("INDEX", "0");
    PMC_NOC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_PMC_NOC_AXI_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,16,18,17>("PMC_NOC_AXI_0_transactor", PMC_NOC_AXI_0_transactor_param_props);

    // PMC_NOC_AXI_0' transactor ports

    mp_PMC_NOC_AXI_0_transactor->ARADDR(PMC_NOC_AXI_0_araddr);
    mp_PMC_NOC_AXI_0_transactor->ARBURST(PMC_NOC_AXI_0_arburst);
    mp_PMC_NOC_AXI_0_transactor->ARCACHE(PMC_NOC_AXI_0_arcache);
    mp_PMC_NOC_AXI_0_transactor->ARID(PMC_NOC_AXI_0_arid);
    mp_PMC_NOC_AXI_0_transactor->ARLEN(PMC_NOC_AXI_0_arlen);
    mp_PMC_NOC_AXI_0_transactor->ARLOCK(PMC_NOC_AXI_0_arlock);
    mp_PMC_NOC_AXI_0_transactor->ARPROT(PMC_NOC_AXI_0_arprot);
    mp_PMC_NOC_AXI_0_transactor->ARQOS(PMC_NOC_AXI_0_arqos);
    mp_PMC_NOC_AXI_0_transactor->ARREGION(PMC_NOC_AXI_0_arregion);
    mp_PMC_NOC_AXI_0_transactor->ARSIZE(PMC_NOC_AXI_0_arsize);
    mp_PMC_NOC_AXI_0_transactor->ARUSER(PMC_NOC_AXI_0_aruser);
    mp_PMC_NOC_AXI_0_transactor->ARVALID(PMC_NOC_AXI_0_arvalid);
    mp_PMC_NOC_AXI_0_transactor->AWADDR(PMC_NOC_AXI_0_awaddr);
    mp_PMC_NOC_AXI_0_transactor->AWBURST(PMC_NOC_AXI_0_awburst);
    mp_PMC_NOC_AXI_0_transactor->AWCACHE(PMC_NOC_AXI_0_awcache);
    mp_PMC_NOC_AXI_0_transactor->AWID(PMC_NOC_AXI_0_awid);
    mp_PMC_NOC_AXI_0_transactor->AWLEN(PMC_NOC_AXI_0_awlen);
    mp_PMC_NOC_AXI_0_transactor->AWLOCK(PMC_NOC_AXI_0_awlock);
    mp_PMC_NOC_AXI_0_transactor->AWPROT(PMC_NOC_AXI_0_awprot);
    mp_PMC_NOC_AXI_0_transactor->AWQOS(PMC_NOC_AXI_0_awqos);
    mp_PMC_NOC_AXI_0_transactor->AWREGION(PMC_NOC_AXI_0_awregion);
    mp_PMC_NOC_AXI_0_transactor->AWSIZE(PMC_NOC_AXI_0_awsize);
    mp_PMC_NOC_AXI_0_transactor->AWUSER(PMC_NOC_AXI_0_awuser);
    mp_PMC_NOC_AXI_0_transactor->AWVALID(PMC_NOC_AXI_0_awvalid);
    mp_PMC_NOC_AXI_0_transactor->BREADY(PMC_NOC_AXI_0_bready);
    mp_PMC_NOC_AXI_0_transactor->RREADY(PMC_NOC_AXI_0_rready);
    mp_PMC_NOC_AXI_0_transactor->WDATA(PMC_NOC_AXI_0_wdata);
    mp_PMC_NOC_AXI_0_transactor->WLAST(PMC_NOC_AXI_0_wlast);
    mp_PMC_NOC_AXI_0_transactor->WSTRB(PMC_NOC_AXI_0_wstrb);
    mp_PMC_NOC_AXI_0_transactor->WUSER(PMC_NOC_AXI_0_wuser);
    mp_PMC_NOC_AXI_0_transactor->WVALID(PMC_NOC_AXI_0_wvalid);
    mp_PMC_NOC_AXI_0_transactor->ARREADY(PMC_NOC_AXI_0_arready);
    mp_PMC_NOC_AXI_0_transactor->AWREADY(PMC_NOC_AXI_0_awready);
    mp_PMC_NOC_AXI_0_transactor->BID(PMC_NOC_AXI_0_bid);
    mp_PMC_NOC_AXI_0_transactor->BRESP(PMC_NOC_AXI_0_bresp);
    mp_PMC_NOC_AXI_0_transactor->BUSER(PMC_NOC_AXI_0_buser);
    mp_PMC_NOC_AXI_0_transactor->BVALID(PMC_NOC_AXI_0_bvalid);
    mp_PMC_NOC_AXI_0_transactor->RDATA(PMC_NOC_AXI_0_rdata);
    mp_PMC_NOC_AXI_0_transactor->RID(PMC_NOC_AXI_0_rid);
    mp_PMC_NOC_AXI_0_transactor->RLAST(PMC_NOC_AXI_0_rlast);
    mp_PMC_NOC_AXI_0_transactor->RRESP(PMC_NOC_AXI_0_rresp);
    mp_PMC_NOC_AXI_0_transactor->RUSER(PMC_NOC_AXI_0_ruser);
    mp_PMC_NOC_AXI_0_transactor->RVALID(PMC_NOC_AXI_0_rvalid);
    mp_PMC_NOC_AXI_0_transactor->WREADY(PMC_NOC_AXI_0_wready);
    mp_PMC_NOC_AXI_0_transactor->CLK(pmc_axi_noc_axi0_clk);
    m_PMC_NOC_AXI_0_transactor_rst_signal.write(1);
    mp_PMC_NOC_AXI_0_transactor->RST(m_PMC_NOC_AXI_0_transactor_rst_signal);

    // PMC_NOC_AXI_0' transactor sockets

    mp_impl->PMC_NOC_AXI_0_tlm_aximm_read_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_write_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'NOC_PMC_AXI_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "NOC_PMC_AXI_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_PMC_AXI_0' transactor parameters
    xsc::common_cpp::properties NOC_PMC_AXI_0_transactor_param_props;
    NOC_PMC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_PMC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_PMC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_PMC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_PMC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_PMC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_PMC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk");
    NOC_PMC_AXI_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_PMC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_PMC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    NOC_PMC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PMC");
    NOC_PMC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    NOC_PMC_AXI_0_transactor_param_props.addString("INDEX", "0");
    NOC_PMC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_NOC_PMC_AXI_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,17,16,18,17>("NOC_PMC_AXI_0_transactor", NOC_PMC_AXI_0_transactor_param_props);

    // NOC_PMC_AXI_0' transactor ports

    mp_NOC_PMC_AXI_0_transactor->ARADDR(NOC_PMC_AXI_0_araddr);
    mp_NOC_PMC_AXI_0_transactor->ARBURST(NOC_PMC_AXI_0_arburst);
    mp_NOC_PMC_AXI_0_transactor->ARCACHE(NOC_PMC_AXI_0_arcache);
    mp_NOC_PMC_AXI_0_transactor->ARID(NOC_PMC_AXI_0_arid);
    mp_NOC_PMC_AXI_0_transactor->ARLEN(NOC_PMC_AXI_0_arlen);
    mp_NOC_PMC_AXI_0_transactor->ARLOCK(NOC_PMC_AXI_0_arlock);
    mp_NOC_PMC_AXI_0_transactor->ARPROT(NOC_PMC_AXI_0_arprot);
    mp_NOC_PMC_AXI_0_transactor->ARQOS(NOC_PMC_AXI_0_arqos);
    mp_NOC_PMC_AXI_0_transactor->ARREGION(NOC_PMC_AXI_0_arregion);
    mp_NOC_PMC_AXI_0_transactor->ARSIZE(NOC_PMC_AXI_0_arsize);
    mp_NOC_PMC_AXI_0_transactor->ARUSER(NOC_PMC_AXI_0_aruser);
    mp_NOC_PMC_AXI_0_transactor->ARVALID(NOC_PMC_AXI_0_arvalid);
    mp_NOC_PMC_AXI_0_transactor->AWADDR(NOC_PMC_AXI_0_awaddr);
    mp_NOC_PMC_AXI_0_transactor->AWBURST(NOC_PMC_AXI_0_awburst);
    mp_NOC_PMC_AXI_0_transactor->AWCACHE(NOC_PMC_AXI_0_awcache);
    mp_NOC_PMC_AXI_0_transactor->AWID(NOC_PMC_AXI_0_awid);
    mp_NOC_PMC_AXI_0_transactor->AWLEN(NOC_PMC_AXI_0_awlen);
    mp_NOC_PMC_AXI_0_transactor->AWLOCK(NOC_PMC_AXI_0_awlock);
    mp_NOC_PMC_AXI_0_transactor->AWPROT(NOC_PMC_AXI_0_awprot);
    mp_NOC_PMC_AXI_0_transactor->AWQOS(NOC_PMC_AXI_0_awqos);
    mp_NOC_PMC_AXI_0_transactor->AWREGION(NOC_PMC_AXI_0_awregion);
    mp_NOC_PMC_AXI_0_transactor->AWSIZE(NOC_PMC_AXI_0_awsize);
    mp_NOC_PMC_AXI_0_transactor->AWUSER(NOC_PMC_AXI_0_awuser);
    mp_NOC_PMC_AXI_0_transactor->AWVALID(NOC_PMC_AXI_0_awvalid);
    mp_NOC_PMC_AXI_0_transactor->BREADY(NOC_PMC_AXI_0_bready);
    mp_NOC_PMC_AXI_0_transactor->RREADY(NOC_PMC_AXI_0_rready);
    mp_NOC_PMC_AXI_0_transactor->WDATA(NOC_PMC_AXI_0_wdata);
    mp_NOC_PMC_AXI_0_transactor->WLAST(NOC_PMC_AXI_0_wlast);
    mp_NOC_PMC_AXI_0_transactor->WSTRB(NOC_PMC_AXI_0_wstrb);
    mp_NOC_PMC_AXI_0_transactor->WUSER(NOC_PMC_AXI_0_wuser);
    mp_NOC_PMC_AXI_0_transactor->WVALID(NOC_PMC_AXI_0_wvalid);
    mp_NOC_PMC_AXI_0_transactor->ARREADY(NOC_PMC_AXI_0_arready);
    mp_NOC_PMC_AXI_0_transactor->AWREADY(NOC_PMC_AXI_0_awready);
    mp_NOC_PMC_AXI_0_transactor->BID(NOC_PMC_AXI_0_bid);
    mp_NOC_PMC_AXI_0_transactor->BRESP(NOC_PMC_AXI_0_bresp);
    mp_NOC_PMC_AXI_0_transactor->BUSER(NOC_PMC_AXI_0_buser);
    mp_NOC_PMC_AXI_0_transactor->BVALID(NOC_PMC_AXI_0_bvalid);
    mp_NOC_PMC_AXI_0_transactor->RDATA(NOC_PMC_AXI_0_rdata);
    mp_NOC_PMC_AXI_0_transactor->RID(NOC_PMC_AXI_0_rid);
    mp_NOC_PMC_AXI_0_transactor->RLAST(NOC_PMC_AXI_0_rlast);
    mp_NOC_PMC_AXI_0_transactor->RRESP(NOC_PMC_AXI_0_rresp);
    mp_NOC_PMC_AXI_0_transactor->RUSER(NOC_PMC_AXI_0_ruser);
    mp_NOC_PMC_AXI_0_transactor->RVALID(NOC_PMC_AXI_0_rvalid);
    mp_NOC_PMC_AXI_0_transactor->WREADY(NOC_PMC_AXI_0_wready);
    mp_NOC_PMC_AXI_0_transactor->CLK(noc_pmc_axi_axi0_clk);
    m_NOC_PMC_AXI_0_transactor_rst_signal.write(1);
    mp_NOC_PMC_AXI_0_transactor->RST(m_NOC_PMC_AXI_0_transactor_rst_signal);

    // NOC_PMC_AXI_0' transactor sockets

    mp_impl->NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->RUSER(CPM_PCIE_NOC_0_ruser);
    mp_CPM_PCIE_NOC_0_transactor->WUSER(CPM_PCIE_NOC_0_wuser);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->RUSER(CPM_PCIE_NOC_1_ruser);
    mp_CPM_PCIE_NOC_1_transactor->WUSER(CPM_PCIE_NOC_1_wuser);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "300000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "full_blown_noc_clk_gen_0_axi_clk_0");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(dma0_intrfc_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
full_blown_versal_cips_0_0::full_blown_versal_cips_0_0(const sc_core::sc_module_name& nm) : full_blown_versal_cips_0_0_sc(nm),  fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk"), fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk"), fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk"), fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk"), lpd_axi_noc_clk("lpd_axi_noc_clk"), pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk"), noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk"), gem0_tsu_timer_cnt("gem0_tsu_timer_cnt"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), dma0_intrfc_clk("dma0_intrfc_clk"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_intrfc_resetn("dma0_intrfc_resetn"), FPD_CCI_NOC_0_awid("FPD_CCI_NOC_0_awid"), FPD_CCI_NOC_0_awaddr("FPD_CCI_NOC_0_awaddr"), FPD_CCI_NOC_0_awlen("FPD_CCI_NOC_0_awlen"), FPD_CCI_NOC_0_awsize("FPD_CCI_NOC_0_awsize"), FPD_CCI_NOC_0_awburst("FPD_CCI_NOC_0_awburst"), FPD_CCI_NOC_0_awlock("FPD_CCI_NOC_0_awlock"), FPD_CCI_NOC_0_awcache("FPD_CCI_NOC_0_awcache"), FPD_CCI_NOC_0_awprot("FPD_CCI_NOC_0_awprot"), FPD_CCI_NOC_0_awvalid("FPD_CCI_NOC_0_awvalid"), FPD_CCI_NOC_0_awuser("FPD_CCI_NOC_0_awuser"), FPD_CCI_NOC_0_awready("FPD_CCI_NOC_0_awready"), FPD_CCI_NOC_0_wdata("FPD_CCI_NOC_0_wdata"), FPD_CCI_NOC_0_wstrb("FPD_CCI_NOC_0_wstrb"), FPD_CCI_NOC_0_wuser("FPD_CCI_NOC_0_wuser"), FPD_CCI_NOC_0_wlast("FPD_CCI_NOC_0_wlast"), FPD_CCI_NOC_0_wvalid("FPD_CCI_NOC_0_wvalid"), FPD_CCI_NOC_0_wready("FPD_CCI_NOC_0_wready"), FPD_CCI_NOC_0_bid("FPD_CCI_NOC_0_bid"), FPD_CCI_NOC_0_bresp("FPD_CCI_NOC_0_bresp"), FPD_CCI_NOC_0_bvalid("FPD_CCI_NOC_0_bvalid"), FPD_CCI_NOC_0_bready("FPD_CCI_NOC_0_bready"), FPD_CCI_NOC_0_arid("FPD_CCI_NOC_0_arid"), FPD_CCI_NOC_0_araddr("FPD_CCI_NOC_0_araddr"), FPD_CCI_NOC_0_arlen("FPD_CCI_NOC_0_arlen"), FPD_CCI_NOC_0_arsize("FPD_CCI_NOC_0_arsize"), FPD_CCI_NOC_0_arburst("FPD_CCI_NOC_0_arburst"), FPD_CCI_NOC_0_arlock("FPD_CCI_NOC_0_arlock"), FPD_CCI_NOC_0_arcache("FPD_CCI_NOC_0_arcache"), FPD_CCI_NOC_0_arprot("FPD_CCI_NOC_0_arprot"), FPD_CCI_NOC_0_arvalid("FPD_CCI_NOC_0_arvalid"), FPD_CCI_NOC_0_aruser("FPD_CCI_NOC_0_aruser"), FPD_CCI_NOC_0_arready("FPD_CCI_NOC_0_arready"), FPD_CCI_NOC_0_rid("FPD_CCI_NOC_0_rid"), FPD_CCI_NOC_0_rdata("FPD_CCI_NOC_0_rdata"), FPD_CCI_NOC_0_rresp("FPD_CCI_NOC_0_rresp"), FPD_CCI_NOC_0_rlast("FPD_CCI_NOC_0_rlast"), FPD_CCI_NOC_0_rvalid("FPD_CCI_NOC_0_rvalid"), FPD_CCI_NOC_0_rready("FPD_CCI_NOC_0_rready"), FPD_CCI_NOC_0_awqos("FPD_CCI_NOC_0_awqos"), FPD_CCI_NOC_0_arqos("FPD_CCI_NOC_0_arqos"), FPD_CCI_NOC_1_awid("FPD_CCI_NOC_1_awid"), FPD_CCI_NOC_1_awaddr("FPD_CCI_NOC_1_awaddr"), FPD_CCI_NOC_1_awlen("FPD_CCI_NOC_1_awlen"), FPD_CCI_NOC_1_awsize("FPD_CCI_NOC_1_awsize"), FPD_CCI_NOC_1_awburst("FPD_CCI_NOC_1_awburst"), FPD_CCI_NOC_1_awlock("FPD_CCI_NOC_1_awlock"), FPD_CCI_NOC_1_awcache("FPD_CCI_NOC_1_awcache"), FPD_CCI_NOC_1_awprot("FPD_CCI_NOC_1_awprot"), FPD_CCI_NOC_1_awvalid("FPD_CCI_NOC_1_awvalid"), FPD_CCI_NOC_1_awuser("FPD_CCI_NOC_1_awuser"), FPD_CCI_NOC_1_awready("FPD_CCI_NOC_1_awready"), FPD_CCI_NOC_1_wdata("FPD_CCI_NOC_1_wdata"), FPD_CCI_NOC_1_wstrb("FPD_CCI_NOC_1_wstrb"), FPD_CCI_NOC_1_wuser("FPD_CCI_NOC_1_wuser"), FPD_CCI_NOC_1_wlast("FPD_CCI_NOC_1_wlast"), FPD_CCI_NOC_1_wvalid("FPD_CCI_NOC_1_wvalid"), FPD_CCI_NOC_1_wready("FPD_CCI_NOC_1_wready"), FPD_CCI_NOC_1_bid("FPD_CCI_NOC_1_bid"), FPD_CCI_NOC_1_bresp("FPD_CCI_NOC_1_bresp"), FPD_CCI_NOC_1_bvalid("FPD_CCI_NOC_1_bvalid"), FPD_CCI_NOC_1_bready("FPD_CCI_NOC_1_bready"), FPD_CCI_NOC_1_arid("FPD_CCI_NOC_1_arid"), FPD_CCI_NOC_1_araddr("FPD_CCI_NOC_1_araddr"), FPD_CCI_NOC_1_arlen("FPD_CCI_NOC_1_arlen"), FPD_CCI_NOC_1_arsize("FPD_CCI_NOC_1_arsize"), FPD_CCI_NOC_1_arburst("FPD_CCI_NOC_1_arburst"), FPD_CCI_NOC_1_arlock("FPD_CCI_NOC_1_arlock"), FPD_CCI_NOC_1_arcache("FPD_CCI_NOC_1_arcache"), FPD_CCI_NOC_1_arprot("FPD_CCI_NOC_1_arprot"), FPD_CCI_NOC_1_arvalid("FPD_CCI_NOC_1_arvalid"), FPD_CCI_NOC_1_aruser("FPD_CCI_NOC_1_aruser"), FPD_CCI_NOC_1_arready("FPD_CCI_NOC_1_arready"), FPD_CCI_NOC_1_rid("FPD_CCI_NOC_1_rid"), FPD_CCI_NOC_1_rdata("FPD_CCI_NOC_1_rdata"), FPD_CCI_NOC_1_rresp("FPD_CCI_NOC_1_rresp"), FPD_CCI_NOC_1_rlast("FPD_CCI_NOC_1_rlast"), FPD_CCI_NOC_1_rvalid("FPD_CCI_NOC_1_rvalid"), FPD_CCI_NOC_1_rready("FPD_CCI_NOC_1_rready"), FPD_CCI_NOC_1_awqos("FPD_CCI_NOC_1_awqos"), FPD_CCI_NOC_1_arqos("FPD_CCI_NOC_1_arqos"), FPD_CCI_NOC_2_awid("FPD_CCI_NOC_2_awid"), FPD_CCI_NOC_2_awaddr("FPD_CCI_NOC_2_awaddr"), FPD_CCI_NOC_2_awlen("FPD_CCI_NOC_2_awlen"), FPD_CCI_NOC_2_awsize("FPD_CCI_NOC_2_awsize"), FPD_CCI_NOC_2_awburst("FPD_CCI_NOC_2_awburst"), FPD_CCI_NOC_2_awlock("FPD_CCI_NOC_2_awlock"), FPD_CCI_NOC_2_awcache("FPD_CCI_NOC_2_awcache"), FPD_CCI_NOC_2_awprot("FPD_CCI_NOC_2_awprot"), FPD_CCI_NOC_2_awvalid("FPD_CCI_NOC_2_awvalid"), FPD_CCI_NOC_2_awuser("FPD_CCI_NOC_2_awuser"), FPD_CCI_NOC_2_awready("FPD_CCI_NOC_2_awready"), FPD_CCI_NOC_2_wdata("FPD_CCI_NOC_2_wdata"), FPD_CCI_NOC_2_wstrb("FPD_CCI_NOC_2_wstrb"), FPD_CCI_NOC_2_wuser("FPD_CCI_NOC_2_wuser"), FPD_CCI_NOC_2_wlast("FPD_CCI_NOC_2_wlast"), FPD_CCI_NOC_2_wvalid("FPD_CCI_NOC_2_wvalid"), FPD_CCI_NOC_2_wready("FPD_CCI_NOC_2_wready"), FPD_CCI_NOC_2_bid("FPD_CCI_NOC_2_bid"), FPD_CCI_NOC_2_bresp("FPD_CCI_NOC_2_bresp"), FPD_CCI_NOC_2_bvalid("FPD_CCI_NOC_2_bvalid"), FPD_CCI_NOC_2_bready("FPD_CCI_NOC_2_bready"), FPD_CCI_NOC_2_arid("FPD_CCI_NOC_2_arid"), FPD_CCI_NOC_2_araddr("FPD_CCI_NOC_2_araddr"), FPD_CCI_NOC_2_arlen("FPD_CCI_NOC_2_arlen"), FPD_CCI_NOC_2_arsize("FPD_CCI_NOC_2_arsize"), FPD_CCI_NOC_2_arburst("FPD_CCI_NOC_2_arburst"), FPD_CCI_NOC_2_arlock("FPD_CCI_NOC_2_arlock"), FPD_CCI_NOC_2_arcache("FPD_CCI_NOC_2_arcache"), FPD_CCI_NOC_2_arprot("FPD_CCI_NOC_2_arprot"), FPD_CCI_NOC_2_arvalid("FPD_CCI_NOC_2_arvalid"), FPD_CCI_NOC_2_aruser("FPD_CCI_NOC_2_aruser"), FPD_CCI_NOC_2_arready("FPD_CCI_NOC_2_arready"), FPD_CCI_NOC_2_rid("FPD_CCI_NOC_2_rid"), FPD_CCI_NOC_2_rdata("FPD_CCI_NOC_2_rdata"), FPD_CCI_NOC_2_rresp("FPD_CCI_NOC_2_rresp"), FPD_CCI_NOC_2_rlast("FPD_CCI_NOC_2_rlast"), FPD_CCI_NOC_2_rvalid("FPD_CCI_NOC_2_rvalid"), FPD_CCI_NOC_2_rready("FPD_CCI_NOC_2_rready"), FPD_CCI_NOC_2_awqos("FPD_CCI_NOC_2_awqos"), FPD_CCI_NOC_2_arqos("FPD_CCI_NOC_2_arqos"), FPD_CCI_NOC_3_awid("FPD_CCI_NOC_3_awid"), FPD_CCI_NOC_3_awaddr("FPD_CCI_NOC_3_awaddr"), FPD_CCI_NOC_3_awlen("FPD_CCI_NOC_3_awlen"), FPD_CCI_NOC_3_awsize("FPD_CCI_NOC_3_awsize"), FPD_CCI_NOC_3_awburst("FPD_CCI_NOC_3_awburst"), FPD_CCI_NOC_3_awlock("FPD_CCI_NOC_3_awlock"), FPD_CCI_NOC_3_awcache("FPD_CCI_NOC_3_awcache"), FPD_CCI_NOC_3_awprot("FPD_CCI_NOC_3_awprot"), FPD_CCI_NOC_3_awvalid("FPD_CCI_NOC_3_awvalid"), FPD_CCI_NOC_3_awuser("FPD_CCI_NOC_3_awuser"), FPD_CCI_NOC_3_awready("FPD_CCI_NOC_3_awready"), FPD_CCI_NOC_3_wdata("FPD_CCI_NOC_3_wdata"), FPD_CCI_NOC_3_wstrb("FPD_CCI_NOC_3_wstrb"), FPD_CCI_NOC_3_wuser("FPD_CCI_NOC_3_wuser"), FPD_CCI_NOC_3_wlast("FPD_CCI_NOC_3_wlast"), FPD_CCI_NOC_3_wvalid("FPD_CCI_NOC_3_wvalid"), FPD_CCI_NOC_3_wready("FPD_CCI_NOC_3_wready"), FPD_CCI_NOC_3_bid("FPD_CCI_NOC_3_bid"), FPD_CCI_NOC_3_bresp("FPD_CCI_NOC_3_bresp"), FPD_CCI_NOC_3_bvalid("FPD_CCI_NOC_3_bvalid"), FPD_CCI_NOC_3_bready("FPD_CCI_NOC_3_bready"), FPD_CCI_NOC_3_arid("FPD_CCI_NOC_3_arid"), FPD_CCI_NOC_3_araddr("FPD_CCI_NOC_3_araddr"), FPD_CCI_NOC_3_arlen("FPD_CCI_NOC_3_arlen"), FPD_CCI_NOC_3_arsize("FPD_CCI_NOC_3_arsize"), FPD_CCI_NOC_3_arburst("FPD_CCI_NOC_3_arburst"), FPD_CCI_NOC_3_arlock("FPD_CCI_NOC_3_arlock"), FPD_CCI_NOC_3_arcache("FPD_CCI_NOC_3_arcache"), FPD_CCI_NOC_3_arprot("FPD_CCI_NOC_3_arprot"), FPD_CCI_NOC_3_arvalid("FPD_CCI_NOC_3_arvalid"), FPD_CCI_NOC_3_aruser("FPD_CCI_NOC_3_aruser"), FPD_CCI_NOC_3_arready("FPD_CCI_NOC_3_arready"), FPD_CCI_NOC_3_rid("FPD_CCI_NOC_3_rid"), FPD_CCI_NOC_3_rdata("FPD_CCI_NOC_3_rdata"), FPD_CCI_NOC_3_rresp("FPD_CCI_NOC_3_rresp"), FPD_CCI_NOC_3_rlast("FPD_CCI_NOC_3_rlast"), FPD_CCI_NOC_3_rvalid("FPD_CCI_NOC_3_rvalid"), FPD_CCI_NOC_3_rready("FPD_CCI_NOC_3_rready"), FPD_CCI_NOC_3_awqos("FPD_CCI_NOC_3_awqos"), FPD_CCI_NOC_3_arqos("FPD_CCI_NOC_3_arqos"), LPD_AXI_NOC_0_awid("LPD_AXI_NOC_0_awid"), LPD_AXI_NOC_0_awaddr("LPD_AXI_NOC_0_awaddr"), LPD_AXI_NOC_0_awlen("LPD_AXI_NOC_0_awlen"), LPD_AXI_NOC_0_awsize("LPD_AXI_NOC_0_awsize"), LPD_AXI_NOC_0_awburst("LPD_AXI_NOC_0_awburst"), LPD_AXI_NOC_0_awlock("LPD_AXI_NOC_0_awlock"), LPD_AXI_NOC_0_awcache("LPD_AXI_NOC_0_awcache"), LPD_AXI_NOC_0_awprot("LPD_AXI_NOC_0_awprot"), LPD_AXI_NOC_0_awvalid("LPD_AXI_NOC_0_awvalid"), LPD_AXI_NOC_0_awuser("LPD_AXI_NOC_0_awuser"), LPD_AXI_NOC_0_awready("LPD_AXI_NOC_0_awready"), LPD_AXI_NOC_0_wdata("LPD_AXI_NOC_0_wdata"), LPD_AXI_NOC_0_wstrb("LPD_AXI_NOC_0_wstrb"), LPD_AXI_NOC_0_wlast("LPD_AXI_NOC_0_wlast"), LPD_AXI_NOC_0_wvalid("LPD_AXI_NOC_0_wvalid"), LPD_AXI_NOC_0_wready("LPD_AXI_NOC_0_wready"), LPD_AXI_NOC_0_bid("LPD_AXI_NOC_0_bid"), LPD_AXI_NOC_0_bresp("LPD_AXI_NOC_0_bresp"), LPD_AXI_NOC_0_bvalid("LPD_AXI_NOC_0_bvalid"), LPD_AXI_NOC_0_bready("LPD_AXI_NOC_0_bready"), LPD_AXI_NOC_0_arid("LPD_AXI_NOC_0_arid"), LPD_AXI_NOC_0_araddr("LPD_AXI_NOC_0_araddr"), LPD_AXI_NOC_0_arlen("LPD_AXI_NOC_0_arlen"), LPD_AXI_NOC_0_arsize("LPD_AXI_NOC_0_arsize"), LPD_AXI_NOC_0_arburst("LPD_AXI_NOC_0_arburst"), LPD_AXI_NOC_0_arlock("LPD_AXI_NOC_0_arlock"), LPD_AXI_NOC_0_arcache("LPD_AXI_NOC_0_arcache"), LPD_AXI_NOC_0_arprot("LPD_AXI_NOC_0_arprot"), LPD_AXI_NOC_0_arvalid("LPD_AXI_NOC_0_arvalid"), LPD_AXI_NOC_0_aruser("LPD_AXI_NOC_0_aruser"), LPD_AXI_NOC_0_arready("LPD_AXI_NOC_0_arready"), LPD_AXI_NOC_0_rid("LPD_AXI_NOC_0_rid"), LPD_AXI_NOC_0_rdata("LPD_AXI_NOC_0_rdata"), LPD_AXI_NOC_0_rresp("LPD_AXI_NOC_0_rresp"), LPD_AXI_NOC_0_rlast("LPD_AXI_NOC_0_rlast"), LPD_AXI_NOC_0_rvalid("LPD_AXI_NOC_0_rvalid"), LPD_AXI_NOC_0_rready("LPD_AXI_NOC_0_rready"), LPD_AXI_NOC_0_awqos("LPD_AXI_NOC_0_awqos"), LPD_AXI_NOC_0_arqos("LPD_AXI_NOC_0_arqos"), PMC_NOC_AXI_0_araddr("PMC_NOC_AXI_0_araddr"), PMC_NOC_AXI_0_arburst("PMC_NOC_AXI_0_arburst"), PMC_NOC_AXI_0_arcache("PMC_NOC_AXI_0_arcache"), PMC_NOC_AXI_0_arid("PMC_NOC_AXI_0_arid"), PMC_NOC_AXI_0_arlen("PMC_NOC_AXI_0_arlen"), PMC_NOC_AXI_0_arlock("PMC_NOC_AXI_0_arlock"), PMC_NOC_AXI_0_arprot("PMC_NOC_AXI_0_arprot"), PMC_NOC_AXI_0_arqos("PMC_NOC_AXI_0_arqos"), PMC_NOC_AXI_0_arregion("PMC_NOC_AXI_0_arregion"), PMC_NOC_AXI_0_arsize("PMC_NOC_AXI_0_arsize"), PMC_NOC_AXI_0_aruser("PMC_NOC_AXI_0_aruser"), PMC_NOC_AXI_0_arvalid("PMC_NOC_AXI_0_arvalid"), PMC_NOC_AXI_0_awaddr("PMC_NOC_AXI_0_awaddr"), PMC_NOC_AXI_0_awburst("PMC_NOC_AXI_0_awburst"), PMC_NOC_AXI_0_awcache("PMC_NOC_AXI_0_awcache"), PMC_NOC_AXI_0_awid("PMC_NOC_AXI_0_awid"), PMC_NOC_AXI_0_awlen("PMC_NOC_AXI_0_awlen"), PMC_NOC_AXI_0_awlock("PMC_NOC_AXI_0_awlock"), PMC_NOC_AXI_0_awprot("PMC_NOC_AXI_0_awprot"), PMC_NOC_AXI_0_awqos("PMC_NOC_AXI_0_awqos"), PMC_NOC_AXI_0_awregion("PMC_NOC_AXI_0_awregion"), PMC_NOC_AXI_0_awsize("PMC_NOC_AXI_0_awsize"), PMC_NOC_AXI_0_awuser("PMC_NOC_AXI_0_awuser"), PMC_NOC_AXI_0_awvalid("PMC_NOC_AXI_0_awvalid"), PMC_NOC_AXI_0_bready("PMC_NOC_AXI_0_bready"), PMC_NOC_AXI_0_rready("PMC_NOC_AXI_0_rready"), PMC_NOC_AXI_0_wdata("PMC_NOC_AXI_0_wdata"), PMC_NOC_AXI_0_wid("PMC_NOC_AXI_0_wid"), PMC_NOC_AXI_0_wlast("PMC_NOC_AXI_0_wlast"), PMC_NOC_AXI_0_wstrb("PMC_NOC_AXI_0_wstrb"), PMC_NOC_AXI_0_wuser("PMC_NOC_AXI_0_wuser"), PMC_NOC_AXI_0_wvalid("PMC_NOC_AXI_0_wvalid"), PMC_NOC_AXI_0_arready("PMC_NOC_AXI_0_arready"), PMC_NOC_AXI_0_awready("PMC_NOC_AXI_0_awready"), PMC_NOC_AXI_0_bid("PMC_NOC_AXI_0_bid"), PMC_NOC_AXI_0_bresp("PMC_NOC_AXI_0_bresp"), PMC_NOC_AXI_0_buser("PMC_NOC_AXI_0_buser"), PMC_NOC_AXI_0_bvalid("PMC_NOC_AXI_0_bvalid"), PMC_NOC_AXI_0_rdata("PMC_NOC_AXI_0_rdata"), PMC_NOC_AXI_0_rid("PMC_NOC_AXI_0_rid"), PMC_NOC_AXI_0_rlast("PMC_NOC_AXI_0_rlast"), PMC_NOC_AXI_0_rresp("PMC_NOC_AXI_0_rresp"), PMC_NOC_AXI_0_ruser("PMC_NOC_AXI_0_ruser"), PMC_NOC_AXI_0_rvalid("PMC_NOC_AXI_0_rvalid"), PMC_NOC_AXI_0_wready("PMC_NOC_AXI_0_wready"), NOC_PMC_AXI_0_araddr("NOC_PMC_AXI_0_araddr"), NOC_PMC_AXI_0_arburst("NOC_PMC_AXI_0_arburst"), NOC_PMC_AXI_0_arcache("NOC_PMC_AXI_0_arcache"), NOC_PMC_AXI_0_arid("NOC_PMC_AXI_0_arid"), NOC_PMC_AXI_0_arlen("NOC_PMC_AXI_0_arlen"), NOC_PMC_AXI_0_arlock("NOC_PMC_AXI_0_arlock"), NOC_PMC_AXI_0_arprot("NOC_PMC_AXI_0_arprot"), NOC_PMC_AXI_0_arqos("NOC_PMC_AXI_0_arqos"), NOC_PMC_AXI_0_arregion("NOC_PMC_AXI_0_arregion"), NOC_PMC_AXI_0_arsize("NOC_PMC_AXI_0_arsize"), NOC_PMC_AXI_0_aruser("NOC_PMC_AXI_0_aruser"), NOC_PMC_AXI_0_arvalid("NOC_PMC_AXI_0_arvalid"), NOC_PMC_AXI_0_awaddr("NOC_PMC_AXI_0_awaddr"), NOC_PMC_AXI_0_awburst("NOC_PMC_AXI_0_awburst"), NOC_PMC_AXI_0_awcache("NOC_PMC_AXI_0_awcache"), NOC_PMC_AXI_0_awid("NOC_PMC_AXI_0_awid"), NOC_PMC_AXI_0_awlen("NOC_PMC_AXI_0_awlen"), NOC_PMC_AXI_0_awlock("NOC_PMC_AXI_0_awlock"), NOC_PMC_AXI_0_awprot("NOC_PMC_AXI_0_awprot"), NOC_PMC_AXI_0_awqos("NOC_PMC_AXI_0_awqos"), NOC_PMC_AXI_0_awregion("NOC_PMC_AXI_0_awregion"), NOC_PMC_AXI_0_awsize("NOC_PMC_AXI_0_awsize"), NOC_PMC_AXI_0_awuser("NOC_PMC_AXI_0_awuser"), NOC_PMC_AXI_0_awvalid("NOC_PMC_AXI_0_awvalid"), NOC_PMC_AXI_0_bready("NOC_PMC_AXI_0_bready"), NOC_PMC_AXI_0_rready("NOC_PMC_AXI_0_rready"), NOC_PMC_AXI_0_wdata("NOC_PMC_AXI_0_wdata"), NOC_PMC_AXI_0_wid("NOC_PMC_AXI_0_wid"), NOC_PMC_AXI_0_wlast("NOC_PMC_AXI_0_wlast"), NOC_PMC_AXI_0_wstrb("NOC_PMC_AXI_0_wstrb"), NOC_PMC_AXI_0_wuser("NOC_PMC_AXI_0_wuser"), NOC_PMC_AXI_0_wvalid("NOC_PMC_AXI_0_wvalid"), NOC_PMC_AXI_0_arready("NOC_PMC_AXI_0_arready"), NOC_PMC_AXI_0_awready("NOC_PMC_AXI_0_awready"), NOC_PMC_AXI_0_bid("NOC_PMC_AXI_0_bid"), NOC_PMC_AXI_0_bresp("NOC_PMC_AXI_0_bresp"), NOC_PMC_AXI_0_buser("NOC_PMC_AXI_0_buser"), NOC_PMC_AXI_0_bvalid("NOC_PMC_AXI_0_bvalid"), NOC_PMC_AXI_0_rdata("NOC_PMC_AXI_0_rdata"), NOC_PMC_AXI_0_rid("NOC_PMC_AXI_0_rid"), NOC_PMC_AXI_0_rlast("NOC_PMC_AXI_0_rlast"), NOC_PMC_AXI_0_rresp("NOC_PMC_AXI_0_rresp"), NOC_PMC_AXI_0_ruser("NOC_PMC_AXI_0_ruser"), NOC_PMC_AXI_0_rvalid("NOC_PMC_AXI_0_rvalid"), NOC_PMC_AXI_0_wready("NOC_PMC_AXI_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_ruser("CPM_PCIE_NOC_0_ruser"), CPM_PCIE_NOC_0_wuser("CPM_PCIE_NOC_0_wuser"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_ruser("CPM_PCIE_NOC_1_ruser"), CPM_PCIE_NOC_1_wuser("CPM_PCIE_NOC_1_wuser"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp"), dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch"), dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id"), dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready"), dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast"), dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid"), dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc"), dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata"), dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty"), dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc"), dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker"), dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt"), dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len"), dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid"), dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id"), dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker"), dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig"), dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size"), dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid"), dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker"), dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id"), dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx"), dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx"), dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id"), dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready"), dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid"), dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar"), dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data"), dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type"), dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast"), dma0_m_axis_h2c_err("dma0_m_axis_h2c_err"), dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid"), dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata"), dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte"), dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready"), dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc"), dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty"), dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid"), dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata"), dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id"), dma0_axis_c2h_status_last("dma0_axis_c2h_status_last"), dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop"), dma0_axis_c2h_status_error("dma0_axis_c2h_status_error"), dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid"), dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp"), dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid"), dma0_qsts_out_vld("dma0_qsts_out_vld"), dma0_qsts_out_op("dma0_qsts_out_op"), dma0_qsts_out_rdy("dma0_qsts_out_rdy"), dma0_qsts_out_qid("dma0_qsts_out_qid"), dma0_qsts_out_data("dma0_qsts_out_data"), dma0_qsts_out_port_id("dma0_qsts_out_port_id"), dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy"), dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir"), dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid"), dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence"), dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid"), dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt"), dma0_usr_irq_ack("dma0_usr_irq_ack"), dma0_usr_irq_fail("dma0_usr_irq_fail"), dma0_usr_irq_valid("dma0_usr_irq_valid"), dma0_usr_irq_vec("dma0_usr_irq_vec"), dma0_usr_irq_fnc("dma0_usr_irq_fnc"), dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm"), dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen"), dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp"), dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir"), dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error"), dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid"), dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv"), dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm"), dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy"), dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid"), dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl"), dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx"), dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id"), dma0_usr_flr_set("dma0_usr_flr_set"), dma0_usr_flr_clear("dma0_usr_flr_clear"), dma0_usr_flr_fnc("dma0_usr_flr_fnc"), dma0_usr_flr_done_vld("dma0_usr_flr_done_vld"), dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{
  // initialize pins
  mp_impl->fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk);
  mp_impl->fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk);
  mp_impl->fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk);
  mp_impl->fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk);
  mp_impl->lpd_axi_noc_clk(lpd_axi_noc_clk);
  mp_impl->pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk);
  mp_impl->noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk);
  mp_impl->gem0_tsu_timer_cnt(gem0_tsu_timer_cnt);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->dma0_intrfc_clk(dma0_intrfc_clk);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_intrfc_resetn(dma0_intrfc_resetn);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp);
  mp_impl->dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch);
  mp_impl->dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id);
  mp_impl->dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready);
  mp_impl->dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast);
  mp_impl->dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid);
  mp_impl->dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc);
  mp_impl->dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata);
  mp_impl->dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty);
  mp_impl->dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc);
  mp_impl->dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker);
  mp_impl->dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt);
  mp_impl->dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len);
  mp_impl->dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid);
  mp_impl->dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig);
  mp_impl->dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size);
  mp_impl->dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid);
  mp_impl->dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id);
  mp_impl->dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready);
  mp_impl->dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid);
  mp_impl->dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar);
  mp_impl->dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data);
  mp_impl->dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type);
  mp_impl->dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast);
  mp_impl->dma0_m_axis_h2c_err(dma0_m_axis_h2c_err);
  mp_impl->dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid);
  mp_impl->dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata);
  mp_impl->dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte);
  mp_impl->dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready);
  mp_impl->dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc);
  mp_impl->dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty);
  mp_impl->dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid);
  mp_impl->dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata);
  mp_impl->dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id);
  mp_impl->dma0_axis_c2h_status_last(dma0_axis_c2h_status_last);
  mp_impl->dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop);
  mp_impl->dma0_axis_c2h_status_error(dma0_axis_c2h_status_error);
  mp_impl->dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid);
  mp_impl->dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp);
  mp_impl->dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid);
  mp_impl->dma0_qsts_out_vld(dma0_qsts_out_vld);
  mp_impl->dma0_qsts_out_op(dma0_qsts_out_op);
  mp_impl->dma0_qsts_out_rdy(dma0_qsts_out_rdy);
  mp_impl->dma0_qsts_out_qid(dma0_qsts_out_qid);
  mp_impl->dma0_qsts_out_data(dma0_qsts_out_data);
  mp_impl->dma0_qsts_out_port_id(dma0_qsts_out_port_id);
  mp_impl->dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy);
  mp_impl->dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir);
  mp_impl->dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid);
  mp_impl->dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence);
  mp_impl->dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid);
  mp_impl->dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt);
  mp_impl->dma0_usr_irq_ack(dma0_usr_irq_ack);
  mp_impl->dma0_usr_irq_fail(dma0_usr_irq_fail);
  mp_impl->dma0_usr_irq_valid(dma0_usr_irq_valid);
  mp_impl->dma0_usr_irq_vec(dma0_usr_irq_vec);
  mp_impl->dma0_usr_irq_fnc(dma0_usr_irq_fnc);
  mp_impl->dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm);
  mp_impl->dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen);
  mp_impl->dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp);
  mp_impl->dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir);
  mp_impl->dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error);
  mp_impl->dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid);
  mp_impl->dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv);
  mp_impl->dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm);
  mp_impl->dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy);
  mp_impl->dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid);
  mp_impl->dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl);
  mp_impl->dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx);
  mp_impl->dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id);
  mp_impl->dma0_usr_flr_set(dma0_usr_flr_set);
  mp_impl->dma0_usr_flr_clear(dma0_usr_flr_clear);
  mp_impl->dma0_usr_flr_fnc(dma0_usr_flr_fnc);
  mp_impl->dma0_usr_flr_done_vld(dma0_usr_flr_done_vld);
  mp_impl->dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_FPD_CCI_NOC_0_transactor = NULL;
  mp_FPD_CCI_NOC_1_transactor = NULL;
  mp_FPD_CCI_NOC_2_transactor = NULL;
  mp_FPD_CCI_NOC_3_transactor = NULL;
  mp_LPD_AXI_NOC_0_transactor = NULL;
  mp_PMC_NOC_AXI_0_transactor = NULL;
  mp_NOC_PMC_AXI_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // Instantiate Socket Stubs

  // configure FPD_CCI_NOC_0_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_0_transactor_param_props;
    FPD_CCI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk");
    FPD_CCI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_FPD_CCI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_0_transactor", FPD_CCI_NOC_0_transactor_param_props);
  mp_FPD_CCI_NOC_0_transactor->AWID(FPD_CCI_NOC_0_awid);
  mp_FPD_CCI_NOC_0_transactor->AWADDR(FPD_CCI_NOC_0_awaddr);
  mp_FPD_CCI_NOC_0_transactor->AWLEN(FPD_CCI_NOC_0_awlen);
  mp_FPD_CCI_NOC_0_transactor->AWSIZE(FPD_CCI_NOC_0_awsize);
  mp_FPD_CCI_NOC_0_transactor->AWBURST(FPD_CCI_NOC_0_awburst);
  mp_FPD_CCI_NOC_0_transactor->AWLOCK(FPD_CCI_NOC_0_awlock);
  mp_FPD_CCI_NOC_0_transactor->AWCACHE(FPD_CCI_NOC_0_awcache);
  mp_FPD_CCI_NOC_0_transactor->AWPROT(FPD_CCI_NOC_0_awprot);
  mp_FPD_CCI_NOC_0_transactor->AWVALID(FPD_CCI_NOC_0_awvalid);
  mp_FPD_CCI_NOC_0_transactor->AWUSER(FPD_CCI_NOC_0_awuser);
  mp_FPD_CCI_NOC_0_transactor->AWREADY(FPD_CCI_NOC_0_awready);
  mp_FPD_CCI_NOC_0_transactor->WDATA(FPD_CCI_NOC_0_wdata);
  mp_FPD_CCI_NOC_0_transactor->WSTRB(FPD_CCI_NOC_0_wstrb);
  mp_FPD_CCI_NOC_0_transactor->WUSER(FPD_CCI_NOC_0_wuser);
  mp_FPD_CCI_NOC_0_transactor->WLAST(FPD_CCI_NOC_0_wlast);
  mp_FPD_CCI_NOC_0_transactor->WVALID(FPD_CCI_NOC_0_wvalid);
  mp_FPD_CCI_NOC_0_transactor->WREADY(FPD_CCI_NOC_0_wready);
  mp_FPD_CCI_NOC_0_transactor->BID(FPD_CCI_NOC_0_bid);
  mp_FPD_CCI_NOC_0_transactor->BRESP(FPD_CCI_NOC_0_bresp);
  mp_FPD_CCI_NOC_0_transactor->BVALID(FPD_CCI_NOC_0_bvalid);
  mp_FPD_CCI_NOC_0_transactor->BREADY(FPD_CCI_NOC_0_bready);
  mp_FPD_CCI_NOC_0_transactor->ARID(FPD_CCI_NOC_0_arid);
  mp_FPD_CCI_NOC_0_transactor->ARADDR(FPD_CCI_NOC_0_araddr);
  mp_FPD_CCI_NOC_0_transactor->ARLEN(FPD_CCI_NOC_0_arlen);
  mp_FPD_CCI_NOC_0_transactor->ARSIZE(FPD_CCI_NOC_0_arsize);
  mp_FPD_CCI_NOC_0_transactor->ARBURST(FPD_CCI_NOC_0_arburst);
  mp_FPD_CCI_NOC_0_transactor->ARLOCK(FPD_CCI_NOC_0_arlock);
  mp_FPD_CCI_NOC_0_transactor->ARCACHE(FPD_CCI_NOC_0_arcache);
  mp_FPD_CCI_NOC_0_transactor->ARPROT(FPD_CCI_NOC_0_arprot);
  mp_FPD_CCI_NOC_0_transactor->ARVALID(FPD_CCI_NOC_0_arvalid);
  mp_FPD_CCI_NOC_0_transactor->ARUSER(FPD_CCI_NOC_0_aruser);
  mp_FPD_CCI_NOC_0_transactor->ARREADY(FPD_CCI_NOC_0_arready);
  mp_FPD_CCI_NOC_0_transactor->RID(FPD_CCI_NOC_0_rid);
  mp_FPD_CCI_NOC_0_transactor->RDATA(FPD_CCI_NOC_0_rdata);
  mp_FPD_CCI_NOC_0_transactor->RRESP(FPD_CCI_NOC_0_rresp);
  mp_FPD_CCI_NOC_0_transactor->RLAST(FPD_CCI_NOC_0_rlast);
  mp_FPD_CCI_NOC_0_transactor->RVALID(FPD_CCI_NOC_0_rvalid);
  mp_FPD_CCI_NOC_0_transactor->RREADY(FPD_CCI_NOC_0_rready);
  mp_FPD_CCI_NOC_0_transactor->AWQOS(FPD_CCI_NOC_0_awqos);
  mp_FPD_CCI_NOC_0_transactor->ARQOS(FPD_CCI_NOC_0_arqos);
  mp_FPD_CCI_NOC_0_transactor->CLK(fpd_cci_noc_axi0_clk);
  m_FPD_CCI_NOC_0_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_0_transactor->RST(m_FPD_CCI_NOC_0_transactor_rst_signal);
  // configure FPD_CCI_NOC_1_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_1_transactor_param_props;
    FPD_CCI_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_1_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk");
    FPD_CCI_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_FPD_CCI_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_1_transactor", FPD_CCI_NOC_1_transactor_param_props);
  mp_FPD_CCI_NOC_1_transactor->AWID(FPD_CCI_NOC_1_awid);
  mp_FPD_CCI_NOC_1_transactor->AWADDR(FPD_CCI_NOC_1_awaddr);
  mp_FPD_CCI_NOC_1_transactor->AWLEN(FPD_CCI_NOC_1_awlen);
  mp_FPD_CCI_NOC_1_transactor->AWSIZE(FPD_CCI_NOC_1_awsize);
  mp_FPD_CCI_NOC_1_transactor->AWBURST(FPD_CCI_NOC_1_awburst);
  mp_FPD_CCI_NOC_1_transactor->AWLOCK(FPD_CCI_NOC_1_awlock);
  mp_FPD_CCI_NOC_1_transactor->AWCACHE(FPD_CCI_NOC_1_awcache);
  mp_FPD_CCI_NOC_1_transactor->AWPROT(FPD_CCI_NOC_1_awprot);
  mp_FPD_CCI_NOC_1_transactor->AWVALID(FPD_CCI_NOC_1_awvalid);
  mp_FPD_CCI_NOC_1_transactor->AWUSER(FPD_CCI_NOC_1_awuser);
  mp_FPD_CCI_NOC_1_transactor->AWREADY(FPD_CCI_NOC_1_awready);
  mp_FPD_CCI_NOC_1_transactor->WDATA(FPD_CCI_NOC_1_wdata);
  mp_FPD_CCI_NOC_1_transactor->WSTRB(FPD_CCI_NOC_1_wstrb);
  mp_FPD_CCI_NOC_1_transactor->WUSER(FPD_CCI_NOC_1_wuser);
  mp_FPD_CCI_NOC_1_transactor->WLAST(FPD_CCI_NOC_1_wlast);
  mp_FPD_CCI_NOC_1_transactor->WVALID(FPD_CCI_NOC_1_wvalid);
  mp_FPD_CCI_NOC_1_transactor->WREADY(FPD_CCI_NOC_1_wready);
  mp_FPD_CCI_NOC_1_transactor->BID(FPD_CCI_NOC_1_bid);
  mp_FPD_CCI_NOC_1_transactor->BRESP(FPD_CCI_NOC_1_bresp);
  mp_FPD_CCI_NOC_1_transactor->BVALID(FPD_CCI_NOC_1_bvalid);
  mp_FPD_CCI_NOC_1_transactor->BREADY(FPD_CCI_NOC_1_bready);
  mp_FPD_CCI_NOC_1_transactor->ARID(FPD_CCI_NOC_1_arid);
  mp_FPD_CCI_NOC_1_transactor->ARADDR(FPD_CCI_NOC_1_araddr);
  mp_FPD_CCI_NOC_1_transactor->ARLEN(FPD_CCI_NOC_1_arlen);
  mp_FPD_CCI_NOC_1_transactor->ARSIZE(FPD_CCI_NOC_1_arsize);
  mp_FPD_CCI_NOC_1_transactor->ARBURST(FPD_CCI_NOC_1_arburst);
  mp_FPD_CCI_NOC_1_transactor->ARLOCK(FPD_CCI_NOC_1_arlock);
  mp_FPD_CCI_NOC_1_transactor->ARCACHE(FPD_CCI_NOC_1_arcache);
  mp_FPD_CCI_NOC_1_transactor->ARPROT(FPD_CCI_NOC_1_arprot);
  mp_FPD_CCI_NOC_1_transactor->ARVALID(FPD_CCI_NOC_1_arvalid);
  mp_FPD_CCI_NOC_1_transactor->ARUSER(FPD_CCI_NOC_1_aruser);
  mp_FPD_CCI_NOC_1_transactor->ARREADY(FPD_CCI_NOC_1_arready);
  mp_FPD_CCI_NOC_1_transactor->RID(FPD_CCI_NOC_1_rid);
  mp_FPD_CCI_NOC_1_transactor->RDATA(FPD_CCI_NOC_1_rdata);
  mp_FPD_CCI_NOC_1_transactor->RRESP(FPD_CCI_NOC_1_rresp);
  mp_FPD_CCI_NOC_1_transactor->RLAST(FPD_CCI_NOC_1_rlast);
  mp_FPD_CCI_NOC_1_transactor->RVALID(FPD_CCI_NOC_1_rvalid);
  mp_FPD_CCI_NOC_1_transactor->RREADY(FPD_CCI_NOC_1_rready);
  mp_FPD_CCI_NOC_1_transactor->AWQOS(FPD_CCI_NOC_1_awqos);
  mp_FPD_CCI_NOC_1_transactor->ARQOS(FPD_CCI_NOC_1_arqos);
  mp_FPD_CCI_NOC_1_transactor->CLK(fpd_cci_noc_axi1_clk);
  m_FPD_CCI_NOC_1_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_1_transactor->RST(m_FPD_CCI_NOC_1_transactor_rst_signal);
  // configure FPD_CCI_NOC_2_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_2_transactor_param_props;
    FPD_CCI_NOC_2_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_2_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_2_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_2_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_2_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_2_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk");
    FPD_CCI_NOC_2_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_2_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_2_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_2_transactor_param_props.addString("INDEX", "2");

    mp_FPD_CCI_NOC_2_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_2_transactor", FPD_CCI_NOC_2_transactor_param_props);
  mp_FPD_CCI_NOC_2_transactor->AWID(FPD_CCI_NOC_2_awid);
  mp_FPD_CCI_NOC_2_transactor->AWADDR(FPD_CCI_NOC_2_awaddr);
  mp_FPD_CCI_NOC_2_transactor->AWLEN(FPD_CCI_NOC_2_awlen);
  mp_FPD_CCI_NOC_2_transactor->AWSIZE(FPD_CCI_NOC_2_awsize);
  mp_FPD_CCI_NOC_2_transactor->AWBURST(FPD_CCI_NOC_2_awburst);
  mp_FPD_CCI_NOC_2_transactor->AWLOCK(FPD_CCI_NOC_2_awlock);
  mp_FPD_CCI_NOC_2_transactor->AWCACHE(FPD_CCI_NOC_2_awcache);
  mp_FPD_CCI_NOC_2_transactor->AWPROT(FPD_CCI_NOC_2_awprot);
  mp_FPD_CCI_NOC_2_transactor->AWVALID(FPD_CCI_NOC_2_awvalid);
  mp_FPD_CCI_NOC_2_transactor->AWUSER(FPD_CCI_NOC_2_awuser);
  mp_FPD_CCI_NOC_2_transactor->AWREADY(FPD_CCI_NOC_2_awready);
  mp_FPD_CCI_NOC_2_transactor->WDATA(FPD_CCI_NOC_2_wdata);
  mp_FPD_CCI_NOC_2_transactor->WSTRB(FPD_CCI_NOC_2_wstrb);
  mp_FPD_CCI_NOC_2_transactor->WUSER(FPD_CCI_NOC_2_wuser);
  mp_FPD_CCI_NOC_2_transactor->WLAST(FPD_CCI_NOC_2_wlast);
  mp_FPD_CCI_NOC_2_transactor->WVALID(FPD_CCI_NOC_2_wvalid);
  mp_FPD_CCI_NOC_2_transactor->WREADY(FPD_CCI_NOC_2_wready);
  mp_FPD_CCI_NOC_2_transactor->BID(FPD_CCI_NOC_2_bid);
  mp_FPD_CCI_NOC_2_transactor->BRESP(FPD_CCI_NOC_2_bresp);
  mp_FPD_CCI_NOC_2_transactor->BVALID(FPD_CCI_NOC_2_bvalid);
  mp_FPD_CCI_NOC_2_transactor->BREADY(FPD_CCI_NOC_2_bready);
  mp_FPD_CCI_NOC_2_transactor->ARID(FPD_CCI_NOC_2_arid);
  mp_FPD_CCI_NOC_2_transactor->ARADDR(FPD_CCI_NOC_2_araddr);
  mp_FPD_CCI_NOC_2_transactor->ARLEN(FPD_CCI_NOC_2_arlen);
  mp_FPD_CCI_NOC_2_transactor->ARSIZE(FPD_CCI_NOC_2_arsize);
  mp_FPD_CCI_NOC_2_transactor->ARBURST(FPD_CCI_NOC_2_arburst);
  mp_FPD_CCI_NOC_2_transactor->ARLOCK(FPD_CCI_NOC_2_arlock);
  mp_FPD_CCI_NOC_2_transactor->ARCACHE(FPD_CCI_NOC_2_arcache);
  mp_FPD_CCI_NOC_2_transactor->ARPROT(FPD_CCI_NOC_2_arprot);
  mp_FPD_CCI_NOC_2_transactor->ARVALID(FPD_CCI_NOC_2_arvalid);
  mp_FPD_CCI_NOC_2_transactor->ARUSER(FPD_CCI_NOC_2_aruser);
  mp_FPD_CCI_NOC_2_transactor->ARREADY(FPD_CCI_NOC_2_arready);
  mp_FPD_CCI_NOC_2_transactor->RID(FPD_CCI_NOC_2_rid);
  mp_FPD_CCI_NOC_2_transactor->RDATA(FPD_CCI_NOC_2_rdata);
  mp_FPD_CCI_NOC_2_transactor->RRESP(FPD_CCI_NOC_2_rresp);
  mp_FPD_CCI_NOC_2_transactor->RLAST(FPD_CCI_NOC_2_rlast);
  mp_FPD_CCI_NOC_2_transactor->RVALID(FPD_CCI_NOC_2_rvalid);
  mp_FPD_CCI_NOC_2_transactor->RREADY(FPD_CCI_NOC_2_rready);
  mp_FPD_CCI_NOC_2_transactor->AWQOS(FPD_CCI_NOC_2_awqos);
  mp_FPD_CCI_NOC_2_transactor->ARQOS(FPD_CCI_NOC_2_arqos);
  mp_FPD_CCI_NOC_2_transactor->CLK(fpd_cci_noc_axi2_clk);
  m_FPD_CCI_NOC_2_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_2_transactor->RST(m_FPD_CCI_NOC_2_transactor_rst_signal);
  // configure FPD_CCI_NOC_3_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_3_transactor_param_props;
    FPD_CCI_NOC_3_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_3_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_3_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_3_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_3_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_3_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk");
    FPD_CCI_NOC_3_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_3_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_3_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_3_transactor_param_props.addString("INDEX", "3");

    mp_FPD_CCI_NOC_3_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_3_transactor", FPD_CCI_NOC_3_transactor_param_props);
  mp_FPD_CCI_NOC_3_transactor->AWID(FPD_CCI_NOC_3_awid);
  mp_FPD_CCI_NOC_3_transactor->AWADDR(FPD_CCI_NOC_3_awaddr);
  mp_FPD_CCI_NOC_3_transactor->AWLEN(FPD_CCI_NOC_3_awlen);
  mp_FPD_CCI_NOC_3_transactor->AWSIZE(FPD_CCI_NOC_3_awsize);
  mp_FPD_CCI_NOC_3_transactor->AWBURST(FPD_CCI_NOC_3_awburst);
  mp_FPD_CCI_NOC_3_transactor->AWLOCK(FPD_CCI_NOC_3_awlock);
  mp_FPD_CCI_NOC_3_transactor->AWCACHE(FPD_CCI_NOC_3_awcache);
  mp_FPD_CCI_NOC_3_transactor->AWPROT(FPD_CCI_NOC_3_awprot);
  mp_FPD_CCI_NOC_3_transactor->AWVALID(FPD_CCI_NOC_3_awvalid);
  mp_FPD_CCI_NOC_3_transactor->AWUSER(FPD_CCI_NOC_3_awuser);
  mp_FPD_CCI_NOC_3_transactor->AWREADY(FPD_CCI_NOC_3_awready);
  mp_FPD_CCI_NOC_3_transactor->WDATA(FPD_CCI_NOC_3_wdata);
  mp_FPD_CCI_NOC_3_transactor->WSTRB(FPD_CCI_NOC_3_wstrb);
  mp_FPD_CCI_NOC_3_transactor->WUSER(FPD_CCI_NOC_3_wuser);
  mp_FPD_CCI_NOC_3_transactor->WLAST(FPD_CCI_NOC_3_wlast);
  mp_FPD_CCI_NOC_3_transactor->WVALID(FPD_CCI_NOC_3_wvalid);
  mp_FPD_CCI_NOC_3_transactor->WREADY(FPD_CCI_NOC_3_wready);
  mp_FPD_CCI_NOC_3_transactor->BID(FPD_CCI_NOC_3_bid);
  mp_FPD_CCI_NOC_3_transactor->BRESP(FPD_CCI_NOC_3_bresp);
  mp_FPD_CCI_NOC_3_transactor->BVALID(FPD_CCI_NOC_3_bvalid);
  mp_FPD_CCI_NOC_3_transactor->BREADY(FPD_CCI_NOC_3_bready);
  mp_FPD_CCI_NOC_3_transactor->ARID(FPD_CCI_NOC_3_arid);
  mp_FPD_CCI_NOC_3_transactor->ARADDR(FPD_CCI_NOC_3_araddr);
  mp_FPD_CCI_NOC_3_transactor->ARLEN(FPD_CCI_NOC_3_arlen);
  mp_FPD_CCI_NOC_3_transactor->ARSIZE(FPD_CCI_NOC_3_arsize);
  mp_FPD_CCI_NOC_3_transactor->ARBURST(FPD_CCI_NOC_3_arburst);
  mp_FPD_CCI_NOC_3_transactor->ARLOCK(FPD_CCI_NOC_3_arlock);
  mp_FPD_CCI_NOC_3_transactor->ARCACHE(FPD_CCI_NOC_3_arcache);
  mp_FPD_CCI_NOC_3_transactor->ARPROT(FPD_CCI_NOC_3_arprot);
  mp_FPD_CCI_NOC_3_transactor->ARVALID(FPD_CCI_NOC_3_arvalid);
  mp_FPD_CCI_NOC_3_transactor->ARUSER(FPD_CCI_NOC_3_aruser);
  mp_FPD_CCI_NOC_3_transactor->ARREADY(FPD_CCI_NOC_3_arready);
  mp_FPD_CCI_NOC_3_transactor->RID(FPD_CCI_NOC_3_rid);
  mp_FPD_CCI_NOC_3_transactor->RDATA(FPD_CCI_NOC_3_rdata);
  mp_FPD_CCI_NOC_3_transactor->RRESP(FPD_CCI_NOC_3_rresp);
  mp_FPD_CCI_NOC_3_transactor->RLAST(FPD_CCI_NOC_3_rlast);
  mp_FPD_CCI_NOC_3_transactor->RVALID(FPD_CCI_NOC_3_rvalid);
  mp_FPD_CCI_NOC_3_transactor->RREADY(FPD_CCI_NOC_3_rready);
  mp_FPD_CCI_NOC_3_transactor->AWQOS(FPD_CCI_NOC_3_awqos);
  mp_FPD_CCI_NOC_3_transactor->ARQOS(FPD_CCI_NOC_3_arqos);
  mp_FPD_CCI_NOC_3_transactor->CLK(fpd_cci_noc_axi3_clk);
  m_FPD_CCI_NOC_3_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_3_transactor->RST(m_FPD_CCI_NOC_3_transactor_rst_signal);
  // configure LPD_AXI_NOC_0_transactor
    xsc::common_cpp::properties LPD_AXI_NOC_0_transactor_param_props;
    LPD_AXI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    LPD_AXI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "599999451");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    LPD_AXI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    LPD_AXI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    LPD_AXI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    LPD_AXI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_lpd_axi_noc_clk");
    LPD_AXI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    LPD_AXI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_rpu");
    LPD_AXI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_RPU_TO_NOC_NMU");
    LPD_AXI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_LPD_AXI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("LPD_AXI_NOC_0_transactor", LPD_AXI_NOC_0_transactor_param_props);
  mp_LPD_AXI_NOC_0_transactor->AWID(LPD_AXI_NOC_0_awid);
  mp_LPD_AXI_NOC_0_transactor->AWADDR(LPD_AXI_NOC_0_awaddr);
  mp_LPD_AXI_NOC_0_transactor->AWLEN(LPD_AXI_NOC_0_awlen);
  mp_LPD_AXI_NOC_0_transactor->AWSIZE(LPD_AXI_NOC_0_awsize);
  mp_LPD_AXI_NOC_0_transactor->AWBURST(LPD_AXI_NOC_0_awburst);
  mp_LPD_AXI_NOC_0_transactor->AWLOCK(LPD_AXI_NOC_0_awlock);
  mp_LPD_AXI_NOC_0_transactor->AWCACHE(LPD_AXI_NOC_0_awcache);
  mp_LPD_AXI_NOC_0_transactor->AWPROT(LPD_AXI_NOC_0_awprot);
  mp_LPD_AXI_NOC_0_transactor->AWVALID(LPD_AXI_NOC_0_awvalid);
  mp_LPD_AXI_NOC_0_transactor->AWUSER(LPD_AXI_NOC_0_awuser);
  mp_LPD_AXI_NOC_0_transactor->AWREADY(LPD_AXI_NOC_0_awready);
  mp_LPD_AXI_NOC_0_transactor->WDATA(LPD_AXI_NOC_0_wdata);
  mp_LPD_AXI_NOC_0_transactor->WSTRB(LPD_AXI_NOC_0_wstrb);
  mp_LPD_AXI_NOC_0_transactor->WLAST(LPD_AXI_NOC_0_wlast);
  mp_LPD_AXI_NOC_0_transactor->WVALID(LPD_AXI_NOC_0_wvalid);
  mp_LPD_AXI_NOC_0_transactor->WREADY(LPD_AXI_NOC_0_wready);
  mp_LPD_AXI_NOC_0_transactor->BID(LPD_AXI_NOC_0_bid);
  mp_LPD_AXI_NOC_0_transactor->BRESP(LPD_AXI_NOC_0_bresp);
  mp_LPD_AXI_NOC_0_transactor->BVALID(LPD_AXI_NOC_0_bvalid);
  mp_LPD_AXI_NOC_0_transactor->BREADY(LPD_AXI_NOC_0_bready);
  mp_LPD_AXI_NOC_0_transactor->ARID(LPD_AXI_NOC_0_arid);
  mp_LPD_AXI_NOC_0_transactor->ARADDR(LPD_AXI_NOC_0_araddr);
  mp_LPD_AXI_NOC_0_transactor->ARLEN(LPD_AXI_NOC_0_arlen);
  mp_LPD_AXI_NOC_0_transactor->ARSIZE(LPD_AXI_NOC_0_arsize);
  mp_LPD_AXI_NOC_0_transactor->ARBURST(LPD_AXI_NOC_0_arburst);
  mp_LPD_AXI_NOC_0_transactor->ARLOCK(LPD_AXI_NOC_0_arlock);
  mp_LPD_AXI_NOC_0_transactor->ARCACHE(LPD_AXI_NOC_0_arcache);
  mp_LPD_AXI_NOC_0_transactor->ARPROT(LPD_AXI_NOC_0_arprot);
  mp_LPD_AXI_NOC_0_transactor->ARVALID(LPD_AXI_NOC_0_arvalid);
  mp_LPD_AXI_NOC_0_transactor->ARUSER(LPD_AXI_NOC_0_aruser);
  mp_LPD_AXI_NOC_0_transactor->ARREADY(LPD_AXI_NOC_0_arready);
  mp_LPD_AXI_NOC_0_transactor->RID(LPD_AXI_NOC_0_rid);
  mp_LPD_AXI_NOC_0_transactor->RDATA(LPD_AXI_NOC_0_rdata);
  mp_LPD_AXI_NOC_0_transactor->RRESP(LPD_AXI_NOC_0_rresp);
  mp_LPD_AXI_NOC_0_transactor->RLAST(LPD_AXI_NOC_0_rlast);
  mp_LPD_AXI_NOC_0_transactor->RVALID(LPD_AXI_NOC_0_rvalid);
  mp_LPD_AXI_NOC_0_transactor->RREADY(LPD_AXI_NOC_0_rready);
  mp_LPD_AXI_NOC_0_transactor->AWQOS(LPD_AXI_NOC_0_awqos);
  mp_LPD_AXI_NOC_0_transactor->ARQOS(LPD_AXI_NOC_0_arqos);
  mp_LPD_AXI_NOC_0_transactor->CLK(lpd_axi_noc_clk);
  m_LPD_AXI_NOC_0_transactor_rst_signal.write(1);
  mp_LPD_AXI_NOC_0_transactor->RST(m_LPD_AXI_NOC_0_transactor_rst_signal);
  // configure PMC_NOC_AXI_0_transactor
    xsc::common_cpp::properties PMC_NOC_AXI_0_transactor_param_props;
    PMC_NOC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    PMC_NOC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    PMC_NOC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    PMC_NOC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    PMC_NOC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    PMC_NOC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk");
    PMC_NOC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    PMC_NOC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    PMC_NOC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PMC_TO_NOC_NMU");
    PMC_NOC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    PMC_NOC_AXI_0_transactor_param_props.addString("INDEX", "0");
    PMC_NOC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_PMC_NOC_AXI_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,16,18,17>("PMC_NOC_AXI_0_transactor", PMC_NOC_AXI_0_transactor_param_props);
  mp_PMC_NOC_AXI_0_transactor->ARADDR(PMC_NOC_AXI_0_araddr);
  mp_PMC_NOC_AXI_0_transactor->ARBURST(PMC_NOC_AXI_0_arburst);
  mp_PMC_NOC_AXI_0_transactor->ARCACHE(PMC_NOC_AXI_0_arcache);
  mp_PMC_NOC_AXI_0_transactor->ARID(PMC_NOC_AXI_0_arid);
  mp_PMC_NOC_AXI_0_transactor->ARLEN(PMC_NOC_AXI_0_arlen);
  mp_PMC_NOC_AXI_0_transactor->ARLOCK(PMC_NOC_AXI_0_arlock);
  mp_PMC_NOC_AXI_0_transactor->ARPROT(PMC_NOC_AXI_0_arprot);
  mp_PMC_NOC_AXI_0_transactor->ARQOS(PMC_NOC_AXI_0_arqos);
  mp_PMC_NOC_AXI_0_transactor->ARREGION(PMC_NOC_AXI_0_arregion);
  mp_PMC_NOC_AXI_0_transactor->ARSIZE(PMC_NOC_AXI_0_arsize);
  mp_PMC_NOC_AXI_0_transactor->ARUSER(PMC_NOC_AXI_0_aruser);
  mp_PMC_NOC_AXI_0_transactor->ARVALID(PMC_NOC_AXI_0_arvalid);
  mp_PMC_NOC_AXI_0_transactor->AWADDR(PMC_NOC_AXI_0_awaddr);
  mp_PMC_NOC_AXI_0_transactor->AWBURST(PMC_NOC_AXI_0_awburst);
  mp_PMC_NOC_AXI_0_transactor->AWCACHE(PMC_NOC_AXI_0_awcache);
  mp_PMC_NOC_AXI_0_transactor->AWID(PMC_NOC_AXI_0_awid);
  mp_PMC_NOC_AXI_0_transactor->AWLEN(PMC_NOC_AXI_0_awlen);
  mp_PMC_NOC_AXI_0_transactor->AWLOCK(PMC_NOC_AXI_0_awlock);
  mp_PMC_NOC_AXI_0_transactor->AWPROT(PMC_NOC_AXI_0_awprot);
  mp_PMC_NOC_AXI_0_transactor->AWQOS(PMC_NOC_AXI_0_awqos);
  mp_PMC_NOC_AXI_0_transactor->AWREGION(PMC_NOC_AXI_0_awregion);
  mp_PMC_NOC_AXI_0_transactor->AWSIZE(PMC_NOC_AXI_0_awsize);
  mp_PMC_NOC_AXI_0_transactor->AWUSER(PMC_NOC_AXI_0_awuser);
  mp_PMC_NOC_AXI_0_transactor->AWVALID(PMC_NOC_AXI_0_awvalid);
  mp_PMC_NOC_AXI_0_transactor->BREADY(PMC_NOC_AXI_0_bready);
  mp_PMC_NOC_AXI_0_transactor->RREADY(PMC_NOC_AXI_0_rready);
  mp_PMC_NOC_AXI_0_transactor->WDATA(PMC_NOC_AXI_0_wdata);
  mp_PMC_NOC_AXI_0_transactor->WLAST(PMC_NOC_AXI_0_wlast);
  mp_PMC_NOC_AXI_0_transactor->WSTRB(PMC_NOC_AXI_0_wstrb);
  mp_PMC_NOC_AXI_0_transactor->WUSER(PMC_NOC_AXI_0_wuser);
  mp_PMC_NOC_AXI_0_transactor->WVALID(PMC_NOC_AXI_0_wvalid);
  mp_PMC_NOC_AXI_0_transactor->ARREADY(PMC_NOC_AXI_0_arready);
  mp_PMC_NOC_AXI_0_transactor->AWREADY(PMC_NOC_AXI_0_awready);
  mp_PMC_NOC_AXI_0_transactor->BID(PMC_NOC_AXI_0_bid);
  mp_PMC_NOC_AXI_0_transactor->BRESP(PMC_NOC_AXI_0_bresp);
  mp_PMC_NOC_AXI_0_transactor->BUSER(PMC_NOC_AXI_0_buser);
  mp_PMC_NOC_AXI_0_transactor->BVALID(PMC_NOC_AXI_0_bvalid);
  mp_PMC_NOC_AXI_0_transactor->RDATA(PMC_NOC_AXI_0_rdata);
  mp_PMC_NOC_AXI_0_transactor->RID(PMC_NOC_AXI_0_rid);
  mp_PMC_NOC_AXI_0_transactor->RLAST(PMC_NOC_AXI_0_rlast);
  mp_PMC_NOC_AXI_0_transactor->RRESP(PMC_NOC_AXI_0_rresp);
  mp_PMC_NOC_AXI_0_transactor->RUSER(PMC_NOC_AXI_0_ruser);
  mp_PMC_NOC_AXI_0_transactor->RVALID(PMC_NOC_AXI_0_rvalid);
  mp_PMC_NOC_AXI_0_transactor->WREADY(PMC_NOC_AXI_0_wready);
  mp_PMC_NOC_AXI_0_transactor->CLK(pmc_axi_noc_axi0_clk);
  m_PMC_NOC_AXI_0_transactor_rst_signal.write(1);
  mp_PMC_NOC_AXI_0_transactor->RST(m_PMC_NOC_AXI_0_transactor_rst_signal);
  // configure NOC_PMC_AXI_0_transactor
    xsc::common_cpp::properties NOC_PMC_AXI_0_transactor_param_props;
    NOC_PMC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_PMC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_PMC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_PMC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_PMC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_PMC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_PMC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk");
    NOC_PMC_AXI_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_PMC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_PMC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    NOC_PMC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PMC");
    NOC_PMC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    NOC_PMC_AXI_0_transactor_param_props.addString("INDEX", "0");
    NOC_PMC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_NOC_PMC_AXI_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,17,16,18,17>("NOC_PMC_AXI_0_transactor", NOC_PMC_AXI_0_transactor_param_props);
  mp_NOC_PMC_AXI_0_transactor->ARADDR(NOC_PMC_AXI_0_araddr);
  mp_NOC_PMC_AXI_0_transactor->ARBURST(NOC_PMC_AXI_0_arburst);
  mp_NOC_PMC_AXI_0_transactor->ARCACHE(NOC_PMC_AXI_0_arcache);
  mp_NOC_PMC_AXI_0_transactor->ARID(NOC_PMC_AXI_0_arid);
  mp_NOC_PMC_AXI_0_transactor->ARLEN(NOC_PMC_AXI_0_arlen);
  mp_NOC_PMC_AXI_0_transactor->ARLOCK(NOC_PMC_AXI_0_arlock);
  mp_NOC_PMC_AXI_0_transactor->ARPROT(NOC_PMC_AXI_0_arprot);
  mp_NOC_PMC_AXI_0_transactor->ARQOS(NOC_PMC_AXI_0_arqos);
  mp_NOC_PMC_AXI_0_transactor->ARREGION(NOC_PMC_AXI_0_arregion);
  mp_NOC_PMC_AXI_0_transactor->ARSIZE(NOC_PMC_AXI_0_arsize);
  mp_NOC_PMC_AXI_0_transactor->ARUSER(NOC_PMC_AXI_0_aruser);
  mp_NOC_PMC_AXI_0_transactor->ARVALID(NOC_PMC_AXI_0_arvalid);
  mp_NOC_PMC_AXI_0_transactor->AWADDR(NOC_PMC_AXI_0_awaddr);
  mp_NOC_PMC_AXI_0_transactor->AWBURST(NOC_PMC_AXI_0_awburst);
  mp_NOC_PMC_AXI_0_transactor->AWCACHE(NOC_PMC_AXI_0_awcache);
  mp_NOC_PMC_AXI_0_transactor->AWID(NOC_PMC_AXI_0_awid);
  mp_NOC_PMC_AXI_0_transactor->AWLEN(NOC_PMC_AXI_0_awlen);
  mp_NOC_PMC_AXI_0_transactor->AWLOCK(NOC_PMC_AXI_0_awlock);
  mp_NOC_PMC_AXI_0_transactor->AWPROT(NOC_PMC_AXI_0_awprot);
  mp_NOC_PMC_AXI_0_transactor->AWQOS(NOC_PMC_AXI_0_awqos);
  mp_NOC_PMC_AXI_0_transactor->AWREGION(NOC_PMC_AXI_0_awregion);
  mp_NOC_PMC_AXI_0_transactor->AWSIZE(NOC_PMC_AXI_0_awsize);
  mp_NOC_PMC_AXI_0_transactor->AWUSER(NOC_PMC_AXI_0_awuser);
  mp_NOC_PMC_AXI_0_transactor->AWVALID(NOC_PMC_AXI_0_awvalid);
  mp_NOC_PMC_AXI_0_transactor->BREADY(NOC_PMC_AXI_0_bready);
  mp_NOC_PMC_AXI_0_transactor->RREADY(NOC_PMC_AXI_0_rready);
  mp_NOC_PMC_AXI_0_transactor->WDATA(NOC_PMC_AXI_0_wdata);
  mp_NOC_PMC_AXI_0_transactor->WLAST(NOC_PMC_AXI_0_wlast);
  mp_NOC_PMC_AXI_0_transactor->WSTRB(NOC_PMC_AXI_0_wstrb);
  mp_NOC_PMC_AXI_0_transactor->WUSER(NOC_PMC_AXI_0_wuser);
  mp_NOC_PMC_AXI_0_transactor->WVALID(NOC_PMC_AXI_0_wvalid);
  mp_NOC_PMC_AXI_0_transactor->ARREADY(NOC_PMC_AXI_0_arready);
  mp_NOC_PMC_AXI_0_transactor->AWREADY(NOC_PMC_AXI_0_awready);
  mp_NOC_PMC_AXI_0_transactor->BID(NOC_PMC_AXI_0_bid);
  mp_NOC_PMC_AXI_0_transactor->BRESP(NOC_PMC_AXI_0_bresp);
  mp_NOC_PMC_AXI_0_transactor->BUSER(NOC_PMC_AXI_0_buser);
  mp_NOC_PMC_AXI_0_transactor->BVALID(NOC_PMC_AXI_0_bvalid);
  mp_NOC_PMC_AXI_0_transactor->RDATA(NOC_PMC_AXI_0_rdata);
  mp_NOC_PMC_AXI_0_transactor->RID(NOC_PMC_AXI_0_rid);
  mp_NOC_PMC_AXI_0_transactor->RLAST(NOC_PMC_AXI_0_rlast);
  mp_NOC_PMC_AXI_0_transactor->RRESP(NOC_PMC_AXI_0_rresp);
  mp_NOC_PMC_AXI_0_transactor->RUSER(NOC_PMC_AXI_0_ruser);
  mp_NOC_PMC_AXI_0_transactor->RVALID(NOC_PMC_AXI_0_rvalid);
  mp_NOC_PMC_AXI_0_transactor->WREADY(NOC_PMC_AXI_0_wready);
  mp_NOC_PMC_AXI_0_transactor->CLK(noc_pmc_axi_axi0_clk);
  m_NOC_PMC_AXI_0_transactor_rst_signal.write(1);
  mp_NOC_PMC_AXI_0_transactor->RST(m_NOC_PMC_AXI_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_0_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);
  mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
  mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
  mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
  mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
  mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
  mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
  mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
  mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
  mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
  mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
  mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
  mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
  mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
  mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
  mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
  mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
  mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
  mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
  mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
  mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
  mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
  mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
  mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
  mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
  mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
  mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
  mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
  mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
  mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
  mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
  mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
  mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
  mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
  mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
  mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
  mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
  mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
  mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
  mp_CPM_PCIE_NOC_0_transactor->RUSER(CPM_PCIE_NOC_0_ruser);
  mp_CPM_PCIE_NOC_0_transactor->WUSER(CPM_PCIE_NOC_0_wuser);
  mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
  mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
  m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_1_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);
  mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
  mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
  mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
  mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
  mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
  mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
  mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
  mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
  mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
  mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
  mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
  mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
  mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
  mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
  mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
  mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
  mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
  mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
  mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
  mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
  mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
  mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
  mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
  mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
  mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
  mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
  mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
  mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
  mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
  mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
  mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
  mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
  mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
  mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
  mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
  mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
  mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
  mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
  mp_CPM_PCIE_NOC_1_transactor->RUSER(CPM_PCIE_NOC_1_ruser);
  mp_CPM_PCIE_NOC_1_transactor->WUSER(CPM_PCIE_NOC_1_wuser);
  mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
  mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
  m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);
  // configure dma0_st_rx_msg_transactor
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "300000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "full_blown_noc_clk_gen_0_axi_clk_0");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);
  mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
  mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
  mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
  mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
  mp_dma0_st_rx_msg_transactor->CLK(dma0_intrfc_clk);
  mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

  // initialize transactors stubs
  FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub = nullptr;
  LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub = nullptr;
  PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub = nullptr;
  NOC_PMC_AXI_0_transactor_target_wr_socket_stub = nullptr;
  NOC_PMC_AXI_0_transactor_target_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  dma0_st_rx_msg_transactor_initiator_socket_stub = nullptr;

}

void full_blown_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'FPD_CCI_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
    FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_FPD_CCI_NOC_0_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
    FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_FPD_CCI_NOC_1_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_2' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_2_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
    FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_FPD_CCI_NOC_2_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_3' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_3_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
    FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_FPD_CCI_NOC_3_transactor->disable_transactor();
  }

  // configure 'LPD_AXI_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "LPD_AXI_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_read_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_write_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
    LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_LPD_AXI_NOC_0_transactor->disable_transactor();
  }

  // configure 'PMC_NOC_AXI_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "PMC_NOC_AXI_0_TLM_MODE") != 1)
  {
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_read_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_write_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
  
  }
  else
  {
    PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
    PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_PMC_NOC_AXI_0_transactor->disable_transactor();
  }

  // configure 'NOC_PMC_AXI_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "NOC_PMC_AXI_0_TLM_MODE") != 1)
  {
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
  
  }
  else
  {
    NOC_PMC_AXI_0_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    NOC_PMC_AXI_0_transactor_target_wr_socket_stub->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
    NOC_PMC_AXI_0_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    NOC_PMC_AXI_0_transactor_target_rd_socket_stub->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_NOC_PMC_AXI_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_CPM_PCIE_NOC_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_CPM_PCIE_NOC_1_transactor->disable_transactor();
  }

  // configure 'dma0_st_rx_msg' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  
  }
  else
  {
    dma0_st_rx_msg_transactor_initiator_socket_stub = new xtlm::xtlm_axis_initiator_stub("socket",0);
    dma0_st_rx_msg_transactor_initiator_socket_stub->bind(*(mp_dma0_st_rx_msg_transactor->socket));
    mp_dma0_st_rx_msg_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
full_blown_versal_cips_0_0::full_blown_versal_cips_0_0(const sc_core::sc_module_name& nm) : full_blown_versal_cips_0_0_sc(nm),  fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk"), fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk"), fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk"), fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk"), lpd_axi_noc_clk("lpd_axi_noc_clk"), pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk"), noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk"), gem0_tsu_timer_cnt("gem0_tsu_timer_cnt"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), dma0_intrfc_clk("dma0_intrfc_clk"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_intrfc_resetn("dma0_intrfc_resetn"), FPD_CCI_NOC_0_awid("FPD_CCI_NOC_0_awid"), FPD_CCI_NOC_0_awaddr("FPD_CCI_NOC_0_awaddr"), FPD_CCI_NOC_0_awlen("FPD_CCI_NOC_0_awlen"), FPD_CCI_NOC_0_awsize("FPD_CCI_NOC_0_awsize"), FPD_CCI_NOC_0_awburst("FPD_CCI_NOC_0_awburst"), FPD_CCI_NOC_0_awlock("FPD_CCI_NOC_0_awlock"), FPD_CCI_NOC_0_awcache("FPD_CCI_NOC_0_awcache"), FPD_CCI_NOC_0_awprot("FPD_CCI_NOC_0_awprot"), FPD_CCI_NOC_0_awvalid("FPD_CCI_NOC_0_awvalid"), FPD_CCI_NOC_0_awuser("FPD_CCI_NOC_0_awuser"), FPD_CCI_NOC_0_awready("FPD_CCI_NOC_0_awready"), FPD_CCI_NOC_0_wdata("FPD_CCI_NOC_0_wdata"), FPD_CCI_NOC_0_wstrb("FPD_CCI_NOC_0_wstrb"), FPD_CCI_NOC_0_wuser("FPD_CCI_NOC_0_wuser"), FPD_CCI_NOC_0_wlast("FPD_CCI_NOC_0_wlast"), FPD_CCI_NOC_0_wvalid("FPD_CCI_NOC_0_wvalid"), FPD_CCI_NOC_0_wready("FPD_CCI_NOC_0_wready"), FPD_CCI_NOC_0_bid("FPD_CCI_NOC_0_bid"), FPD_CCI_NOC_0_bresp("FPD_CCI_NOC_0_bresp"), FPD_CCI_NOC_0_bvalid("FPD_CCI_NOC_0_bvalid"), FPD_CCI_NOC_0_bready("FPD_CCI_NOC_0_bready"), FPD_CCI_NOC_0_arid("FPD_CCI_NOC_0_arid"), FPD_CCI_NOC_0_araddr("FPD_CCI_NOC_0_araddr"), FPD_CCI_NOC_0_arlen("FPD_CCI_NOC_0_arlen"), FPD_CCI_NOC_0_arsize("FPD_CCI_NOC_0_arsize"), FPD_CCI_NOC_0_arburst("FPD_CCI_NOC_0_arburst"), FPD_CCI_NOC_0_arlock("FPD_CCI_NOC_0_arlock"), FPD_CCI_NOC_0_arcache("FPD_CCI_NOC_0_arcache"), FPD_CCI_NOC_0_arprot("FPD_CCI_NOC_0_arprot"), FPD_CCI_NOC_0_arvalid("FPD_CCI_NOC_0_arvalid"), FPD_CCI_NOC_0_aruser("FPD_CCI_NOC_0_aruser"), FPD_CCI_NOC_0_arready("FPD_CCI_NOC_0_arready"), FPD_CCI_NOC_0_rid("FPD_CCI_NOC_0_rid"), FPD_CCI_NOC_0_rdata("FPD_CCI_NOC_0_rdata"), FPD_CCI_NOC_0_rresp("FPD_CCI_NOC_0_rresp"), FPD_CCI_NOC_0_rlast("FPD_CCI_NOC_0_rlast"), FPD_CCI_NOC_0_rvalid("FPD_CCI_NOC_0_rvalid"), FPD_CCI_NOC_0_rready("FPD_CCI_NOC_0_rready"), FPD_CCI_NOC_0_awqos("FPD_CCI_NOC_0_awqos"), FPD_CCI_NOC_0_arqos("FPD_CCI_NOC_0_arqos"), FPD_CCI_NOC_1_awid("FPD_CCI_NOC_1_awid"), FPD_CCI_NOC_1_awaddr("FPD_CCI_NOC_1_awaddr"), FPD_CCI_NOC_1_awlen("FPD_CCI_NOC_1_awlen"), FPD_CCI_NOC_1_awsize("FPD_CCI_NOC_1_awsize"), FPD_CCI_NOC_1_awburst("FPD_CCI_NOC_1_awburst"), FPD_CCI_NOC_1_awlock("FPD_CCI_NOC_1_awlock"), FPD_CCI_NOC_1_awcache("FPD_CCI_NOC_1_awcache"), FPD_CCI_NOC_1_awprot("FPD_CCI_NOC_1_awprot"), FPD_CCI_NOC_1_awvalid("FPD_CCI_NOC_1_awvalid"), FPD_CCI_NOC_1_awuser("FPD_CCI_NOC_1_awuser"), FPD_CCI_NOC_1_awready("FPD_CCI_NOC_1_awready"), FPD_CCI_NOC_1_wdata("FPD_CCI_NOC_1_wdata"), FPD_CCI_NOC_1_wstrb("FPD_CCI_NOC_1_wstrb"), FPD_CCI_NOC_1_wuser("FPD_CCI_NOC_1_wuser"), FPD_CCI_NOC_1_wlast("FPD_CCI_NOC_1_wlast"), FPD_CCI_NOC_1_wvalid("FPD_CCI_NOC_1_wvalid"), FPD_CCI_NOC_1_wready("FPD_CCI_NOC_1_wready"), FPD_CCI_NOC_1_bid("FPD_CCI_NOC_1_bid"), FPD_CCI_NOC_1_bresp("FPD_CCI_NOC_1_bresp"), FPD_CCI_NOC_1_bvalid("FPD_CCI_NOC_1_bvalid"), FPD_CCI_NOC_1_bready("FPD_CCI_NOC_1_bready"), FPD_CCI_NOC_1_arid("FPD_CCI_NOC_1_arid"), FPD_CCI_NOC_1_araddr("FPD_CCI_NOC_1_araddr"), FPD_CCI_NOC_1_arlen("FPD_CCI_NOC_1_arlen"), FPD_CCI_NOC_1_arsize("FPD_CCI_NOC_1_arsize"), FPD_CCI_NOC_1_arburst("FPD_CCI_NOC_1_arburst"), FPD_CCI_NOC_1_arlock("FPD_CCI_NOC_1_arlock"), FPD_CCI_NOC_1_arcache("FPD_CCI_NOC_1_arcache"), FPD_CCI_NOC_1_arprot("FPD_CCI_NOC_1_arprot"), FPD_CCI_NOC_1_arvalid("FPD_CCI_NOC_1_arvalid"), FPD_CCI_NOC_1_aruser("FPD_CCI_NOC_1_aruser"), FPD_CCI_NOC_1_arready("FPD_CCI_NOC_1_arready"), FPD_CCI_NOC_1_rid("FPD_CCI_NOC_1_rid"), FPD_CCI_NOC_1_rdata("FPD_CCI_NOC_1_rdata"), FPD_CCI_NOC_1_rresp("FPD_CCI_NOC_1_rresp"), FPD_CCI_NOC_1_rlast("FPD_CCI_NOC_1_rlast"), FPD_CCI_NOC_1_rvalid("FPD_CCI_NOC_1_rvalid"), FPD_CCI_NOC_1_rready("FPD_CCI_NOC_1_rready"), FPD_CCI_NOC_1_awqos("FPD_CCI_NOC_1_awqos"), FPD_CCI_NOC_1_arqos("FPD_CCI_NOC_1_arqos"), FPD_CCI_NOC_2_awid("FPD_CCI_NOC_2_awid"), FPD_CCI_NOC_2_awaddr("FPD_CCI_NOC_2_awaddr"), FPD_CCI_NOC_2_awlen("FPD_CCI_NOC_2_awlen"), FPD_CCI_NOC_2_awsize("FPD_CCI_NOC_2_awsize"), FPD_CCI_NOC_2_awburst("FPD_CCI_NOC_2_awburst"), FPD_CCI_NOC_2_awlock("FPD_CCI_NOC_2_awlock"), FPD_CCI_NOC_2_awcache("FPD_CCI_NOC_2_awcache"), FPD_CCI_NOC_2_awprot("FPD_CCI_NOC_2_awprot"), FPD_CCI_NOC_2_awvalid("FPD_CCI_NOC_2_awvalid"), FPD_CCI_NOC_2_awuser("FPD_CCI_NOC_2_awuser"), FPD_CCI_NOC_2_awready("FPD_CCI_NOC_2_awready"), FPD_CCI_NOC_2_wdata("FPD_CCI_NOC_2_wdata"), FPD_CCI_NOC_2_wstrb("FPD_CCI_NOC_2_wstrb"), FPD_CCI_NOC_2_wuser("FPD_CCI_NOC_2_wuser"), FPD_CCI_NOC_2_wlast("FPD_CCI_NOC_2_wlast"), FPD_CCI_NOC_2_wvalid("FPD_CCI_NOC_2_wvalid"), FPD_CCI_NOC_2_wready("FPD_CCI_NOC_2_wready"), FPD_CCI_NOC_2_bid("FPD_CCI_NOC_2_bid"), FPD_CCI_NOC_2_bresp("FPD_CCI_NOC_2_bresp"), FPD_CCI_NOC_2_bvalid("FPD_CCI_NOC_2_bvalid"), FPD_CCI_NOC_2_bready("FPD_CCI_NOC_2_bready"), FPD_CCI_NOC_2_arid("FPD_CCI_NOC_2_arid"), FPD_CCI_NOC_2_araddr("FPD_CCI_NOC_2_araddr"), FPD_CCI_NOC_2_arlen("FPD_CCI_NOC_2_arlen"), FPD_CCI_NOC_2_arsize("FPD_CCI_NOC_2_arsize"), FPD_CCI_NOC_2_arburst("FPD_CCI_NOC_2_arburst"), FPD_CCI_NOC_2_arlock("FPD_CCI_NOC_2_arlock"), FPD_CCI_NOC_2_arcache("FPD_CCI_NOC_2_arcache"), FPD_CCI_NOC_2_arprot("FPD_CCI_NOC_2_arprot"), FPD_CCI_NOC_2_arvalid("FPD_CCI_NOC_2_arvalid"), FPD_CCI_NOC_2_aruser("FPD_CCI_NOC_2_aruser"), FPD_CCI_NOC_2_arready("FPD_CCI_NOC_2_arready"), FPD_CCI_NOC_2_rid("FPD_CCI_NOC_2_rid"), FPD_CCI_NOC_2_rdata("FPD_CCI_NOC_2_rdata"), FPD_CCI_NOC_2_rresp("FPD_CCI_NOC_2_rresp"), FPD_CCI_NOC_2_rlast("FPD_CCI_NOC_2_rlast"), FPD_CCI_NOC_2_rvalid("FPD_CCI_NOC_2_rvalid"), FPD_CCI_NOC_2_rready("FPD_CCI_NOC_2_rready"), FPD_CCI_NOC_2_awqos("FPD_CCI_NOC_2_awqos"), FPD_CCI_NOC_2_arqos("FPD_CCI_NOC_2_arqos"), FPD_CCI_NOC_3_awid("FPD_CCI_NOC_3_awid"), FPD_CCI_NOC_3_awaddr("FPD_CCI_NOC_3_awaddr"), FPD_CCI_NOC_3_awlen("FPD_CCI_NOC_3_awlen"), FPD_CCI_NOC_3_awsize("FPD_CCI_NOC_3_awsize"), FPD_CCI_NOC_3_awburst("FPD_CCI_NOC_3_awburst"), FPD_CCI_NOC_3_awlock("FPD_CCI_NOC_3_awlock"), FPD_CCI_NOC_3_awcache("FPD_CCI_NOC_3_awcache"), FPD_CCI_NOC_3_awprot("FPD_CCI_NOC_3_awprot"), FPD_CCI_NOC_3_awvalid("FPD_CCI_NOC_3_awvalid"), FPD_CCI_NOC_3_awuser("FPD_CCI_NOC_3_awuser"), FPD_CCI_NOC_3_awready("FPD_CCI_NOC_3_awready"), FPD_CCI_NOC_3_wdata("FPD_CCI_NOC_3_wdata"), FPD_CCI_NOC_3_wstrb("FPD_CCI_NOC_3_wstrb"), FPD_CCI_NOC_3_wuser("FPD_CCI_NOC_3_wuser"), FPD_CCI_NOC_3_wlast("FPD_CCI_NOC_3_wlast"), FPD_CCI_NOC_3_wvalid("FPD_CCI_NOC_3_wvalid"), FPD_CCI_NOC_3_wready("FPD_CCI_NOC_3_wready"), FPD_CCI_NOC_3_bid("FPD_CCI_NOC_3_bid"), FPD_CCI_NOC_3_bresp("FPD_CCI_NOC_3_bresp"), FPD_CCI_NOC_3_bvalid("FPD_CCI_NOC_3_bvalid"), FPD_CCI_NOC_3_bready("FPD_CCI_NOC_3_bready"), FPD_CCI_NOC_3_arid("FPD_CCI_NOC_3_arid"), FPD_CCI_NOC_3_araddr("FPD_CCI_NOC_3_araddr"), FPD_CCI_NOC_3_arlen("FPD_CCI_NOC_3_arlen"), FPD_CCI_NOC_3_arsize("FPD_CCI_NOC_3_arsize"), FPD_CCI_NOC_3_arburst("FPD_CCI_NOC_3_arburst"), FPD_CCI_NOC_3_arlock("FPD_CCI_NOC_3_arlock"), FPD_CCI_NOC_3_arcache("FPD_CCI_NOC_3_arcache"), FPD_CCI_NOC_3_arprot("FPD_CCI_NOC_3_arprot"), FPD_CCI_NOC_3_arvalid("FPD_CCI_NOC_3_arvalid"), FPD_CCI_NOC_3_aruser("FPD_CCI_NOC_3_aruser"), FPD_CCI_NOC_3_arready("FPD_CCI_NOC_3_arready"), FPD_CCI_NOC_3_rid("FPD_CCI_NOC_3_rid"), FPD_CCI_NOC_3_rdata("FPD_CCI_NOC_3_rdata"), FPD_CCI_NOC_3_rresp("FPD_CCI_NOC_3_rresp"), FPD_CCI_NOC_3_rlast("FPD_CCI_NOC_3_rlast"), FPD_CCI_NOC_3_rvalid("FPD_CCI_NOC_3_rvalid"), FPD_CCI_NOC_3_rready("FPD_CCI_NOC_3_rready"), FPD_CCI_NOC_3_awqos("FPD_CCI_NOC_3_awqos"), FPD_CCI_NOC_3_arqos("FPD_CCI_NOC_3_arqos"), LPD_AXI_NOC_0_awid("LPD_AXI_NOC_0_awid"), LPD_AXI_NOC_0_awaddr("LPD_AXI_NOC_0_awaddr"), LPD_AXI_NOC_0_awlen("LPD_AXI_NOC_0_awlen"), LPD_AXI_NOC_0_awsize("LPD_AXI_NOC_0_awsize"), LPD_AXI_NOC_0_awburst("LPD_AXI_NOC_0_awburst"), LPD_AXI_NOC_0_awlock("LPD_AXI_NOC_0_awlock"), LPD_AXI_NOC_0_awcache("LPD_AXI_NOC_0_awcache"), LPD_AXI_NOC_0_awprot("LPD_AXI_NOC_0_awprot"), LPD_AXI_NOC_0_awvalid("LPD_AXI_NOC_0_awvalid"), LPD_AXI_NOC_0_awuser("LPD_AXI_NOC_0_awuser"), LPD_AXI_NOC_0_awready("LPD_AXI_NOC_0_awready"), LPD_AXI_NOC_0_wdata("LPD_AXI_NOC_0_wdata"), LPD_AXI_NOC_0_wstrb("LPD_AXI_NOC_0_wstrb"), LPD_AXI_NOC_0_wlast("LPD_AXI_NOC_0_wlast"), LPD_AXI_NOC_0_wvalid("LPD_AXI_NOC_0_wvalid"), LPD_AXI_NOC_0_wready("LPD_AXI_NOC_0_wready"), LPD_AXI_NOC_0_bid("LPD_AXI_NOC_0_bid"), LPD_AXI_NOC_0_bresp("LPD_AXI_NOC_0_bresp"), LPD_AXI_NOC_0_bvalid("LPD_AXI_NOC_0_bvalid"), LPD_AXI_NOC_0_bready("LPD_AXI_NOC_0_bready"), LPD_AXI_NOC_0_arid("LPD_AXI_NOC_0_arid"), LPD_AXI_NOC_0_araddr("LPD_AXI_NOC_0_araddr"), LPD_AXI_NOC_0_arlen("LPD_AXI_NOC_0_arlen"), LPD_AXI_NOC_0_arsize("LPD_AXI_NOC_0_arsize"), LPD_AXI_NOC_0_arburst("LPD_AXI_NOC_0_arburst"), LPD_AXI_NOC_0_arlock("LPD_AXI_NOC_0_arlock"), LPD_AXI_NOC_0_arcache("LPD_AXI_NOC_0_arcache"), LPD_AXI_NOC_0_arprot("LPD_AXI_NOC_0_arprot"), LPD_AXI_NOC_0_arvalid("LPD_AXI_NOC_0_arvalid"), LPD_AXI_NOC_0_aruser("LPD_AXI_NOC_0_aruser"), LPD_AXI_NOC_0_arready("LPD_AXI_NOC_0_arready"), LPD_AXI_NOC_0_rid("LPD_AXI_NOC_0_rid"), LPD_AXI_NOC_0_rdata("LPD_AXI_NOC_0_rdata"), LPD_AXI_NOC_0_rresp("LPD_AXI_NOC_0_rresp"), LPD_AXI_NOC_0_rlast("LPD_AXI_NOC_0_rlast"), LPD_AXI_NOC_0_rvalid("LPD_AXI_NOC_0_rvalid"), LPD_AXI_NOC_0_rready("LPD_AXI_NOC_0_rready"), LPD_AXI_NOC_0_awqos("LPD_AXI_NOC_0_awqos"), LPD_AXI_NOC_0_arqos("LPD_AXI_NOC_0_arqos"), PMC_NOC_AXI_0_araddr("PMC_NOC_AXI_0_araddr"), PMC_NOC_AXI_0_arburst("PMC_NOC_AXI_0_arburst"), PMC_NOC_AXI_0_arcache("PMC_NOC_AXI_0_arcache"), PMC_NOC_AXI_0_arid("PMC_NOC_AXI_0_arid"), PMC_NOC_AXI_0_arlen("PMC_NOC_AXI_0_arlen"), PMC_NOC_AXI_0_arlock("PMC_NOC_AXI_0_arlock"), PMC_NOC_AXI_0_arprot("PMC_NOC_AXI_0_arprot"), PMC_NOC_AXI_0_arqos("PMC_NOC_AXI_0_arqos"), PMC_NOC_AXI_0_arregion("PMC_NOC_AXI_0_arregion"), PMC_NOC_AXI_0_arsize("PMC_NOC_AXI_0_arsize"), PMC_NOC_AXI_0_aruser("PMC_NOC_AXI_0_aruser"), PMC_NOC_AXI_0_arvalid("PMC_NOC_AXI_0_arvalid"), PMC_NOC_AXI_0_awaddr("PMC_NOC_AXI_0_awaddr"), PMC_NOC_AXI_0_awburst("PMC_NOC_AXI_0_awburst"), PMC_NOC_AXI_0_awcache("PMC_NOC_AXI_0_awcache"), PMC_NOC_AXI_0_awid("PMC_NOC_AXI_0_awid"), PMC_NOC_AXI_0_awlen("PMC_NOC_AXI_0_awlen"), PMC_NOC_AXI_0_awlock("PMC_NOC_AXI_0_awlock"), PMC_NOC_AXI_0_awprot("PMC_NOC_AXI_0_awprot"), PMC_NOC_AXI_0_awqos("PMC_NOC_AXI_0_awqos"), PMC_NOC_AXI_0_awregion("PMC_NOC_AXI_0_awregion"), PMC_NOC_AXI_0_awsize("PMC_NOC_AXI_0_awsize"), PMC_NOC_AXI_0_awuser("PMC_NOC_AXI_0_awuser"), PMC_NOC_AXI_0_awvalid("PMC_NOC_AXI_0_awvalid"), PMC_NOC_AXI_0_bready("PMC_NOC_AXI_0_bready"), PMC_NOC_AXI_0_rready("PMC_NOC_AXI_0_rready"), PMC_NOC_AXI_0_wdata("PMC_NOC_AXI_0_wdata"), PMC_NOC_AXI_0_wid("PMC_NOC_AXI_0_wid"), PMC_NOC_AXI_0_wlast("PMC_NOC_AXI_0_wlast"), PMC_NOC_AXI_0_wstrb("PMC_NOC_AXI_0_wstrb"), PMC_NOC_AXI_0_wuser("PMC_NOC_AXI_0_wuser"), PMC_NOC_AXI_0_wvalid("PMC_NOC_AXI_0_wvalid"), PMC_NOC_AXI_0_arready("PMC_NOC_AXI_0_arready"), PMC_NOC_AXI_0_awready("PMC_NOC_AXI_0_awready"), PMC_NOC_AXI_0_bid("PMC_NOC_AXI_0_bid"), PMC_NOC_AXI_0_bresp("PMC_NOC_AXI_0_bresp"), PMC_NOC_AXI_0_buser("PMC_NOC_AXI_0_buser"), PMC_NOC_AXI_0_bvalid("PMC_NOC_AXI_0_bvalid"), PMC_NOC_AXI_0_rdata("PMC_NOC_AXI_0_rdata"), PMC_NOC_AXI_0_rid("PMC_NOC_AXI_0_rid"), PMC_NOC_AXI_0_rlast("PMC_NOC_AXI_0_rlast"), PMC_NOC_AXI_0_rresp("PMC_NOC_AXI_0_rresp"), PMC_NOC_AXI_0_ruser("PMC_NOC_AXI_0_ruser"), PMC_NOC_AXI_0_rvalid("PMC_NOC_AXI_0_rvalid"), PMC_NOC_AXI_0_wready("PMC_NOC_AXI_0_wready"), NOC_PMC_AXI_0_araddr("NOC_PMC_AXI_0_araddr"), NOC_PMC_AXI_0_arburst("NOC_PMC_AXI_0_arburst"), NOC_PMC_AXI_0_arcache("NOC_PMC_AXI_0_arcache"), NOC_PMC_AXI_0_arid("NOC_PMC_AXI_0_arid"), NOC_PMC_AXI_0_arlen("NOC_PMC_AXI_0_arlen"), NOC_PMC_AXI_0_arlock("NOC_PMC_AXI_0_arlock"), NOC_PMC_AXI_0_arprot("NOC_PMC_AXI_0_arprot"), NOC_PMC_AXI_0_arqos("NOC_PMC_AXI_0_arqos"), NOC_PMC_AXI_0_arregion("NOC_PMC_AXI_0_arregion"), NOC_PMC_AXI_0_arsize("NOC_PMC_AXI_0_arsize"), NOC_PMC_AXI_0_aruser("NOC_PMC_AXI_0_aruser"), NOC_PMC_AXI_0_arvalid("NOC_PMC_AXI_0_arvalid"), NOC_PMC_AXI_0_awaddr("NOC_PMC_AXI_0_awaddr"), NOC_PMC_AXI_0_awburst("NOC_PMC_AXI_0_awburst"), NOC_PMC_AXI_0_awcache("NOC_PMC_AXI_0_awcache"), NOC_PMC_AXI_0_awid("NOC_PMC_AXI_0_awid"), NOC_PMC_AXI_0_awlen("NOC_PMC_AXI_0_awlen"), NOC_PMC_AXI_0_awlock("NOC_PMC_AXI_0_awlock"), NOC_PMC_AXI_0_awprot("NOC_PMC_AXI_0_awprot"), NOC_PMC_AXI_0_awqos("NOC_PMC_AXI_0_awqos"), NOC_PMC_AXI_0_awregion("NOC_PMC_AXI_0_awregion"), NOC_PMC_AXI_0_awsize("NOC_PMC_AXI_0_awsize"), NOC_PMC_AXI_0_awuser("NOC_PMC_AXI_0_awuser"), NOC_PMC_AXI_0_awvalid("NOC_PMC_AXI_0_awvalid"), NOC_PMC_AXI_0_bready("NOC_PMC_AXI_0_bready"), NOC_PMC_AXI_0_rready("NOC_PMC_AXI_0_rready"), NOC_PMC_AXI_0_wdata("NOC_PMC_AXI_0_wdata"), NOC_PMC_AXI_0_wid("NOC_PMC_AXI_0_wid"), NOC_PMC_AXI_0_wlast("NOC_PMC_AXI_0_wlast"), NOC_PMC_AXI_0_wstrb("NOC_PMC_AXI_0_wstrb"), NOC_PMC_AXI_0_wuser("NOC_PMC_AXI_0_wuser"), NOC_PMC_AXI_0_wvalid("NOC_PMC_AXI_0_wvalid"), NOC_PMC_AXI_0_arready("NOC_PMC_AXI_0_arready"), NOC_PMC_AXI_0_awready("NOC_PMC_AXI_0_awready"), NOC_PMC_AXI_0_bid("NOC_PMC_AXI_0_bid"), NOC_PMC_AXI_0_bresp("NOC_PMC_AXI_0_bresp"), NOC_PMC_AXI_0_buser("NOC_PMC_AXI_0_buser"), NOC_PMC_AXI_0_bvalid("NOC_PMC_AXI_0_bvalid"), NOC_PMC_AXI_0_rdata("NOC_PMC_AXI_0_rdata"), NOC_PMC_AXI_0_rid("NOC_PMC_AXI_0_rid"), NOC_PMC_AXI_0_rlast("NOC_PMC_AXI_0_rlast"), NOC_PMC_AXI_0_rresp("NOC_PMC_AXI_0_rresp"), NOC_PMC_AXI_0_ruser("NOC_PMC_AXI_0_ruser"), NOC_PMC_AXI_0_rvalid("NOC_PMC_AXI_0_rvalid"), NOC_PMC_AXI_0_wready("NOC_PMC_AXI_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_ruser("CPM_PCIE_NOC_0_ruser"), CPM_PCIE_NOC_0_wuser("CPM_PCIE_NOC_0_wuser"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_ruser("CPM_PCIE_NOC_1_ruser"), CPM_PCIE_NOC_1_wuser("CPM_PCIE_NOC_1_wuser"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp"), dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch"), dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id"), dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready"), dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast"), dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid"), dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc"), dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata"), dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty"), dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc"), dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker"), dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt"), dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len"), dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid"), dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id"), dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker"), dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig"), dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size"), dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid"), dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker"), dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id"), dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx"), dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx"), dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id"), dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready"), dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid"), dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar"), dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data"), dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type"), dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast"), dma0_m_axis_h2c_err("dma0_m_axis_h2c_err"), dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid"), dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata"), dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte"), dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready"), dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc"), dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty"), dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid"), dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata"), dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id"), dma0_axis_c2h_status_last("dma0_axis_c2h_status_last"), dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop"), dma0_axis_c2h_status_error("dma0_axis_c2h_status_error"), dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid"), dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp"), dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid"), dma0_qsts_out_vld("dma0_qsts_out_vld"), dma0_qsts_out_op("dma0_qsts_out_op"), dma0_qsts_out_rdy("dma0_qsts_out_rdy"), dma0_qsts_out_qid("dma0_qsts_out_qid"), dma0_qsts_out_data("dma0_qsts_out_data"), dma0_qsts_out_port_id("dma0_qsts_out_port_id"), dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy"), dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir"), dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid"), dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence"), dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid"), dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt"), dma0_usr_irq_ack("dma0_usr_irq_ack"), dma0_usr_irq_fail("dma0_usr_irq_fail"), dma0_usr_irq_valid("dma0_usr_irq_valid"), dma0_usr_irq_vec("dma0_usr_irq_vec"), dma0_usr_irq_fnc("dma0_usr_irq_fnc"), dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm"), dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen"), dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp"), dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir"), dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error"), dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid"), dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv"), dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm"), dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy"), dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid"), dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl"), dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx"), dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id"), dma0_usr_flr_set("dma0_usr_flr_set"), dma0_usr_flr_clear("dma0_usr_flr_clear"), dma0_usr_flr_fnc("dma0_usr_flr_fnc"), dma0_usr_flr_done_vld("dma0_usr_flr_done_vld"), dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{
  // initialize pins
  mp_impl->fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk);
  mp_impl->fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk);
  mp_impl->fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk);
  mp_impl->fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk);
  mp_impl->lpd_axi_noc_clk(lpd_axi_noc_clk);
  mp_impl->pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk);
  mp_impl->noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk);
  mp_impl->gem0_tsu_timer_cnt(gem0_tsu_timer_cnt);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->dma0_intrfc_clk(dma0_intrfc_clk);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_intrfc_resetn(dma0_intrfc_resetn);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp);
  mp_impl->dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch);
  mp_impl->dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id);
  mp_impl->dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready);
  mp_impl->dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast);
  mp_impl->dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid);
  mp_impl->dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc);
  mp_impl->dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata);
  mp_impl->dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty);
  mp_impl->dma0_s_axis_c2h_ecc(dma0_s_axis_c2h_ecc);
  mp_impl->dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker);
  mp_impl->dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt);
  mp_impl->dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len);
  mp_impl->dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid);
  mp_impl->dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_marker(dma0_s_axis_c2h_cmpt_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_user_trig(dma0_s_axis_c2h_cmpt_user_trig);
  mp_impl->dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size);
  mp_impl->dma0_s_axis_c2h_cmpt_qid(dma0_s_axis_c2h_cmpt_qid);
  mp_impl->dma0_s_axis_c2h_cmpt_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker);
  mp_impl->dma0_s_axis_c2h_cmpt_port_id(dma0_s_axis_c2h_cmpt_port_id);
  mp_impl->dma0_s_axis_c2h_cmpt_col_idx(dma0_s_axis_c2h_cmpt_col_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_err_idx(dma0_s_axis_c2h_cmpt_err_idx);
  mp_impl->dma0_s_axis_c2h_cmpt_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id);
  mp_impl->dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready);
  mp_impl->dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid);
  mp_impl->dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar);
  mp_impl->dma0_s_axis_c2h_cmpt_data(dma0_s_axis_c2h_cmpt_data);
  mp_impl->dma0_s_axis_c2h_cmpt_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type);
  mp_impl->dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast);
  mp_impl->dma0_m_axis_h2c_err(dma0_m_axis_h2c_err);
  mp_impl->dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid);
  mp_impl->dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata);
  mp_impl->dma0_m_axis_h2c_zero_byte(dma0_m_axis_h2c_zero_byte);
  mp_impl->dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready);
  mp_impl->dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc);
  mp_impl->dma0_m_axis_h2c_mty(dma0_m_axis_h2c_mty);
  mp_impl->dma0_m_axis_h2c_qid(dma0_m_axis_h2c_qid);
  mp_impl->dma0_m_axis_h2c_mdata(dma0_m_axis_h2c_mdata);
  mp_impl->dma0_m_axis_h2c_port_id(dma0_m_axis_h2c_port_id);
  mp_impl->dma0_axis_c2h_status_last(dma0_axis_c2h_status_last);
  mp_impl->dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop);
  mp_impl->dma0_axis_c2h_status_error(dma0_axis_c2h_status_error);
  mp_impl->dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid);
  mp_impl->dma0_axis_c2h_status_status_cmp(dma0_axis_c2h_status_status_cmp);
  mp_impl->dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid);
  mp_impl->dma0_qsts_out_vld(dma0_qsts_out_vld);
  mp_impl->dma0_qsts_out_op(dma0_qsts_out_op);
  mp_impl->dma0_qsts_out_rdy(dma0_qsts_out_rdy);
  mp_impl->dma0_qsts_out_qid(dma0_qsts_out_qid);
  mp_impl->dma0_qsts_out_data(dma0_qsts_out_data);
  mp_impl->dma0_qsts_out_port_id(dma0_qsts_out_port_id);
  mp_impl->dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy);
  mp_impl->dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir);
  mp_impl->dma0_dsc_crdt_in_valid(dma0_dsc_crdt_in_valid);
  mp_impl->dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence);
  mp_impl->dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid);
  mp_impl->dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt);
  mp_impl->dma0_usr_irq_ack(dma0_usr_irq_ack);
  mp_impl->dma0_usr_irq_fail(dma0_usr_irq_fail);
  mp_impl->dma0_usr_irq_valid(dma0_usr_irq_valid);
  mp_impl->dma0_usr_irq_vec(dma0_usr_irq_vec);
  mp_impl->dma0_usr_irq_fnc(dma0_usr_irq_fnc);
  mp_impl->dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm);
  mp_impl->dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen);
  mp_impl->dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp);
  mp_impl->dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir);
  mp_impl->dma0_tm_dsc_sts_error(dma0_tm_dsc_sts_error);
  mp_impl->dma0_tm_dsc_sts_valid(dma0_tm_dsc_sts_valid);
  mp_impl->dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv);
  mp_impl->dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm);
  mp_impl->dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy);
  mp_impl->dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid);
  mp_impl->dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl);
  mp_impl->dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx);
  mp_impl->dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id);
  mp_impl->dma0_usr_flr_set(dma0_usr_flr_set);
  mp_impl->dma0_usr_flr_clear(dma0_usr_flr_clear);
  mp_impl->dma0_usr_flr_fnc(dma0_usr_flr_fnc);
  mp_impl->dma0_usr_flr_done_vld(dma0_usr_flr_done_vld);
  mp_impl->dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_FPD_CCI_NOC_0_transactor = NULL;
  mp_FPD_CCI_NOC_1_transactor = NULL;
  mp_FPD_CCI_NOC_2_transactor = NULL;
  mp_FPD_CCI_NOC_3_transactor = NULL;
  mp_LPD_AXI_NOC_0_transactor = NULL;
  mp_PMC_NOC_AXI_0_transactor = NULL;
  mp_NOC_PMC_AXI_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // Instantiate Socket Stubs

  // configure FPD_CCI_NOC_0_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_0_transactor_param_props;
    FPD_CCI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk");
    FPD_CCI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_FPD_CCI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_0_transactor", FPD_CCI_NOC_0_transactor_param_props);
  mp_FPD_CCI_NOC_0_transactor->AWID(FPD_CCI_NOC_0_awid);
  mp_FPD_CCI_NOC_0_transactor->AWADDR(FPD_CCI_NOC_0_awaddr);
  mp_FPD_CCI_NOC_0_transactor->AWLEN(FPD_CCI_NOC_0_awlen);
  mp_FPD_CCI_NOC_0_transactor->AWSIZE(FPD_CCI_NOC_0_awsize);
  mp_FPD_CCI_NOC_0_transactor->AWBURST(FPD_CCI_NOC_0_awburst);
  mp_FPD_CCI_NOC_0_transactor->AWLOCK(FPD_CCI_NOC_0_awlock);
  mp_FPD_CCI_NOC_0_transactor->AWCACHE(FPD_CCI_NOC_0_awcache);
  mp_FPD_CCI_NOC_0_transactor->AWPROT(FPD_CCI_NOC_0_awprot);
  mp_FPD_CCI_NOC_0_transactor->AWVALID(FPD_CCI_NOC_0_awvalid);
  mp_FPD_CCI_NOC_0_transactor->AWUSER(FPD_CCI_NOC_0_awuser);
  mp_FPD_CCI_NOC_0_transactor->AWREADY(FPD_CCI_NOC_0_awready);
  mp_FPD_CCI_NOC_0_transactor->WDATA(FPD_CCI_NOC_0_wdata);
  mp_FPD_CCI_NOC_0_transactor->WSTRB(FPD_CCI_NOC_0_wstrb);
  mp_FPD_CCI_NOC_0_transactor->WUSER(FPD_CCI_NOC_0_wuser);
  mp_FPD_CCI_NOC_0_transactor->WLAST(FPD_CCI_NOC_0_wlast);
  mp_FPD_CCI_NOC_0_transactor->WVALID(FPD_CCI_NOC_0_wvalid);
  mp_FPD_CCI_NOC_0_transactor->WREADY(FPD_CCI_NOC_0_wready);
  mp_FPD_CCI_NOC_0_transactor->BID(FPD_CCI_NOC_0_bid);
  mp_FPD_CCI_NOC_0_transactor->BRESP(FPD_CCI_NOC_0_bresp);
  mp_FPD_CCI_NOC_0_transactor->BVALID(FPD_CCI_NOC_0_bvalid);
  mp_FPD_CCI_NOC_0_transactor->BREADY(FPD_CCI_NOC_0_bready);
  mp_FPD_CCI_NOC_0_transactor->ARID(FPD_CCI_NOC_0_arid);
  mp_FPD_CCI_NOC_0_transactor->ARADDR(FPD_CCI_NOC_0_araddr);
  mp_FPD_CCI_NOC_0_transactor->ARLEN(FPD_CCI_NOC_0_arlen);
  mp_FPD_CCI_NOC_0_transactor->ARSIZE(FPD_CCI_NOC_0_arsize);
  mp_FPD_CCI_NOC_0_transactor->ARBURST(FPD_CCI_NOC_0_arburst);
  mp_FPD_CCI_NOC_0_transactor->ARLOCK(FPD_CCI_NOC_0_arlock);
  mp_FPD_CCI_NOC_0_transactor->ARCACHE(FPD_CCI_NOC_0_arcache);
  mp_FPD_CCI_NOC_0_transactor->ARPROT(FPD_CCI_NOC_0_arprot);
  mp_FPD_CCI_NOC_0_transactor->ARVALID(FPD_CCI_NOC_0_arvalid);
  mp_FPD_CCI_NOC_0_transactor->ARUSER(FPD_CCI_NOC_0_aruser);
  mp_FPD_CCI_NOC_0_transactor->ARREADY(FPD_CCI_NOC_0_arready);
  mp_FPD_CCI_NOC_0_transactor->RID(FPD_CCI_NOC_0_rid);
  mp_FPD_CCI_NOC_0_transactor->RDATA(FPD_CCI_NOC_0_rdata);
  mp_FPD_CCI_NOC_0_transactor->RRESP(FPD_CCI_NOC_0_rresp);
  mp_FPD_CCI_NOC_0_transactor->RLAST(FPD_CCI_NOC_0_rlast);
  mp_FPD_CCI_NOC_0_transactor->RVALID(FPD_CCI_NOC_0_rvalid);
  mp_FPD_CCI_NOC_0_transactor->RREADY(FPD_CCI_NOC_0_rready);
  mp_FPD_CCI_NOC_0_transactor->AWQOS(FPD_CCI_NOC_0_awqos);
  mp_FPD_CCI_NOC_0_transactor->ARQOS(FPD_CCI_NOC_0_arqos);
  mp_FPD_CCI_NOC_0_transactor->CLK(fpd_cci_noc_axi0_clk);
  m_FPD_CCI_NOC_0_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_0_transactor->RST(m_FPD_CCI_NOC_0_transactor_rst_signal);
  // configure FPD_CCI_NOC_1_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_1_transactor_param_props;
    FPD_CCI_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_1_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk");
    FPD_CCI_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_FPD_CCI_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_1_transactor", FPD_CCI_NOC_1_transactor_param_props);
  mp_FPD_CCI_NOC_1_transactor->AWID(FPD_CCI_NOC_1_awid);
  mp_FPD_CCI_NOC_1_transactor->AWADDR(FPD_CCI_NOC_1_awaddr);
  mp_FPD_CCI_NOC_1_transactor->AWLEN(FPD_CCI_NOC_1_awlen);
  mp_FPD_CCI_NOC_1_transactor->AWSIZE(FPD_CCI_NOC_1_awsize);
  mp_FPD_CCI_NOC_1_transactor->AWBURST(FPD_CCI_NOC_1_awburst);
  mp_FPD_CCI_NOC_1_transactor->AWLOCK(FPD_CCI_NOC_1_awlock);
  mp_FPD_CCI_NOC_1_transactor->AWCACHE(FPD_CCI_NOC_1_awcache);
  mp_FPD_CCI_NOC_1_transactor->AWPROT(FPD_CCI_NOC_1_awprot);
  mp_FPD_CCI_NOC_1_transactor->AWVALID(FPD_CCI_NOC_1_awvalid);
  mp_FPD_CCI_NOC_1_transactor->AWUSER(FPD_CCI_NOC_1_awuser);
  mp_FPD_CCI_NOC_1_transactor->AWREADY(FPD_CCI_NOC_1_awready);
  mp_FPD_CCI_NOC_1_transactor->WDATA(FPD_CCI_NOC_1_wdata);
  mp_FPD_CCI_NOC_1_transactor->WSTRB(FPD_CCI_NOC_1_wstrb);
  mp_FPD_CCI_NOC_1_transactor->WUSER(FPD_CCI_NOC_1_wuser);
  mp_FPD_CCI_NOC_1_transactor->WLAST(FPD_CCI_NOC_1_wlast);
  mp_FPD_CCI_NOC_1_transactor->WVALID(FPD_CCI_NOC_1_wvalid);
  mp_FPD_CCI_NOC_1_transactor->WREADY(FPD_CCI_NOC_1_wready);
  mp_FPD_CCI_NOC_1_transactor->BID(FPD_CCI_NOC_1_bid);
  mp_FPD_CCI_NOC_1_transactor->BRESP(FPD_CCI_NOC_1_bresp);
  mp_FPD_CCI_NOC_1_transactor->BVALID(FPD_CCI_NOC_1_bvalid);
  mp_FPD_CCI_NOC_1_transactor->BREADY(FPD_CCI_NOC_1_bready);
  mp_FPD_CCI_NOC_1_transactor->ARID(FPD_CCI_NOC_1_arid);
  mp_FPD_CCI_NOC_1_transactor->ARADDR(FPD_CCI_NOC_1_araddr);
  mp_FPD_CCI_NOC_1_transactor->ARLEN(FPD_CCI_NOC_1_arlen);
  mp_FPD_CCI_NOC_1_transactor->ARSIZE(FPD_CCI_NOC_1_arsize);
  mp_FPD_CCI_NOC_1_transactor->ARBURST(FPD_CCI_NOC_1_arburst);
  mp_FPD_CCI_NOC_1_transactor->ARLOCK(FPD_CCI_NOC_1_arlock);
  mp_FPD_CCI_NOC_1_transactor->ARCACHE(FPD_CCI_NOC_1_arcache);
  mp_FPD_CCI_NOC_1_transactor->ARPROT(FPD_CCI_NOC_1_arprot);
  mp_FPD_CCI_NOC_1_transactor->ARVALID(FPD_CCI_NOC_1_arvalid);
  mp_FPD_CCI_NOC_1_transactor->ARUSER(FPD_CCI_NOC_1_aruser);
  mp_FPD_CCI_NOC_1_transactor->ARREADY(FPD_CCI_NOC_1_arready);
  mp_FPD_CCI_NOC_1_transactor->RID(FPD_CCI_NOC_1_rid);
  mp_FPD_CCI_NOC_1_transactor->RDATA(FPD_CCI_NOC_1_rdata);
  mp_FPD_CCI_NOC_1_transactor->RRESP(FPD_CCI_NOC_1_rresp);
  mp_FPD_CCI_NOC_1_transactor->RLAST(FPD_CCI_NOC_1_rlast);
  mp_FPD_CCI_NOC_1_transactor->RVALID(FPD_CCI_NOC_1_rvalid);
  mp_FPD_CCI_NOC_1_transactor->RREADY(FPD_CCI_NOC_1_rready);
  mp_FPD_CCI_NOC_1_transactor->AWQOS(FPD_CCI_NOC_1_awqos);
  mp_FPD_CCI_NOC_1_transactor->ARQOS(FPD_CCI_NOC_1_arqos);
  mp_FPD_CCI_NOC_1_transactor->CLK(fpd_cci_noc_axi1_clk);
  m_FPD_CCI_NOC_1_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_1_transactor->RST(m_FPD_CCI_NOC_1_transactor_rst_signal);
  // configure FPD_CCI_NOC_2_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_2_transactor_param_props;
    FPD_CCI_NOC_2_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_2_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_2_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_2_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_2_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_2_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_2_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_2_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk");
    FPD_CCI_NOC_2_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_2_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_2_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_2_transactor_param_props.addString("INDEX", "2");

    mp_FPD_CCI_NOC_2_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_2_transactor", FPD_CCI_NOC_2_transactor_param_props);
  mp_FPD_CCI_NOC_2_transactor->AWID(FPD_CCI_NOC_2_awid);
  mp_FPD_CCI_NOC_2_transactor->AWADDR(FPD_CCI_NOC_2_awaddr);
  mp_FPD_CCI_NOC_2_transactor->AWLEN(FPD_CCI_NOC_2_awlen);
  mp_FPD_CCI_NOC_2_transactor->AWSIZE(FPD_CCI_NOC_2_awsize);
  mp_FPD_CCI_NOC_2_transactor->AWBURST(FPD_CCI_NOC_2_awburst);
  mp_FPD_CCI_NOC_2_transactor->AWLOCK(FPD_CCI_NOC_2_awlock);
  mp_FPD_CCI_NOC_2_transactor->AWCACHE(FPD_CCI_NOC_2_awcache);
  mp_FPD_CCI_NOC_2_transactor->AWPROT(FPD_CCI_NOC_2_awprot);
  mp_FPD_CCI_NOC_2_transactor->AWVALID(FPD_CCI_NOC_2_awvalid);
  mp_FPD_CCI_NOC_2_transactor->AWUSER(FPD_CCI_NOC_2_awuser);
  mp_FPD_CCI_NOC_2_transactor->AWREADY(FPD_CCI_NOC_2_awready);
  mp_FPD_CCI_NOC_2_transactor->WDATA(FPD_CCI_NOC_2_wdata);
  mp_FPD_CCI_NOC_2_transactor->WSTRB(FPD_CCI_NOC_2_wstrb);
  mp_FPD_CCI_NOC_2_transactor->WUSER(FPD_CCI_NOC_2_wuser);
  mp_FPD_CCI_NOC_2_transactor->WLAST(FPD_CCI_NOC_2_wlast);
  mp_FPD_CCI_NOC_2_transactor->WVALID(FPD_CCI_NOC_2_wvalid);
  mp_FPD_CCI_NOC_2_transactor->WREADY(FPD_CCI_NOC_2_wready);
  mp_FPD_CCI_NOC_2_transactor->BID(FPD_CCI_NOC_2_bid);
  mp_FPD_CCI_NOC_2_transactor->BRESP(FPD_CCI_NOC_2_bresp);
  mp_FPD_CCI_NOC_2_transactor->BVALID(FPD_CCI_NOC_2_bvalid);
  mp_FPD_CCI_NOC_2_transactor->BREADY(FPD_CCI_NOC_2_bready);
  mp_FPD_CCI_NOC_2_transactor->ARID(FPD_CCI_NOC_2_arid);
  mp_FPD_CCI_NOC_2_transactor->ARADDR(FPD_CCI_NOC_2_araddr);
  mp_FPD_CCI_NOC_2_transactor->ARLEN(FPD_CCI_NOC_2_arlen);
  mp_FPD_CCI_NOC_2_transactor->ARSIZE(FPD_CCI_NOC_2_arsize);
  mp_FPD_CCI_NOC_2_transactor->ARBURST(FPD_CCI_NOC_2_arburst);
  mp_FPD_CCI_NOC_2_transactor->ARLOCK(FPD_CCI_NOC_2_arlock);
  mp_FPD_CCI_NOC_2_transactor->ARCACHE(FPD_CCI_NOC_2_arcache);
  mp_FPD_CCI_NOC_2_transactor->ARPROT(FPD_CCI_NOC_2_arprot);
  mp_FPD_CCI_NOC_2_transactor->ARVALID(FPD_CCI_NOC_2_arvalid);
  mp_FPD_CCI_NOC_2_transactor->ARUSER(FPD_CCI_NOC_2_aruser);
  mp_FPD_CCI_NOC_2_transactor->ARREADY(FPD_CCI_NOC_2_arready);
  mp_FPD_CCI_NOC_2_transactor->RID(FPD_CCI_NOC_2_rid);
  mp_FPD_CCI_NOC_2_transactor->RDATA(FPD_CCI_NOC_2_rdata);
  mp_FPD_CCI_NOC_2_transactor->RRESP(FPD_CCI_NOC_2_rresp);
  mp_FPD_CCI_NOC_2_transactor->RLAST(FPD_CCI_NOC_2_rlast);
  mp_FPD_CCI_NOC_2_transactor->RVALID(FPD_CCI_NOC_2_rvalid);
  mp_FPD_CCI_NOC_2_transactor->RREADY(FPD_CCI_NOC_2_rready);
  mp_FPD_CCI_NOC_2_transactor->AWQOS(FPD_CCI_NOC_2_awqos);
  mp_FPD_CCI_NOC_2_transactor->ARQOS(FPD_CCI_NOC_2_arqos);
  mp_FPD_CCI_NOC_2_transactor->CLK(fpd_cci_noc_axi2_clk);
  m_FPD_CCI_NOC_2_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_2_transactor->RST(m_FPD_CCI_NOC_2_transactor_rst_signal);
  // configure FPD_CCI_NOC_3_transactor
    xsc::common_cpp::properties FPD_CCI_NOC_3_transactor_param_props;
    FPD_CCI_NOC_3_transactor_param_props.addLong("DATA_WIDTH", "128");
    FPD_CCI_NOC_3_transactor_param_props.addLong("FREQ_HZ", "824999207");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ID_WIDTH", "16");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ADDR_WIDTH", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_WIDTH", "17");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("BUSER_WIDTH", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_LOCK", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_PROT", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_CACHE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_QOS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_REGION", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_WSTRB", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_BRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RRESP", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    FPD_CCI_NOC_3_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_SIZE", "1");
    FPD_CCI_NOC_3_transactor_param_props.addLong("HAS_RESET", "0");
    FPD_CCI_NOC_3_transactor_param_props.addFloat("PHASE", "0.0");
    FPD_CCI_NOC_3_transactor_param_props.addString("PROTOCOL", "AXI4");
    FPD_CCI_NOC_3_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    FPD_CCI_NOC_3_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk");
    FPD_CCI_NOC_3_transactor_param_props.addString("CATEGORY", "noc");
    FPD_CCI_NOC_3_transactor_param_props.addString("MY_CATEGORY", "ps_cci");
    FPD_CCI_NOC_3_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_CCI_TO_NOC_NMU");
    FPD_CCI_NOC_3_transactor_param_props.addString("INDEX", "3");

    mp_FPD_CCI_NOC_3_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,1>("FPD_CCI_NOC_3_transactor", FPD_CCI_NOC_3_transactor_param_props);
  mp_FPD_CCI_NOC_3_transactor->AWID(FPD_CCI_NOC_3_awid);
  mp_FPD_CCI_NOC_3_transactor->AWADDR(FPD_CCI_NOC_3_awaddr);
  mp_FPD_CCI_NOC_3_transactor->AWLEN(FPD_CCI_NOC_3_awlen);
  mp_FPD_CCI_NOC_3_transactor->AWSIZE(FPD_CCI_NOC_3_awsize);
  mp_FPD_CCI_NOC_3_transactor->AWBURST(FPD_CCI_NOC_3_awburst);
  mp_FPD_CCI_NOC_3_transactor->AWLOCK(FPD_CCI_NOC_3_awlock);
  mp_FPD_CCI_NOC_3_transactor->AWCACHE(FPD_CCI_NOC_3_awcache);
  mp_FPD_CCI_NOC_3_transactor->AWPROT(FPD_CCI_NOC_3_awprot);
  mp_FPD_CCI_NOC_3_transactor->AWVALID(FPD_CCI_NOC_3_awvalid);
  mp_FPD_CCI_NOC_3_transactor->AWUSER(FPD_CCI_NOC_3_awuser);
  mp_FPD_CCI_NOC_3_transactor->AWREADY(FPD_CCI_NOC_3_awready);
  mp_FPD_CCI_NOC_3_transactor->WDATA(FPD_CCI_NOC_3_wdata);
  mp_FPD_CCI_NOC_3_transactor->WSTRB(FPD_CCI_NOC_3_wstrb);
  mp_FPD_CCI_NOC_3_transactor->WUSER(FPD_CCI_NOC_3_wuser);
  mp_FPD_CCI_NOC_3_transactor->WLAST(FPD_CCI_NOC_3_wlast);
  mp_FPD_CCI_NOC_3_transactor->WVALID(FPD_CCI_NOC_3_wvalid);
  mp_FPD_CCI_NOC_3_transactor->WREADY(FPD_CCI_NOC_3_wready);
  mp_FPD_CCI_NOC_3_transactor->BID(FPD_CCI_NOC_3_bid);
  mp_FPD_CCI_NOC_3_transactor->BRESP(FPD_CCI_NOC_3_bresp);
  mp_FPD_CCI_NOC_3_transactor->BVALID(FPD_CCI_NOC_3_bvalid);
  mp_FPD_CCI_NOC_3_transactor->BREADY(FPD_CCI_NOC_3_bready);
  mp_FPD_CCI_NOC_3_transactor->ARID(FPD_CCI_NOC_3_arid);
  mp_FPD_CCI_NOC_3_transactor->ARADDR(FPD_CCI_NOC_3_araddr);
  mp_FPD_CCI_NOC_3_transactor->ARLEN(FPD_CCI_NOC_3_arlen);
  mp_FPD_CCI_NOC_3_transactor->ARSIZE(FPD_CCI_NOC_3_arsize);
  mp_FPD_CCI_NOC_3_transactor->ARBURST(FPD_CCI_NOC_3_arburst);
  mp_FPD_CCI_NOC_3_transactor->ARLOCK(FPD_CCI_NOC_3_arlock);
  mp_FPD_CCI_NOC_3_transactor->ARCACHE(FPD_CCI_NOC_3_arcache);
  mp_FPD_CCI_NOC_3_transactor->ARPROT(FPD_CCI_NOC_3_arprot);
  mp_FPD_CCI_NOC_3_transactor->ARVALID(FPD_CCI_NOC_3_arvalid);
  mp_FPD_CCI_NOC_3_transactor->ARUSER(FPD_CCI_NOC_3_aruser);
  mp_FPD_CCI_NOC_3_transactor->ARREADY(FPD_CCI_NOC_3_arready);
  mp_FPD_CCI_NOC_3_transactor->RID(FPD_CCI_NOC_3_rid);
  mp_FPD_CCI_NOC_3_transactor->RDATA(FPD_CCI_NOC_3_rdata);
  mp_FPD_CCI_NOC_3_transactor->RRESP(FPD_CCI_NOC_3_rresp);
  mp_FPD_CCI_NOC_3_transactor->RLAST(FPD_CCI_NOC_3_rlast);
  mp_FPD_CCI_NOC_3_transactor->RVALID(FPD_CCI_NOC_3_rvalid);
  mp_FPD_CCI_NOC_3_transactor->RREADY(FPD_CCI_NOC_3_rready);
  mp_FPD_CCI_NOC_3_transactor->AWQOS(FPD_CCI_NOC_3_awqos);
  mp_FPD_CCI_NOC_3_transactor->ARQOS(FPD_CCI_NOC_3_arqos);
  mp_FPD_CCI_NOC_3_transactor->CLK(fpd_cci_noc_axi3_clk);
  m_FPD_CCI_NOC_3_transactor_rst_signal.write(1);
  mp_FPD_CCI_NOC_3_transactor->RST(m_FPD_CCI_NOC_3_transactor_rst_signal);
  // configure LPD_AXI_NOC_0_transactor
    xsc::common_cpp::properties LPD_AXI_NOC_0_transactor_param_props;
    LPD_AXI_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    LPD_AXI_NOC_0_transactor_param_props.addLong("FREQ_HZ", "599999451");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    LPD_AXI_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    LPD_AXI_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    LPD_AXI_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    LPD_AXI_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    LPD_AXI_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    LPD_AXI_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_lpd_axi_noc_clk");
    LPD_AXI_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    LPD_AXI_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_rpu");
    LPD_AXI_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_RPU_TO_NOC_NMU");
    LPD_AXI_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_LPD_AXI_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("LPD_AXI_NOC_0_transactor", LPD_AXI_NOC_0_transactor_param_props);
  mp_LPD_AXI_NOC_0_transactor->AWID(LPD_AXI_NOC_0_awid);
  mp_LPD_AXI_NOC_0_transactor->AWADDR(LPD_AXI_NOC_0_awaddr);
  mp_LPD_AXI_NOC_0_transactor->AWLEN(LPD_AXI_NOC_0_awlen);
  mp_LPD_AXI_NOC_0_transactor->AWSIZE(LPD_AXI_NOC_0_awsize);
  mp_LPD_AXI_NOC_0_transactor->AWBURST(LPD_AXI_NOC_0_awburst);
  mp_LPD_AXI_NOC_0_transactor->AWLOCK(LPD_AXI_NOC_0_awlock);
  mp_LPD_AXI_NOC_0_transactor->AWCACHE(LPD_AXI_NOC_0_awcache);
  mp_LPD_AXI_NOC_0_transactor->AWPROT(LPD_AXI_NOC_0_awprot);
  mp_LPD_AXI_NOC_0_transactor->AWVALID(LPD_AXI_NOC_0_awvalid);
  mp_LPD_AXI_NOC_0_transactor->AWUSER(LPD_AXI_NOC_0_awuser);
  mp_LPD_AXI_NOC_0_transactor->AWREADY(LPD_AXI_NOC_0_awready);
  mp_LPD_AXI_NOC_0_transactor->WDATA(LPD_AXI_NOC_0_wdata);
  mp_LPD_AXI_NOC_0_transactor->WSTRB(LPD_AXI_NOC_0_wstrb);
  mp_LPD_AXI_NOC_0_transactor->WLAST(LPD_AXI_NOC_0_wlast);
  mp_LPD_AXI_NOC_0_transactor->WVALID(LPD_AXI_NOC_0_wvalid);
  mp_LPD_AXI_NOC_0_transactor->WREADY(LPD_AXI_NOC_0_wready);
  mp_LPD_AXI_NOC_0_transactor->BID(LPD_AXI_NOC_0_bid);
  mp_LPD_AXI_NOC_0_transactor->BRESP(LPD_AXI_NOC_0_bresp);
  mp_LPD_AXI_NOC_0_transactor->BVALID(LPD_AXI_NOC_0_bvalid);
  mp_LPD_AXI_NOC_0_transactor->BREADY(LPD_AXI_NOC_0_bready);
  mp_LPD_AXI_NOC_0_transactor->ARID(LPD_AXI_NOC_0_arid);
  mp_LPD_AXI_NOC_0_transactor->ARADDR(LPD_AXI_NOC_0_araddr);
  mp_LPD_AXI_NOC_0_transactor->ARLEN(LPD_AXI_NOC_0_arlen);
  mp_LPD_AXI_NOC_0_transactor->ARSIZE(LPD_AXI_NOC_0_arsize);
  mp_LPD_AXI_NOC_0_transactor->ARBURST(LPD_AXI_NOC_0_arburst);
  mp_LPD_AXI_NOC_0_transactor->ARLOCK(LPD_AXI_NOC_0_arlock);
  mp_LPD_AXI_NOC_0_transactor->ARCACHE(LPD_AXI_NOC_0_arcache);
  mp_LPD_AXI_NOC_0_transactor->ARPROT(LPD_AXI_NOC_0_arprot);
  mp_LPD_AXI_NOC_0_transactor->ARVALID(LPD_AXI_NOC_0_arvalid);
  mp_LPD_AXI_NOC_0_transactor->ARUSER(LPD_AXI_NOC_0_aruser);
  mp_LPD_AXI_NOC_0_transactor->ARREADY(LPD_AXI_NOC_0_arready);
  mp_LPD_AXI_NOC_0_transactor->RID(LPD_AXI_NOC_0_rid);
  mp_LPD_AXI_NOC_0_transactor->RDATA(LPD_AXI_NOC_0_rdata);
  mp_LPD_AXI_NOC_0_transactor->RRESP(LPD_AXI_NOC_0_rresp);
  mp_LPD_AXI_NOC_0_transactor->RLAST(LPD_AXI_NOC_0_rlast);
  mp_LPD_AXI_NOC_0_transactor->RVALID(LPD_AXI_NOC_0_rvalid);
  mp_LPD_AXI_NOC_0_transactor->RREADY(LPD_AXI_NOC_0_rready);
  mp_LPD_AXI_NOC_0_transactor->AWQOS(LPD_AXI_NOC_0_awqos);
  mp_LPD_AXI_NOC_0_transactor->ARQOS(LPD_AXI_NOC_0_arqos);
  mp_LPD_AXI_NOC_0_transactor->CLK(lpd_axi_noc_clk);
  m_LPD_AXI_NOC_0_transactor_rst_signal.write(1);
  mp_LPD_AXI_NOC_0_transactor->RST(m_LPD_AXI_NOC_0_transactor_rst_signal);
  // configure PMC_NOC_AXI_0_transactor
    xsc::common_cpp::properties PMC_NOC_AXI_0_transactor_param_props;
    PMC_NOC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    PMC_NOC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    PMC_NOC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    PMC_NOC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    PMC_NOC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    PMC_NOC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    PMC_NOC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    PMC_NOC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    PMC_NOC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk");
    PMC_NOC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    PMC_NOC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    PMC_NOC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PMC_TO_NOC_NMU");
    PMC_NOC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    PMC_NOC_AXI_0_transactor_param_props.addString("INDEX", "0");
    PMC_NOC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_PMC_NOC_AXI_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,16,18,17>("PMC_NOC_AXI_0_transactor", PMC_NOC_AXI_0_transactor_param_props);
  mp_PMC_NOC_AXI_0_transactor->ARADDR(PMC_NOC_AXI_0_araddr);
  mp_PMC_NOC_AXI_0_transactor->ARBURST(PMC_NOC_AXI_0_arburst);
  mp_PMC_NOC_AXI_0_transactor->ARCACHE(PMC_NOC_AXI_0_arcache);
  mp_PMC_NOC_AXI_0_transactor->ARID(PMC_NOC_AXI_0_arid);
  mp_PMC_NOC_AXI_0_transactor->ARLEN(PMC_NOC_AXI_0_arlen);
  mp_PMC_NOC_AXI_0_transactor->ARLOCK(PMC_NOC_AXI_0_arlock);
  mp_PMC_NOC_AXI_0_transactor->ARPROT(PMC_NOC_AXI_0_arprot);
  mp_PMC_NOC_AXI_0_transactor->ARQOS(PMC_NOC_AXI_0_arqos);
  mp_PMC_NOC_AXI_0_transactor->ARREGION(PMC_NOC_AXI_0_arregion);
  mp_PMC_NOC_AXI_0_transactor->ARSIZE(PMC_NOC_AXI_0_arsize);
  mp_PMC_NOC_AXI_0_transactor->ARUSER(PMC_NOC_AXI_0_aruser);
  mp_PMC_NOC_AXI_0_transactor->ARVALID(PMC_NOC_AXI_0_arvalid);
  mp_PMC_NOC_AXI_0_transactor->AWADDR(PMC_NOC_AXI_0_awaddr);
  mp_PMC_NOC_AXI_0_transactor->AWBURST(PMC_NOC_AXI_0_awburst);
  mp_PMC_NOC_AXI_0_transactor->AWCACHE(PMC_NOC_AXI_0_awcache);
  mp_PMC_NOC_AXI_0_transactor->AWID(PMC_NOC_AXI_0_awid);
  mp_PMC_NOC_AXI_0_transactor->AWLEN(PMC_NOC_AXI_0_awlen);
  mp_PMC_NOC_AXI_0_transactor->AWLOCK(PMC_NOC_AXI_0_awlock);
  mp_PMC_NOC_AXI_0_transactor->AWPROT(PMC_NOC_AXI_0_awprot);
  mp_PMC_NOC_AXI_0_transactor->AWQOS(PMC_NOC_AXI_0_awqos);
  mp_PMC_NOC_AXI_0_transactor->AWREGION(PMC_NOC_AXI_0_awregion);
  mp_PMC_NOC_AXI_0_transactor->AWSIZE(PMC_NOC_AXI_0_awsize);
  mp_PMC_NOC_AXI_0_transactor->AWUSER(PMC_NOC_AXI_0_awuser);
  mp_PMC_NOC_AXI_0_transactor->AWVALID(PMC_NOC_AXI_0_awvalid);
  mp_PMC_NOC_AXI_0_transactor->BREADY(PMC_NOC_AXI_0_bready);
  mp_PMC_NOC_AXI_0_transactor->RREADY(PMC_NOC_AXI_0_rready);
  mp_PMC_NOC_AXI_0_transactor->WDATA(PMC_NOC_AXI_0_wdata);
  mp_PMC_NOC_AXI_0_transactor->WLAST(PMC_NOC_AXI_0_wlast);
  mp_PMC_NOC_AXI_0_transactor->WSTRB(PMC_NOC_AXI_0_wstrb);
  mp_PMC_NOC_AXI_0_transactor->WUSER(PMC_NOC_AXI_0_wuser);
  mp_PMC_NOC_AXI_0_transactor->WVALID(PMC_NOC_AXI_0_wvalid);
  mp_PMC_NOC_AXI_0_transactor->ARREADY(PMC_NOC_AXI_0_arready);
  mp_PMC_NOC_AXI_0_transactor->AWREADY(PMC_NOC_AXI_0_awready);
  mp_PMC_NOC_AXI_0_transactor->BID(PMC_NOC_AXI_0_bid);
  mp_PMC_NOC_AXI_0_transactor->BRESP(PMC_NOC_AXI_0_bresp);
  mp_PMC_NOC_AXI_0_transactor->BUSER(PMC_NOC_AXI_0_buser);
  mp_PMC_NOC_AXI_0_transactor->BVALID(PMC_NOC_AXI_0_bvalid);
  mp_PMC_NOC_AXI_0_transactor->RDATA(PMC_NOC_AXI_0_rdata);
  mp_PMC_NOC_AXI_0_transactor->RID(PMC_NOC_AXI_0_rid);
  mp_PMC_NOC_AXI_0_transactor->RLAST(PMC_NOC_AXI_0_rlast);
  mp_PMC_NOC_AXI_0_transactor->RRESP(PMC_NOC_AXI_0_rresp);
  mp_PMC_NOC_AXI_0_transactor->RUSER(PMC_NOC_AXI_0_ruser);
  mp_PMC_NOC_AXI_0_transactor->RVALID(PMC_NOC_AXI_0_rvalid);
  mp_PMC_NOC_AXI_0_transactor->WREADY(PMC_NOC_AXI_0_wready);
  mp_PMC_NOC_AXI_0_transactor->CLK(pmc_axi_noc_axi0_clk);
  m_PMC_NOC_AXI_0_transactor_rst_signal.write(1);
  mp_PMC_NOC_AXI_0_transactor->RST(m_PMC_NOC_AXI_0_transactor_rst_signal);
  // configure NOC_PMC_AXI_0_transactor
    xsc::common_cpp::properties NOC_PMC_AXI_0_transactor_param_props;
    NOC_PMC_AXI_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_PMC_AXI_0_transactor_param_props.addLong("FREQ_HZ", "400000000");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_PMC_AXI_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    NOC_PMC_AXI_0_transactor_param_props.addLong("BUSER_WIDTH", "16");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_REGION", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_PMC_AXI_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_PMC_AXI_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_PMC_AXI_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_PMC_AXI_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_PMC_AXI_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_PMC_AXI_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_PMC_AXI_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk");
    NOC_PMC_AXI_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_PMC_AXI_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_PMC_AXI_0_transactor_param_props.addString("MY_CATEGORY", "ps_pmc");
    NOC_PMC_AXI_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PMC");
    NOC_PMC_AXI_0_transactor_param_props.addString("HD_TANDEM", "1");
    NOC_PMC_AXI_0_transactor_param_props.addString("INDEX", "0");
    NOC_PMC_AXI_0_transactor_param_props.addString("SLR_INDEX", "0");

    mp_NOC_PMC_AXI_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,17,16,18,17>("NOC_PMC_AXI_0_transactor", NOC_PMC_AXI_0_transactor_param_props);
  mp_NOC_PMC_AXI_0_transactor->ARADDR(NOC_PMC_AXI_0_araddr);
  mp_NOC_PMC_AXI_0_transactor->ARBURST(NOC_PMC_AXI_0_arburst);
  mp_NOC_PMC_AXI_0_transactor->ARCACHE(NOC_PMC_AXI_0_arcache);
  mp_NOC_PMC_AXI_0_transactor->ARID(NOC_PMC_AXI_0_arid);
  mp_NOC_PMC_AXI_0_transactor->ARLEN(NOC_PMC_AXI_0_arlen);
  mp_NOC_PMC_AXI_0_transactor->ARLOCK(NOC_PMC_AXI_0_arlock);
  mp_NOC_PMC_AXI_0_transactor->ARPROT(NOC_PMC_AXI_0_arprot);
  mp_NOC_PMC_AXI_0_transactor->ARQOS(NOC_PMC_AXI_0_arqos);
  mp_NOC_PMC_AXI_0_transactor->ARREGION(NOC_PMC_AXI_0_arregion);
  mp_NOC_PMC_AXI_0_transactor->ARSIZE(NOC_PMC_AXI_0_arsize);
  mp_NOC_PMC_AXI_0_transactor->ARUSER(NOC_PMC_AXI_0_aruser);
  mp_NOC_PMC_AXI_0_transactor->ARVALID(NOC_PMC_AXI_0_arvalid);
  mp_NOC_PMC_AXI_0_transactor->AWADDR(NOC_PMC_AXI_0_awaddr);
  mp_NOC_PMC_AXI_0_transactor->AWBURST(NOC_PMC_AXI_0_awburst);
  mp_NOC_PMC_AXI_0_transactor->AWCACHE(NOC_PMC_AXI_0_awcache);
  mp_NOC_PMC_AXI_0_transactor->AWID(NOC_PMC_AXI_0_awid);
  mp_NOC_PMC_AXI_0_transactor->AWLEN(NOC_PMC_AXI_0_awlen);
  mp_NOC_PMC_AXI_0_transactor->AWLOCK(NOC_PMC_AXI_0_awlock);
  mp_NOC_PMC_AXI_0_transactor->AWPROT(NOC_PMC_AXI_0_awprot);
  mp_NOC_PMC_AXI_0_transactor->AWQOS(NOC_PMC_AXI_0_awqos);
  mp_NOC_PMC_AXI_0_transactor->AWREGION(NOC_PMC_AXI_0_awregion);
  mp_NOC_PMC_AXI_0_transactor->AWSIZE(NOC_PMC_AXI_0_awsize);
  mp_NOC_PMC_AXI_0_transactor->AWUSER(NOC_PMC_AXI_0_awuser);
  mp_NOC_PMC_AXI_0_transactor->AWVALID(NOC_PMC_AXI_0_awvalid);
  mp_NOC_PMC_AXI_0_transactor->BREADY(NOC_PMC_AXI_0_bready);
  mp_NOC_PMC_AXI_0_transactor->RREADY(NOC_PMC_AXI_0_rready);
  mp_NOC_PMC_AXI_0_transactor->WDATA(NOC_PMC_AXI_0_wdata);
  mp_NOC_PMC_AXI_0_transactor->WLAST(NOC_PMC_AXI_0_wlast);
  mp_NOC_PMC_AXI_0_transactor->WSTRB(NOC_PMC_AXI_0_wstrb);
  mp_NOC_PMC_AXI_0_transactor->WUSER(NOC_PMC_AXI_0_wuser);
  mp_NOC_PMC_AXI_0_transactor->WVALID(NOC_PMC_AXI_0_wvalid);
  mp_NOC_PMC_AXI_0_transactor->ARREADY(NOC_PMC_AXI_0_arready);
  mp_NOC_PMC_AXI_0_transactor->AWREADY(NOC_PMC_AXI_0_awready);
  mp_NOC_PMC_AXI_0_transactor->BID(NOC_PMC_AXI_0_bid);
  mp_NOC_PMC_AXI_0_transactor->BRESP(NOC_PMC_AXI_0_bresp);
  mp_NOC_PMC_AXI_0_transactor->BUSER(NOC_PMC_AXI_0_buser);
  mp_NOC_PMC_AXI_0_transactor->BVALID(NOC_PMC_AXI_0_bvalid);
  mp_NOC_PMC_AXI_0_transactor->RDATA(NOC_PMC_AXI_0_rdata);
  mp_NOC_PMC_AXI_0_transactor->RID(NOC_PMC_AXI_0_rid);
  mp_NOC_PMC_AXI_0_transactor->RLAST(NOC_PMC_AXI_0_rlast);
  mp_NOC_PMC_AXI_0_transactor->RRESP(NOC_PMC_AXI_0_rresp);
  mp_NOC_PMC_AXI_0_transactor->RUSER(NOC_PMC_AXI_0_ruser);
  mp_NOC_PMC_AXI_0_transactor->RVALID(NOC_PMC_AXI_0_rvalid);
  mp_NOC_PMC_AXI_0_transactor->WREADY(NOC_PMC_AXI_0_wready);
  mp_NOC_PMC_AXI_0_transactor->CLK(noc_pmc_axi_axi0_clk);
  m_NOC_PMC_AXI_0_transactor_rst_signal.write(1);
  mp_NOC_PMC_AXI_0_transactor->RST(m_NOC_PMC_AXI_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_0_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);
  mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
  mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
  mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
  mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
  mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
  mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
  mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
  mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
  mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
  mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
  mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
  mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
  mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
  mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
  mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
  mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
  mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
  mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
  mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
  mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
  mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
  mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
  mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
  mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
  mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
  mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
  mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
  mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
  mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
  mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
  mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
  mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
  mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
  mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
  mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
  mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
  mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
  mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
  mp_CPM_PCIE_NOC_0_transactor->RUSER(CPM_PCIE_NOC_0_ruser);
  mp_CPM_PCIE_NOC_0_transactor->WUSER(CPM_PCIE_NOC_0_wuser);
  mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
  mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
  m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_1_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "1000000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "17");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,17,1,18,17>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);
  mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
  mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
  mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
  mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
  mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
  mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
  mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
  mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
  mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
  mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
  mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
  mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
  mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
  mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
  mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
  mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
  mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
  mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
  mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
  mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
  mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
  mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
  mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
  mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
  mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
  mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
  mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
  mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
  mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
  mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
  mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
  mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
  mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
  mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
  mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
  mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
  mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
  mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
  mp_CPM_PCIE_NOC_1_transactor->RUSER(CPM_PCIE_NOC_1_ruser);
  mp_CPM_PCIE_NOC_1_transactor->WUSER(CPM_PCIE_NOC_1_wuser);
  mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
  mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
  m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);
  // configure dma0_st_rx_msg_transactor
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "300000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "full_blown_noc_clk_gen_0_axi_clk_0");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);
  mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
  mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
  mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
  mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
  mp_dma0_st_rx_msg_transactor->CLK(dma0_intrfc_clk);
  mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

  // initialize transactors stubs
  FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub = nullptr;
  FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub = nullptr;
  FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub = nullptr;
  LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub = nullptr;
  PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub = nullptr;
  NOC_PMC_AXI_0_transactor_target_wr_socket_stub = nullptr;
  NOC_PMC_AXI_0_transactor_target_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  dma0_st_rx_msg_transactor_initiator_socket_stub = nullptr;

}

void full_blown_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'FPD_CCI_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_0_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_0_transactor->wr_socket));
    FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_0_transactor->rd_socket));
    mp_FPD_CCI_NOC_0_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_1_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_1_transactor->wr_socket));
    FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_1_transactor->rd_socket));
    mp_FPD_CCI_NOC_1_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_2' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_2_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_2_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_2_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_2_transactor->wr_socket));
    FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_2_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_2_transactor->rd_socket));
    mp_FPD_CCI_NOC_2_transactor->disable_transactor();
  }

  // configure 'FPD_CCI_NOC_3' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "FPD_CCI_NOC_3_TLM_MODE") != 1)
  {
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_read_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_impl->FPD_CCI_NOC_3_tlm_aximm_write_socket->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
  
  }
  else
  {
    FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    FPD_CCI_NOC_3_transactor_initiator_wr_socket_stub->bind(*(mp_FPD_CCI_NOC_3_transactor->wr_socket));
    FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    FPD_CCI_NOC_3_transactor_initiator_rd_socket_stub->bind(*(mp_FPD_CCI_NOC_3_transactor->rd_socket));
    mp_FPD_CCI_NOC_3_transactor->disable_transactor();
  }

  // configure 'LPD_AXI_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "LPD_AXI_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_read_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_impl->LPD_AXI_NOC_0_tlm_aximm_write_socket->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    LPD_AXI_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_LPD_AXI_NOC_0_transactor->wr_socket));
    LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    LPD_AXI_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_LPD_AXI_NOC_0_transactor->rd_socket));
    mp_LPD_AXI_NOC_0_transactor->disable_transactor();
  }

  // configure 'PMC_NOC_AXI_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "PMC_NOC_AXI_0_TLM_MODE") != 1)
  {
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_read_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_impl->PMC_NOC_AXI_0_tlm_aximm_write_socket->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
  
  }
  else
  {
    PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    PMC_NOC_AXI_0_transactor_initiator_wr_socket_stub->bind(*(mp_PMC_NOC_AXI_0_transactor->wr_socket));
    PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    PMC_NOC_AXI_0_transactor_initiator_rd_socket_stub->bind(*(mp_PMC_NOC_AXI_0_transactor->rd_socket));
    mp_PMC_NOC_AXI_0_transactor->disable_transactor();
  }

  // configure 'NOC_PMC_AXI_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "NOC_PMC_AXI_0_TLM_MODE") != 1)
  {
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_impl->NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
  
  }
  else
  {
    NOC_PMC_AXI_0_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    NOC_PMC_AXI_0_transactor_target_wr_socket_stub->bind(*(mp_NOC_PMC_AXI_0_transactor->wr_socket));
    NOC_PMC_AXI_0_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    NOC_PMC_AXI_0_transactor_target_rd_socket_stub->bind(*(mp_NOC_PMC_AXI_0_transactor->rd_socket));
    mp_NOC_PMC_AXI_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_CPM_PCIE_NOC_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_CPM_PCIE_NOC_1_transactor->disable_transactor();
  }

  // configure 'dma0_st_rx_msg' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("full_blown_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  
  }
  else
  {
    dma0_st_rx_msg_transactor_initiator_socket_stub = new xtlm::xtlm_axis_initiator_stub("socket",0);
    dma0_st_rx_msg_transactor_initiator_socket_stub->bind(*(mp_dma0_st_rx_msg_transactor->socket));
    mp_dma0_st_rx_msg_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




full_blown_versal_cips_0_0::~full_blown_versal_cips_0_0()
{
  delete mp_FPD_CCI_NOC_0_transactor;

  delete mp_FPD_CCI_NOC_1_transactor;

  delete mp_FPD_CCI_NOC_2_transactor;

  delete mp_FPD_CCI_NOC_3_transactor;

  delete mp_LPD_AXI_NOC_0_transactor;

  delete mp_PMC_NOC_AXI_0_transactor;

  delete mp_NOC_PMC_AXI_0_transactor;

  delete mp_CPM_PCIE_NOC_0_transactor;

  delete mp_CPM_PCIE_NOC_1_transactor;

  delete mp_dma0_st_rx_msg_transactor;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(full_blown_versal_cips_0_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(full_blown_versal_cips_0_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(full_blown_versal_cips_0_0);
SC_REGISTER_BV(512);
#endif

