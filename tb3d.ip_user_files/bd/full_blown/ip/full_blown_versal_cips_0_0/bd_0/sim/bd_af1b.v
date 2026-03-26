//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_af1b.bd
//Design : bd_af1b
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_af1b,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_af1b,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=None}" *) (* HW_HANDOFF = "full_blown_versal_cips_0_0.hwdef" *) 
module bd_af1b
   (CPM_PCIE_NOC_0_araddr,
    CPM_PCIE_NOC_0_arburst,
    CPM_PCIE_NOC_0_arcache,
    CPM_PCIE_NOC_0_arid,
    CPM_PCIE_NOC_0_arlen,
    CPM_PCIE_NOC_0_arlock,
    CPM_PCIE_NOC_0_arprot,
    CPM_PCIE_NOC_0_arqos,
    CPM_PCIE_NOC_0_arready,
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
    CPM_PCIE_NOC_0_awready,
    CPM_PCIE_NOC_0_awsize,
    CPM_PCIE_NOC_0_awuser,
    CPM_PCIE_NOC_0_awvalid,
    CPM_PCIE_NOC_0_bid,
    CPM_PCIE_NOC_0_bready,
    CPM_PCIE_NOC_0_bresp,
    CPM_PCIE_NOC_0_bvalid,
    CPM_PCIE_NOC_0_rdata,
    CPM_PCIE_NOC_0_rid,
    CPM_PCIE_NOC_0_rlast,
    CPM_PCIE_NOC_0_rready,
    CPM_PCIE_NOC_0_rresp,
    CPM_PCIE_NOC_0_ruser,
    CPM_PCIE_NOC_0_rvalid,
    CPM_PCIE_NOC_0_wdata,
    CPM_PCIE_NOC_0_wlast,
    CPM_PCIE_NOC_0_wready,
    CPM_PCIE_NOC_0_wstrb,
    CPM_PCIE_NOC_0_wuser,
    CPM_PCIE_NOC_0_wvalid,
    CPM_PCIE_NOC_1_araddr,
    CPM_PCIE_NOC_1_arburst,
    CPM_PCIE_NOC_1_arcache,
    CPM_PCIE_NOC_1_arid,
    CPM_PCIE_NOC_1_arlen,
    CPM_PCIE_NOC_1_arlock,
    CPM_PCIE_NOC_1_arprot,
    CPM_PCIE_NOC_1_arqos,
    CPM_PCIE_NOC_1_arready,
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
    CPM_PCIE_NOC_1_awready,
    CPM_PCIE_NOC_1_awsize,
    CPM_PCIE_NOC_1_awuser,
    CPM_PCIE_NOC_1_awvalid,
    CPM_PCIE_NOC_1_bid,
    CPM_PCIE_NOC_1_bready,
    CPM_PCIE_NOC_1_bresp,
    CPM_PCIE_NOC_1_bvalid,
    CPM_PCIE_NOC_1_rdata,
    CPM_PCIE_NOC_1_rid,
    CPM_PCIE_NOC_1_rlast,
    CPM_PCIE_NOC_1_rready,
    CPM_PCIE_NOC_1_rresp,
    CPM_PCIE_NOC_1_ruser,
    CPM_PCIE_NOC_1_rvalid,
    CPM_PCIE_NOC_1_wdata,
    CPM_PCIE_NOC_1_wlast,
    CPM_PCIE_NOC_1_wready,
    CPM_PCIE_NOC_1_wstrb,
    CPM_PCIE_NOC_1_wuser,
    CPM_PCIE_NOC_1_wvalid,
    FPD_CCI_NOC_0_araddr,
    FPD_CCI_NOC_0_arburst,
    FPD_CCI_NOC_0_arcache,
    FPD_CCI_NOC_0_arid,
    FPD_CCI_NOC_0_arlen,
    FPD_CCI_NOC_0_arlock,
    FPD_CCI_NOC_0_arprot,
    FPD_CCI_NOC_0_arqos,
    FPD_CCI_NOC_0_arready,
    FPD_CCI_NOC_0_arsize,
    FPD_CCI_NOC_0_aruser,
    FPD_CCI_NOC_0_arvalid,
    FPD_CCI_NOC_0_awaddr,
    FPD_CCI_NOC_0_awburst,
    FPD_CCI_NOC_0_awcache,
    FPD_CCI_NOC_0_awid,
    FPD_CCI_NOC_0_awlen,
    FPD_CCI_NOC_0_awlock,
    FPD_CCI_NOC_0_awprot,
    FPD_CCI_NOC_0_awqos,
    FPD_CCI_NOC_0_awready,
    FPD_CCI_NOC_0_awsize,
    FPD_CCI_NOC_0_awuser,
    FPD_CCI_NOC_0_awvalid,
    FPD_CCI_NOC_0_bid,
    FPD_CCI_NOC_0_bready,
    FPD_CCI_NOC_0_bresp,
    FPD_CCI_NOC_0_bvalid,
    FPD_CCI_NOC_0_rdata,
    FPD_CCI_NOC_0_rid,
    FPD_CCI_NOC_0_rlast,
    FPD_CCI_NOC_0_rready,
    FPD_CCI_NOC_0_rresp,
    FPD_CCI_NOC_0_rvalid,
    FPD_CCI_NOC_0_wdata,
    FPD_CCI_NOC_0_wlast,
    FPD_CCI_NOC_0_wready,
    FPD_CCI_NOC_0_wstrb,
    FPD_CCI_NOC_0_wuser,
    FPD_CCI_NOC_0_wvalid,
    FPD_CCI_NOC_1_araddr,
    FPD_CCI_NOC_1_arburst,
    FPD_CCI_NOC_1_arcache,
    FPD_CCI_NOC_1_arid,
    FPD_CCI_NOC_1_arlen,
    FPD_CCI_NOC_1_arlock,
    FPD_CCI_NOC_1_arprot,
    FPD_CCI_NOC_1_arqos,
    FPD_CCI_NOC_1_arready,
    FPD_CCI_NOC_1_arsize,
    FPD_CCI_NOC_1_aruser,
    FPD_CCI_NOC_1_arvalid,
    FPD_CCI_NOC_1_awaddr,
    FPD_CCI_NOC_1_awburst,
    FPD_CCI_NOC_1_awcache,
    FPD_CCI_NOC_1_awid,
    FPD_CCI_NOC_1_awlen,
    FPD_CCI_NOC_1_awlock,
    FPD_CCI_NOC_1_awprot,
    FPD_CCI_NOC_1_awqos,
    FPD_CCI_NOC_1_awready,
    FPD_CCI_NOC_1_awsize,
    FPD_CCI_NOC_1_awuser,
    FPD_CCI_NOC_1_awvalid,
    FPD_CCI_NOC_1_bid,
    FPD_CCI_NOC_1_bready,
    FPD_CCI_NOC_1_bresp,
    FPD_CCI_NOC_1_bvalid,
    FPD_CCI_NOC_1_rdata,
    FPD_CCI_NOC_1_rid,
    FPD_CCI_NOC_1_rlast,
    FPD_CCI_NOC_1_rready,
    FPD_CCI_NOC_1_rresp,
    FPD_CCI_NOC_1_rvalid,
    FPD_CCI_NOC_1_wdata,
    FPD_CCI_NOC_1_wlast,
    FPD_CCI_NOC_1_wready,
    FPD_CCI_NOC_1_wstrb,
    FPD_CCI_NOC_1_wuser,
    FPD_CCI_NOC_1_wvalid,
    FPD_CCI_NOC_2_araddr,
    FPD_CCI_NOC_2_arburst,
    FPD_CCI_NOC_2_arcache,
    FPD_CCI_NOC_2_arid,
    FPD_CCI_NOC_2_arlen,
    FPD_CCI_NOC_2_arlock,
    FPD_CCI_NOC_2_arprot,
    FPD_CCI_NOC_2_arqos,
    FPD_CCI_NOC_2_arready,
    FPD_CCI_NOC_2_arsize,
    FPD_CCI_NOC_2_aruser,
    FPD_CCI_NOC_2_arvalid,
    FPD_CCI_NOC_2_awaddr,
    FPD_CCI_NOC_2_awburst,
    FPD_CCI_NOC_2_awcache,
    FPD_CCI_NOC_2_awid,
    FPD_CCI_NOC_2_awlen,
    FPD_CCI_NOC_2_awlock,
    FPD_CCI_NOC_2_awprot,
    FPD_CCI_NOC_2_awqos,
    FPD_CCI_NOC_2_awready,
    FPD_CCI_NOC_2_awsize,
    FPD_CCI_NOC_2_awuser,
    FPD_CCI_NOC_2_awvalid,
    FPD_CCI_NOC_2_bid,
    FPD_CCI_NOC_2_bready,
    FPD_CCI_NOC_2_bresp,
    FPD_CCI_NOC_2_bvalid,
    FPD_CCI_NOC_2_rdata,
    FPD_CCI_NOC_2_rid,
    FPD_CCI_NOC_2_rlast,
    FPD_CCI_NOC_2_rready,
    FPD_CCI_NOC_2_rresp,
    FPD_CCI_NOC_2_rvalid,
    FPD_CCI_NOC_2_wdata,
    FPD_CCI_NOC_2_wlast,
    FPD_CCI_NOC_2_wready,
    FPD_CCI_NOC_2_wstrb,
    FPD_CCI_NOC_2_wuser,
    FPD_CCI_NOC_2_wvalid,
    FPD_CCI_NOC_3_araddr,
    FPD_CCI_NOC_3_arburst,
    FPD_CCI_NOC_3_arcache,
    FPD_CCI_NOC_3_arid,
    FPD_CCI_NOC_3_arlen,
    FPD_CCI_NOC_3_arlock,
    FPD_CCI_NOC_3_arprot,
    FPD_CCI_NOC_3_arqos,
    FPD_CCI_NOC_3_arready,
    FPD_CCI_NOC_3_arsize,
    FPD_CCI_NOC_3_aruser,
    FPD_CCI_NOC_3_arvalid,
    FPD_CCI_NOC_3_awaddr,
    FPD_CCI_NOC_3_awburst,
    FPD_CCI_NOC_3_awcache,
    FPD_CCI_NOC_3_awid,
    FPD_CCI_NOC_3_awlen,
    FPD_CCI_NOC_3_awlock,
    FPD_CCI_NOC_3_awprot,
    FPD_CCI_NOC_3_awqos,
    FPD_CCI_NOC_3_awready,
    FPD_CCI_NOC_3_awsize,
    FPD_CCI_NOC_3_awuser,
    FPD_CCI_NOC_3_awvalid,
    FPD_CCI_NOC_3_bid,
    FPD_CCI_NOC_3_bready,
    FPD_CCI_NOC_3_bresp,
    FPD_CCI_NOC_3_bvalid,
    FPD_CCI_NOC_3_rdata,
    FPD_CCI_NOC_3_rid,
    FPD_CCI_NOC_3_rlast,
    FPD_CCI_NOC_3_rready,
    FPD_CCI_NOC_3_rresp,
    FPD_CCI_NOC_3_rvalid,
    FPD_CCI_NOC_3_wdata,
    FPD_CCI_NOC_3_wlast,
    FPD_CCI_NOC_3_wready,
    FPD_CCI_NOC_3_wstrb,
    FPD_CCI_NOC_3_wuser,
    FPD_CCI_NOC_3_wvalid,
    LPD_AXI_NOC_0_araddr,
    LPD_AXI_NOC_0_arburst,
    LPD_AXI_NOC_0_arcache,
    LPD_AXI_NOC_0_arid,
    LPD_AXI_NOC_0_arlen,
    LPD_AXI_NOC_0_arlock,
    LPD_AXI_NOC_0_arprot,
    LPD_AXI_NOC_0_arqos,
    LPD_AXI_NOC_0_arready,
    LPD_AXI_NOC_0_arsize,
    LPD_AXI_NOC_0_aruser,
    LPD_AXI_NOC_0_arvalid,
    LPD_AXI_NOC_0_awaddr,
    LPD_AXI_NOC_0_awburst,
    LPD_AXI_NOC_0_awcache,
    LPD_AXI_NOC_0_awid,
    LPD_AXI_NOC_0_awlen,
    LPD_AXI_NOC_0_awlock,
    LPD_AXI_NOC_0_awprot,
    LPD_AXI_NOC_0_awqos,
    LPD_AXI_NOC_0_awready,
    LPD_AXI_NOC_0_awsize,
    LPD_AXI_NOC_0_awuser,
    LPD_AXI_NOC_0_awvalid,
    LPD_AXI_NOC_0_bid,
    LPD_AXI_NOC_0_bready,
    LPD_AXI_NOC_0_bresp,
    LPD_AXI_NOC_0_bvalid,
    LPD_AXI_NOC_0_rdata,
    LPD_AXI_NOC_0_rid,
    LPD_AXI_NOC_0_rlast,
    LPD_AXI_NOC_0_rready,
    LPD_AXI_NOC_0_rresp,
    LPD_AXI_NOC_0_rvalid,
    LPD_AXI_NOC_0_wdata,
    LPD_AXI_NOC_0_wlast,
    LPD_AXI_NOC_0_wready,
    LPD_AXI_NOC_0_wstrb,
    LPD_AXI_NOC_0_wvalid,
    NOC_PMC_AXI_0_araddr,
    NOC_PMC_AXI_0_arburst,
    NOC_PMC_AXI_0_arcache,
    NOC_PMC_AXI_0_arid,
    NOC_PMC_AXI_0_arlen,
    NOC_PMC_AXI_0_arlock,
    NOC_PMC_AXI_0_arprot,
    NOC_PMC_AXI_0_arqos,
    NOC_PMC_AXI_0_arready,
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
    NOC_PMC_AXI_0_awready,
    NOC_PMC_AXI_0_awregion,
    NOC_PMC_AXI_0_awsize,
    NOC_PMC_AXI_0_awuser,
    NOC_PMC_AXI_0_awvalid,
    NOC_PMC_AXI_0_bid,
    NOC_PMC_AXI_0_bready,
    NOC_PMC_AXI_0_bresp,
    NOC_PMC_AXI_0_buser,
    NOC_PMC_AXI_0_bvalid,
    NOC_PMC_AXI_0_rdata,
    NOC_PMC_AXI_0_rid,
    NOC_PMC_AXI_0_rlast,
    NOC_PMC_AXI_0_rready,
    NOC_PMC_AXI_0_rresp,
    NOC_PMC_AXI_0_ruser,
    NOC_PMC_AXI_0_rvalid,
    NOC_PMC_AXI_0_wdata,
    NOC_PMC_AXI_0_wid,
    NOC_PMC_AXI_0_wlast,
    NOC_PMC_AXI_0_wready,
    NOC_PMC_AXI_0_wstrb,
    NOC_PMC_AXI_0_wuser,
    NOC_PMC_AXI_0_wvalid,
    PCIE0_GT_grx_n,
    PCIE0_GT_grx_p,
    PCIE0_GT_gtx_n,
    PCIE0_GT_gtx_p,
    PMC_NOC_AXI_0_araddr,
    PMC_NOC_AXI_0_arburst,
    PMC_NOC_AXI_0_arcache,
    PMC_NOC_AXI_0_arid,
    PMC_NOC_AXI_0_arlen,
    PMC_NOC_AXI_0_arlock,
    PMC_NOC_AXI_0_arprot,
    PMC_NOC_AXI_0_arqos,
    PMC_NOC_AXI_0_arready,
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
    PMC_NOC_AXI_0_awready,
    PMC_NOC_AXI_0_awregion,
    PMC_NOC_AXI_0_awsize,
    PMC_NOC_AXI_0_awuser,
    PMC_NOC_AXI_0_awvalid,
    PMC_NOC_AXI_0_bid,
    PMC_NOC_AXI_0_bready,
    PMC_NOC_AXI_0_bresp,
    PMC_NOC_AXI_0_buser,
    PMC_NOC_AXI_0_bvalid,
    PMC_NOC_AXI_0_rdata,
    PMC_NOC_AXI_0_rid,
    PMC_NOC_AXI_0_rlast,
    PMC_NOC_AXI_0_rready,
    PMC_NOC_AXI_0_rresp,
    PMC_NOC_AXI_0_ruser,
    PMC_NOC_AXI_0_rvalid,
    PMC_NOC_AXI_0_wdata,
    PMC_NOC_AXI_0_wid,
    PMC_NOC_AXI_0_wlast,
    PMC_NOC_AXI_0_wready,
    PMC_NOC_AXI_0_wstrb,
    PMC_NOC_AXI_0_wuser,
    PMC_NOC_AXI_0_wvalid,
    cpm_cor_irq,
    cpm_irq0,
    cpm_irq1,
    cpm_misc_irq,
    cpm_pcie_noc_axi0_clk,
    cpm_pcie_noc_axi1_clk,
    cpm_uncor_irq,
    dma0_axi_aresetn,
    dma0_axis_c2h_dmawr_cmp,
    dma0_axis_c2h_dmawr_port_id,
    dma0_axis_c2h_dmawr_target_vch,
    dma0_axis_c2h_status_drop,
    dma0_axis_c2h_status_error,
    dma0_axis_c2h_status_last,
    dma0_axis_c2h_status_qid,
    dma0_axis_c2h_status_status_cmp,
    dma0_axis_c2h_status_valid,
    dma0_dsc_crdt_in_crdt,
    dma0_dsc_crdt_in_dir,
    dma0_dsc_crdt_in_fence,
    dma0_dsc_crdt_in_qid,
    dma0_dsc_crdt_in_rdy,
    dma0_dsc_crdt_in_valid,
    dma0_intrfc_clk,
    dma0_intrfc_resetn,
    dma0_m_axis_h2c_err,
    dma0_m_axis_h2c_mdata,
    dma0_m_axis_h2c_mty,
    dma0_m_axis_h2c_port_id,
    dma0_m_axis_h2c_qid,
    dma0_m_axis_h2c_tcrc,
    dma0_m_axis_h2c_tdata,
    dma0_m_axis_h2c_tlast,
    dma0_m_axis_h2c_tready,
    dma0_m_axis_h2c_tvalid,
    dma0_m_axis_h2c_zero_byte,
    dma0_mgmt_cpl_dat,
    dma0_mgmt_cpl_rdy,
    dma0_mgmt_cpl_sts,
    dma0_mgmt_cpl_vld,
    dma0_mgmt_req_adr,
    dma0_mgmt_req_cmd,
    dma0_mgmt_req_dat,
    dma0_mgmt_req_fnc,
    dma0_mgmt_req_msc,
    dma0_mgmt_req_rdy,
    dma0_mgmt_req_vld,
    dma0_qsts_out_data,
    dma0_qsts_out_op,
    dma0_qsts_out_port_id,
    dma0_qsts_out_qid,
    dma0_qsts_out_rdy,
    dma0_qsts_out_vld,
    dma0_s_axis_c2h_cmpt_cmpt_type,
    dma0_s_axis_c2h_cmpt_col_idx,
    dma0_s_axis_c2h_cmpt_data,
    dma0_s_axis_c2h_cmpt_dpar,
    dma0_s_axis_c2h_cmpt_err_idx,
    dma0_s_axis_c2h_cmpt_marker,
    dma0_s_axis_c2h_cmpt_no_wrb_marker,
    dma0_s_axis_c2h_cmpt_port_id,
    dma0_s_axis_c2h_cmpt_qid,
    dma0_s_axis_c2h_cmpt_size,
    dma0_s_axis_c2h_cmpt_tready,
    dma0_s_axis_c2h_cmpt_tvalid,
    dma0_s_axis_c2h_cmpt_user_trig,
    dma0_s_axis_c2h_cmpt_wait_pld_pkt_id,
    dma0_s_axis_c2h_ctrl_has_cmpt,
    dma0_s_axis_c2h_ctrl_len,
    dma0_s_axis_c2h_ctrl_marker,
    dma0_s_axis_c2h_ctrl_port_id,
    dma0_s_axis_c2h_ctrl_qid,
    dma0_s_axis_c2h_ecc,
    dma0_s_axis_c2h_mty,
    dma0_s_axis_c2h_tcrc,
    dma0_s_axis_c2h_tdata,
    dma0_s_axis_c2h_tlast,
    dma0_s_axis_c2h_tready,
    dma0_s_axis_c2h_tvalid,
    dma0_st_rx_msg_tdata,
    dma0_st_rx_msg_tlast,
    dma0_st_rx_msg_tready,
    dma0_st_rx_msg_tvalid,
    dma0_tm_dsc_sts_avl,
    dma0_tm_dsc_sts_byp,
    dma0_tm_dsc_sts_dir,
    dma0_tm_dsc_sts_error,
    dma0_tm_dsc_sts_irq_arm,
    dma0_tm_dsc_sts_mm,
    dma0_tm_dsc_sts_pidx,
    dma0_tm_dsc_sts_port_id,
    dma0_tm_dsc_sts_qen,
    dma0_tm_dsc_sts_qid,
    dma0_tm_dsc_sts_qinv,
    dma0_tm_dsc_sts_rdy,
    dma0_tm_dsc_sts_valid,
    dma0_usr_flr_clear,
    dma0_usr_flr_done_fnc,
    dma0_usr_flr_done_vld,
    dma0_usr_flr_fnc,
    dma0_usr_flr_set,
    dma0_usr_irq_ack,
    dma0_usr_irq_fail,
    dma0_usr_irq_fnc,
    dma0_usr_irq_valid,
    dma0_usr_irq_vec,
    fpd_cci_noc_axi0_clk,
    fpd_cci_noc_axi1_clk,
    fpd_cci_noc_axi2_clk,
    fpd_cci_noc_axi3_clk,
    gem0_tsu_timer_cnt,
    gt_refclk0_clk_n,
    gt_refclk0_clk_p,
    lpd_axi_noc_clk,
    noc_pmc_axi_axi0_clk,
    pmc_axi_noc_axi0_clk);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_0, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk, DATA_WIDTH 128, FREQ_HZ 1000000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, HD_TANDEM 1, ID_WIDTH 16, INDEX 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_pcie, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]CPM_PCIE_NOC_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARBURST" *) output [1:0]CPM_PCIE_NOC_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARCACHE" *) output [3:0]CPM_PCIE_NOC_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARID" *) output [15:0]CPM_PCIE_NOC_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLEN" *) output [7:0]CPM_PCIE_NOC_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLOCK" *) output CPM_PCIE_NOC_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARPROT" *) output [2:0]CPM_PCIE_NOC_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARQOS" *) output [3:0]CPM_PCIE_NOC_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARREADY" *) input CPM_PCIE_NOC_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARSIZE" *) output [2:0]CPM_PCIE_NOC_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARUSER" *) output [17:0]CPM_PCIE_NOC_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARVALID" *) output CPM_PCIE_NOC_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWADDR" *) output [63:0]CPM_PCIE_NOC_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWBURST" *) output [1:0]CPM_PCIE_NOC_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWCACHE" *) output [3:0]CPM_PCIE_NOC_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWID" *) output [15:0]CPM_PCIE_NOC_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLEN" *) output [7:0]CPM_PCIE_NOC_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLOCK" *) output CPM_PCIE_NOC_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWPROT" *) output [2:0]CPM_PCIE_NOC_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWQOS" *) output [3:0]CPM_PCIE_NOC_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWREADY" *) input CPM_PCIE_NOC_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWSIZE" *) output [2:0]CPM_PCIE_NOC_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWUSER" *) output [17:0]CPM_PCIE_NOC_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWVALID" *) output CPM_PCIE_NOC_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BID" *) input [15:0]CPM_PCIE_NOC_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BREADY" *) output CPM_PCIE_NOC_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BRESP" *) input [1:0]CPM_PCIE_NOC_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BVALID" *) input CPM_PCIE_NOC_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RDATA" *) input [127:0]CPM_PCIE_NOC_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RID" *) input [15:0]CPM_PCIE_NOC_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RLAST" *) input CPM_PCIE_NOC_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RREADY" *) output CPM_PCIE_NOC_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RRESP" *) input [1:0]CPM_PCIE_NOC_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RUSER" *) input [16:0]CPM_PCIE_NOC_0_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RVALID" *) input CPM_PCIE_NOC_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WDATA" *) output [127:0]CPM_PCIE_NOC_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WLAST" *) output CPM_PCIE_NOC_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WREADY" *) input CPM_PCIE_NOC_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WSTRB" *) output [15:0]CPM_PCIE_NOC_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WUSER" *) output [16:0]CPM_PCIE_NOC_0_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WVALID" *) output CPM_PCIE_NOC_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_1, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk, DATA_WIDTH 128, FREQ_HZ 1000000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, HD_TANDEM 1, ID_WIDTH 16, INDEX 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_pcie, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]CPM_PCIE_NOC_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARBURST" *) output [1:0]CPM_PCIE_NOC_1_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARCACHE" *) output [3:0]CPM_PCIE_NOC_1_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARID" *) output [15:0]CPM_PCIE_NOC_1_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLEN" *) output [7:0]CPM_PCIE_NOC_1_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLOCK" *) output CPM_PCIE_NOC_1_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARPROT" *) output [2:0]CPM_PCIE_NOC_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARQOS" *) output [3:0]CPM_PCIE_NOC_1_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARREADY" *) input CPM_PCIE_NOC_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARSIZE" *) output [2:0]CPM_PCIE_NOC_1_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARUSER" *) output [17:0]CPM_PCIE_NOC_1_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARVALID" *) output CPM_PCIE_NOC_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWADDR" *) output [63:0]CPM_PCIE_NOC_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWBURST" *) output [1:0]CPM_PCIE_NOC_1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWCACHE" *) output [3:0]CPM_PCIE_NOC_1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWID" *) output [15:0]CPM_PCIE_NOC_1_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLEN" *) output [7:0]CPM_PCIE_NOC_1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLOCK" *) output CPM_PCIE_NOC_1_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWPROT" *) output [2:0]CPM_PCIE_NOC_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWQOS" *) output [3:0]CPM_PCIE_NOC_1_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWREADY" *) input CPM_PCIE_NOC_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWSIZE" *) output [2:0]CPM_PCIE_NOC_1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWUSER" *) output [17:0]CPM_PCIE_NOC_1_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWVALID" *) output CPM_PCIE_NOC_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BID" *) input [15:0]CPM_PCIE_NOC_1_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BREADY" *) output CPM_PCIE_NOC_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BRESP" *) input [1:0]CPM_PCIE_NOC_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BVALID" *) input CPM_PCIE_NOC_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RDATA" *) input [127:0]CPM_PCIE_NOC_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RID" *) input [15:0]CPM_PCIE_NOC_1_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RLAST" *) input CPM_PCIE_NOC_1_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RREADY" *) output CPM_PCIE_NOC_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RRESP" *) input [1:0]CPM_PCIE_NOC_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RUSER" *) input [16:0]CPM_PCIE_NOC_1_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RVALID" *) input CPM_PCIE_NOC_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WDATA" *) output [127:0]CPM_PCIE_NOC_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WLAST" *) output CPM_PCIE_NOC_1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WREADY" *) input CPM_PCIE_NOC_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WSTRB" *) output [15:0]CPM_PCIE_NOC_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WUSER" *) output [16:0]CPM_PCIE_NOC_1_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WVALID" *) output CPM_PCIE_NOC_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_0, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk, DATA_WIDTH 128, FREQ_HZ 824999207, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INDEX 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_cci, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]FPD_CCI_NOC_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARBURST" *) output [1:0]FPD_CCI_NOC_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARCACHE" *) output [3:0]FPD_CCI_NOC_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARID" *) output [15:0]FPD_CCI_NOC_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARLEN" *) output [7:0]FPD_CCI_NOC_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARLOCK" *) output FPD_CCI_NOC_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARPROT" *) output [2:0]FPD_CCI_NOC_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARQOS" *) output [3:0]FPD_CCI_NOC_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARREADY" *) input FPD_CCI_NOC_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARSIZE" *) output [2:0]FPD_CCI_NOC_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARUSER" *) output [17:0]FPD_CCI_NOC_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 ARVALID" *) output FPD_CCI_NOC_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWADDR" *) output [63:0]FPD_CCI_NOC_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWBURST" *) output [1:0]FPD_CCI_NOC_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWCACHE" *) output [3:0]FPD_CCI_NOC_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWID" *) output [15:0]FPD_CCI_NOC_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWLEN" *) output [7:0]FPD_CCI_NOC_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWLOCK" *) output FPD_CCI_NOC_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWPROT" *) output [2:0]FPD_CCI_NOC_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWQOS" *) output [3:0]FPD_CCI_NOC_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWREADY" *) input FPD_CCI_NOC_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWSIZE" *) output [2:0]FPD_CCI_NOC_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWUSER" *) output [17:0]FPD_CCI_NOC_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 AWVALID" *) output FPD_CCI_NOC_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BID" *) input [15:0]FPD_CCI_NOC_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BREADY" *) output FPD_CCI_NOC_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BRESP" *) input [1:0]FPD_CCI_NOC_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 BVALID" *) input FPD_CCI_NOC_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RDATA" *) input [127:0]FPD_CCI_NOC_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RID" *) input [15:0]FPD_CCI_NOC_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RLAST" *) input FPD_CCI_NOC_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RREADY" *) output FPD_CCI_NOC_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RRESP" *) input [1:0]FPD_CCI_NOC_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 RVALID" *) input FPD_CCI_NOC_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WDATA" *) output [127:0]FPD_CCI_NOC_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WLAST" *) output FPD_CCI_NOC_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WREADY" *) input FPD_CCI_NOC_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WSTRB" *) output [15:0]FPD_CCI_NOC_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WUSER" *) output [16:0]FPD_CCI_NOC_0_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_0 WVALID" *) output FPD_CCI_NOC_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_1, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk, DATA_WIDTH 128, FREQ_HZ 824999207, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INDEX 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_cci, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]FPD_CCI_NOC_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARBURST" *) output [1:0]FPD_CCI_NOC_1_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARCACHE" *) output [3:0]FPD_CCI_NOC_1_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARID" *) output [15:0]FPD_CCI_NOC_1_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARLEN" *) output [7:0]FPD_CCI_NOC_1_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARLOCK" *) output FPD_CCI_NOC_1_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARPROT" *) output [2:0]FPD_CCI_NOC_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARQOS" *) output [3:0]FPD_CCI_NOC_1_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARREADY" *) input FPD_CCI_NOC_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARSIZE" *) output [2:0]FPD_CCI_NOC_1_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARUSER" *) output [17:0]FPD_CCI_NOC_1_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 ARVALID" *) output FPD_CCI_NOC_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWADDR" *) output [63:0]FPD_CCI_NOC_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWBURST" *) output [1:0]FPD_CCI_NOC_1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWCACHE" *) output [3:0]FPD_CCI_NOC_1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWID" *) output [15:0]FPD_CCI_NOC_1_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWLEN" *) output [7:0]FPD_CCI_NOC_1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWLOCK" *) output FPD_CCI_NOC_1_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWPROT" *) output [2:0]FPD_CCI_NOC_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWQOS" *) output [3:0]FPD_CCI_NOC_1_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWREADY" *) input FPD_CCI_NOC_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWSIZE" *) output [2:0]FPD_CCI_NOC_1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWUSER" *) output [17:0]FPD_CCI_NOC_1_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 AWVALID" *) output FPD_CCI_NOC_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BID" *) input [15:0]FPD_CCI_NOC_1_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BREADY" *) output FPD_CCI_NOC_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BRESP" *) input [1:0]FPD_CCI_NOC_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 BVALID" *) input FPD_CCI_NOC_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RDATA" *) input [127:0]FPD_CCI_NOC_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RID" *) input [15:0]FPD_CCI_NOC_1_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RLAST" *) input FPD_CCI_NOC_1_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RREADY" *) output FPD_CCI_NOC_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RRESP" *) input [1:0]FPD_CCI_NOC_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 RVALID" *) input FPD_CCI_NOC_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WDATA" *) output [127:0]FPD_CCI_NOC_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WLAST" *) output FPD_CCI_NOC_1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WREADY" *) input FPD_CCI_NOC_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WSTRB" *) output [15:0]FPD_CCI_NOC_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WUSER" *) output [16:0]FPD_CCI_NOC_1_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_1 WVALID" *) output FPD_CCI_NOC_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_2, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk, DATA_WIDTH 128, FREQ_HZ 824999207, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INDEX 2, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_cci, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]FPD_CCI_NOC_2_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARBURST" *) output [1:0]FPD_CCI_NOC_2_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARCACHE" *) output [3:0]FPD_CCI_NOC_2_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARID" *) output [15:0]FPD_CCI_NOC_2_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARLEN" *) output [7:0]FPD_CCI_NOC_2_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARLOCK" *) output FPD_CCI_NOC_2_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARPROT" *) output [2:0]FPD_CCI_NOC_2_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARQOS" *) output [3:0]FPD_CCI_NOC_2_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARREADY" *) input FPD_CCI_NOC_2_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARSIZE" *) output [2:0]FPD_CCI_NOC_2_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARUSER" *) output [17:0]FPD_CCI_NOC_2_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 ARVALID" *) output FPD_CCI_NOC_2_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWADDR" *) output [63:0]FPD_CCI_NOC_2_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWBURST" *) output [1:0]FPD_CCI_NOC_2_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWCACHE" *) output [3:0]FPD_CCI_NOC_2_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWID" *) output [15:0]FPD_CCI_NOC_2_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWLEN" *) output [7:0]FPD_CCI_NOC_2_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWLOCK" *) output FPD_CCI_NOC_2_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWPROT" *) output [2:0]FPD_CCI_NOC_2_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWQOS" *) output [3:0]FPD_CCI_NOC_2_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWREADY" *) input FPD_CCI_NOC_2_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWSIZE" *) output [2:0]FPD_CCI_NOC_2_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWUSER" *) output [17:0]FPD_CCI_NOC_2_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 AWVALID" *) output FPD_CCI_NOC_2_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BID" *) input [15:0]FPD_CCI_NOC_2_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BREADY" *) output FPD_CCI_NOC_2_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BRESP" *) input [1:0]FPD_CCI_NOC_2_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 BVALID" *) input FPD_CCI_NOC_2_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RDATA" *) input [127:0]FPD_CCI_NOC_2_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RID" *) input [15:0]FPD_CCI_NOC_2_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RLAST" *) input FPD_CCI_NOC_2_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RREADY" *) output FPD_CCI_NOC_2_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RRESP" *) input [1:0]FPD_CCI_NOC_2_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 RVALID" *) input FPD_CCI_NOC_2_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WDATA" *) output [127:0]FPD_CCI_NOC_2_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WLAST" *) output FPD_CCI_NOC_2_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WREADY" *) input FPD_CCI_NOC_2_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WSTRB" *) output [15:0]FPD_CCI_NOC_2_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WUSER" *) output [16:0]FPD_CCI_NOC_2_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_2 WVALID" *) output FPD_CCI_NOC_2_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FPD_CCI_NOC_3, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk, DATA_WIDTH 128, FREQ_HZ 824999207, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INDEX 3, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_cci, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]FPD_CCI_NOC_3_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARBURST" *) output [1:0]FPD_CCI_NOC_3_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARCACHE" *) output [3:0]FPD_CCI_NOC_3_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARID" *) output [15:0]FPD_CCI_NOC_3_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARLEN" *) output [7:0]FPD_CCI_NOC_3_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARLOCK" *) output FPD_CCI_NOC_3_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARPROT" *) output [2:0]FPD_CCI_NOC_3_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARQOS" *) output [3:0]FPD_CCI_NOC_3_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARREADY" *) input FPD_CCI_NOC_3_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARSIZE" *) output [2:0]FPD_CCI_NOC_3_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARUSER" *) output [17:0]FPD_CCI_NOC_3_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 ARVALID" *) output FPD_CCI_NOC_3_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWADDR" *) output [63:0]FPD_CCI_NOC_3_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWBURST" *) output [1:0]FPD_CCI_NOC_3_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWCACHE" *) output [3:0]FPD_CCI_NOC_3_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWID" *) output [15:0]FPD_CCI_NOC_3_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWLEN" *) output [7:0]FPD_CCI_NOC_3_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWLOCK" *) output FPD_CCI_NOC_3_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWPROT" *) output [2:0]FPD_CCI_NOC_3_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWQOS" *) output [3:0]FPD_CCI_NOC_3_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWREADY" *) input FPD_CCI_NOC_3_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWSIZE" *) output [2:0]FPD_CCI_NOC_3_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWUSER" *) output [17:0]FPD_CCI_NOC_3_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 AWVALID" *) output FPD_CCI_NOC_3_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BID" *) input [15:0]FPD_CCI_NOC_3_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BREADY" *) output FPD_CCI_NOC_3_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BRESP" *) input [1:0]FPD_CCI_NOC_3_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 BVALID" *) input FPD_CCI_NOC_3_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RDATA" *) input [127:0]FPD_CCI_NOC_3_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RID" *) input [15:0]FPD_CCI_NOC_3_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RLAST" *) input FPD_CCI_NOC_3_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RREADY" *) output FPD_CCI_NOC_3_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RRESP" *) input [1:0]FPD_CCI_NOC_3_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 RVALID" *) input FPD_CCI_NOC_3_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WDATA" *) output [127:0]FPD_CCI_NOC_3_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WLAST" *) output FPD_CCI_NOC_3_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WREADY" *) input FPD_CCI_NOC_3_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WSTRB" *) output [15:0]FPD_CCI_NOC_3_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WUSER" *) output [16:0]FPD_CCI_NOC_3_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FPD_CCI_NOC_3 WVALID" *) output FPD_CCI_NOC_3_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LPD_AXI_NOC_0, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_lpd_axi_noc_clk, DATA_WIDTH 128, FREQ_HZ 599999451, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INDEX 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_rpu, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_RPU_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]LPD_AXI_NOC_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARBURST" *) output [1:0]LPD_AXI_NOC_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARCACHE" *) output [3:0]LPD_AXI_NOC_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARID" *) output [15:0]LPD_AXI_NOC_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARLEN" *) output [7:0]LPD_AXI_NOC_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARLOCK" *) output LPD_AXI_NOC_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARPROT" *) output [2:0]LPD_AXI_NOC_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARQOS" *) output [3:0]LPD_AXI_NOC_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARREADY" *) input LPD_AXI_NOC_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARSIZE" *) output [2:0]LPD_AXI_NOC_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARUSER" *) output [17:0]LPD_AXI_NOC_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 ARVALID" *) output LPD_AXI_NOC_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWADDR" *) output [63:0]LPD_AXI_NOC_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWBURST" *) output [1:0]LPD_AXI_NOC_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWCACHE" *) output [3:0]LPD_AXI_NOC_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWID" *) output [15:0]LPD_AXI_NOC_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWLEN" *) output [7:0]LPD_AXI_NOC_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWLOCK" *) output LPD_AXI_NOC_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWPROT" *) output [2:0]LPD_AXI_NOC_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWQOS" *) output [3:0]LPD_AXI_NOC_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWREADY" *) input LPD_AXI_NOC_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWSIZE" *) output [2:0]LPD_AXI_NOC_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWUSER" *) output [17:0]LPD_AXI_NOC_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 AWVALID" *) output LPD_AXI_NOC_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BID" *) input [15:0]LPD_AXI_NOC_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BREADY" *) output LPD_AXI_NOC_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BRESP" *) input [1:0]LPD_AXI_NOC_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 BVALID" *) input LPD_AXI_NOC_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RDATA" *) input [127:0]LPD_AXI_NOC_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RID" *) input [15:0]LPD_AXI_NOC_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RLAST" *) input LPD_AXI_NOC_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RREADY" *) output LPD_AXI_NOC_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RRESP" *) input [1:0]LPD_AXI_NOC_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 RVALID" *) input LPD_AXI_NOC_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WDATA" *) output [127:0]LPD_AXI_NOC_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WLAST" *) output LPD_AXI_NOC_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WREADY" *) input LPD_AXI_NOC_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WSTRB" *) output [15:0]LPD_AXI_NOC_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 LPD_AXI_NOC_0 WVALID" *) output LPD_AXI_NOC_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NOC_PMC_AXI_0, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 16, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk, DATA_WIDTH 128, FREQ_HZ 400000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, HD_TANDEM 1, ID_WIDTH 2, INDEX 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_pmc, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 4, PHASE 0.0, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PMC, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, SLR_INDEX 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) input [63:0]NOC_PMC_AXI_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARBURST" *) input [1:0]NOC_PMC_AXI_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARCACHE" *) input [3:0]NOC_PMC_AXI_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARID" *) input [1:0]NOC_PMC_AXI_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARLEN" *) input [7:0]NOC_PMC_AXI_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARLOCK" *) input NOC_PMC_AXI_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARPROT" *) input [2:0]NOC_PMC_AXI_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARQOS" *) input [3:0]NOC_PMC_AXI_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARREADY" *) output NOC_PMC_AXI_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARREGION" *) input [3:0]NOC_PMC_AXI_0_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARSIZE" *) input [2:0]NOC_PMC_AXI_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARUSER" *) input [17:0]NOC_PMC_AXI_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 ARVALID" *) input NOC_PMC_AXI_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWADDR" *) input [63:0]NOC_PMC_AXI_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWBURST" *) input [1:0]NOC_PMC_AXI_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWCACHE" *) input [3:0]NOC_PMC_AXI_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWID" *) input [1:0]NOC_PMC_AXI_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWLEN" *) input [7:0]NOC_PMC_AXI_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWLOCK" *) input NOC_PMC_AXI_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWPROT" *) input [2:0]NOC_PMC_AXI_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWQOS" *) input [3:0]NOC_PMC_AXI_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWREADY" *) output NOC_PMC_AXI_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWREGION" *) input [3:0]NOC_PMC_AXI_0_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWSIZE" *) input [2:0]NOC_PMC_AXI_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWUSER" *) input [17:0]NOC_PMC_AXI_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 AWVALID" *) input NOC_PMC_AXI_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BID" *) output [1:0]NOC_PMC_AXI_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BREADY" *) input NOC_PMC_AXI_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BRESP" *) output [1:0]NOC_PMC_AXI_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BUSER" *) output [15:0]NOC_PMC_AXI_0_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 BVALID" *) output NOC_PMC_AXI_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RDATA" *) output [127:0]NOC_PMC_AXI_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RID" *) output [1:0]NOC_PMC_AXI_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RLAST" *) output NOC_PMC_AXI_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RREADY" *) input NOC_PMC_AXI_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RRESP" *) output [1:0]NOC_PMC_AXI_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RUSER" *) output [16:0]NOC_PMC_AXI_0_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 RVALID" *) output NOC_PMC_AXI_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WDATA" *) input [127:0]NOC_PMC_AXI_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WID" *) input [3:0]NOC_PMC_AXI_0_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WLAST" *) input NOC_PMC_AXI_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WREADY" *) output NOC_PMC_AXI_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WSTRB" *) input [15:0]NOC_PMC_AXI_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WUSER" *) input [16:0]NOC_PMC_AXI_0_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_PMC_AXI_0 WVALID" *) input NOC_PMC_AXI_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_N" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PCIE0_GT, CAN_DEBUG false" *) input [7:0]PCIE0_GT_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_P" *) input [7:0]PCIE0_GT_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_N" *) output [7:0]PCIE0_GT_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_P" *) output [7:0]PCIE0_GT_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PMC_NOC_AXI_0, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 16, CATEGORY noc, CLK_DOMAIN bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk, DATA_WIDTH 128, FREQ_HZ 400000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, HD_TANDEM 1, ID_WIDTH 16, INDEX 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps_pmc, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, SLR_INDEX 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]PMC_NOC_AXI_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARBURST" *) output [1:0]PMC_NOC_AXI_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARCACHE" *) output [3:0]PMC_NOC_AXI_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARID" *) output [15:0]PMC_NOC_AXI_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARLEN" *) output [7:0]PMC_NOC_AXI_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARLOCK" *) output PMC_NOC_AXI_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARPROT" *) output [2:0]PMC_NOC_AXI_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARQOS" *) output [3:0]PMC_NOC_AXI_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARREADY" *) input PMC_NOC_AXI_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARREGION" *) output [3:0]PMC_NOC_AXI_0_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARSIZE" *) output [2:0]PMC_NOC_AXI_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARUSER" *) output [17:0]PMC_NOC_AXI_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 ARVALID" *) output PMC_NOC_AXI_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWADDR" *) output [63:0]PMC_NOC_AXI_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWBURST" *) output [1:0]PMC_NOC_AXI_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWCACHE" *) output [3:0]PMC_NOC_AXI_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWID" *) output [15:0]PMC_NOC_AXI_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWLEN" *) output [7:0]PMC_NOC_AXI_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWLOCK" *) output PMC_NOC_AXI_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWPROT" *) output [2:0]PMC_NOC_AXI_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWQOS" *) output [3:0]PMC_NOC_AXI_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWREADY" *) input PMC_NOC_AXI_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWREGION" *) output [3:0]PMC_NOC_AXI_0_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWSIZE" *) output [2:0]PMC_NOC_AXI_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWUSER" *) output [17:0]PMC_NOC_AXI_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 AWVALID" *) output PMC_NOC_AXI_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BID" *) input [15:0]PMC_NOC_AXI_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BREADY" *) output PMC_NOC_AXI_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BRESP" *) input [1:0]PMC_NOC_AXI_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BUSER" *) input [15:0]PMC_NOC_AXI_0_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 BVALID" *) input PMC_NOC_AXI_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RDATA" *) input [127:0]PMC_NOC_AXI_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RID" *) input [15:0]PMC_NOC_AXI_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RLAST" *) input PMC_NOC_AXI_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RREADY" *) output PMC_NOC_AXI_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RRESP" *) input [1:0]PMC_NOC_AXI_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RUSER" *) input [16:0]PMC_NOC_AXI_0_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 RVALID" *) input PMC_NOC_AXI_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WDATA" *) output [127:0]PMC_NOC_AXI_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WID" *) output [15:0]PMC_NOC_AXI_0_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WLAST" *) output PMC_NOC_AXI_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WREADY" *) input PMC_NOC_AXI_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WSTRB" *) output [15:0]PMC_NOC_AXI_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WUSER" *) output [16:0]PMC_NOC_AXI_0_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PMC_NOC_AXI_0 WVALID" *) output PMC_NOC_AXI_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CPM_COR_IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CPM_COR_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output cpm_cor_irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CPM_IRQ0 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CPM_IRQ0, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input cpm_irq0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CPM_IRQ1 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CPM_IRQ1, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input cpm_irq1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CPM_MISC_IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CPM_MISC_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output cpm_misc_irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CPM_PCIE_NOC_AXI0_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CPM_PCIE_NOC_AXI0_CLK, ASSOCIATED_BUSIF CPM_PCIE_NOC_0, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi0_clk, FREQ_HZ 1000000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *) output cpm_pcie_noc_axi0_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CPM_PCIE_NOC_AXI1_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CPM_PCIE_NOC_AXI1_CLK, ASSOCIATED_BUSIF CPM_PCIE_NOC_1, CLK_DOMAIN bd_af1b_pspmc_0_0_cpm_pcie_noc_axi1_clk, FREQ_HZ 1000000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *) output cpm_pcie_noc_axi1_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.CPM_UNCOR_IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.CPM_UNCOR_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output cpm_uncor_irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DMA0_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DMA0_AXI_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output dma0_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr cmp" *) (* X_INTERFACE_MODE = "Master" *) output dma0_axis_c2h_dmawr_cmp;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr port_id" *) output [2:0]dma0_axis_c2h_dmawr_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_dmawr:1.0 dma0_axis_c2h_dmawr target_vch" *) output dma0_axis_c2h_dmawr_target_vch;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status drop" *) (* X_INTERFACE_MODE = "Master" *) output dma0_axis_c2h_status_drop;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status error" *) output dma0_axis_c2h_status_error;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status last" *) output dma0_axis_c2h_status_last;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status qid" *) output [11:0]dma0_axis_c2h_status_qid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status status_cmp" *) output dma0_axis_c2h_status_status_cmp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_c2h_status:1.0 dma0_axis_c2h_status valid" *) output dma0_axis_c2h_status_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in crdt" *) (* X_INTERFACE_MODE = "Slave" *) input [15:0]dma0_dsc_crdt_in_crdt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in dir" *) input dma0_dsc_crdt_in_dir;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in fence" *) input dma0_dsc_crdt_in_fence;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in qid" *) input [11:0]dma0_dsc_crdt_in_qid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in rdy" *) output dma0_dsc_crdt_in_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_dsc_crdt_in:1.0 dma0_dsc_crdt_in valid" *) input dma0_dsc_crdt_in_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DMA0_INTRFC_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DMA0_INTRFC_CLK, ASSOCIATED_BUSIF dma0_m_axis_h2c:dma0_s_axis_c2h:dma0_s_axis_c2h_cmpt:dma0_st_rx_msg, ASSOCIATED_RESET dma0_axi_aresetn, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, FREQ_HZ 300000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input dma0_intrfc_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DMA0_INTRFC_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DMA0_INTRFC_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input dma0_intrfc_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c err" *) (* X_INTERFACE_MODE = "Master" *) output dma0_m_axis_h2c_err;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c mdata" *) output [31:0]dma0_m_axis_h2c_mdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c mty" *) output [5:0]dma0_m_axis_h2c_mty;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c port_id" *) output [2:0]dma0_m_axis_h2c_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c qid" *) output [11:0]dma0_m_axis_h2c_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tcrc" *) output [31:0]dma0_m_axis_h2c_tcrc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tdata" *) output [511:0]dma0_m_axis_h2c_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tlast" *) output dma0_m_axis_h2c_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tready" *) input dma0_m_axis_h2c_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c tvalid" *) output dma0_m_axis_h2c_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 dma0_m_axis_h2c zero_byte" *) output dma0_m_axis_h2c_zero_byte;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_dat" *) (* X_INTERFACE_MODE = "Slave" *) output [31:0]dma0_mgmt_cpl_dat;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_rdy" *) input dma0_mgmt_cpl_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_sts" *) output [1:0]dma0_mgmt_cpl_sts;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_vld" *) output dma0_mgmt_cpl_vld;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_adr" *) input [31:0]dma0_mgmt_req_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_cmd" *) input [1:0]dma0_mgmt_req_cmd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_dat" *) input [31:0]dma0_mgmt_req_dat;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_fnc" *) input [12:0]dma0_mgmt_req_fnc;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_msc" *) input [5:0]dma0_mgmt_req_msc;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_rdy" *) output dma0_mgmt_req_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_vld" *) input dma0_mgmt_req_vld;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out data" *) (* X_INTERFACE_MODE = "Master" *) output [63:0]dma0_qsts_out_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out op" *) output [7:0]dma0_qsts_out_op;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out port_id" *) output [2:0]dma0_qsts_out_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out qid" *) output [12:0]dma0_qsts_out_qid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out rdy" *) input dma0_qsts_out_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:eqdma_qsts:1.0 dma0_qsts_out vld" *) output dma0_qsts_out_vld;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt cmpt_type" *) (* X_INTERFACE_MODE = "Slave" *) input [1:0]dma0_s_axis_c2h_cmpt_cmpt_type;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt col_idx" *) input [2:0]dma0_s_axis_c2h_cmpt_col_idx;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt data" *) input [511:0]dma0_s_axis_c2h_cmpt_data;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt dpar" *) input [15:0]dma0_s_axis_c2h_cmpt_dpar;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt err_idx" *) input [2:0]dma0_s_axis_c2h_cmpt_err_idx;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt marker" *) input dma0_s_axis_c2h_cmpt_marker;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt no_wrb_marker" *) input dma0_s_axis_c2h_cmpt_no_wrb_marker;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt port_id" *) input [2:0]dma0_s_axis_c2h_cmpt_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt qid" *) input [12:0]dma0_s_axis_c2h_cmpt_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt size" *) input [1:0]dma0_s_axis_c2h_cmpt_size;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt tready" *) output dma0_s_axis_c2h_cmpt_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt tvalid" *) input dma0_s_axis_c2h_cmpt_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt user_trig" *) input dma0_s_axis_c2h_cmpt_user_trig;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 dma0_s_axis_c2h_cmpt wait_pld_pkt_id" *) input [15:0]dma0_s_axis_c2h_cmpt_wait_pld_pkt_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_has_cmpt" *) (* X_INTERFACE_MODE = "Slave" *) input dma0_s_axis_c2h_ctrl_has_cmpt;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_len" *) input [15:0]dma0_s_axis_c2h_ctrl_len;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_marker" *) input dma0_s_axis_c2h_ctrl_marker;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_port_id" *) input [2:0]dma0_s_axis_c2h_ctrl_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ctrl_qid" *) input [11:0]dma0_s_axis_c2h_ctrl_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h ecc" *) input [6:0]dma0_s_axis_c2h_ecc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h mty" *) input [5:0]dma0_s_axis_c2h_mty;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tcrc" *) input [31:0]dma0_s_axis_c2h_tcrc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tdata" *) input [511:0]dma0_s_axis_c2h_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tlast" *) input dma0_s_axis_c2h_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tready" *) output dma0_s_axis_c2h_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 dma0_s_axis_c2h tvalid" *) input dma0_s_axis_c2h_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TDATA" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dma0_st_rx_msg, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, FREQ_HZ 300000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]dma0_st_rx_msg_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TLAST" *) output dma0_st_rx_msg_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TREADY" *) input dma0_st_rx_msg_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TVALID" *) output dma0_st_rx_msg_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts avl" *) (* X_INTERFACE_MODE = "Master" *) output [15:0]dma0_tm_dsc_sts_avl;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts byp" *) output dma0_tm_dsc_sts_byp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts dir" *) output dma0_tm_dsc_sts_dir;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts error" *) output dma0_tm_dsc_sts_error;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts irq_arm" *) output dma0_tm_dsc_sts_irq_arm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts mm" *) output dma0_tm_dsc_sts_mm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts pidx" *) output [15:0]dma0_tm_dsc_sts_pidx;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts port_id" *) output [2:0]dma0_tm_dsc_sts_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qen" *) output dma0_tm_dsc_sts_qen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qid" *) output [11:0]dma0_tm_dsc_sts_qid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts qinv" *) output dma0_tm_dsc_sts_qinv;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts rdy" *) input dma0_tm_dsc_sts_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_tm_dsc_sts:1.0 dma0_tm_dsc_sts valid" *) output dma0_tm_dsc_sts_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr clear" *) (* X_INTERFACE_MODE = "Slave" *) output dma0_usr_flr_clear;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr done_fnc" *) input [12:0]dma0_usr_flr_done_fnc;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr done_vld" *) input dma0_usr_flr_done_vld;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr fnc" *) output [12:0]dma0_usr_flr_fnc;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_flr:1.0 dma0_usr_flr set" *) output dma0_usr_flr_set;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq ack" *) (* X_INTERFACE_MODE = "Slave" *) output dma0_usr_irq_ack;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq fail" *) output dma0_usr_irq_fail;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq fnc" *) input [12:0]dma0_usr_irq_fnc;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq valid" *) input dma0_usr_irq_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:qdma_usr_irq:1.0 dma0_usr_irq vec" *) input [10:0]dma0_usr_irq_vec;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.FPD_CCI_NOC_AXI0_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.FPD_CCI_NOC_AXI0_CLK, ASSOCIATED_BUSIF FPD_CCI_NOC_0, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi0_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *) output fpd_cci_noc_axi0_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.FPD_CCI_NOC_AXI1_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.FPD_CCI_NOC_AXI1_CLK, ASSOCIATED_BUSIF FPD_CCI_NOC_1, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi1_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *) output fpd_cci_noc_axi1_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.FPD_CCI_NOC_AXI2_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.FPD_CCI_NOC_AXI2_CLK, ASSOCIATED_BUSIF FPD_CCI_NOC_2, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi2_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *) output fpd_cci_noc_axi2_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.FPD_CCI_NOC_AXI3_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.FPD_CCI_NOC_AXI3_CLK, ASSOCIATED_BUSIF FPD_CCI_NOC_3, CLK_DOMAIN bd_af1b_pspmc_0_0_fpd_cci_noc_axi3_clk, FREQ_HZ 824999207, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_CCI_TO_NOC_NMU" *) output fpd_cci_noc_axi3_clk;
  output [93:0]gem0_tsu_timer_cnt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk0, CAN_DEBUG false, FREQ_HZ 100000000" *) input gt_refclk0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_P" *) input gt_refclk0_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.LPD_AXI_NOC_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.LPD_AXI_NOC_CLK, ASSOCIATED_BUSIF LPD_AXI_NOC_0, CLK_DOMAIN bd_af1b_pspmc_0_0_lpd_axi_noc_clk, FREQ_HZ 599999451, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_RPU_TO_NOC_NMU" *) output lpd_axi_noc_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.NOC_PMC_AXI_AXI0_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.NOC_PMC_AXI_AXI0_CLK, ASSOCIATED_BUSIF NOC_PMC_AXI_0, CLK_DOMAIN bd_af1b_pspmc_0_0_noc_pmc_axi_axi0_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NSU" *) output noc_pmc_axi_axi0_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PMC_AXI_NOC_AXI0_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PMC_AXI_NOC_AXI0_CLK, ASSOCIATED_BUSIF PMC_NOC_AXI_0, CLK_DOMAIN bd_af1b_pspmc_0_0_pmc_axi_noc_axi0_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PMC_TO_NOC_NMU" *) output pmc_axi_noc_axi0_clk;

  (* HARD_CONN = "true" *) wire [63:0]CPM_PCIE_NOC_0_araddr;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_0_arburst;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_0_arcache;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_0_arid;
  (* HARD_CONN = "true" *) wire [7:0]CPM_PCIE_NOC_0_arlen;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_arlock;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_0_arprot;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_0_arqos;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_arready;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_0_arsize;
  (* HARD_CONN = "true" *) wire [17:0]CPM_PCIE_NOC_0_aruser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]CPM_PCIE_NOC_0_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_0_awburst;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_0_awcache;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_0_awid;
  (* HARD_CONN = "true" *) wire [7:0]CPM_PCIE_NOC_0_awlen;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_awlock;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_0_awprot;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_0_awqos;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_awready;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_0_awsize;
  (* HARD_CONN = "true" *) wire [17:0]CPM_PCIE_NOC_0_awuser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_0_bid;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_bready;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_0_bresp;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]CPM_PCIE_NOC_0_rdata;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_0_rid;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_rlast;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_rready;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_0_rresp;
  (* HARD_CONN = "true" *) wire [16:0]CPM_PCIE_NOC_0_ruser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]CPM_PCIE_NOC_0_wdata;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_wlast;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_wready;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_0_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]CPM_PCIE_NOC_0_wuser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_0_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]CPM_PCIE_NOC_1_araddr;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_1_arburst;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_1_arcache;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_1_arid;
  (* HARD_CONN = "true" *) wire [7:0]CPM_PCIE_NOC_1_arlen;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_arlock;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_1_arprot;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_1_arqos;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_arready;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_1_arsize;
  (* HARD_CONN = "true" *) wire [17:0]CPM_PCIE_NOC_1_aruser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]CPM_PCIE_NOC_1_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_1_awburst;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_1_awcache;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_1_awid;
  (* HARD_CONN = "true" *) wire [7:0]CPM_PCIE_NOC_1_awlen;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_awlock;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_1_awprot;
  (* HARD_CONN = "true" *) wire [3:0]CPM_PCIE_NOC_1_awqos;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_awready;
  (* HARD_CONN = "true" *) wire [2:0]CPM_PCIE_NOC_1_awsize;
  (* HARD_CONN = "true" *) wire [17:0]CPM_PCIE_NOC_1_awuser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_1_bid;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_bready;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_1_bresp;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]CPM_PCIE_NOC_1_rdata;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_1_rid;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_rlast;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_rready;
  (* HARD_CONN = "true" *) wire [1:0]CPM_PCIE_NOC_1_rresp;
  (* HARD_CONN = "true" *) wire [16:0]CPM_PCIE_NOC_1_ruser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]CPM_PCIE_NOC_1_wdata;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_wlast;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_wready;
  (* HARD_CONN = "true" *) wire [15:0]CPM_PCIE_NOC_1_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]CPM_PCIE_NOC_1_wuser;
  (* HARD_CONN = "true" *) wire CPM_PCIE_NOC_1_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_0_araddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_0_arburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_0_arcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_0_arid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_0_arlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_arlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_0_arprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_0_arqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_arready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_0_arsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_0_aruser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_0_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_0_awburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_0_awcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_0_awid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_0_awlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_awlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_0_awprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_0_awqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_awready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_0_awsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_0_awuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_0_bid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_bready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_0_bresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_0_rdata;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_0_rid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_rlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_rready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_0_rresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_0_wdata;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_wlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_wready;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_0_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]FPD_CCI_NOC_0_wuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_0_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_1_araddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_1_arburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_1_arcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_1_arid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_1_arlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_arlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_1_arprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_1_arqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_arready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_1_arsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_1_aruser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_1_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_1_awburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_1_awcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_1_awid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_1_awlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_awlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_1_awprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_1_awqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_awready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_1_awsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_1_awuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_1_bid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_bready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_1_bresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_1_rdata;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_1_rid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_rlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_rready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_1_rresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_1_wdata;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_wlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_wready;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_1_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]FPD_CCI_NOC_1_wuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_1_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_2_araddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_2_arburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_2_arcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_2_arid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_2_arlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_arlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_2_arprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_2_arqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_arready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_2_arsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_2_aruser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_2_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_2_awburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_2_awcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_2_awid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_2_awlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_awlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_2_awprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_2_awqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_awready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_2_awsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_2_awuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_2_bid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_bready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_2_bresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_2_rdata;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_2_rid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_rlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_rready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_2_rresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_2_wdata;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_wlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_wready;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_2_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]FPD_CCI_NOC_2_wuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_2_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_3_araddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_3_arburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_3_arcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_3_arid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_3_arlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_arlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_3_arprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_3_arqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_arready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_3_arsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_3_aruser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]FPD_CCI_NOC_3_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_3_awburst;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_3_awcache;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_3_awid;
  (* HARD_CONN = "true" *) wire [7:0]FPD_CCI_NOC_3_awlen;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_awlock;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_3_awprot;
  (* HARD_CONN = "true" *) wire [3:0]FPD_CCI_NOC_3_awqos;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_awready;
  (* HARD_CONN = "true" *) wire [2:0]FPD_CCI_NOC_3_awsize;
  (* HARD_CONN = "true" *) wire [17:0]FPD_CCI_NOC_3_awuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_3_bid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_bready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_3_bresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_3_rdata;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_3_rid;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_rlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_rready;
  (* HARD_CONN = "true" *) wire [1:0]FPD_CCI_NOC_3_rresp;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]FPD_CCI_NOC_3_wdata;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_wlast;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_wready;
  (* HARD_CONN = "true" *) wire [15:0]FPD_CCI_NOC_3_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]FPD_CCI_NOC_3_wuser;
  (* HARD_CONN = "true" *) wire FPD_CCI_NOC_3_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]LPD_AXI_NOC_0_araddr;
  (* HARD_CONN = "true" *) wire [1:0]LPD_AXI_NOC_0_arburst;
  (* HARD_CONN = "true" *) wire [3:0]LPD_AXI_NOC_0_arcache;
  (* HARD_CONN = "true" *) wire [15:0]LPD_AXI_NOC_0_arid;
  (* HARD_CONN = "true" *) wire [7:0]LPD_AXI_NOC_0_arlen;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_arlock;
  (* HARD_CONN = "true" *) wire [2:0]LPD_AXI_NOC_0_arprot;
  (* HARD_CONN = "true" *) wire [3:0]LPD_AXI_NOC_0_arqos;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_arready;
  (* HARD_CONN = "true" *) wire [2:0]LPD_AXI_NOC_0_arsize;
  (* HARD_CONN = "true" *) wire [17:0]LPD_AXI_NOC_0_aruser;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]LPD_AXI_NOC_0_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]LPD_AXI_NOC_0_awburst;
  (* HARD_CONN = "true" *) wire [3:0]LPD_AXI_NOC_0_awcache;
  (* HARD_CONN = "true" *) wire [15:0]LPD_AXI_NOC_0_awid;
  (* HARD_CONN = "true" *) wire [7:0]LPD_AXI_NOC_0_awlen;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_awlock;
  (* HARD_CONN = "true" *) wire [2:0]LPD_AXI_NOC_0_awprot;
  (* HARD_CONN = "true" *) wire [3:0]LPD_AXI_NOC_0_awqos;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_awready;
  (* HARD_CONN = "true" *) wire [2:0]LPD_AXI_NOC_0_awsize;
  (* HARD_CONN = "true" *) wire [17:0]LPD_AXI_NOC_0_awuser;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]LPD_AXI_NOC_0_bid;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_bready;
  (* HARD_CONN = "true" *) wire [1:0]LPD_AXI_NOC_0_bresp;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]LPD_AXI_NOC_0_rdata;
  (* HARD_CONN = "true" *) wire [15:0]LPD_AXI_NOC_0_rid;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_rlast;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_rready;
  (* HARD_CONN = "true" *) wire [1:0]LPD_AXI_NOC_0_rresp;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]LPD_AXI_NOC_0_wdata;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_wlast;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_wready;
  (* HARD_CONN = "true" *) wire [15:0]LPD_AXI_NOC_0_wstrb;
  (* HARD_CONN = "true" *) wire LPD_AXI_NOC_0_wvalid;
  (* HARD_CONN = "true" *) wire [63:0]NOC_PMC_AXI_0_araddr;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_arburst;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_arcache;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_arid;
  (* HARD_CONN = "true" *) wire [7:0]NOC_PMC_AXI_0_arlen;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_arlock;
  (* HARD_CONN = "true" *) wire [2:0]NOC_PMC_AXI_0_arprot;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_arqos;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_arready;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_arregion;
  (* HARD_CONN = "true" *) wire [2:0]NOC_PMC_AXI_0_arsize;
  (* HARD_CONN = "true" *) wire [17:0]NOC_PMC_AXI_0_aruser;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]NOC_PMC_AXI_0_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_awburst;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_awcache;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_awid;
  (* HARD_CONN = "true" *) wire [7:0]NOC_PMC_AXI_0_awlen;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_awlock;
  (* HARD_CONN = "true" *) wire [2:0]NOC_PMC_AXI_0_awprot;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_awqos;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_awready;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_awregion;
  (* HARD_CONN = "true" *) wire [2:0]NOC_PMC_AXI_0_awsize;
  (* HARD_CONN = "true" *) wire [17:0]NOC_PMC_AXI_0_awuser;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_awvalid;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_bid;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_bready;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_bresp;
  (* HARD_CONN = "true" *) wire [15:0]NOC_PMC_AXI_0_buser;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]NOC_PMC_AXI_0_rdata;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_rid;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_rlast;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_rready;
  (* HARD_CONN = "true" *) wire [1:0]NOC_PMC_AXI_0_rresp;
  (* HARD_CONN = "true" *) wire [16:0]NOC_PMC_AXI_0_ruser;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]NOC_PMC_AXI_0_wdata;
  (* HARD_CONN = "true" *) wire [3:0]NOC_PMC_AXI_0_wid;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_wlast;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_wready;
  (* HARD_CONN = "true" *) wire [15:0]NOC_PMC_AXI_0_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]NOC_PMC_AXI_0_wuser;
  (* HARD_CONN = "true" *) wire NOC_PMC_AXI_0_wvalid;
  wire [7:0]PCIE0_GT_grx_n;
  wire [7:0]PCIE0_GT_grx_p;
  wire [7:0]PCIE0_GT_gtx_n;
  wire [7:0]PCIE0_GT_gtx_p;
  (* HARD_CONN = "true" *) wire [63:0]PMC_NOC_AXI_0_araddr;
  (* HARD_CONN = "true" *) wire [1:0]PMC_NOC_AXI_0_arburst;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_arcache;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_arid;
  (* HARD_CONN = "true" *) wire [7:0]PMC_NOC_AXI_0_arlen;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_arlock;
  (* HARD_CONN = "true" *) wire [2:0]PMC_NOC_AXI_0_arprot;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_arqos;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_arready;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_arregion;
  (* HARD_CONN = "true" *) wire [2:0]PMC_NOC_AXI_0_arsize;
  (* HARD_CONN = "true" *) wire [17:0]PMC_NOC_AXI_0_aruser;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_arvalid;
  (* HARD_CONN = "true" *) wire [63:0]PMC_NOC_AXI_0_awaddr;
  (* HARD_CONN = "true" *) wire [1:0]PMC_NOC_AXI_0_awburst;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_awcache;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_awid;
  (* HARD_CONN = "true" *) wire [7:0]PMC_NOC_AXI_0_awlen;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_awlock;
  (* HARD_CONN = "true" *) wire [2:0]PMC_NOC_AXI_0_awprot;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_awqos;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_awready;
  (* HARD_CONN = "true" *) wire [3:0]PMC_NOC_AXI_0_awregion;
  (* HARD_CONN = "true" *) wire [2:0]PMC_NOC_AXI_0_awsize;
  (* HARD_CONN = "true" *) wire [17:0]PMC_NOC_AXI_0_awuser;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_awvalid;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_bid;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_bready;
  (* HARD_CONN = "true" *) wire [1:0]PMC_NOC_AXI_0_bresp;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_buser;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_bvalid;
  (* HARD_CONN = "true" *) wire [127:0]PMC_NOC_AXI_0_rdata;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_rid;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_rlast;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_rready;
  (* HARD_CONN = "true" *) wire [1:0]PMC_NOC_AXI_0_rresp;
  (* HARD_CONN = "true" *) wire [16:0]PMC_NOC_AXI_0_ruser;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_rvalid;
  (* HARD_CONN = "true" *) wire [127:0]PMC_NOC_AXI_0_wdata;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_wid;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_wlast;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_wready;
  (* HARD_CONN = "true" *) wire [15:0]PMC_NOC_AXI_0_wstrb;
  (* HARD_CONN = "true" *) wire [16:0]PMC_NOC_AXI_0_wuser;
  (* HARD_CONN = "true" *) wire PMC_NOC_AXI_0_wvalid;
  wire cpm_cor_irq;
  wire cpm_irq0;
  wire cpm_irq1;
  wire cpm_misc_irq;
  (* HARD_CONN = "true" *) wire cpm_pcie_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire cpm_pcie_noc_axi1_clk;
  wire cpm_uncor_irq;
  wire dma0_axi_aresetn;
  wire dma0_axis_c2h_dmawr_cmp;
  wire [2:0]dma0_axis_c2h_dmawr_port_id;
  wire dma0_axis_c2h_dmawr_target_vch;
  wire dma0_axis_c2h_status_drop;
  wire dma0_axis_c2h_status_error;
  wire dma0_axis_c2h_status_last;
  wire [11:0]dma0_axis_c2h_status_qid;
  wire dma0_axis_c2h_status_status_cmp;
  wire dma0_axis_c2h_status_valid;
  wire [15:0]dma0_dsc_crdt_in_crdt;
  wire dma0_dsc_crdt_in_dir;
  wire dma0_dsc_crdt_in_fence;
  wire [11:0]dma0_dsc_crdt_in_qid;
  wire dma0_dsc_crdt_in_rdy;
  wire dma0_dsc_crdt_in_valid;
  wire dma0_intrfc_clk;
  wire dma0_intrfc_resetn;
  wire dma0_m_axis_h2c_err;
  wire [31:0]dma0_m_axis_h2c_mdata;
  wire [5:0]dma0_m_axis_h2c_mty;
  wire [2:0]dma0_m_axis_h2c_port_id;
  wire [11:0]dma0_m_axis_h2c_qid;
  wire [31:0]dma0_m_axis_h2c_tcrc;
  wire [511:0]dma0_m_axis_h2c_tdata;
  wire dma0_m_axis_h2c_tlast;
  wire dma0_m_axis_h2c_tready;
  wire dma0_m_axis_h2c_tvalid;
  wire dma0_m_axis_h2c_zero_byte;
  wire [31:0]dma0_mgmt_cpl_dat;
  wire dma0_mgmt_cpl_rdy;
  wire [1:0]dma0_mgmt_cpl_sts;
  wire dma0_mgmt_cpl_vld;
  wire [31:0]dma0_mgmt_req_adr;
  wire [1:0]dma0_mgmt_req_cmd;
  wire [31:0]dma0_mgmt_req_dat;
  wire [12:0]dma0_mgmt_req_fnc;
  wire [5:0]dma0_mgmt_req_msc;
  wire dma0_mgmt_req_rdy;
  wire dma0_mgmt_req_vld;
  wire [63:0]dma0_qsts_out_data;
  wire [7:0]dma0_qsts_out_op;
  wire [2:0]dma0_qsts_out_port_id;
  wire [12:0]dma0_qsts_out_qid;
  wire dma0_qsts_out_rdy;
  wire dma0_qsts_out_vld;
  wire [1:0]dma0_s_axis_c2h_cmpt_cmpt_type;
  wire [2:0]dma0_s_axis_c2h_cmpt_col_idx;
  wire [511:0]dma0_s_axis_c2h_cmpt_data;
  wire [15:0]dma0_s_axis_c2h_cmpt_dpar;
  wire [2:0]dma0_s_axis_c2h_cmpt_err_idx;
  wire dma0_s_axis_c2h_cmpt_marker;
  wire dma0_s_axis_c2h_cmpt_no_wrb_marker;
  wire [2:0]dma0_s_axis_c2h_cmpt_port_id;
  wire [12:0]dma0_s_axis_c2h_cmpt_qid;
  wire [1:0]dma0_s_axis_c2h_cmpt_size;
  wire dma0_s_axis_c2h_cmpt_tready;
  wire dma0_s_axis_c2h_cmpt_tvalid;
  wire dma0_s_axis_c2h_cmpt_user_trig;
  wire [15:0]dma0_s_axis_c2h_cmpt_wait_pld_pkt_id;
  wire dma0_s_axis_c2h_ctrl_has_cmpt;
  wire [15:0]dma0_s_axis_c2h_ctrl_len;
  wire dma0_s_axis_c2h_ctrl_marker;
  wire [2:0]dma0_s_axis_c2h_ctrl_port_id;
  wire [11:0]dma0_s_axis_c2h_ctrl_qid;
  wire [6:0]dma0_s_axis_c2h_ecc;
  wire [5:0]dma0_s_axis_c2h_mty;
  wire [31:0]dma0_s_axis_c2h_tcrc;
  wire [511:0]dma0_s_axis_c2h_tdata;
  wire dma0_s_axis_c2h_tlast;
  wire dma0_s_axis_c2h_tready;
  wire dma0_s_axis_c2h_tvalid;
  wire [31:0]dma0_st_rx_msg_tdata;
  wire dma0_st_rx_msg_tlast;
  wire dma0_st_rx_msg_tready;
  wire dma0_st_rx_msg_tvalid;
  wire [15:0]dma0_tm_dsc_sts_avl;
  wire dma0_tm_dsc_sts_byp;
  wire dma0_tm_dsc_sts_dir;
  wire dma0_tm_dsc_sts_error;
  wire dma0_tm_dsc_sts_irq_arm;
  wire dma0_tm_dsc_sts_mm;
  wire [15:0]dma0_tm_dsc_sts_pidx;
  wire [2:0]dma0_tm_dsc_sts_port_id;
  wire dma0_tm_dsc_sts_qen;
  wire [11:0]dma0_tm_dsc_sts_qid;
  wire dma0_tm_dsc_sts_qinv;
  wire dma0_tm_dsc_sts_rdy;
  wire dma0_tm_dsc_sts_valid;
  wire dma0_usr_flr_clear;
  wire [12:0]dma0_usr_flr_done_fnc;
  wire dma0_usr_flr_done_vld;
  wire [12:0]dma0_usr_flr_fnc;
  wire dma0_usr_flr_set;
  wire dma0_usr_irq_ack;
  wire dma0_usr_irq_fail;
  wire [12:0]dma0_usr_irq_fnc;
  wire dma0_usr_irq_valid;
  wire [10:0]dma0_usr_irq_vec;
  (* HARD_CONN = "true" *) wire fpd_cci_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire fpd_cci_noc_axi1_clk;
  (* HARD_CONN = "true" *) wire fpd_cci_noc_axi2_clk;
  (* HARD_CONN = "true" *) wire fpd_cci_noc_axi3_clk;
  wire [93:0]gem0_tsu_timer_cnt;
  wire gt_refclk0_clk_n;
  wire gt_refclk0_clk_p;
  (* HARD_CONN = "true" *) wire lpd_axi_noc_clk;
  (* HARD_CONN = "true" *) wire noc_pmc_axi_axi0_clk;
  (* HARD_CONN = "true" *) wire pmc_axi_noc_axi0_clk;
  wire pspmc_0_IF_PS_CPM_cpm_osc_clk_div2;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_apb_en;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_dis_npi_clk;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_fabric_en;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_gate_reg;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_hold_state;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_init_state;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_mem_clr;
  wire [3:0]pspmc_0_IF_PS_CPM_cpm_pcr_o_disable;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_pcomplete;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_pwr_dn;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_scan_clr;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_start_bisr;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_start_cal;
  wire pspmc_0_IF_PS_CPM_cpm_pcr_tristate;
  wire pspmc_0_IF_PS_CPM_cpmps_corr_irq;
  wire pspmc_0_IF_PS_CPM_cpmps_misc_irq;
  wire pspmc_0_IF_PS_CPM_cpmps_uncorr_irq;
  wire pspmc_0_IF_PS_CPM_hsdp_gt_rxoutclk;
  wire pspmc_0_IF_PS_CPM_hsdp_gt_txusrclk;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_gearboxslip;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_headervalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_pcsreset;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_resetdone;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_resetdone;
  wire [6:0]pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_sequence;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_gearboxslip;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_headervalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_pcsreset;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_resetdone;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_resetdone;
  wire [6:0]pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_sequence;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_gearboxslip;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_headervalid;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_pcsreset;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_resetdone;
  wire [1:0]pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_header;
  wire pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_resetdone;
  wire [6:0]pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_sequence;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_bufgtce;
  wire [3:0]pspmc_0_IF_PS_CPM_link0_xpipe_bufgtcemask;
  wire [11:0]pspmc_0_IF_PS_CPM_link0_xpipe_bufgtdiv;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrst;
  wire [3:0]pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrstmask;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_gtoutclk;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_gtpipeclk;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_pcielinkreachtarget;
  wire [5:0]pspmc_0_IF_PS_CPM_link0_xpipe_pcieltssmstate;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_pcieperstn;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_phyesmadaptationsave;
  wire pspmc_0_IF_PS_CPM_link0_xpipe_phyready;
  wire [2:0]pspmc_0_IF_PS_CPM_link0_xpipe_piperate;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_bufgtce;
  wire [3:0]pspmc_0_IF_PS_CPM_link1_xpipe_bufgtcemask;
  wire [11:0]pspmc_0_IF_PS_CPM_link1_xpipe_bufgtdiv;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrst;
  wire [3:0]pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrstmask;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_gtoutclk;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_gtpipeclk;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_pcielinkreachtarget;
  wire [5:0]pspmc_0_IF_PS_CPM_link1_xpipe_pcieltssmstate;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_pcieperstn;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_phyesmadaptationsave;
  wire pspmc_0_IF_PS_CPM_link1_xpipe_phyready;
  wire [2:0]pspmc_0_IF_PS_CPM_link1_xpipe_piperate;
  wire pspmc_0_IF_PS_CPM_lpd_refclk_in;
  wire pspmc_0_IF_PS_CPM_lpd_swclk;
  wire pspmc_0_IF_PS_CPM_lpd_switch_timeout_cnt;
  wire [63:0]pspmc_0_IF_PS_CPM_m_axi0_ps_araddr;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arburst;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arcache;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arid;
  wire [7:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arlen;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_arlock;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arprot;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arqos;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_arready;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arregion;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi0_ps_arsize;
  wire [31:0]pspmc_0_IF_PS_CPM_m_axi0_ps_aruser;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_arvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awaddr;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awburst;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awcache;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awid;
  wire [7:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awlen;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_awlock;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awprot;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awqos;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_awready;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awregion;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awsize;
  wire [31:0]pspmc_0_IF_PS_CPM_m_axi0_ps_awuser;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_awvalid;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_bid;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_bready;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi0_ps_bresp;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_buser;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_bvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_m_axi0_ps_rdata;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_rid;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_rlast;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_rready;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi0_ps_rresp;
  wire [17:0]pspmc_0_IF_PS_CPM_m_axi0_ps_ruser;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_rvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_m_axi0_ps_wdata;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_wid;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_wlast;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_wready;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi0_ps_wstrb;
  wire [17:0]pspmc_0_IF_PS_CPM_m_axi0_ps_wuser;
  wire pspmc_0_IF_PS_CPM_m_axi0_ps_wvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_m_axi1_ps_araddr;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arburst;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arcache;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arid;
  wire [7:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arlen;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_arlock;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arprot;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arqos;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_arready;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arregion;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi1_ps_arsize;
  wire [17:0]pspmc_0_IF_PS_CPM_m_axi1_ps_aruser;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_arvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awaddr;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awburst;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awcache;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awid;
  wire [7:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awlen;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_awlock;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awprot;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awqos;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_awready;
  wire [3:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awregion;
  wire [2:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awsize;
  wire [17:0]pspmc_0_IF_PS_CPM_m_axi1_ps_awuser;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_awvalid;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_bid;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_bready;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi1_ps_bresp;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_buser;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_bvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_m_axi1_ps_rdata;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_rid;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_rlast;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_rready;
  wire [1:0]pspmc_0_IF_PS_CPM_m_axi1_ps_rresp;
  wire [16:0]pspmc_0_IF_PS_CPM_m_axi1_ps_ruser;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_rvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_m_axi1_ps_wdata;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_wid;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_wlast;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_wready;
  wire [15:0]pspmc_0_IF_PS_CPM_m_axi1_ps_wstrb;
  wire [16:0]pspmc_0_IF_PS_CPM_m_axi1_ps_wuser;
  wire pspmc_0_IF_PS_CPM_m_axi1_ps_wvalid;
  wire pspmc_0_IF_PS_CPM_perst0n;
  wire pspmc_0_IF_PS_CPM_perst1n;
  wire pspmc_0_IF_PS_CPM_phy_ready_frbot;
  wire pspmc_0_IF_PS_CPM_phy_ready_tobot;
  wire [63:0]pspmc_0_IF_PS_CPM_s_axi_cfg_araddr;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arburst;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arcache;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arid;
  wire [7:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arlen;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_arlock;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arprot;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arqos;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_arready;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arregion;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_cfg_arsize;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_aruser;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_arvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awaddr;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awburst;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awcache;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awid;
  wire [7:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awlen;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_awlock;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awprot;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awqos;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_awready;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awregion;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awsize;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_awuser;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_awvalid;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_bid;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_bready;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_cfg_bresp;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_buser;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_bvalid;
  wire [31:0]pspmc_0_IF_PS_CPM_s_axi_cfg_rdata;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_rid;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_rlast;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_rready;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_cfg_rresp;
  wire [5:0]pspmc_0_IF_PS_CPM_s_axi_cfg_ruser;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_rvalid;
  wire [31:0]pspmc_0_IF_PS_CPM_s_axi_cfg_wdata;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_cfg_wid;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_wlast;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_wready;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_cfg_wstrb;
  wire [5:0]pspmc_0_IF_PS_CPM_s_axi_cfg_wuser;
  wire pspmc_0_IF_PS_CPM_s_axi_cfg_wvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_s_axi_pcie_araddr;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arburst;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arcache;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arid;
  wire [7:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arlen;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_arlock;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arprot;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arqos;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_arready;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arregion;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_pcie_arsize;
  wire [17:0]pspmc_0_IF_PS_CPM_s_axi_pcie_aruser;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_arvalid;
  wire [63:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awaddr;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awburst;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awcache;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awid;
  wire [7:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awlen;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_awlock;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awprot;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awqos;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_awready;
  wire [3:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awregion;
  wire [2:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awsize;
  wire [17:0]pspmc_0_IF_PS_CPM_s_axi_pcie_awuser;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_awvalid;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_bid;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_bready;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_pcie_bresp;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_buser;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_bvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_s_axi_pcie_rdata;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_rid;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_rlast;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_rready;
  wire [1:0]pspmc_0_IF_PS_CPM_s_axi_pcie_rresp;
  wire [16:0]pspmc_0_IF_PS_CPM_s_axi_pcie_ruser;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_rvalid;
  wire [127:0]pspmc_0_IF_PS_CPM_s_axi_pcie_wdata;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_wid;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_wlast;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_wready;
  wire [15:0]pspmc_0_IF_PS_CPM_s_axi_pcie_wstrb;
  wire [16:0]pspmc_0_IF_PS_CPM_s_axi_pcie_wuser;
  wire pspmc_0_IF_PS_CPM_s_axi_pcie_wvalid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe0_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe0_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe0_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe0_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe0_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe0_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe0_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe0_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe0_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe0_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe0_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe0_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe0_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe0_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe10_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe10_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe10_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe10_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe10_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe10_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe10_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe10_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe10_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe10_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe10_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe10_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe10_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe10_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe10_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe11_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe11_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe11_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe11_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe11_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe11_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe11_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe11_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe11_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe11_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe11_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe11_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe11_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe11_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe11_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe12_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe12_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe12_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe12_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe12_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe12_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe12_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe12_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe12_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe12_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe12_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe12_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe12_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe12_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe12_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe13_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe13_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe13_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe13_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe13_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe13_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe13_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe13_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe13_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe13_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe13_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe13_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe13_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe13_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe13_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe14_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe14_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe14_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe14_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe14_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe14_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe14_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe14_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe14_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe14_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe14_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe14_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe14_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe14_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe14_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe15_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe15_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe15_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe15_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe15_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe15_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe15_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe15_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe15_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe15_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe15_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe15_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe15_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe15_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe15_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe1_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe1_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe1_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe1_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe1_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe1_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe1_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe1_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe1_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe1_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe1_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe1_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe1_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe1_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe1_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe2_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe2_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe2_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe2_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe2_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe2_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe2_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe2_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe2_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe2_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe2_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe2_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe2_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe2_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe2_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe3_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe3_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe3_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe3_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe3_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe3_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe3_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe3_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe3_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe3_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe3_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe3_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe3_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe3_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe3_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe4_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe4_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe4_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe4_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe4_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe4_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe4_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe4_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe4_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe4_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe4_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe4_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe4_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe4_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe4_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe5_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe5_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe5_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe5_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe5_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe5_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe5_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe5_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe5_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe5_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe5_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe5_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe5_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe5_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe5_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe6_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe6_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe6_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe6_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe6_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe6_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe6_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe6_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe6_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe6_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe6_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe6_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe6_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe6_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe6_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe7_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe7_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe7_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe7_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe7_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe7_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe7_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe7_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe7_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe7_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe7_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe7_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe7_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe7_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe7_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe8_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe8_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe8_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe8_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe8_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe8_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe8_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe8_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe8_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe8_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe8_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe8_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe8_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe8_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe8_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe9_phystatus;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe9_powerdown;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe9_rx_charisk;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe9_rx_data;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_elecidle;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_polarity;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_startblock;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe9_rx_status;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe9_rx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_termination;
  wire pspmc_0_IF_PS_CPM_xpipe9_rx_valid;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe9_tx_charisk;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_compliance;
  wire [31:0]pspmc_0_IF_PS_CPM_xpipe9_tx_data;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_datavalid;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_deemph;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_detectrxloopback;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_elecidle;
  wire [6:0]pspmc_0_IF_PS_CPM_xpipe9_tx_maincursor;
  wire [2:0]pspmc_0_IF_PS_CPM_xpipe9_tx_margin;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe9_tx_postcursor;
  wire [4:0]pspmc_0_IF_PS_CPM_xpipe9_tx_precursor;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_startblock;
  wire pspmc_0_IF_PS_CPM_xpipe9_tx_swing;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe9_tx_syncheader;
  wire pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_req;
  wire pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_ack;
  wire [3:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_cmd;
  wire [1:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_lanenum;
  wire [7:0]pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_payload;
  wire pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_req;

  bd_af1b_cpm_0_0 cpm_0
       (.cpm_cor_irq(cpm_cor_irq),
        .cpm_irq0(cpm_irq0),
        .cpm_irq1(cpm_irq1),
        .cpm_misc_irq(cpm_misc_irq),
        .cpm_osc_clk_div2(pspmc_0_IF_PS_CPM_cpm_osc_clk_div2),
        .cpm_pcr_apb_en(pspmc_0_IF_PS_CPM_cpm_pcr_apb_en),
        .cpm_pcr_dis_npi_clk(pspmc_0_IF_PS_CPM_cpm_pcr_dis_npi_clk),
        .cpm_pcr_fabric_en(pspmc_0_IF_PS_CPM_cpm_pcr_fabric_en),
        .cpm_pcr_gate_reg(pspmc_0_IF_PS_CPM_cpm_pcr_gate_reg),
        .cpm_pcr_hold_state(pspmc_0_IF_PS_CPM_cpm_pcr_hold_state),
        .cpm_pcr_init_state(pspmc_0_IF_PS_CPM_cpm_pcr_init_state),
        .cpm_pcr_mem_clr(pspmc_0_IF_PS_CPM_cpm_pcr_mem_clr),
        .cpm_pcr_o_disable(pspmc_0_IF_PS_CPM_cpm_pcr_o_disable),
        .cpm_pcr_pcomplete(pspmc_0_IF_PS_CPM_cpm_pcr_pcomplete),
        .cpm_pcr_pwr_dn(pspmc_0_IF_PS_CPM_cpm_pcr_pwr_dn),
        .cpm_pcr_scan_clr(pspmc_0_IF_PS_CPM_cpm_pcr_scan_clr),
        .cpm_pcr_start_bisr(pspmc_0_IF_PS_CPM_cpm_pcr_start_bisr),
        .cpm_pcr_start_cal(pspmc_0_IF_PS_CPM_cpm_pcr_start_cal),
        .cpm_pcr_tristate(pspmc_0_IF_PS_CPM_cpm_pcr_tristate),
        .cpm_uncor_irq(cpm_uncor_irq),
        .cpmps_corr_irq(pspmc_0_IF_PS_CPM_cpmps_corr_irq),
        .cpmps_misc_irq(pspmc_0_IF_PS_CPM_cpmps_misc_irq),
        .cpmps_uncorr_irq(pspmc_0_IF_PS_CPM_cpmps_uncorr_irq),
        .dma0_axi_aresetn(dma0_axi_aresetn),
        .dma0_axis_c2h_dmawr_cmp(dma0_axis_c2h_dmawr_cmp),
        .dma0_axis_c2h_dmawr_port_id(dma0_axis_c2h_dmawr_port_id),
        .dma0_axis_c2h_dmawr_target_vch(dma0_axis_c2h_dmawr_target_vch),
        .dma0_axis_c2h_status_cmp(dma0_axis_c2h_status_status_cmp),
        .dma0_axis_c2h_status_drop(dma0_axis_c2h_status_drop),
        .dma0_axis_c2h_status_error(dma0_axis_c2h_status_error),
        .dma0_axis_c2h_status_last(dma0_axis_c2h_status_last),
        .dma0_axis_c2h_status_qid(dma0_axis_c2h_status_qid),
        .dma0_axis_c2h_status_valid(dma0_axis_c2h_status_valid),
        .dma0_dsc_crdt_in_crdt(dma0_dsc_crdt_in_crdt),
        .dma0_dsc_crdt_in_dir(dma0_dsc_crdt_in_dir),
        .dma0_dsc_crdt_in_fence(dma0_dsc_crdt_in_fence),
        .dma0_dsc_crdt_in_qid(dma0_dsc_crdt_in_qid),
        .dma0_dsc_crdt_in_rdy(dma0_dsc_crdt_in_rdy),
        .dma0_dsc_crdt_in_vld(dma0_dsc_crdt_in_valid),
        .dma0_intrfc_clk(dma0_intrfc_clk),
        .dma0_intrfc_resetn(dma0_intrfc_resetn),
        .dma0_m_axis_h2c_tcrc(dma0_m_axis_h2c_tcrc),
        .dma0_m_axis_h2c_tdata(dma0_m_axis_h2c_tdata),
        .dma0_m_axis_h2c_tlast(dma0_m_axis_h2c_tlast),
        .dma0_m_axis_h2c_tready(dma0_m_axis_h2c_tready),
        .dma0_m_axis_h2c_tuser_err(dma0_m_axis_h2c_err),
        .dma0_m_axis_h2c_tuser_mdata(dma0_m_axis_h2c_mdata),
        .dma0_m_axis_h2c_tuser_mty(dma0_m_axis_h2c_mty),
        .dma0_m_axis_h2c_tuser_port_id(dma0_m_axis_h2c_port_id),
        .dma0_m_axis_h2c_tuser_qid(dma0_m_axis_h2c_qid),
        .dma0_m_axis_h2c_tuser_zero_byte(dma0_m_axis_h2c_zero_byte),
        .dma0_m_axis_h2c_tvalid(dma0_m_axis_h2c_tvalid),
        .dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat),
        .dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy),
        .dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts),
        .dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld),
        .dma0_mgmt_req_adr(dma0_mgmt_req_adr),
        .dma0_mgmt_req_cmd(dma0_mgmt_req_cmd),
        .dma0_mgmt_req_dat(dma0_mgmt_req_dat),
        .dma0_mgmt_req_fnc(dma0_mgmt_req_fnc),
        .dma0_mgmt_req_msc(dma0_mgmt_req_msc),
        .dma0_mgmt_req_rdy(dma0_mgmt_req_rdy),
        .dma0_mgmt_req_vld(dma0_mgmt_req_vld),
        .dma0_qsts_out_data(dma0_qsts_out_data),
        .dma0_qsts_out_op(dma0_qsts_out_op),
        .dma0_qsts_out_port_id(dma0_qsts_out_port_id),
        .dma0_qsts_out_qid(dma0_qsts_out_qid),
        .dma0_qsts_sts_out_rdy(dma0_qsts_out_rdy),
        .dma0_qsts_sts_out_vld(dma0_qsts_out_vld),
        .dma0_s_axis_c2h_cmpt_ctrl_cmpt_type(dma0_s_axis_c2h_cmpt_cmpt_type),
        .dma0_s_axis_c2h_cmpt_ctrl_col_idx(dma0_s_axis_c2h_cmpt_col_idx),
        .dma0_s_axis_c2h_cmpt_ctrl_err_idx(dma0_s_axis_c2h_cmpt_err_idx),
        .dma0_s_axis_c2h_cmpt_ctrl_marker(dma0_s_axis_c2h_cmpt_marker),
        .dma0_s_axis_c2h_cmpt_ctrl_no_wrb_marker(dma0_s_axis_c2h_cmpt_no_wrb_marker),
        .dma0_s_axis_c2h_cmpt_ctrl_port_id(dma0_s_axis_c2h_cmpt_port_id),
        .dma0_s_axis_c2h_cmpt_ctrl_qid(dma0_s_axis_c2h_cmpt_qid),
        .dma0_s_axis_c2h_cmpt_ctrl_user_trig(dma0_s_axis_c2h_cmpt_user_trig),
        .dma0_s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id(dma0_s_axis_c2h_cmpt_wait_pld_pkt_id),
        .dma0_s_axis_c2h_cmpt_dpar(dma0_s_axis_c2h_cmpt_dpar),
        .dma0_s_axis_c2h_cmpt_size(dma0_s_axis_c2h_cmpt_size),
        .dma0_s_axis_c2h_cmpt_tdata(dma0_s_axis_c2h_cmpt_data),
        .dma0_s_axis_c2h_cmpt_tready(dma0_s_axis_c2h_cmpt_tready),
        .dma0_s_axis_c2h_cmpt_tvalid(dma0_s_axis_c2h_cmpt_tvalid),
        .dma0_s_axis_c2h_ctrl_ecc(dma0_s_axis_c2h_ecc),
        .dma0_s_axis_c2h_ctrl_has_cmpt(dma0_s_axis_c2h_ctrl_has_cmpt),
        .dma0_s_axis_c2h_ctrl_len(dma0_s_axis_c2h_ctrl_len),
        .dma0_s_axis_c2h_ctrl_marker(dma0_s_axis_c2h_ctrl_marker),
        .dma0_s_axis_c2h_ctrl_port_id(dma0_s_axis_c2h_ctrl_port_id),
        .dma0_s_axis_c2h_ctrl_qid(dma0_s_axis_c2h_ctrl_qid),
        .dma0_s_axis_c2h_mty(dma0_s_axis_c2h_mty),
        .dma0_s_axis_c2h_tcrc(dma0_s_axis_c2h_tcrc),
        .dma0_s_axis_c2h_tdata(dma0_s_axis_c2h_tdata),
        .dma0_s_axis_c2h_tlast(dma0_s_axis_c2h_tlast),
        .dma0_s_axis_c2h_tready(dma0_s_axis_c2h_tready),
        .dma0_s_axis_c2h_tvalid(dma0_s_axis_c2h_tvalid),
        .dma0_st_rx_msg_data(dma0_st_rx_msg_tdata),
        .dma0_st_rx_msg_last(dma0_st_rx_msg_tlast),
        .dma0_st_rx_msg_rdy(dma0_st_rx_msg_tready),
        .dma0_st_rx_msg_valid(dma0_st_rx_msg_tvalid),
        .dma0_tm_dsc_sts_avl(dma0_tm_dsc_sts_avl),
        .dma0_tm_dsc_sts_byp(dma0_tm_dsc_sts_byp),
        .dma0_tm_dsc_sts_dir(dma0_tm_dsc_sts_dir),
        .dma0_tm_dsc_sts_err(dma0_tm_dsc_sts_error),
        .dma0_tm_dsc_sts_irq_arm(dma0_tm_dsc_sts_irq_arm),
        .dma0_tm_dsc_sts_mm(dma0_tm_dsc_sts_mm),
        .dma0_tm_dsc_sts_pidx(dma0_tm_dsc_sts_pidx),
        .dma0_tm_dsc_sts_port_id(dma0_tm_dsc_sts_port_id),
        .dma0_tm_dsc_sts_qen(dma0_tm_dsc_sts_qen),
        .dma0_tm_dsc_sts_qid(dma0_tm_dsc_sts_qid),
        .dma0_tm_dsc_sts_qinv(dma0_tm_dsc_sts_qinv),
        .dma0_tm_dsc_sts_rdy(dma0_tm_dsc_sts_rdy),
        .dma0_tm_dsc_sts_vld(dma0_tm_dsc_sts_valid),
        .dma0_usr_flr_clr(dma0_usr_flr_clear),
        .dma0_usr_flr_done_fnc(dma0_usr_flr_done_fnc),
        .dma0_usr_flr_done_vld(dma0_usr_flr_done_vld),
        .dma0_usr_flr_fnc(dma0_usr_flr_fnc),
        .dma0_usr_flr_set(dma0_usr_flr_set),
        .dma0_usr_irq_ack(dma0_usr_irq_ack),
        .dma0_usr_irq_fail(dma0_usr_irq_fail),
        .dma0_usr_irq_fnc(dma0_usr_irq_fnc),
        .dma0_usr_irq_vec(dma0_usr_irq_vec),
        .dma0_usr_irq_vld(dma0_usr_irq_valid),
        .gt_refclk0_n(gt_refclk0_clk_n),
        .gt_refclk0_p(gt_refclk0_clk_p),
        .hsdp_gt_rxoutclk(pspmc_0_IF_PS_CPM_hsdp_gt_rxoutclk),
        .hsdp_gt_txusrclk(pspmc_0_IF_PS_CPM_hsdp_gt_txusrclk),
        .hsdp_xpipe0_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_datavalid),
        .hsdp_xpipe0_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_gearboxslip),
        .hsdp_xpipe0_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_header),
        .hsdp_xpipe0_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_headervalid),
        .hsdp_xpipe0_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_pcsreset),
        .hsdp_xpipe0_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_resetdone),
        .hsdp_xpipe0_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_header),
        .hsdp_xpipe0_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_resetdone),
        .hsdp_xpipe0_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_sequence),
        .hsdp_xpipe1_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_datavalid),
        .hsdp_xpipe1_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_gearboxslip),
        .hsdp_xpipe1_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_header),
        .hsdp_xpipe1_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_headervalid),
        .hsdp_xpipe1_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_pcsreset),
        .hsdp_xpipe1_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_resetdone),
        .hsdp_xpipe1_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_header),
        .hsdp_xpipe1_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_resetdone),
        .hsdp_xpipe1_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_sequence),
        .hsdp_xpipe2_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_datavalid),
        .hsdp_xpipe2_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_gearboxslip),
        .hsdp_xpipe2_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_header),
        .hsdp_xpipe2_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_headervalid),
        .hsdp_xpipe2_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_pcsreset),
        .hsdp_xpipe2_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_resetdone),
        .hsdp_xpipe2_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_header),
        .hsdp_xpipe2_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_resetdone),
        .hsdp_xpipe2_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_sequence),
        .link0_xpipe_bufgtce(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtce),
        .link0_xpipe_bufgtcemask(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtcemask),
        .link0_xpipe_bufgtdiv(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtdiv),
        .link0_xpipe_bufgtrst(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrst),
        .link0_xpipe_bufgtrstmask(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrstmask),
        .link0_xpipe_gtoutclk(pspmc_0_IF_PS_CPM_link0_xpipe_gtoutclk),
        .link0_xpipe_gtpipeclk(pspmc_0_IF_PS_CPM_link0_xpipe_gtpipeclk),
        .link0_xpipe_pcielinkreachtarget(pspmc_0_IF_PS_CPM_link0_xpipe_pcielinkreachtarget),
        .link0_xpipe_pcieltssmstate(pspmc_0_IF_PS_CPM_link0_xpipe_pcieltssmstate),
        .link0_xpipe_pcieperstn(pspmc_0_IF_PS_CPM_link0_xpipe_pcieperstn),
        .link0_xpipe_phyesmadaptationsave(pspmc_0_IF_PS_CPM_link0_xpipe_phyesmadaptationsave),
        .link0_xpipe_phyready(pspmc_0_IF_PS_CPM_link0_xpipe_phyready),
        .link0_xpipe_piperate(pspmc_0_IF_PS_CPM_link0_xpipe_piperate),
        .link1_xpipe_bufgtce(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtce),
        .link1_xpipe_bufgtcemask(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtcemask),
        .link1_xpipe_bufgtdiv(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtdiv),
        .link1_xpipe_bufgtrst(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrst),
        .link1_xpipe_bufgtrstmask(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrstmask),
        .link1_xpipe_gtoutclk(pspmc_0_IF_PS_CPM_link1_xpipe_gtoutclk),
        .link1_xpipe_gtpipeclk(pspmc_0_IF_PS_CPM_link1_xpipe_gtpipeclk),
        .link1_xpipe_pcielinkreachtarget(pspmc_0_IF_PS_CPM_link1_xpipe_pcielinkreachtarget),
        .link1_xpipe_pcieltssmstate(pspmc_0_IF_PS_CPM_link1_xpipe_pcieltssmstate),
        .link1_xpipe_pcieperstn(pspmc_0_IF_PS_CPM_link1_xpipe_pcieperstn),
        .link1_xpipe_phyesmadaptationsave(pspmc_0_IF_PS_CPM_link1_xpipe_phyesmadaptationsave),
        .link1_xpipe_phyready(pspmc_0_IF_PS_CPM_link1_xpipe_phyready),
        .link1_xpipe_piperate(pspmc_0_IF_PS_CPM_link1_xpipe_piperate),
        .lpd_refclk_in(pspmc_0_IF_PS_CPM_lpd_refclk_in),
        .lpd_swclk(pspmc_0_IF_PS_CPM_lpd_swclk),
        .lpd_switch_timeout_cnt(pspmc_0_IF_PS_CPM_lpd_switch_timeout_cnt),
        .m_axi0_ps_araddr(pspmc_0_IF_PS_CPM_m_axi0_ps_araddr),
        .m_axi0_ps_arburst(pspmc_0_IF_PS_CPM_m_axi0_ps_arburst),
        .m_axi0_ps_arcache(pspmc_0_IF_PS_CPM_m_axi0_ps_arcache),
        .m_axi0_ps_arid(pspmc_0_IF_PS_CPM_m_axi0_ps_arid),
        .m_axi0_ps_arlen(pspmc_0_IF_PS_CPM_m_axi0_ps_arlen),
        .m_axi0_ps_arlock(pspmc_0_IF_PS_CPM_m_axi0_ps_arlock),
        .m_axi0_ps_arprot(pspmc_0_IF_PS_CPM_m_axi0_ps_arprot),
        .m_axi0_ps_arqos(pspmc_0_IF_PS_CPM_m_axi0_ps_arqos),
        .m_axi0_ps_arready(pspmc_0_IF_PS_CPM_m_axi0_ps_arready),
        .m_axi0_ps_arregion(pspmc_0_IF_PS_CPM_m_axi0_ps_arregion),
        .m_axi0_ps_arsize(pspmc_0_IF_PS_CPM_m_axi0_ps_arsize),
        .m_axi0_ps_aruser(pspmc_0_IF_PS_CPM_m_axi0_ps_aruser),
        .m_axi0_ps_arvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_arvalid),
        .m_axi0_ps_awaddr(pspmc_0_IF_PS_CPM_m_axi0_ps_awaddr),
        .m_axi0_ps_awburst(pspmc_0_IF_PS_CPM_m_axi0_ps_awburst),
        .m_axi0_ps_awcache(pspmc_0_IF_PS_CPM_m_axi0_ps_awcache),
        .m_axi0_ps_awid(pspmc_0_IF_PS_CPM_m_axi0_ps_awid),
        .m_axi0_ps_awlen(pspmc_0_IF_PS_CPM_m_axi0_ps_awlen),
        .m_axi0_ps_awlock(pspmc_0_IF_PS_CPM_m_axi0_ps_awlock),
        .m_axi0_ps_awprot(pspmc_0_IF_PS_CPM_m_axi0_ps_awprot),
        .m_axi0_ps_awqos(pspmc_0_IF_PS_CPM_m_axi0_ps_awqos),
        .m_axi0_ps_awready(pspmc_0_IF_PS_CPM_m_axi0_ps_awready),
        .m_axi0_ps_awregion(pspmc_0_IF_PS_CPM_m_axi0_ps_awregion),
        .m_axi0_ps_awsize(pspmc_0_IF_PS_CPM_m_axi0_ps_awsize),
        .m_axi0_ps_awuser(pspmc_0_IF_PS_CPM_m_axi0_ps_awuser),
        .m_axi0_ps_awvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_awvalid),
        .m_axi0_ps_bid(pspmc_0_IF_PS_CPM_m_axi0_ps_bid),
        .m_axi0_ps_bready(pspmc_0_IF_PS_CPM_m_axi0_ps_bready),
        .m_axi0_ps_bresp(pspmc_0_IF_PS_CPM_m_axi0_ps_bresp),
        .m_axi0_ps_buser(pspmc_0_IF_PS_CPM_m_axi0_ps_buser),
        .m_axi0_ps_bvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_bvalid),
        .m_axi0_ps_rdata(pspmc_0_IF_PS_CPM_m_axi0_ps_rdata),
        .m_axi0_ps_rid(pspmc_0_IF_PS_CPM_m_axi0_ps_rid),
        .m_axi0_ps_rlast(pspmc_0_IF_PS_CPM_m_axi0_ps_rlast),
        .m_axi0_ps_rready(pspmc_0_IF_PS_CPM_m_axi0_ps_rready),
        .m_axi0_ps_rresp(pspmc_0_IF_PS_CPM_m_axi0_ps_rresp),
        .m_axi0_ps_ruser(pspmc_0_IF_PS_CPM_m_axi0_ps_ruser),
        .m_axi0_ps_rvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_rvalid),
        .m_axi0_ps_wdata(pspmc_0_IF_PS_CPM_m_axi0_ps_wdata),
        .m_axi0_ps_wid(pspmc_0_IF_PS_CPM_m_axi0_ps_wid),
        .m_axi0_ps_wlast(pspmc_0_IF_PS_CPM_m_axi0_ps_wlast),
        .m_axi0_ps_wready(pspmc_0_IF_PS_CPM_m_axi0_ps_wready),
        .m_axi0_ps_wstrb(pspmc_0_IF_PS_CPM_m_axi0_ps_wstrb),
        .m_axi0_ps_wuser(pspmc_0_IF_PS_CPM_m_axi0_ps_wuser),
        .m_axi0_ps_wvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_wvalid),
        .m_axi1_ps_araddr(pspmc_0_IF_PS_CPM_m_axi1_ps_araddr),
        .m_axi1_ps_arburst(pspmc_0_IF_PS_CPM_m_axi1_ps_arburst),
        .m_axi1_ps_arcache(pspmc_0_IF_PS_CPM_m_axi1_ps_arcache),
        .m_axi1_ps_arid(pspmc_0_IF_PS_CPM_m_axi1_ps_arid),
        .m_axi1_ps_arlen(pspmc_0_IF_PS_CPM_m_axi1_ps_arlen),
        .m_axi1_ps_arlock(pspmc_0_IF_PS_CPM_m_axi1_ps_arlock),
        .m_axi1_ps_arprot(pspmc_0_IF_PS_CPM_m_axi1_ps_arprot),
        .m_axi1_ps_arqos(pspmc_0_IF_PS_CPM_m_axi1_ps_arqos),
        .m_axi1_ps_arready(pspmc_0_IF_PS_CPM_m_axi1_ps_arready),
        .m_axi1_ps_arregion(pspmc_0_IF_PS_CPM_m_axi1_ps_arregion),
        .m_axi1_ps_arsize(pspmc_0_IF_PS_CPM_m_axi1_ps_arsize),
        .m_axi1_ps_aruser(pspmc_0_IF_PS_CPM_m_axi1_ps_aruser),
        .m_axi1_ps_arvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_arvalid),
        .m_axi1_ps_awaddr(pspmc_0_IF_PS_CPM_m_axi1_ps_awaddr),
        .m_axi1_ps_awburst(pspmc_0_IF_PS_CPM_m_axi1_ps_awburst),
        .m_axi1_ps_awcache(pspmc_0_IF_PS_CPM_m_axi1_ps_awcache),
        .m_axi1_ps_awid(pspmc_0_IF_PS_CPM_m_axi1_ps_awid),
        .m_axi1_ps_awlen(pspmc_0_IF_PS_CPM_m_axi1_ps_awlen),
        .m_axi1_ps_awlock(pspmc_0_IF_PS_CPM_m_axi1_ps_awlock),
        .m_axi1_ps_awprot(pspmc_0_IF_PS_CPM_m_axi1_ps_awprot),
        .m_axi1_ps_awqos(pspmc_0_IF_PS_CPM_m_axi1_ps_awqos),
        .m_axi1_ps_awready(pspmc_0_IF_PS_CPM_m_axi1_ps_awready),
        .m_axi1_ps_awregion(pspmc_0_IF_PS_CPM_m_axi1_ps_awregion),
        .m_axi1_ps_awsize(pspmc_0_IF_PS_CPM_m_axi1_ps_awsize),
        .m_axi1_ps_awuser(pspmc_0_IF_PS_CPM_m_axi1_ps_awuser),
        .m_axi1_ps_awvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_awvalid),
        .m_axi1_ps_bid(pspmc_0_IF_PS_CPM_m_axi1_ps_bid),
        .m_axi1_ps_bready(pspmc_0_IF_PS_CPM_m_axi1_ps_bready),
        .m_axi1_ps_bresp(pspmc_0_IF_PS_CPM_m_axi1_ps_bresp),
        .m_axi1_ps_buser(pspmc_0_IF_PS_CPM_m_axi1_ps_buser),
        .m_axi1_ps_bvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_bvalid),
        .m_axi1_ps_rdata(pspmc_0_IF_PS_CPM_m_axi1_ps_rdata),
        .m_axi1_ps_rid(pspmc_0_IF_PS_CPM_m_axi1_ps_rid),
        .m_axi1_ps_rlast(pspmc_0_IF_PS_CPM_m_axi1_ps_rlast),
        .m_axi1_ps_rready(pspmc_0_IF_PS_CPM_m_axi1_ps_rready),
        .m_axi1_ps_rresp(pspmc_0_IF_PS_CPM_m_axi1_ps_rresp),
        .m_axi1_ps_ruser(pspmc_0_IF_PS_CPM_m_axi1_ps_ruser),
        .m_axi1_ps_rvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_rvalid),
        .m_axi1_ps_wdata(pspmc_0_IF_PS_CPM_m_axi1_ps_wdata),
        .m_axi1_ps_wid(pspmc_0_IF_PS_CPM_m_axi1_ps_wid),
        .m_axi1_ps_wlast(pspmc_0_IF_PS_CPM_m_axi1_ps_wlast),
        .m_axi1_ps_wready(pspmc_0_IF_PS_CPM_m_axi1_ps_wready),
        .m_axi1_ps_wstrb(pspmc_0_IF_PS_CPM_m_axi1_ps_wstrb),
        .m_axi1_ps_wuser(pspmc_0_IF_PS_CPM_m_axi1_ps_wuser),
        .m_axi1_ps_wvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_wvalid),
        .pcie0_gt_rxn(PCIE0_GT_grx_n),
        .pcie0_gt_rxp(PCIE0_GT_grx_p),
        .pcie0_gt_txn(PCIE0_GT_gtx_n),
        .pcie0_gt_txp(PCIE0_GT_gtx_p),
        .perst0n(pspmc_0_IF_PS_CPM_perst0n),
        .perst1n(pspmc_0_IF_PS_CPM_perst1n),
        .phy_ready_frbot(pspmc_0_IF_PS_CPM_phy_ready_frbot),
        .phy_ready_tobot(pspmc_0_IF_PS_CPM_phy_ready_tobot),
        .s_axi_cfg_araddr(pspmc_0_IF_PS_CPM_s_axi_cfg_araddr),
        .s_axi_cfg_arburst(pspmc_0_IF_PS_CPM_s_axi_cfg_arburst),
        .s_axi_cfg_arcache(pspmc_0_IF_PS_CPM_s_axi_cfg_arcache),
        .s_axi_cfg_arid(pspmc_0_IF_PS_CPM_s_axi_cfg_arid),
        .s_axi_cfg_arlen(pspmc_0_IF_PS_CPM_s_axi_cfg_arlen),
        .s_axi_cfg_arlock(pspmc_0_IF_PS_CPM_s_axi_cfg_arlock),
        .s_axi_cfg_arprot(pspmc_0_IF_PS_CPM_s_axi_cfg_arprot),
        .s_axi_cfg_arqos(pspmc_0_IF_PS_CPM_s_axi_cfg_arqos),
        .s_axi_cfg_arready(pspmc_0_IF_PS_CPM_s_axi_cfg_arready),
        .s_axi_cfg_arregion(pspmc_0_IF_PS_CPM_s_axi_cfg_arregion),
        .s_axi_cfg_arsize(pspmc_0_IF_PS_CPM_s_axi_cfg_arsize),
        .s_axi_cfg_aruser(pspmc_0_IF_PS_CPM_s_axi_cfg_aruser),
        .s_axi_cfg_arvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_arvalid),
        .s_axi_cfg_awaddr(pspmc_0_IF_PS_CPM_s_axi_cfg_awaddr),
        .s_axi_cfg_awburst(pspmc_0_IF_PS_CPM_s_axi_cfg_awburst),
        .s_axi_cfg_awcache(pspmc_0_IF_PS_CPM_s_axi_cfg_awcache),
        .s_axi_cfg_awid(pspmc_0_IF_PS_CPM_s_axi_cfg_awid),
        .s_axi_cfg_awlen(pspmc_0_IF_PS_CPM_s_axi_cfg_awlen),
        .s_axi_cfg_awlock(pspmc_0_IF_PS_CPM_s_axi_cfg_awlock),
        .s_axi_cfg_awprot(pspmc_0_IF_PS_CPM_s_axi_cfg_awprot),
        .s_axi_cfg_awqos(pspmc_0_IF_PS_CPM_s_axi_cfg_awqos),
        .s_axi_cfg_awready(pspmc_0_IF_PS_CPM_s_axi_cfg_awready),
        .s_axi_cfg_awregion(pspmc_0_IF_PS_CPM_s_axi_cfg_awregion),
        .s_axi_cfg_awsize(pspmc_0_IF_PS_CPM_s_axi_cfg_awsize),
        .s_axi_cfg_awuser(pspmc_0_IF_PS_CPM_s_axi_cfg_awuser),
        .s_axi_cfg_awvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_awvalid),
        .s_axi_cfg_bid(pspmc_0_IF_PS_CPM_s_axi_cfg_bid),
        .s_axi_cfg_bready(pspmc_0_IF_PS_CPM_s_axi_cfg_bready),
        .s_axi_cfg_bresp(pspmc_0_IF_PS_CPM_s_axi_cfg_bresp),
        .s_axi_cfg_buser(pspmc_0_IF_PS_CPM_s_axi_cfg_buser),
        .s_axi_cfg_bvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_bvalid),
        .s_axi_cfg_rdata(pspmc_0_IF_PS_CPM_s_axi_cfg_rdata),
        .s_axi_cfg_rid(pspmc_0_IF_PS_CPM_s_axi_cfg_rid),
        .s_axi_cfg_rlast(pspmc_0_IF_PS_CPM_s_axi_cfg_rlast),
        .s_axi_cfg_rready(pspmc_0_IF_PS_CPM_s_axi_cfg_rready),
        .s_axi_cfg_rresp(pspmc_0_IF_PS_CPM_s_axi_cfg_rresp),
        .s_axi_cfg_ruser(pspmc_0_IF_PS_CPM_s_axi_cfg_ruser),
        .s_axi_cfg_rvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_rvalid),
        .s_axi_cfg_wdata(pspmc_0_IF_PS_CPM_s_axi_cfg_wdata),
        .s_axi_cfg_wid(pspmc_0_IF_PS_CPM_s_axi_cfg_wid),
        .s_axi_cfg_wlast(pspmc_0_IF_PS_CPM_s_axi_cfg_wlast),
        .s_axi_cfg_wready(pspmc_0_IF_PS_CPM_s_axi_cfg_wready),
        .s_axi_cfg_wstrb(pspmc_0_IF_PS_CPM_s_axi_cfg_wstrb),
        .s_axi_cfg_wuser(pspmc_0_IF_PS_CPM_s_axi_cfg_wuser),
        .s_axi_cfg_wvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_wvalid),
        .s_axi_pcie_araddr(pspmc_0_IF_PS_CPM_s_axi_pcie_araddr),
        .s_axi_pcie_arburst(pspmc_0_IF_PS_CPM_s_axi_pcie_arburst),
        .s_axi_pcie_arcache(pspmc_0_IF_PS_CPM_s_axi_pcie_arcache),
        .s_axi_pcie_arid(pspmc_0_IF_PS_CPM_s_axi_pcie_arid),
        .s_axi_pcie_arlen(pspmc_0_IF_PS_CPM_s_axi_pcie_arlen),
        .s_axi_pcie_arlock(pspmc_0_IF_PS_CPM_s_axi_pcie_arlock),
        .s_axi_pcie_arprot(pspmc_0_IF_PS_CPM_s_axi_pcie_arprot),
        .s_axi_pcie_arqos(pspmc_0_IF_PS_CPM_s_axi_pcie_arqos),
        .s_axi_pcie_arready(pspmc_0_IF_PS_CPM_s_axi_pcie_arready),
        .s_axi_pcie_arregion(pspmc_0_IF_PS_CPM_s_axi_pcie_arregion),
        .s_axi_pcie_arsize(pspmc_0_IF_PS_CPM_s_axi_pcie_arsize),
        .s_axi_pcie_aruser(pspmc_0_IF_PS_CPM_s_axi_pcie_aruser),
        .s_axi_pcie_arvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_arvalid),
        .s_axi_pcie_awaddr(pspmc_0_IF_PS_CPM_s_axi_pcie_awaddr),
        .s_axi_pcie_awburst(pspmc_0_IF_PS_CPM_s_axi_pcie_awburst),
        .s_axi_pcie_awcache(pspmc_0_IF_PS_CPM_s_axi_pcie_awcache),
        .s_axi_pcie_awid(pspmc_0_IF_PS_CPM_s_axi_pcie_awid),
        .s_axi_pcie_awlen(pspmc_0_IF_PS_CPM_s_axi_pcie_awlen),
        .s_axi_pcie_awlock(pspmc_0_IF_PS_CPM_s_axi_pcie_awlock),
        .s_axi_pcie_awprot(pspmc_0_IF_PS_CPM_s_axi_pcie_awprot),
        .s_axi_pcie_awqos(pspmc_0_IF_PS_CPM_s_axi_pcie_awqos),
        .s_axi_pcie_awready(pspmc_0_IF_PS_CPM_s_axi_pcie_awready),
        .s_axi_pcie_awregion(pspmc_0_IF_PS_CPM_s_axi_pcie_awregion),
        .s_axi_pcie_awsize(pspmc_0_IF_PS_CPM_s_axi_pcie_awsize),
        .s_axi_pcie_awuser(pspmc_0_IF_PS_CPM_s_axi_pcie_awuser),
        .s_axi_pcie_awvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_awvalid),
        .s_axi_pcie_bid(pspmc_0_IF_PS_CPM_s_axi_pcie_bid),
        .s_axi_pcie_bready(pspmc_0_IF_PS_CPM_s_axi_pcie_bready),
        .s_axi_pcie_bresp(pspmc_0_IF_PS_CPM_s_axi_pcie_bresp),
        .s_axi_pcie_buser(pspmc_0_IF_PS_CPM_s_axi_pcie_buser),
        .s_axi_pcie_bvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_bvalid),
        .s_axi_pcie_rdata(pspmc_0_IF_PS_CPM_s_axi_pcie_rdata),
        .s_axi_pcie_rid(pspmc_0_IF_PS_CPM_s_axi_pcie_rid),
        .s_axi_pcie_rlast(pspmc_0_IF_PS_CPM_s_axi_pcie_rlast),
        .s_axi_pcie_rready(pspmc_0_IF_PS_CPM_s_axi_pcie_rready),
        .s_axi_pcie_rresp(pspmc_0_IF_PS_CPM_s_axi_pcie_rresp),
        .s_axi_pcie_ruser(pspmc_0_IF_PS_CPM_s_axi_pcie_ruser),
        .s_axi_pcie_rvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_rvalid),
        .s_axi_pcie_wdata(pspmc_0_IF_PS_CPM_s_axi_pcie_wdata),
        .s_axi_pcie_wid(pspmc_0_IF_PS_CPM_s_axi_pcie_wid),
        .s_axi_pcie_wlast(pspmc_0_IF_PS_CPM_s_axi_pcie_wlast),
        .s_axi_pcie_wready(pspmc_0_IF_PS_CPM_s_axi_pcie_wready),
        .s_axi_pcie_wstrb(pspmc_0_IF_PS_CPM_s_axi_pcie_wstrb),
        .s_axi_pcie_wuser(pspmc_0_IF_PS_CPM_s_axi_pcie_wuser),
        .s_axi_pcie_wvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_wvalid),
        .xpipe0_powerdown(pspmc_0_IF_PS_CPM_xpipe0_powerdown),
        .xpipe0_rx_charisk(pspmc_0_IF_PS_CPM_xpipe0_rx_charisk),
        .xpipe0_rx_data(pspmc_0_IF_PS_CPM_xpipe0_rx_data),
        .xpipe0_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe0_rx_datavalid),
        .xpipe0_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe0_rx_elecidle),
        .xpipe0_rx_polarity(pspmc_0_IF_PS_CPM_xpipe0_rx_polarity),
        .xpipe0_rx_startblock(pspmc_0_IF_PS_CPM_xpipe0_rx_startblock),
        .xpipe0_rx_status(pspmc_0_IF_PS_CPM_xpipe0_rx_status),
        .xpipe0_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe0_rx_syncheader),
        .xpipe0_rx_termination(pspmc_0_IF_PS_CPM_xpipe0_rx_termination),
        .xpipe0_rx_valid(pspmc_0_IF_PS_CPM_xpipe0_rx_valid),
        .xpipe0_tx_charisk(pspmc_0_IF_PS_CPM_xpipe0_tx_charisk),
        .xpipe0_tx_compliance(pspmc_0_IF_PS_CPM_xpipe0_tx_compliance),
        .xpipe0_tx_data(pspmc_0_IF_PS_CPM_xpipe0_tx_data),
        .xpipe0_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe0_tx_datavalid),
        .xpipe0_tx_deemph(pspmc_0_IF_PS_CPM_xpipe0_tx_deemph),
        .xpipe0_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe0_tx_detectrxloopback),
        .xpipe0_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe0_tx_elecidle),
        .xpipe0_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe0_tx_maincursor),
        .xpipe0_tx_margin(pspmc_0_IF_PS_CPM_xpipe0_tx_margin),
        .xpipe0_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe0_tx_postcursor),
        .xpipe0_tx_precursor(pspmc_0_IF_PS_CPM_xpipe0_tx_precursor),
        .xpipe0_tx_startblock(pspmc_0_IF_PS_CPM_xpipe0_tx_startblock),
        .xpipe0_tx_swing(pspmc_0_IF_PS_CPM_xpipe0_tx_swing),
        .xpipe0_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe0_tx_syncheader),
        .xpipe10_phystatus(pspmc_0_IF_PS_CPM_xpipe10_phystatus),
        .xpipe10_powerdown(pspmc_0_IF_PS_CPM_xpipe10_powerdown),
        .xpipe10_rx_charisk(pspmc_0_IF_PS_CPM_xpipe10_rx_charisk),
        .xpipe10_rx_data(pspmc_0_IF_PS_CPM_xpipe10_rx_data),
        .xpipe10_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe10_rx_datavalid),
        .xpipe10_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe10_rx_elecidle),
        .xpipe10_rx_polarity(pspmc_0_IF_PS_CPM_xpipe10_rx_polarity),
        .xpipe10_rx_startblock(pspmc_0_IF_PS_CPM_xpipe10_rx_startblock),
        .xpipe10_rx_status(pspmc_0_IF_PS_CPM_xpipe10_rx_status),
        .xpipe10_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe10_rx_syncheader),
        .xpipe10_rx_termination(pspmc_0_IF_PS_CPM_xpipe10_rx_termination),
        .xpipe10_rx_valid(pspmc_0_IF_PS_CPM_xpipe10_rx_valid),
        .xpipe10_tx_charisk(pspmc_0_IF_PS_CPM_xpipe10_tx_charisk),
        .xpipe10_tx_compliance(pspmc_0_IF_PS_CPM_xpipe10_tx_compliance),
        .xpipe10_tx_data(pspmc_0_IF_PS_CPM_xpipe10_tx_data),
        .xpipe10_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe10_tx_datavalid),
        .xpipe10_tx_deemph(pspmc_0_IF_PS_CPM_xpipe10_tx_deemph),
        .xpipe10_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe10_tx_detectrxloopback),
        .xpipe10_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe10_tx_elecidle),
        .xpipe10_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe10_tx_maincursor),
        .xpipe10_tx_margin(pspmc_0_IF_PS_CPM_xpipe10_tx_margin),
        .xpipe10_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe10_tx_postcursor),
        .xpipe10_tx_precursor(pspmc_0_IF_PS_CPM_xpipe10_tx_precursor),
        .xpipe10_tx_startblock(pspmc_0_IF_PS_CPM_xpipe10_tx_startblock),
        .xpipe10_tx_swing(pspmc_0_IF_PS_CPM_xpipe10_tx_swing),
        .xpipe10_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe10_tx_syncheader),
        .xpipe11_phystatus(pspmc_0_IF_PS_CPM_xpipe11_phystatus),
        .xpipe11_powerdown(pspmc_0_IF_PS_CPM_xpipe11_powerdown),
        .xpipe11_rx_charisk(pspmc_0_IF_PS_CPM_xpipe11_rx_charisk),
        .xpipe11_rx_data(pspmc_0_IF_PS_CPM_xpipe11_rx_data),
        .xpipe11_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe11_rx_datavalid),
        .xpipe11_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe11_rx_elecidle),
        .xpipe11_rx_polarity(pspmc_0_IF_PS_CPM_xpipe11_rx_polarity),
        .xpipe11_rx_startblock(pspmc_0_IF_PS_CPM_xpipe11_rx_startblock),
        .xpipe11_rx_status(pspmc_0_IF_PS_CPM_xpipe11_rx_status),
        .xpipe11_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe11_rx_syncheader),
        .xpipe11_rx_termination(pspmc_0_IF_PS_CPM_xpipe11_rx_termination),
        .xpipe11_rx_valid(pspmc_0_IF_PS_CPM_xpipe11_rx_valid),
        .xpipe11_tx_charisk(pspmc_0_IF_PS_CPM_xpipe11_tx_charisk),
        .xpipe11_tx_compliance(pspmc_0_IF_PS_CPM_xpipe11_tx_compliance),
        .xpipe11_tx_data(pspmc_0_IF_PS_CPM_xpipe11_tx_data),
        .xpipe11_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe11_tx_datavalid),
        .xpipe11_tx_deemph(pspmc_0_IF_PS_CPM_xpipe11_tx_deemph),
        .xpipe11_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe11_tx_detectrxloopback),
        .xpipe11_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe11_tx_elecidle),
        .xpipe11_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe11_tx_maincursor),
        .xpipe11_tx_margin(pspmc_0_IF_PS_CPM_xpipe11_tx_margin),
        .xpipe11_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe11_tx_postcursor),
        .xpipe11_tx_precursor(pspmc_0_IF_PS_CPM_xpipe11_tx_precursor),
        .xpipe11_tx_startblock(pspmc_0_IF_PS_CPM_xpipe11_tx_startblock),
        .xpipe11_tx_swing(pspmc_0_IF_PS_CPM_xpipe11_tx_swing),
        .xpipe11_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe11_tx_syncheader),
        .xpipe12_phystatus(pspmc_0_IF_PS_CPM_xpipe12_phystatus),
        .xpipe12_powerdown(pspmc_0_IF_PS_CPM_xpipe12_powerdown),
        .xpipe12_rx_charisk(pspmc_0_IF_PS_CPM_xpipe12_rx_charisk),
        .xpipe12_rx_data(pspmc_0_IF_PS_CPM_xpipe12_rx_data),
        .xpipe12_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe12_rx_datavalid),
        .xpipe12_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe12_rx_elecidle),
        .xpipe12_rx_polarity(pspmc_0_IF_PS_CPM_xpipe12_rx_polarity),
        .xpipe12_rx_startblock(pspmc_0_IF_PS_CPM_xpipe12_rx_startblock),
        .xpipe12_rx_status(pspmc_0_IF_PS_CPM_xpipe12_rx_status),
        .xpipe12_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe12_rx_syncheader),
        .xpipe12_rx_termination(pspmc_0_IF_PS_CPM_xpipe12_rx_termination),
        .xpipe12_rx_valid(pspmc_0_IF_PS_CPM_xpipe12_rx_valid),
        .xpipe12_tx_charisk(pspmc_0_IF_PS_CPM_xpipe12_tx_charisk),
        .xpipe12_tx_compliance(pspmc_0_IF_PS_CPM_xpipe12_tx_compliance),
        .xpipe12_tx_data(pspmc_0_IF_PS_CPM_xpipe12_tx_data),
        .xpipe12_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe12_tx_datavalid),
        .xpipe12_tx_deemph(pspmc_0_IF_PS_CPM_xpipe12_tx_deemph),
        .xpipe12_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe12_tx_detectrxloopback),
        .xpipe12_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe12_tx_elecidle),
        .xpipe12_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe12_tx_maincursor),
        .xpipe12_tx_margin(pspmc_0_IF_PS_CPM_xpipe12_tx_margin),
        .xpipe12_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe12_tx_postcursor),
        .xpipe12_tx_precursor(pspmc_0_IF_PS_CPM_xpipe12_tx_precursor),
        .xpipe12_tx_startblock(pspmc_0_IF_PS_CPM_xpipe12_tx_startblock),
        .xpipe12_tx_swing(pspmc_0_IF_PS_CPM_xpipe12_tx_swing),
        .xpipe12_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe12_tx_syncheader),
        .xpipe13_phystatus(pspmc_0_IF_PS_CPM_xpipe13_phystatus),
        .xpipe13_powerdown(pspmc_0_IF_PS_CPM_xpipe13_powerdown),
        .xpipe13_rx_charisk(pspmc_0_IF_PS_CPM_xpipe13_rx_charisk),
        .xpipe13_rx_data(pspmc_0_IF_PS_CPM_xpipe13_rx_data),
        .xpipe13_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe13_rx_datavalid),
        .xpipe13_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe13_rx_elecidle),
        .xpipe13_rx_polarity(pspmc_0_IF_PS_CPM_xpipe13_rx_polarity),
        .xpipe13_rx_startblock(pspmc_0_IF_PS_CPM_xpipe13_rx_startblock),
        .xpipe13_rx_status(pspmc_0_IF_PS_CPM_xpipe13_rx_status),
        .xpipe13_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe13_rx_syncheader),
        .xpipe13_rx_termination(pspmc_0_IF_PS_CPM_xpipe13_rx_termination),
        .xpipe13_rx_valid(pspmc_0_IF_PS_CPM_xpipe13_rx_valid),
        .xpipe13_tx_charisk(pspmc_0_IF_PS_CPM_xpipe13_tx_charisk),
        .xpipe13_tx_compliance(pspmc_0_IF_PS_CPM_xpipe13_tx_compliance),
        .xpipe13_tx_data(pspmc_0_IF_PS_CPM_xpipe13_tx_data),
        .xpipe13_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe13_tx_datavalid),
        .xpipe13_tx_deemph(pspmc_0_IF_PS_CPM_xpipe13_tx_deemph),
        .xpipe13_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe13_tx_detectrxloopback),
        .xpipe13_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe13_tx_elecidle),
        .xpipe13_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe13_tx_maincursor),
        .xpipe13_tx_margin(pspmc_0_IF_PS_CPM_xpipe13_tx_margin),
        .xpipe13_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe13_tx_postcursor),
        .xpipe13_tx_precursor(pspmc_0_IF_PS_CPM_xpipe13_tx_precursor),
        .xpipe13_tx_startblock(pspmc_0_IF_PS_CPM_xpipe13_tx_startblock),
        .xpipe13_tx_swing(pspmc_0_IF_PS_CPM_xpipe13_tx_swing),
        .xpipe13_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe13_tx_syncheader),
        .xpipe14_phystatus(pspmc_0_IF_PS_CPM_xpipe14_phystatus),
        .xpipe14_powerdown(pspmc_0_IF_PS_CPM_xpipe14_powerdown),
        .xpipe14_rx_charisk(pspmc_0_IF_PS_CPM_xpipe14_rx_charisk),
        .xpipe14_rx_data(pspmc_0_IF_PS_CPM_xpipe14_rx_data),
        .xpipe14_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe14_rx_datavalid),
        .xpipe14_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe14_rx_elecidle),
        .xpipe14_rx_polarity(pspmc_0_IF_PS_CPM_xpipe14_rx_polarity),
        .xpipe14_rx_startblock(pspmc_0_IF_PS_CPM_xpipe14_rx_startblock),
        .xpipe14_rx_status(pspmc_0_IF_PS_CPM_xpipe14_rx_status),
        .xpipe14_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe14_rx_syncheader),
        .xpipe14_rx_termination(pspmc_0_IF_PS_CPM_xpipe14_rx_termination),
        .xpipe14_rx_valid(pspmc_0_IF_PS_CPM_xpipe14_rx_valid),
        .xpipe14_tx_charisk(pspmc_0_IF_PS_CPM_xpipe14_tx_charisk),
        .xpipe14_tx_compliance(pspmc_0_IF_PS_CPM_xpipe14_tx_compliance),
        .xpipe14_tx_data(pspmc_0_IF_PS_CPM_xpipe14_tx_data),
        .xpipe14_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe14_tx_datavalid),
        .xpipe14_tx_deemph(pspmc_0_IF_PS_CPM_xpipe14_tx_deemph),
        .xpipe14_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe14_tx_detectrxloopback),
        .xpipe14_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe14_tx_elecidle),
        .xpipe14_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe14_tx_maincursor),
        .xpipe14_tx_margin(pspmc_0_IF_PS_CPM_xpipe14_tx_margin),
        .xpipe14_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe14_tx_postcursor),
        .xpipe14_tx_precursor(pspmc_0_IF_PS_CPM_xpipe14_tx_precursor),
        .xpipe14_tx_startblock(pspmc_0_IF_PS_CPM_xpipe14_tx_startblock),
        .xpipe14_tx_swing(pspmc_0_IF_PS_CPM_xpipe14_tx_swing),
        .xpipe14_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe14_tx_syncheader),
        .xpipe15_phystatus(pspmc_0_IF_PS_CPM_xpipe15_phystatus),
        .xpipe15_powerdown(pspmc_0_IF_PS_CPM_xpipe15_powerdown),
        .xpipe15_rx_charisk(pspmc_0_IF_PS_CPM_xpipe15_rx_charisk),
        .xpipe15_rx_data(pspmc_0_IF_PS_CPM_xpipe15_rx_data),
        .xpipe15_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe15_rx_datavalid),
        .xpipe15_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe15_rx_elecidle),
        .xpipe15_rx_polarity(pspmc_0_IF_PS_CPM_xpipe15_rx_polarity),
        .xpipe15_rx_startblock(pspmc_0_IF_PS_CPM_xpipe15_rx_startblock),
        .xpipe15_rx_status(pspmc_0_IF_PS_CPM_xpipe15_rx_status),
        .xpipe15_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe15_rx_syncheader),
        .xpipe15_rx_termination(pspmc_0_IF_PS_CPM_xpipe15_rx_termination),
        .xpipe15_rx_valid(pspmc_0_IF_PS_CPM_xpipe15_rx_valid),
        .xpipe15_tx_charisk(pspmc_0_IF_PS_CPM_xpipe15_tx_charisk),
        .xpipe15_tx_compliance(pspmc_0_IF_PS_CPM_xpipe15_tx_compliance),
        .xpipe15_tx_data(pspmc_0_IF_PS_CPM_xpipe15_tx_data),
        .xpipe15_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe15_tx_datavalid),
        .xpipe15_tx_deemph(pspmc_0_IF_PS_CPM_xpipe15_tx_deemph),
        .xpipe15_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe15_tx_detectrxloopback),
        .xpipe15_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe15_tx_elecidle),
        .xpipe15_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe15_tx_maincursor),
        .xpipe15_tx_margin(pspmc_0_IF_PS_CPM_xpipe15_tx_margin),
        .xpipe15_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe15_tx_postcursor),
        .xpipe15_tx_precursor(pspmc_0_IF_PS_CPM_xpipe15_tx_precursor),
        .xpipe15_tx_startblock(pspmc_0_IF_PS_CPM_xpipe15_tx_startblock),
        .xpipe15_tx_swing(pspmc_0_IF_PS_CPM_xpipe15_tx_swing),
        .xpipe15_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe15_tx_syncheader),
        .xpipe1_phystatus(pspmc_0_IF_PS_CPM_xpipe1_phystatus),
        .xpipe1_powerdown(pspmc_0_IF_PS_CPM_xpipe1_powerdown),
        .xpipe1_rx_charisk(pspmc_0_IF_PS_CPM_xpipe1_rx_charisk),
        .xpipe1_rx_data(pspmc_0_IF_PS_CPM_xpipe1_rx_data),
        .xpipe1_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe1_rx_datavalid),
        .xpipe1_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe1_rx_elecidle),
        .xpipe1_rx_polarity(pspmc_0_IF_PS_CPM_xpipe1_rx_polarity),
        .xpipe1_rx_startblock(pspmc_0_IF_PS_CPM_xpipe1_rx_startblock),
        .xpipe1_rx_status(pspmc_0_IF_PS_CPM_xpipe1_rx_status),
        .xpipe1_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe1_rx_syncheader),
        .xpipe1_rx_termination(pspmc_0_IF_PS_CPM_xpipe1_rx_termination),
        .xpipe1_rx_valid(pspmc_0_IF_PS_CPM_xpipe1_rx_valid),
        .xpipe1_tx_charisk(pspmc_0_IF_PS_CPM_xpipe1_tx_charisk),
        .xpipe1_tx_compliance(pspmc_0_IF_PS_CPM_xpipe1_tx_compliance),
        .xpipe1_tx_data(pspmc_0_IF_PS_CPM_xpipe1_tx_data),
        .xpipe1_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe1_tx_datavalid),
        .xpipe1_tx_deemph(pspmc_0_IF_PS_CPM_xpipe1_tx_deemph),
        .xpipe1_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe1_tx_detectrxloopback),
        .xpipe1_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe1_tx_elecidle),
        .xpipe1_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe1_tx_maincursor),
        .xpipe1_tx_margin(pspmc_0_IF_PS_CPM_xpipe1_tx_margin),
        .xpipe1_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe1_tx_postcursor),
        .xpipe1_tx_precursor(pspmc_0_IF_PS_CPM_xpipe1_tx_precursor),
        .xpipe1_tx_startblock(pspmc_0_IF_PS_CPM_xpipe1_tx_startblock),
        .xpipe1_tx_swing(pspmc_0_IF_PS_CPM_xpipe1_tx_swing),
        .xpipe1_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe1_tx_syncheader),
        .xpipe2_phystatus(pspmc_0_IF_PS_CPM_xpipe2_phystatus),
        .xpipe2_powerdown(pspmc_0_IF_PS_CPM_xpipe2_powerdown),
        .xpipe2_rx_charisk(pspmc_0_IF_PS_CPM_xpipe2_rx_charisk),
        .xpipe2_rx_data(pspmc_0_IF_PS_CPM_xpipe2_rx_data),
        .xpipe2_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe2_rx_datavalid),
        .xpipe2_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe2_rx_elecidle),
        .xpipe2_rx_polarity(pspmc_0_IF_PS_CPM_xpipe2_rx_polarity),
        .xpipe2_rx_startblock(pspmc_0_IF_PS_CPM_xpipe2_rx_startblock),
        .xpipe2_rx_status(pspmc_0_IF_PS_CPM_xpipe2_rx_status),
        .xpipe2_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe2_rx_syncheader),
        .xpipe2_rx_termination(pspmc_0_IF_PS_CPM_xpipe2_rx_termination),
        .xpipe2_rx_valid(pspmc_0_IF_PS_CPM_xpipe2_rx_valid),
        .xpipe2_tx_charisk(pspmc_0_IF_PS_CPM_xpipe2_tx_charisk),
        .xpipe2_tx_compliance(pspmc_0_IF_PS_CPM_xpipe2_tx_compliance),
        .xpipe2_tx_data(pspmc_0_IF_PS_CPM_xpipe2_tx_data),
        .xpipe2_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe2_tx_datavalid),
        .xpipe2_tx_deemph(pspmc_0_IF_PS_CPM_xpipe2_tx_deemph),
        .xpipe2_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe2_tx_detectrxloopback),
        .xpipe2_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe2_tx_elecidle),
        .xpipe2_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe2_tx_maincursor),
        .xpipe2_tx_margin(pspmc_0_IF_PS_CPM_xpipe2_tx_margin),
        .xpipe2_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe2_tx_postcursor),
        .xpipe2_tx_precursor(pspmc_0_IF_PS_CPM_xpipe2_tx_precursor),
        .xpipe2_tx_startblock(pspmc_0_IF_PS_CPM_xpipe2_tx_startblock),
        .xpipe2_tx_swing(pspmc_0_IF_PS_CPM_xpipe2_tx_swing),
        .xpipe2_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe2_tx_syncheader),
        .xpipe3_phystatus(pspmc_0_IF_PS_CPM_xpipe3_phystatus),
        .xpipe3_powerdown(pspmc_0_IF_PS_CPM_xpipe3_powerdown),
        .xpipe3_rx_charisk(pspmc_0_IF_PS_CPM_xpipe3_rx_charisk),
        .xpipe3_rx_data(pspmc_0_IF_PS_CPM_xpipe3_rx_data),
        .xpipe3_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe3_rx_datavalid),
        .xpipe3_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe3_rx_elecidle),
        .xpipe3_rx_polarity(pspmc_0_IF_PS_CPM_xpipe3_rx_polarity),
        .xpipe3_rx_startblock(pspmc_0_IF_PS_CPM_xpipe3_rx_startblock),
        .xpipe3_rx_status(pspmc_0_IF_PS_CPM_xpipe3_rx_status),
        .xpipe3_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe3_rx_syncheader),
        .xpipe3_rx_termination(pspmc_0_IF_PS_CPM_xpipe3_rx_termination),
        .xpipe3_rx_valid(pspmc_0_IF_PS_CPM_xpipe3_rx_valid),
        .xpipe3_tx_charisk(pspmc_0_IF_PS_CPM_xpipe3_tx_charisk),
        .xpipe3_tx_compliance(pspmc_0_IF_PS_CPM_xpipe3_tx_compliance),
        .xpipe3_tx_data(pspmc_0_IF_PS_CPM_xpipe3_tx_data),
        .xpipe3_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe3_tx_datavalid),
        .xpipe3_tx_deemph(pspmc_0_IF_PS_CPM_xpipe3_tx_deemph),
        .xpipe3_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe3_tx_detectrxloopback),
        .xpipe3_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe3_tx_elecidle),
        .xpipe3_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe3_tx_maincursor),
        .xpipe3_tx_margin(pspmc_0_IF_PS_CPM_xpipe3_tx_margin),
        .xpipe3_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe3_tx_postcursor),
        .xpipe3_tx_precursor(pspmc_0_IF_PS_CPM_xpipe3_tx_precursor),
        .xpipe3_tx_startblock(pspmc_0_IF_PS_CPM_xpipe3_tx_startblock),
        .xpipe3_tx_swing(pspmc_0_IF_PS_CPM_xpipe3_tx_swing),
        .xpipe3_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe3_tx_syncheader),
        .xpipe4_phystatus(pspmc_0_IF_PS_CPM_xpipe4_phystatus),
        .xpipe4_powerdown(pspmc_0_IF_PS_CPM_xpipe4_powerdown),
        .xpipe4_rx_charisk(pspmc_0_IF_PS_CPM_xpipe4_rx_charisk),
        .xpipe4_rx_data(pspmc_0_IF_PS_CPM_xpipe4_rx_data),
        .xpipe4_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe4_rx_datavalid),
        .xpipe4_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe4_rx_elecidle),
        .xpipe4_rx_polarity(pspmc_0_IF_PS_CPM_xpipe4_rx_polarity),
        .xpipe4_rx_startblock(pspmc_0_IF_PS_CPM_xpipe4_rx_startblock),
        .xpipe4_rx_status(pspmc_0_IF_PS_CPM_xpipe4_rx_status),
        .xpipe4_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe4_rx_syncheader),
        .xpipe4_rx_termination(pspmc_0_IF_PS_CPM_xpipe4_rx_termination),
        .xpipe4_rx_valid(pspmc_0_IF_PS_CPM_xpipe4_rx_valid),
        .xpipe4_tx_charisk(pspmc_0_IF_PS_CPM_xpipe4_tx_charisk),
        .xpipe4_tx_compliance(pspmc_0_IF_PS_CPM_xpipe4_tx_compliance),
        .xpipe4_tx_data(pspmc_0_IF_PS_CPM_xpipe4_tx_data),
        .xpipe4_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe4_tx_datavalid),
        .xpipe4_tx_deemph(pspmc_0_IF_PS_CPM_xpipe4_tx_deemph),
        .xpipe4_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe4_tx_detectrxloopback),
        .xpipe4_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe4_tx_elecidle),
        .xpipe4_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe4_tx_maincursor),
        .xpipe4_tx_margin(pspmc_0_IF_PS_CPM_xpipe4_tx_margin),
        .xpipe4_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe4_tx_postcursor),
        .xpipe4_tx_precursor(pspmc_0_IF_PS_CPM_xpipe4_tx_precursor),
        .xpipe4_tx_startblock(pspmc_0_IF_PS_CPM_xpipe4_tx_startblock),
        .xpipe4_tx_swing(pspmc_0_IF_PS_CPM_xpipe4_tx_swing),
        .xpipe4_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe4_tx_syncheader),
        .xpipe5_phystatus(pspmc_0_IF_PS_CPM_xpipe5_phystatus),
        .xpipe5_powerdown(pspmc_0_IF_PS_CPM_xpipe5_powerdown),
        .xpipe5_rx_charisk(pspmc_0_IF_PS_CPM_xpipe5_rx_charisk),
        .xpipe5_rx_data(pspmc_0_IF_PS_CPM_xpipe5_rx_data),
        .xpipe5_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe5_rx_datavalid),
        .xpipe5_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe5_rx_elecidle),
        .xpipe5_rx_polarity(pspmc_0_IF_PS_CPM_xpipe5_rx_polarity),
        .xpipe5_rx_startblock(pspmc_0_IF_PS_CPM_xpipe5_rx_startblock),
        .xpipe5_rx_status(pspmc_0_IF_PS_CPM_xpipe5_rx_status),
        .xpipe5_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe5_rx_syncheader),
        .xpipe5_rx_termination(pspmc_0_IF_PS_CPM_xpipe5_rx_termination),
        .xpipe5_rx_valid(pspmc_0_IF_PS_CPM_xpipe5_rx_valid),
        .xpipe5_tx_charisk(pspmc_0_IF_PS_CPM_xpipe5_tx_charisk),
        .xpipe5_tx_compliance(pspmc_0_IF_PS_CPM_xpipe5_tx_compliance),
        .xpipe5_tx_data(pspmc_0_IF_PS_CPM_xpipe5_tx_data),
        .xpipe5_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe5_tx_datavalid),
        .xpipe5_tx_deemph(pspmc_0_IF_PS_CPM_xpipe5_tx_deemph),
        .xpipe5_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe5_tx_detectrxloopback),
        .xpipe5_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe5_tx_elecidle),
        .xpipe5_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe5_tx_maincursor),
        .xpipe5_tx_margin(pspmc_0_IF_PS_CPM_xpipe5_tx_margin),
        .xpipe5_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe5_tx_postcursor),
        .xpipe5_tx_precursor(pspmc_0_IF_PS_CPM_xpipe5_tx_precursor),
        .xpipe5_tx_startblock(pspmc_0_IF_PS_CPM_xpipe5_tx_startblock),
        .xpipe5_tx_swing(pspmc_0_IF_PS_CPM_xpipe5_tx_swing),
        .xpipe5_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe5_tx_syncheader),
        .xpipe6_phystatus(pspmc_0_IF_PS_CPM_xpipe6_phystatus),
        .xpipe6_powerdown(pspmc_0_IF_PS_CPM_xpipe6_powerdown),
        .xpipe6_rx_charisk(pspmc_0_IF_PS_CPM_xpipe6_rx_charisk),
        .xpipe6_rx_data(pspmc_0_IF_PS_CPM_xpipe6_rx_data),
        .xpipe6_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe6_rx_datavalid),
        .xpipe6_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe6_rx_elecidle),
        .xpipe6_rx_polarity(pspmc_0_IF_PS_CPM_xpipe6_rx_polarity),
        .xpipe6_rx_startblock(pspmc_0_IF_PS_CPM_xpipe6_rx_startblock),
        .xpipe6_rx_status(pspmc_0_IF_PS_CPM_xpipe6_rx_status),
        .xpipe6_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe6_rx_syncheader),
        .xpipe6_rx_termination(pspmc_0_IF_PS_CPM_xpipe6_rx_termination),
        .xpipe6_rx_valid(pspmc_0_IF_PS_CPM_xpipe6_rx_valid),
        .xpipe6_tx_charisk(pspmc_0_IF_PS_CPM_xpipe6_tx_charisk),
        .xpipe6_tx_compliance(pspmc_0_IF_PS_CPM_xpipe6_tx_compliance),
        .xpipe6_tx_data(pspmc_0_IF_PS_CPM_xpipe6_tx_data),
        .xpipe6_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe6_tx_datavalid),
        .xpipe6_tx_deemph(pspmc_0_IF_PS_CPM_xpipe6_tx_deemph),
        .xpipe6_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe6_tx_detectrxloopback),
        .xpipe6_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe6_tx_elecidle),
        .xpipe6_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe6_tx_maincursor),
        .xpipe6_tx_margin(pspmc_0_IF_PS_CPM_xpipe6_tx_margin),
        .xpipe6_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe6_tx_postcursor),
        .xpipe6_tx_precursor(pspmc_0_IF_PS_CPM_xpipe6_tx_precursor),
        .xpipe6_tx_startblock(pspmc_0_IF_PS_CPM_xpipe6_tx_startblock),
        .xpipe6_tx_swing(pspmc_0_IF_PS_CPM_xpipe6_tx_swing),
        .xpipe6_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe6_tx_syncheader),
        .xpipe7_phystatus(pspmc_0_IF_PS_CPM_xpipe7_phystatus),
        .xpipe7_powerdown(pspmc_0_IF_PS_CPM_xpipe7_powerdown),
        .xpipe7_rx_charisk(pspmc_0_IF_PS_CPM_xpipe7_rx_charisk),
        .xpipe7_rx_data(pspmc_0_IF_PS_CPM_xpipe7_rx_data),
        .xpipe7_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe7_rx_datavalid),
        .xpipe7_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe7_rx_elecidle),
        .xpipe7_rx_polarity(pspmc_0_IF_PS_CPM_xpipe7_rx_polarity),
        .xpipe7_rx_startblock(pspmc_0_IF_PS_CPM_xpipe7_rx_startblock),
        .xpipe7_rx_status(pspmc_0_IF_PS_CPM_xpipe7_rx_status),
        .xpipe7_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe7_rx_syncheader),
        .xpipe7_rx_termination(pspmc_0_IF_PS_CPM_xpipe7_rx_termination),
        .xpipe7_rx_valid(pspmc_0_IF_PS_CPM_xpipe7_rx_valid),
        .xpipe7_tx_charisk(pspmc_0_IF_PS_CPM_xpipe7_tx_charisk),
        .xpipe7_tx_compliance(pspmc_0_IF_PS_CPM_xpipe7_tx_compliance),
        .xpipe7_tx_data(pspmc_0_IF_PS_CPM_xpipe7_tx_data),
        .xpipe7_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe7_tx_datavalid),
        .xpipe7_tx_deemph(pspmc_0_IF_PS_CPM_xpipe7_tx_deemph),
        .xpipe7_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe7_tx_detectrxloopback),
        .xpipe7_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe7_tx_elecidle),
        .xpipe7_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe7_tx_maincursor),
        .xpipe7_tx_margin(pspmc_0_IF_PS_CPM_xpipe7_tx_margin),
        .xpipe7_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe7_tx_postcursor),
        .xpipe7_tx_precursor(pspmc_0_IF_PS_CPM_xpipe7_tx_precursor),
        .xpipe7_tx_startblock(pspmc_0_IF_PS_CPM_xpipe7_tx_startblock),
        .xpipe7_tx_swing(pspmc_0_IF_PS_CPM_xpipe7_tx_swing),
        .xpipe7_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe7_tx_syncheader),
        .xpipe8_phystatus(pspmc_0_IF_PS_CPM_xpipe8_phystatus),
        .xpipe8_powerdown(pspmc_0_IF_PS_CPM_xpipe8_powerdown),
        .xpipe8_rx_charisk(pspmc_0_IF_PS_CPM_xpipe8_rx_charisk),
        .xpipe8_rx_data(pspmc_0_IF_PS_CPM_xpipe8_rx_data),
        .xpipe8_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe8_rx_datavalid),
        .xpipe8_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe8_rx_elecidle),
        .xpipe8_rx_polarity(pspmc_0_IF_PS_CPM_xpipe8_rx_polarity),
        .xpipe8_rx_startblock(pspmc_0_IF_PS_CPM_xpipe8_rx_startblock),
        .xpipe8_rx_status(pspmc_0_IF_PS_CPM_xpipe8_rx_status),
        .xpipe8_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe8_rx_syncheader),
        .xpipe8_rx_termination(pspmc_0_IF_PS_CPM_xpipe8_rx_termination),
        .xpipe8_rx_valid(pspmc_0_IF_PS_CPM_xpipe8_rx_valid),
        .xpipe8_tx_charisk(pspmc_0_IF_PS_CPM_xpipe8_tx_charisk),
        .xpipe8_tx_compliance(pspmc_0_IF_PS_CPM_xpipe8_tx_compliance),
        .xpipe8_tx_data(pspmc_0_IF_PS_CPM_xpipe8_tx_data),
        .xpipe8_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe8_tx_datavalid),
        .xpipe8_tx_deemph(pspmc_0_IF_PS_CPM_xpipe8_tx_deemph),
        .xpipe8_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe8_tx_detectrxloopback),
        .xpipe8_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe8_tx_elecidle),
        .xpipe8_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe8_tx_maincursor),
        .xpipe8_tx_margin(pspmc_0_IF_PS_CPM_xpipe8_tx_margin),
        .xpipe8_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe8_tx_postcursor),
        .xpipe8_tx_precursor(pspmc_0_IF_PS_CPM_xpipe8_tx_precursor),
        .xpipe8_tx_startblock(pspmc_0_IF_PS_CPM_xpipe8_tx_startblock),
        .xpipe8_tx_swing(pspmc_0_IF_PS_CPM_xpipe8_tx_swing),
        .xpipe8_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe8_tx_syncheader),
        .xpipe9_phystatus(pspmc_0_IF_PS_CPM_xpipe9_phystatus),
        .xpipe9_powerdown(pspmc_0_IF_PS_CPM_xpipe9_powerdown),
        .xpipe9_rx_charisk(pspmc_0_IF_PS_CPM_xpipe9_rx_charisk),
        .xpipe9_rx_data(pspmc_0_IF_PS_CPM_xpipe9_rx_data),
        .xpipe9_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe9_rx_datavalid),
        .xpipe9_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe9_rx_elecidle),
        .xpipe9_rx_polarity(pspmc_0_IF_PS_CPM_xpipe9_rx_polarity),
        .xpipe9_rx_startblock(pspmc_0_IF_PS_CPM_xpipe9_rx_startblock),
        .xpipe9_rx_status(pspmc_0_IF_PS_CPM_xpipe9_rx_status),
        .xpipe9_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe9_rx_syncheader),
        .xpipe9_rx_termination(pspmc_0_IF_PS_CPM_xpipe9_rx_termination),
        .xpipe9_rx_valid(pspmc_0_IF_PS_CPM_xpipe9_rx_valid),
        .xpipe9_tx_charisk(pspmc_0_IF_PS_CPM_xpipe9_tx_charisk),
        .xpipe9_tx_compliance(pspmc_0_IF_PS_CPM_xpipe9_tx_compliance),
        .xpipe9_tx_data(pspmc_0_IF_PS_CPM_xpipe9_tx_data),
        .xpipe9_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe9_tx_datavalid),
        .xpipe9_tx_deemph(pspmc_0_IF_PS_CPM_xpipe9_tx_deemph),
        .xpipe9_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe9_tx_detectrxloopback),
        .xpipe9_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe9_tx_elecidle),
        .xpipe9_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe9_tx_maincursor),
        .xpipe9_tx_margin(pspmc_0_IF_PS_CPM_xpipe9_tx_margin),
        .xpipe9_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe9_tx_postcursor),
        .xpipe9_tx_precursor(pspmc_0_IF_PS_CPM_xpipe9_tx_precursor),
        .xpipe9_tx_startblock(pspmc_0_IF_PS_CPM_xpipe9_tx_startblock),
        .xpipe9_tx_swing(pspmc_0_IF_PS_CPM_xpipe9_tx_swing),
        .xpipe9_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe9_tx_syncheader),
        .xpipe_q0_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_ack),
        .xpipe_q0_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_cmd),
        .xpipe_q0_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_lanenum),
        .xpipe_q0_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_payload),
        .xpipe_q0_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_req),
        .xpipe_q0_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_ack),
        .xpipe_q0_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_cmd),
        .xpipe_q0_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_lanenum),
        .xpipe_q0_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_payload),
        .xpipe_q0_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_req),
        .xpipe_q1_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_ack),
        .xpipe_q1_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_cmd),
        .xpipe_q1_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_lanenum),
        .xpipe_q1_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_payload),
        .xpipe_q1_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_req),
        .xpipe_q1_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_ack),
        .xpipe_q1_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_cmd),
        .xpipe_q1_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_lanenum),
        .xpipe_q1_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_payload),
        .xpipe_q1_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_req),
        .xpipe_q2_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_ack),
        .xpipe_q2_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_cmd),
        .xpipe_q2_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_lanenum),
        .xpipe_q2_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_payload),
        .xpipe_q2_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_req),
        .xpipe_q2_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_ack),
        .xpipe_q2_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_cmd),
        .xpipe_q2_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_lanenum),
        .xpipe_q2_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_payload),
        .xpipe_q2_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_req),
        .xpipe_q3_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_ack),
        .xpipe_q3_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_cmd),
        .xpipe_q3_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_lanenum),
        .xpipe_q3_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_payload),
        .xpipe_q3_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_req),
        .xpipe_q3_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_ack),
        .xpipe_q3_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_cmd),
        .xpipe_q3_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_lanenum),
        .xpipe_q3_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_payload),
        .xpipe_q3_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_req));
  bd_af1b_pspmc_0_0 pspmc_0
       (.cpm_osc_clk_div2(pspmc_0_IF_PS_CPM_cpm_osc_clk_div2),
        .cpm_pcie_noc_axi0_araddr(CPM_PCIE_NOC_0_araddr),
        .cpm_pcie_noc_axi0_arburst(CPM_PCIE_NOC_0_arburst),
        .cpm_pcie_noc_axi0_arcache(CPM_PCIE_NOC_0_arcache),
        .cpm_pcie_noc_axi0_arid(CPM_PCIE_NOC_0_arid),
        .cpm_pcie_noc_axi0_arlen(CPM_PCIE_NOC_0_arlen),
        .cpm_pcie_noc_axi0_arlock(CPM_PCIE_NOC_0_arlock),
        .cpm_pcie_noc_axi0_arprot(CPM_PCIE_NOC_0_arprot),
        .cpm_pcie_noc_axi0_arqos(CPM_PCIE_NOC_0_arqos),
        .cpm_pcie_noc_axi0_arready(CPM_PCIE_NOC_0_arready),
        .cpm_pcie_noc_axi0_arsize(CPM_PCIE_NOC_0_arsize),
        .cpm_pcie_noc_axi0_aruser(CPM_PCIE_NOC_0_aruser),
        .cpm_pcie_noc_axi0_arvalid(CPM_PCIE_NOC_0_arvalid),
        .cpm_pcie_noc_axi0_awaddr(CPM_PCIE_NOC_0_awaddr),
        .cpm_pcie_noc_axi0_awburst(CPM_PCIE_NOC_0_awburst),
        .cpm_pcie_noc_axi0_awcache(CPM_PCIE_NOC_0_awcache),
        .cpm_pcie_noc_axi0_awid(CPM_PCIE_NOC_0_awid),
        .cpm_pcie_noc_axi0_awlen(CPM_PCIE_NOC_0_awlen),
        .cpm_pcie_noc_axi0_awlock(CPM_PCIE_NOC_0_awlock),
        .cpm_pcie_noc_axi0_awprot(CPM_PCIE_NOC_0_awprot),
        .cpm_pcie_noc_axi0_awqos(CPM_PCIE_NOC_0_awqos),
        .cpm_pcie_noc_axi0_awready(CPM_PCIE_NOC_0_awready),
        .cpm_pcie_noc_axi0_awsize(CPM_PCIE_NOC_0_awsize),
        .cpm_pcie_noc_axi0_awuser(CPM_PCIE_NOC_0_awuser),
        .cpm_pcie_noc_axi0_awvalid(CPM_PCIE_NOC_0_awvalid),
        .cpm_pcie_noc_axi0_bid(CPM_PCIE_NOC_0_bid),
        .cpm_pcie_noc_axi0_bready(CPM_PCIE_NOC_0_bready),
        .cpm_pcie_noc_axi0_bresp(CPM_PCIE_NOC_0_bresp),
        .cpm_pcie_noc_axi0_bvalid(CPM_PCIE_NOC_0_bvalid),
        .cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk),
        .cpm_pcie_noc_axi0_rdata(CPM_PCIE_NOC_0_rdata),
        .cpm_pcie_noc_axi0_rid(CPM_PCIE_NOC_0_rid),
        .cpm_pcie_noc_axi0_rlast(CPM_PCIE_NOC_0_rlast),
        .cpm_pcie_noc_axi0_rready(CPM_PCIE_NOC_0_rready),
        .cpm_pcie_noc_axi0_rresp(CPM_PCIE_NOC_0_rresp),
        .cpm_pcie_noc_axi0_rvalid(CPM_PCIE_NOC_0_rvalid),
        .cpm_pcie_noc_axi0_wdata(CPM_PCIE_NOC_0_wdata),
        .cpm_pcie_noc_axi0_wlast(CPM_PCIE_NOC_0_wlast),
        .cpm_pcie_noc_axi0_wready(CPM_PCIE_NOC_0_wready),
        .cpm_pcie_noc_axi0_wstrb(CPM_PCIE_NOC_0_wstrb),
        .cpm_pcie_noc_axi0_wvalid(CPM_PCIE_NOC_0_wvalid),
        .cpm_pcie_noc_axi1_araddr(CPM_PCIE_NOC_1_araddr),
        .cpm_pcie_noc_axi1_arburst(CPM_PCIE_NOC_1_arburst),
        .cpm_pcie_noc_axi1_arcache(CPM_PCIE_NOC_1_arcache),
        .cpm_pcie_noc_axi1_arid(CPM_PCIE_NOC_1_arid),
        .cpm_pcie_noc_axi1_arlen(CPM_PCIE_NOC_1_arlen),
        .cpm_pcie_noc_axi1_arlock(CPM_PCIE_NOC_1_arlock),
        .cpm_pcie_noc_axi1_arprot(CPM_PCIE_NOC_1_arprot),
        .cpm_pcie_noc_axi1_arqos(CPM_PCIE_NOC_1_arqos),
        .cpm_pcie_noc_axi1_arready(CPM_PCIE_NOC_1_arready),
        .cpm_pcie_noc_axi1_arsize(CPM_PCIE_NOC_1_arsize),
        .cpm_pcie_noc_axi1_aruser(CPM_PCIE_NOC_1_aruser),
        .cpm_pcie_noc_axi1_arvalid(CPM_PCIE_NOC_1_arvalid),
        .cpm_pcie_noc_axi1_awaddr(CPM_PCIE_NOC_1_awaddr),
        .cpm_pcie_noc_axi1_awburst(CPM_PCIE_NOC_1_awburst),
        .cpm_pcie_noc_axi1_awcache(CPM_PCIE_NOC_1_awcache),
        .cpm_pcie_noc_axi1_awid(CPM_PCIE_NOC_1_awid),
        .cpm_pcie_noc_axi1_awlen(CPM_PCIE_NOC_1_awlen),
        .cpm_pcie_noc_axi1_awlock(CPM_PCIE_NOC_1_awlock),
        .cpm_pcie_noc_axi1_awprot(CPM_PCIE_NOC_1_awprot),
        .cpm_pcie_noc_axi1_awqos(CPM_PCIE_NOC_1_awqos),
        .cpm_pcie_noc_axi1_awready(CPM_PCIE_NOC_1_awready),
        .cpm_pcie_noc_axi1_awsize(CPM_PCIE_NOC_1_awsize),
        .cpm_pcie_noc_axi1_awuser(CPM_PCIE_NOC_1_awuser),
        .cpm_pcie_noc_axi1_awvalid(CPM_PCIE_NOC_1_awvalid),
        .cpm_pcie_noc_axi1_bid(CPM_PCIE_NOC_1_bid),
        .cpm_pcie_noc_axi1_bready(CPM_PCIE_NOC_1_bready),
        .cpm_pcie_noc_axi1_bresp(CPM_PCIE_NOC_1_bresp),
        .cpm_pcie_noc_axi1_bvalid(CPM_PCIE_NOC_1_bvalid),
        .cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk),
        .cpm_pcie_noc_axi1_rdata(CPM_PCIE_NOC_1_rdata),
        .cpm_pcie_noc_axi1_rid(CPM_PCIE_NOC_1_rid),
        .cpm_pcie_noc_axi1_rlast(CPM_PCIE_NOC_1_rlast),
        .cpm_pcie_noc_axi1_rready(CPM_PCIE_NOC_1_rready),
        .cpm_pcie_noc_axi1_rresp(CPM_PCIE_NOC_1_rresp),
        .cpm_pcie_noc_axi1_rvalid(CPM_PCIE_NOC_1_rvalid),
        .cpm_pcie_noc_axi1_wdata(CPM_PCIE_NOC_1_wdata),
        .cpm_pcie_noc_axi1_wlast(CPM_PCIE_NOC_1_wlast),
        .cpm_pcie_noc_axi1_wready(CPM_PCIE_NOC_1_wready),
        .cpm_pcie_noc_axi1_wstrb(CPM_PCIE_NOC_1_wstrb),
        .cpm_pcie_noc_axi1_wvalid(CPM_PCIE_NOC_1_wvalid),
        .cpm_pcr_apb_en(pspmc_0_IF_PS_CPM_cpm_pcr_apb_en),
        .cpm_pcr_dis_npi_clk(pspmc_0_IF_PS_CPM_cpm_pcr_dis_npi_clk),
        .cpm_pcr_fabric_en(pspmc_0_IF_PS_CPM_cpm_pcr_fabric_en),
        .cpm_pcr_gate_reg(pspmc_0_IF_PS_CPM_cpm_pcr_gate_reg),
        .cpm_pcr_hold_state(pspmc_0_IF_PS_CPM_cpm_pcr_hold_state),
        .cpm_pcr_init_state(pspmc_0_IF_PS_CPM_cpm_pcr_init_state),
        .cpm_pcr_mem_clr(pspmc_0_IF_PS_CPM_cpm_pcr_mem_clr),
        .cpm_pcr_o_disable(pspmc_0_IF_PS_CPM_cpm_pcr_o_disable),
        .cpm_pcr_pcomplete(pspmc_0_IF_PS_CPM_cpm_pcr_pcomplete),
        .cpm_pcr_pwr_dn(pspmc_0_IF_PS_CPM_cpm_pcr_pwr_dn),
        .cpm_pcr_scan_clr(pspmc_0_IF_PS_CPM_cpm_pcr_scan_clr),
        .cpm_pcr_start_bisr(pspmc_0_IF_PS_CPM_cpm_pcr_start_bisr),
        .cpm_pcr_start_cal(pspmc_0_IF_PS_CPM_cpm_pcr_start_cal),
        .cpm_pcr_tristate(pspmc_0_IF_PS_CPM_cpm_pcr_tristate),
        .cpmps_corr_irq(pspmc_0_IF_PS_CPM_cpmps_corr_irq),
        .cpmps_misc_irq(pspmc_0_IF_PS_CPM_cpmps_misc_irq),
        .cpmps_uncorr_irq(pspmc_0_IF_PS_CPM_cpmps_uncorr_irq),
        .fpd_cci_noc_axi0_araddr(FPD_CCI_NOC_0_araddr),
        .fpd_cci_noc_axi0_arburst(FPD_CCI_NOC_0_arburst),
        .fpd_cci_noc_axi0_arcache(FPD_CCI_NOC_0_arcache),
        .fpd_cci_noc_axi0_arid(FPD_CCI_NOC_0_arid),
        .fpd_cci_noc_axi0_arlen(FPD_CCI_NOC_0_arlen),
        .fpd_cci_noc_axi0_arlock(FPD_CCI_NOC_0_arlock),
        .fpd_cci_noc_axi0_arprot(FPD_CCI_NOC_0_arprot),
        .fpd_cci_noc_axi0_arqos(FPD_CCI_NOC_0_arqos),
        .fpd_cci_noc_axi0_arready(FPD_CCI_NOC_0_arready),
        .fpd_cci_noc_axi0_arsize(FPD_CCI_NOC_0_arsize),
        .fpd_cci_noc_axi0_aruser(FPD_CCI_NOC_0_aruser),
        .fpd_cci_noc_axi0_arvalid(FPD_CCI_NOC_0_arvalid),
        .fpd_cci_noc_axi0_awaddr(FPD_CCI_NOC_0_awaddr),
        .fpd_cci_noc_axi0_awburst(FPD_CCI_NOC_0_awburst),
        .fpd_cci_noc_axi0_awcache(FPD_CCI_NOC_0_awcache),
        .fpd_cci_noc_axi0_awid(FPD_CCI_NOC_0_awid),
        .fpd_cci_noc_axi0_awlen(FPD_CCI_NOC_0_awlen),
        .fpd_cci_noc_axi0_awlock(FPD_CCI_NOC_0_awlock),
        .fpd_cci_noc_axi0_awprot(FPD_CCI_NOC_0_awprot),
        .fpd_cci_noc_axi0_awqos(FPD_CCI_NOC_0_awqos),
        .fpd_cci_noc_axi0_awready(FPD_CCI_NOC_0_awready),
        .fpd_cci_noc_axi0_awsize(FPD_CCI_NOC_0_awsize),
        .fpd_cci_noc_axi0_awuser(FPD_CCI_NOC_0_awuser),
        .fpd_cci_noc_axi0_awvalid(FPD_CCI_NOC_0_awvalid),
        .fpd_cci_noc_axi0_bid(FPD_CCI_NOC_0_bid),
        .fpd_cci_noc_axi0_bready(FPD_CCI_NOC_0_bready),
        .fpd_cci_noc_axi0_bresp(FPD_CCI_NOC_0_bresp),
        .fpd_cci_noc_axi0_bvalid(FPD_CCI_NOC_0_bvalid),
        .fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk),
        .fpd_cci_noc_axi0_rdata(FPD_CCI_NOC_0_rdata),
        .fpd_cci_noc_axi0_rid(FPD_CCI_NOC_0_rid),
        .fpd_cci_noc_axi0_rlast(FPD_CCI_NOC_0_rlast),
        .fpd_cci_noc_axi0_rready(FPD_CCI_NOC_0_rready),
        .fpd_cci_noc_axi0_rresp(FPD_CCI_NOC_0_rresp),
        .fpd_cci_noc_axi0_rvalid(FPD_CCI_NOC_0_rvalid),
        .fpd_cci_noc_axi0_wdata(FPD_CCI_NOC_0_wdata),
        .fpd_cci_noc_axi0_wlast(FPD_CCI_NOC_0_wlast),
        .fpd_cci_noc_axi0_wready(FPD_CCI_NOC_0_wready),
        .fpd_cci_noc_axi0_wstrb(FPD_CCI_NOC_0_wstrb),
        .fpd_cci_noc_axi0_wuser(FPD_CCI_NOC_0_wuser),
        .fpd_cci_noc_axi0_wvalid(FPD_CCI_NOC_0_wvalid),
        .fpd_cci_noc_axi1_araddr(FPD_CCI_NOC_1_araddr),
        .fpd_cci_noc_axi1_arburst(FPD_CCI_NOC_1_arburst),
        .fpd_cci_noc_axi1_arcache(FPD_CCI_NOC_1_arcache),
        .fpd_cci_noc_axi1_arid(FPD_CCI_NOC_1_arid),
        .fpd_cci_noc_axi1_arlen(FPD_CCI_NOC_1_arlen),
        .fpd_cci_noc_axi1_arlock(FPD_CCI_NOC_1_arlock),
        .fpd_cci_noc_axi1_arprot(FPD_CCI_NOC_1_arprot),
        .fpd_cci_noc_axi1_arqos(FPD_CCI_NOC_1_arqos),
        .fpd_cci_noc_axi1_arready(FPD_CCI_NOC_1_arready),
        .fpd_cci_noc_axi1_arsize(FPD_CCI_NOC_1_arsize),
        .fpd_cci_noc_axi1_aruser(FPD_CCI_NOC_1_aruser),
        .fpd_cci_noc_axi1_arvalid(FPD_CCI_NOC_1_arvalid),
        .fpd_cci_noc_axi1_awaddr(FPD_CCI_NOC_1_awaddr),
        .fpd_cci_noc_axi1_awburst(FPD_CCI_NOC_1_awburst),
        .fpd_cci_noc_axi1_awcache(FPD_CCI_NOC_1_awcache),
        .fpd_cci_noc_axi1_awid(FPD_CCI_NOC_1_awid),
        .fpd_cci_noc_axi1_awlen(FPD_CCI_NOC_1_awlen),
        .fpd_cci_noc_axi1_awlock(FPD_CCI_NOC_1_awlock),
        .fpd_cci_noc_axi1_awprot(FPD_CCI_NOC_1_awprot),
        .fpd_cci_noc_axi1_awqos(FPD_CCI_NOC_1_awqos),
        .fpd_cci_noc_axi1_awready(FPD_CCI_NOC_1_awready),
        .fpd_cci_noc_axi1_awsize(FPD_CCI_NOC_1_awsize),
        .fpd_cci_noc_axi1_awuser(FPD_CCI_NOC_1_awuser),
        .fpd_cci_noc_axi1_awvalid(FPD_CCI_NOC_1_awvalid),
        .fpd_cci_noc_axi1_bid(FPD_CCI_NOC_1_bid),
        .fpd_cci_noc_axi1_bready(FPD_CCI_NOC_1_bready),
        .fpd_cci_noc_axi1_bresp(FPD_CCI_NOC_1_bresp),
        .fpd_cci_noc_axi1_bvalid(FPD_CCI_NOC_1_bvalid),
        .fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk),
        .fpd_cci_noc_axi1_rdata(FPD_CCI_NOC_1_rdata),
        .fpd_cci_noc_axi1_rid(FPD_CCI_NOC_1_rid),
        .fpd_cci_noc_axi1_rlast(FPD_CCI_NOC_1_rlast),
        .fpd_cci_noc_axi1_rready(FPD_CCI_NOC_1_rready),
        .fpd_cci_noc_axi1_rresp(FPD_CCI_NOC_1_rresp),
        .fpd_cci_noc_axi1_rvalid(FPD_CCI_NOC_1_rvalid),
        .fpd_cci_noc_axi1_wdata(FPD_CCI_NOC_1_wdata),
        .fpd_cci_noc_axi1_wlast(FPD_CCI_NOC_1_wlast),
        .fpd_cci_noc_axi1_wready(FPD_CCI_NOC_1_wready),
        .fpd_cci_noc_axi1_wstrb(FPD_CCI_NOC_1_wstrb),
        .fpd_cci_noc_axi1_wuser(FPD_CCI_NOC_1_wuser),
        .fpd_cci_noc_axi1_wvalid(FPD_CCI_NOC_1_wvalid),
        .fpd_cci_noc_axi2_araddr(FPD_CCI_NOC_2_araddr),
        .fpd_cci_noc_axi2_arburst(FPD_CCI_NOC_2_arburst),
        .fpd_cci_noc_axi2_arcache(FPD_CCI_NOC_2_arcache),
        .fpd_cci_noc_axi2_arid(FPD_CCI_NOC_2_arid),
        .fpd_cci_noc_axi2_arlen(FPD_CCI_NOC_2_arlen),
        .fpd_cci_noc_axi2_arlock(FPD_CCI_NOC_2_arlock),
        .fpd_cci_noc_axi2_arprot(FPD_CCI_NOC_2_arprot),
        .fpd_cci_noc_axi2_arqos(FPD_CCI_NOC_2_arqos),
        .fpd_cci_noc_axi2_arready(FPD_CCI_NOC_2_arready),
        .fpd_cci_noc_axi2_arsize(FPD_CCI_NOC_2_arsize),
        .fpd_cci_noc_axi2_aruser(FPD_CCI_NOC_2_aruser),
        .fpd_cci_noc_axi2_arvalid(FPD_CCI_NOC_2_arvalid),
        .fpd_cci_noc_axi2_awaddr(FPD_CCI_NOC_2_awaddr),
        .fpd_cci_noc_axi2_awburst(FPD_CCI_NOC_2_awburst),
        .fpd_cci_noc_axi2_awcache(FPD_CCI_NOC_2_awcache),
        .fpd_cci_noc_axi2_awid(FPD_CCI_NOC_2_awid),
        .fpd_cci_noc_axi2_awlen(FPD_CCI_NOC_2_awlen),
        .fpd_cci_noc_axi2_awlock(FPD_CCI_NOC_2_awlock),
        .fpd_cci_noc_axi2_awprot(FPD_CCI_NOC_2_awprot),
        .fpd_cci_noc_axi2_awqos(FPD_CCI_NOC_2_awqos),
        .fpd_cci_noc_axi2_awready(FPD_CCI_NOC_2_awready),
        .fpd_cci_noc_axi2_awsize(FPD_CCI_NOC_2_awsize),
        .fpd_cci_noc_axi2_awuser(FPD_CCI_NOC_2_awuser),
        .fpd_cci_noc_axi2_awvalid(FPD_CCI_NOC_2_awvalid),
        .fpd_cci_noc_axi2_bid(FPD_CCI_NOC_2_bid),
        .fpd_cci_noc_axi2_bready(FPD_CCI_NOC_2_bready),
        .fpd_cci_noc_axi2_bresp(FPD_CCI_NOC_2_bresp),
        .fpd_cci_noc_axi2_bvalid(FPD_CCI_NOC_2_bvalid),
        .fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk),
        .fpd_cci_noc_axi2_rdata(FPD_CCI_NOC_2_rdata),
        .fpd_cci_noc_axi2_rid(FPD_CCI_NOC_2_rid),
        .fpd_cci_noc_axi2_rlast(FPD_CCI_NOC_2_rlast),
        .fpd_cci_noc_axi2_rready(FPD_CCI_NOC_2_rready),
        .fpd_cci_noc_axi2_rresp(FPD_CCI_NOC_2_rresp),
        .fpd_cci_noc_axi2_rvalid(FPD_CCI_NOC_2_rvalid),
        .fpd_cci_noc_axi2_wdata(FPD_CCI_NOC_2_wdata),
        .fpd_cci_noc_axi2_wlast(FPD_CCI_NOC_2_wlast),
        .fpd_cci_noc_axi2_wready(FPD_CCI_NOC_2_wready),
        .fpd_cci_noc_axi2_wstrb(FPD_CCI_NOC_2_wstrb),
        .fpd_cci_noc_axi2_wuser(FPD_CCI_NOC_2_wuser),
        .fpd_cci_noc_axi2_wvalid(FPD_CCI_NOC_2_wvalid),
        .fpd_cci_noc_axi3_araddr(FPD_CCI_NOC_3_araddr),
        .fpd_cci_noc_axi3_arburst(FPD_CCI_NOC_3_arburst),
        .fpd_cci_noc_axi3_arcache(FPD_CCI_NOC_3_arcache),
        .fpd_cci_noc_axi3_arid(FPD_CCI_NOC_3_arid),
        .fpd_cci_noc_axi3_arlen(FPD_CCI_NOC_3_arlen),
        .fpd_cci_noc_axi3_arlock(FPD_CCI_NOC_3_arlock),
        .fpd_cci_noc_axi3_arprot(FPD_CCI_NOC_3_arprot),
        .fpd_cci_noc_axi3_arqos(FPD_CCI_NOC_3_arqos),
        .fpd_cci_noc_axi3_arready(FPD_CCI_NOC_3_arready),
        .fpd_cci_noc_axi3_arsize(FPD_CCI_NOC_3_arsize),
        .fpd_cci_noc_axi3_aruser(FPD_CCI_NOC_3_aruser),
        .fpd_cci_noc_axi3_arvalid(FPD_CCI_NOC_3_arvalid),
        .fpd_cci_noc_axi3_awaddr(FPD_CCI_NOC_3_awaddr),
        .fpd_cci_noc_axi3_awburst(FPD_CCI_NOC_3_awburst),
        .fpd_cci_noc_axi3_awcache(FPD_CCI_NOC_3_awcache),
        .fpd_cci_noc_axi3_awid(FPD_CCI_NOC_3_awid),
        .fpd_cci_noc_axi3_awlen(FPD_CCI_NOC_3_awlen),
        .fpd_cci_noc_axi3_awlock(FPD_CCI_NOC_3_awlock),
        .fpd_cci_noc_axi3_awprot(FPD_CCI_NOC_3_awprot),
        .fpd_cci_noc_axi3_awqos(FPD_CCI_NOC_3_awqos),
        .fpd_cci_noc_axi3_awready(FPD_CCI_NOC_3_awready),
        .fpd_cci_noc_axi3_awsize(FPD_CCI_NOC_3_awsize),
        .fpd_cci_noc_axi3_awuser(FPD_CCI_NOC_3_awuser),
        .fpd_cci_noc_axi3_awvalid(FPD_CCI_NOC_3_awvalid),
        .fpd_cci_noc_axi3_bid(FPD_CCI_NOC_3_bid),
        .fpd_cci_noc_axi3_bready(FPD_CCI_NOC_3_bready),
        .fpd_cci_noc_axi3_bresp(FPD_CCI_NOC_3_bresp),
        .fpd_cci_noc_axi3_bvalid(FPD_CCI_NOC_3_bvalid),
        .fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk),
        .fpd_cci_noc_axi3_rdata(FPD_CCI_NOC_3_rdata),
        .fpd_cci_noc_axi3_rid(FPD_CCI_NOC_3_rid),
        .fpd_cci_noc_axi3_rlast(FPD_CCI_NOC_3_rlast),
        .fpd_cci_noc_axi3_rready(FPD_CCI_NOC_3_rready),
        .fpd_cci_noc_axi3_rresp(FPD_CCI_NOC_3_rresp),
        .fpd_cci_noc_axi3_rvalid(FPD_CCI_NOC_3_rvalid),
        .fpd_cci_noc_axi3_wdata(FPD_CCI_NOC_3_wdata),
        .fpd_cci_noc_axi3_wlast(FPD_CCI_NOC_3_wlast),
        .fpd_cci_noc_axi3_wready(FPD_CCI_NOC_3_wready),
        .fpd_cci_noc_axi3_wstrb(FPD_CCI_NOC_3_wstrb),
        .fpd_cci_noc_axi3_wuser(FPD_CCI_NOC_3_wuser),
        .fpd_cci_noc_axi3_wvalid(FPD_CCI_NOC_3_wvalid),
        .gem0_tsu_timer_cnt(gem0_tsu_timer_cnt),
        .hsdp_gt_rxoutclk(pspmc_0_IF_PS_CPM_hsdp_gt_rxoutclk),
        .hsdp_gt_txusrclk(pspmc_0_IF_PS_CPM_hsdp_gt_txusrclk),
        .hsdp_xpipe0_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_datavalid),
        .hsdp_xpipe0_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_gearboxslip),
        .hsdp_xpipe0_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_header),
        .hsdp_xpipe0_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_headervalid),
        .hsdp_xpipe0_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_pcsreset),
        .hsdp_xpipe0_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe0_rx_resetdone),
        .hsdp_xpipe0_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_header),
        .hsdp_xpipe0_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_resetdone),
        .hsdp_xpipe0_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe0_tx_sequence),
        .hsdp_xpipe1_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_datavalid),
        .hsdp_xpipe1_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_gearboxslip),
        .hsdp_xpipe1_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_header),
        .hsdp_xpipe1_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_headervalid),
        .hsdp_xpipe1_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_pcsreset),
        .hsdp_xpipe1_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe1_rx_resetdone),
        .hsdp_xpipe1_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_header),
        .hsdp_xpipe1_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_resetdone),
        .hsdp_xpipe1_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe1_tx_sequence),
        .hsdp_xpipe2_rx_datavalid(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_datavalid),
        .hsdp_xpipe2_rx_gearboxslip(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_gearboxslip),
        .hsdp_xpipe2_rx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_header),
        .hsdp_xpipe2_rx_headervalid(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_headervalid),
        .hsdp_xpipe2_rx_pcsreset(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_pcsreset),
        .hsdp_xpipe2_rx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe2_rx_resetdone),
        .hsdp_xpipe2_tx_header(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_header),
        .hsdp_xpipe2_tx_resetdone(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_resetdone),
        .hsdp_xpipe2_tx_sequence(pspmc_0_IF_PS_CPM_hsdp_xpipe2_tx_sequence),
        .if_ps_noc_pci_axi0_ruser(CPM_PCIE_NOC_0_ruser),
        .if_ps_noc_pci_axi0_wuser(CPM_PCIE_NOC_0_wuser),
        .if_ps_noc_pci_axi1_ruser(CPM_PCIE_NOC_1_ruser),
        .if_ps_noc_pci_axi1_wuser(CPM_PCIE_NOC_1_wuser),
        .link0_xpipe_bufgtce(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtce),
        .link0_xpipe_bufgtcemask(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtcemask),
        .link0_xpipe_bufgtdiv(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtdiv),
        .link0_xpipe_bufgtrst(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrst),
        .link0_xpipe_bufgtrstmask(pspmc_0_IF_PS_CPM_link0_xpipe_bufgtrstmask),
        .link0_xpipe_gtoutclk(pspmc_0_IF_PS_CPM_link0_xpipe_gtoutclk),
        .link0_xpipe_gtpipeclk(pspmc_0_IF_PS_CPM_link0_xpipe_gtpipeclk),
        .link0_xpipe_pcielinkreachtarget(pspmc_0_IF_PS_CPM_link0_xpipe_pcielinkreachtarget),
        .link0_xpipe_pcieltssmstate(pspmc_0_IF_PS_CPM_link0_xpipe_pcieltssmstate),
        .link0_xpipe_pcieperstn(pspmc_0_IF_PS_CPM_link0_xpipe_pcieperstn),
        .link0_xpipe_phyesmadaptationsave(pspmc_0_IF_PS_CPM_link0_xpipe_phyesmadaptationsave),
        .link0_xpipe_phyready(pspmc_0_IF_PS_CPM_link0_xpipe_phyready),
        .link0_xpipe_piperate(pspmc_0_IF_PS_CPM_link0_xpipe_piperate),
        .link1_xpipe_bufgtce(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtce),
        .link1_xpipe_bufgtcemask(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtcemask),
        .link1_xpipe_bufgtdiv(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtdiv),
        .link1_xpipe_bufgtrst(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrst),
        .link1_xpipe_bufgtrstmask(pspmc_0_IF_PS_CPM_link1_xpipe_bufgtrstmask),
        .link1_xpipe_gtoutclk(pspmc_0_IF_PS_CPM_link1_xpipe_gtoutclk),
        .link1_xpipe_gtpipeclk(pspmc_0_IF_PS_CPM_link1_xpipe_gtpipeclk),
        .link1_xpipe_pcielinkreachtarget(pspmc_0_IF_PS_CPM_link1_xpipe_pcielinkreachtarget),
        .link1_xpipe_pcieltssmstate(pspmc_0_IF_PS_CPM_link1_xpipe_pcieltssmstate),
        .link1_xpipe_pcieperstn(pspmc_0_IF_PS_CPM_link1_xpipe_pcieperstn),
        .link1_xpipe_phyesmadaptationsave(pspmc_0_IF_PS_CPM_link1_xpipe_phyesmadaptationsave),
        .link1_xpipe_phyready(pspmc_0_IF_PS_CPM_link1_xpipe_phyready),
        .link1_xpipe_piperate(pspmc_0_IF_PS_CPM_link1_xpipe_piperate),
        .lpd_axi_noc_axi0_araddr(LPD_AXI_NOC_0_araddr),
        .lpd_axi_noc_axi0_arburst(LPD_AXI_NOC_0_arburst),
        .lpd_axi_noc_axi0_arcache(LPD_AXI_NOC_0_arcache),
        .lpd_axi_noc_axi0_arid(LPD_AXI_NOC_0_arid),
        .lpd_axi_noc_axi0_arlen(LPD_AXI_NOC_0_arlen),
        .lpd_axi_noc_axi0_arlock(LPD_AXI_NOC_0_arlock),
        .lpd_axi_noc_axi0_arprot(LPD_AXI_NOC_0_arprot),
        .lpd_axi_noc_axi0_arqos(LPD_AXI_NOC_0_arqos),
        .lpd_axi_noc_axi0_arready(LPD_AXI_NOC_0_arready),
        .lpd_axi_noc_axi0_arsize(LPD_AXI_NOC_0_arsize),
        .lpd_axi_noc_axi0_aruser(LPD_AXI_NOC_0_aruser),
        .lpd_axi_noc_axi0_arvalid(LPD_AXI_NOC_0_arvalid),
        .lpd_axi_noc_axi0_awaddr(LPD_AXI_NOC_0_awaddr),
        .lpd_axi_noc_axi0_awburst(LPD_AXI_NOC_0_awburst),
        .lpd_axi_noc_axi0_awcache(LPD_AXI_NOC_0_awcache),
        .lpd_axi_noc_axi0_awid(LPD_AXI_NOC_0_awid),
        .lpd_axi_noc_axi0_awlen(LPD_AXI_NOC_0_awlen),
        .lpd_axi_noc_axi0_awlock(LPD_AXI_NOC_0_awlock),
        .lpd_axi_noc_axi0_awprot(LPD_AXI_NOC_0_awprot),
        .lpd_axi_noc_axi0_awqos(LPD_AXI_NOC_0_awqos),
        .lpd_axi_noc_axi0_awready(LPD_AXI_NOC_0_awready),
        .lpd_axi_noc_axi0_awsize(LPD_AXI_NOC_0_awsize),
        .lpd_axi_noc_axi0_awuser(LPD_AXI_NOC_0_awuser),
        .lpd_axi_noc_axi0_awvalid(LPD_AXI_NOC_0_awvalid),
        .lpd_axi_noc_axi0_bid(LPD_AXI_NOC_0_bid),
        .lpd_axi_noc_axi0_bready(LPD_AXI_NOC_0_bready),
        .lpd_axi_noc_axi0_bresp(LPD_AXI_NOC_0_bresp),
        .lpd_axi_noc_axi0_bvalid(LPD_AXI_NOC_0_bvalid),
        .lpd_axi_noc_axi0_rdata(LPD_AXI_NOC_0_rdata),
        .lpd_axi_noc_axi0_rid(LPD_AXI_NOC_0_rid),
        .lpd_axi_noc_axi0_rlast(LPD_AXI_NOC_0_rlast),
        .lpd_axi_noc_axi0_rready(LPD_AXI_NOC_0_rready),
        .lpd_axi_noc_axi0_rresp(LPD_AXI_NOC_0_rresp),
        .lpd_axi_noc_axi0_rvalid(LPD_AXI_NOC_0_rvalid),
        .lpd_axi_noc_axi0_wdata(LPD_AXI_NOC_0_wdata),
        .lpd_axi_noc_axi0_wlast(LPD_AXI_NOC_0_wlast),
        .lpd_axi_noc_axi0_wready(LPD_AXI_NOC_0_wready),
        .lpd_axi_noc_axi0_wstrb(LPD_AXI_NOC_0_wstrb),
        .lpd_axi_noc_axi0_wvalid(LPD_AXI_NOC_0_wvalid),
        .lpd_axi_noc_clk(lpd_axi_noc_clk),
        .lpd_refclk_in(pspmc_0_IF_PS_CPM_lpd_refclk_in),
        .lpd_swclk(pspmc_0_IF_PS_CPM_lpd_swclk),
        .lpd_switch_timeout_cnt(pspmc_0_IF_PS_CPM_lpd_switch_timeout_cnt),
        .m_axi0_ps_araddr(pspmc_0_IF_PS_CPM_m_axi0_ps_araddr),
        .m_axi0_ps_arburst(pspmc_0_IF_PS_CPM_m_axi0_ps_arburst),
        .m_axi0_ps_arcache(pspmc_0_IF_PS_CPM_m_axi0_ps_arcache),
        .m_axi0_ps_arid(pspmc_0_IF_PS_CPM_m_axi0_ps_arid),
        .m_axi0_ps_arlen(pspmc_0_IF_PS_CPM_m_axi0_ps_arlen),
        .m_axi0_ps_arlock(pspmc_0_IF_PS_CPM_m_axi0_ps_arlock),
        .m_axi0_ps_arprot(pspmc_0_IF_PS_CPM_m_axi0_ps_arprot),
        .m_axi0_ps_arqos(pspmc_0_IF_PS_CPM_m_axi0_ps_arqos),
        .m_axi0_ps_arready(pspmc_0_IF_PS_CPM_m_axi0_ps_arready),
        .m_axi0_ps_arregion(pspmc_0_IF_PS_CPM_m_axi0_ps_arregion),
        .m_axi0_ps_arsize(pspmc_0_IF_PS_CPM_m_axi0_ps_arsize),
        .m_axi0_ps_aruser(pspmc_0_IF_PS_CPM_m_axi0_ps_aruser),
        .m_axi0_ps_arvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_arvalid),
        .m_axi0_ps_awaddr(pspmc_0_IF_PS_CPM_m_axi0_ps_awaddr),
        .m_axi0_ps_awburst(pspmc_0_IF_PS_CPM_m_axi0_ps_awburst),
        .m_axi0_ps_awcache(pspmc_0_IF_PS_CPM_m_axi0_ps_awcache),
        .m_axi0_ps_awid(pspmc_0_IF_PS_CPM_m_axi0_ps_awid),
        .m_axi0_ps_awlen(pspmc_0_IF_PS_CPM_m_axi0_ps_awlen),
        .m_axi0_ps_awlock(pspmc_0_IF_PS_CPM_m_axi0_ps_awlock),
        .m_axi0_ps_awprot(pspmc_0_IF_PS_CPM_m_axi0_ps_awprot),
        .m_axi0_ps_awqos(pspmc_0_IF_PS_CPM_m_axi0_ps_awqos),
        .m_axi0_ps_awready(pspmc_0_IF_PS_CPM_m_axi0_ps_awready),
        .m_axi0_ps_awregion(pspmc_0_IF_PS_CPM_m_axi0_ps_awregion),
        .m_axi0_ps_awsize(pspmc_0_IF_PS_CPM_m_axi0_ps_awsize),
        .m_axi0_ps_awuser(pspmc_0_IF_PS_CPM_m_axi0_ps_awuser),
        .m_axi0_ps_awvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_awvalid),
        .m_axi0_ps_bid(pspmc_0_IF_PS_CPM_m_axi0_ps_bid),
        .m_axi0_ps_bready(pspmc_0_IF_PS_CPM_m_axi0_ps_bready),
        .m_axi0_ps_bresp(pspmc_0_IF_PS_CPM_m_axi0_ps_bresp),
        .m_axi0_ps_buser(pspmc_0_IF_PS_CPM_m_axi0_ps_buser),
        .m_axi0_ps_bvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_bvalid),
        .m_axi0_ps_rdata(pspmc_0_IF_PS_CPM_m_axi0_ps_rdata),
        .m_axi0_ps_rid(pspmc_0_IF_PS_CPM_m_axi0_ps_rid),
        .m_axi0_ps_rlast(pspmc_0_IF_PS_CPM_m_axi0_ps_rlast),
        .m_axi0_ps_rready(pspmc_0_IF_PS_CPM_m_axi0_ps_rready),
        .m_axi0_ps_rresp(pspmc_0_IF_PS_CPM_m_axi0_ps_rresp),
        .m_axi0_ps_ruser(pspmc_0_IF_PS_CPM_m_axi0_ps_ruser),
        .m_axi0_ps_rvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_rvalid),
        .m_axi0_ps_wdata(pspmc_0_IF_PS_CPM_m_axi0_ps_wdata),
        .m_axi0_ps_wid(pspmc_0_IF_PS_CPM_m_axi0_ps_wid),
        .m_axi0_ps_wlast(pspmc_0_IF_PS_CPM_m_axi0_ps_wlast),
        .m_axi0_ps_wready(pspmc_0_IF_PS_CPM_m_axi0_ps_wready),
        .m_axi0_ps_wstrb(pspmc_0_IF_PS_CPM_m_axi0_ps_wstrb),
        .m_axi0_ps_wuser(pspmc_0_IF_PS_CPM_m_axi0_ps_wuser),
        .m_axi0_ps_wvalid(pspmc_0_IF_PS_CPM_m_axi0_ps_wvalid),
        .m_axi1_ps_araddr(pspmc_0_IF_PS_CPM_m_axi1_ps_araddr),
        .m_axi1_ps_arburst(pspmc_0_IF_PS_CPM_m_axi1_ps_arburst),
        .m_axi1_ps_arcache(pspmc_0_IF_PS_CPM_m_axi1_ps_arcache),
        .m_axi1_ps_arid(pspmc_0_IF_PS_CPM_m_axi1_ps_arid),
        .m_axi1_ps_arlen(pspmc_0_IF_PS_CPM_m_axi1_ps_arlen),
        .m_axi1_ps_arlock(pspmc_0_IF_PS_CPM_m_axi1_ps_arlock),
        .m_axi1_ps_arprot(pspmc_0_IF_PS_CPM_m_axi1_ps_arprot),
        .m_axi1_ps_arqos(pspmc_0_IF_PS_CPM_m_axi1_ps_arqos),
        .m_axi1_ps_arready(pspmc_0_IF_PS_CPM_m_axi1_ps_arready),
        .m_axi1_ps_arregion(pspmc_0_IF_PS_CPM_m_axi1_ps_arregion),
        .m_axi1_ps_arsize(pspmc_0_IF_PS_CPM_m_axi1_ps_arsize),
        .m_axi1_ps_aruser(pspmc_0_IF_PS_CPM_m_axi1_ps_aruser),
        .m_axi1_ps_arvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_arvalid),
        .m_axi1_ps_awaddr(pspmc_0_IF_PS_CPM_m_axi1_ps_awaddr),
        .m_axi1_ps_awburst(pspmc_0_IF_PS_CPM_m_axi1_ps_awburst),
        .m_axi1_ps_awcache(pspmc_0_IF_PS_CPM_m_axi1_ps_awcache),
        .m_axi1_ps_awid(pspmc_0_IF_PS_CPM_m_axi1_ps_awid),
        .m_axi1_ps_awlen(pspmc_0_IF_PS_CPM_m_axi1_ps_awlen),
        .m_axi1_ps_awlock(pspmc_0_IF_PS_CPM_m_axi1_ps_awlock),
        .m_axi1_ps_awprot(pspmc_0_IF_PS_CPM_m_axi1_ps_awprot),
        .m_axi1_ps_awqos(pspmc_0_IF_PS_CPM_m_axi1_ps_awqos),
        .m_axi1_ps_awready(pspmc_0_IF_PS_CPM_m_axi1_ps_awready),
        .m_axi1_ps_awregion(pspmc_0_IF_PS_CPM_m_axi1_ps_awregion),
        .m_axi1_ps_awsize(pspmc_0_IF_PS_CPM_m_axi1_ps_awsize),
        .m_axi1_ps_awuser(pspmc_0_IF_PS_CPM_m_axi1_ps_awuser),
        .m_axi1_ps_awvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_awvalid),
        .m_axi1_ps_bid(pspmc_0_IF_PS_CPM_m_axi1_ps_bid),
        .m_axi1_ps_bready(pspmc_0_IF_PS_CPM_m_axi1_ps_bready),
        .m_axi1_ps_bresp(pspmc_0_IF_PS_CPM_m_axi1_ps_bresp),
        .m_axi1_ps_buser(pspmc_0_IF_PS_CPM_m_axi1_ps_buser),
        .m_axi1_ps_bvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_bvalid),
        .m_axi1_ps_rdata(pspmc_0_IF_PS_CPM_m_axi1_ps_rdata),
        .m_axi1_ps_rid(pspmc_0_IF_PS_CPM_m_axi1_ps_rid),
        .m_axi1_ps_rlast(pspmc_0_IF_PS_CPM_m_axi1_ps_rlast),
        .m_axi1_ps_rready(pspmc_0_IF_PS_CPM_m_axi1_ps_rready),
        .m_axi1_ps_rresp(pspmc_0_IF_PS_CPM_m_axi1_ps_rresp),
        .m_axi1_ps_ruser(pspmc_0_IF_PS_CPM_m_axi1_ps_ruser),
        .m_axi1_ps_rvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_rvalid),
        .m_axi1_ps_wdata(pspmc_0_IF_PS_CPM_m_axi1_ps_wdata),
        .m_axi1_ps_wid(pspmc_0_IF_PS_CPM_m_axi1_ps_wid),
        .m_axi1_ps_wlast(pspmc_0_IF_PS_CPM_m_axi1_ps_wlast),
        .m_axi1_ps_wready(pspmc_0_IF_PS_CPM_m_axi1_ps_wready),
        .m_axi1_ps_wstrb(pspmc_0_IF_PS_CPM_m_axi1_ps_wstrb),
        .m_axi1_ps_wuser(pspmc_0_IF_PS_CPM_m_axi1_ps_wuser),
        .m_axi1_ps_wvalid(pspmc_0_IF_PS_CPM_m_axi1_ps_wvalid),
        .noc_pmc_axi0_araddr(NOC_PMC_AXI_0_araddr),
        .noc_pmc_axi0_arburst(NOC_PMC_AXI_0_arburst),
        .noc_pmc_axi0_arcache(NOC_PMC_AXI_0_arcache),
        .noc_pmc_axi0_arid(NOC_PMC_AXI_0_arid),
        .noc_pmc_axi0_arlen(NOC_PMC_AXI_0_arlen),
        .noc_pmc_axi0_arlock(NOC_PMC_AXI_0_arlock),
        .noc_pmc_axi0_arprot(NOC_PMC_AXI_0_arprot),
        .noc_pmc_axi0_arqos(NOC_PMC_AXI_0_arqos),
        .noc_pmc_axi0_arready(NOC_PMC_AXI_0_arready),
        .noc_pmc_axi0_arregion(NOC_PMC_AXI_0_arregion),
        .noc_pmc_axi0_arsize(NOC_PMC_AXI_0_arsize),
        .noc_pmc_axi0_aruser(NOC_PMC_AXI_0_aruser),
        .noc_pmc_axi0_arvalid(NOC_PMC_AXI_0_arvalid),
        .noc_pmc_axi0_awaddr(NOC_PMC_AXI_0_awaddr),
        .noc_pmc_axi0_awburst(NOC_PMC_AXI_0_awburst),
        .noc_pmc_axi0_awcache(NOC_PMC_AXI_0_awcache),
        .noc_pmc_axi0_awid(NOC_PMC_AXI_0_awid),
        .noc_pmc_axi0_awlen(NOC_PMC_AXI_0_awlen),
        .noc_pmc_axi0_awlock(NOC_PMC_AXI_0_awlock),
        .noc_pmc_axi0_awprot(NOC_PMC_AXI_0_awprot),
        .noc_pmc_axi0_awqos(NOC_PMC_AXI_0_awqos),
        .noc_pmc_axi0_awready(NOC_PMC_AXI_0_awready),
        .noc_pmc_axi0_awregion(NOC_PMC_AXI_0_awregion),
        .noc_pmc_axi0_awsize(NOC_PMC_AXI_0_awsize),
        .noc_pmc_axi0_awuser(NOC_PMC_AXI_0_awuser),
        .noc_pmc_axi0_awvalid(NOC_PMC_AXI_0_awvalid),
        .noc_pmc_axi0_bid(NOC_PMC_AXI_0_bid),
        .noc_pmc_axi0_bready(NOC_PMC_AXI_0_bready),
        .noc_pmc_axi0_bresp(NOC_PMC_AXI_0_bresp),
        .noc_pmc_axi0_buser(NOC_PMC_AXI_0_buser),
        .noc_pmc_axi0_bvalid(NOC_PMC_AXI_0_bvalid),
        .noc_pmc_axi0_rdata(NOC_PMC_AXI_0_rdata),
        .noc_pmc_axi0_rid(NOC_PMC_AXI_0_rid),
        .noc_pmc_axi0_rlast(NOC_PMC_AXI_0_rlast),
        .noc_pmc_axi0_rready(NOC_PMC_AXI_0_rready),
        .noc_pmc_axi0_rresp(NOC_PMC_AXI_0_rresp),
        .noc_pmc_axi0_ruser(NOC_PMC_AXI_0_ruser),
        .noc_pmc_axi0_rvalid(NOC_PMC_AXI_0_rvalid),
        .noc_pmc_axi0_wdata(NOC_PMC_AXI_0_wdata),
        .noc_pmc_axi0_wid(NOC_PMC_AXI_0_wid),
        .noc_pmc_axi0_wlast(NOC_PMC_AXI_0_wlast),
        .noc_pmc_axi0_wready(NOC_PMC_AXI_0_wready),
        .noc_pmc_axi0_wstrb(NOC_PMC_AXI_0_wstrb),
        .noc_pmc_axi0_wuser(NOC_PMC_AXI_0_wuser),
        .noc_pmc_axi0_wvalid(NOC_PMC_AXI_0_wvalid),
        .noc_pmc_axi_axi0_clk(noc_pmc_axi_axi0_clk),
        .perst0n(pspmc_0_IF_PS_CPM_perst0n),
        .perst1n(pspmc_0_IF_PS_CPM_perst1n),
        .phy_ready_frbot(pspmc_0_IF_PS_CPM_phy_ready_frbot),
        .phy_ready_tobot(pspmc_0_IF_PS_CPM_phy_ready_tobot),
        .pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk),
        .pmc_noc_axi0_araddr(PMC_NOC_AXI_0_araddr),
        .pmc_noc_axi0_arburst(PMC_NOC_AXI_0_arburst),
        .pmc_noc_axi0_arcache(PMC_NOC_AXI_0_arcache),
        .pmc_noc_axi0_arid(PMC_NOC_AXI_0_arid),
        .pmc_noc_axi0_arlen(PMC_NOC_AXI_0_arlen),
        .pmc_noc_axi0_arlock(PMC_NOC_AXI_0_arlock),
        .pmc_noc_axi0_arprot(PMC_NOC_AXI_0_arprot),
        .pmc_noc_axi0_arqos(PMC_NOC_AXI_0_arqos),
        .pmc_noc_axi0_arready(PMC_NOC_AXI_0_arready),
        .pmc_noc_axi0_arregion(PMC_NOC_AXI_0_arregion),
        .pmc_noc_axi0_arsize(PMC_NOC_AXI_0_arsize),
        .pmc_noc_axi0_aruser(PMC_NOC_AXI_0_aruser),
        .pmc_noc_axi0_arvalid(PMC_NOC_AXI_0_arvalid),
        .pmc_noc_axi0_awaddr(PMC_NOC_AXI_0_awaddr),
        .pmc_noc_axi0_awburst(PMC_NOC_AXI_0_awburst),
        .pmc_noc_axi0_awcache(PMC_NOC_AXI_0_awcache),
        .pmc_noc_axi0_awid(PMC_NOC_AXI_0_awid),
        .pmc_noc_axi0_awlen(PMC_NOC_AXI_0_awlen),
        .pmc_noc_axi0_awlock(PMC_NOC_AXI_0_awlock),
        .pmc_noc_axi0_awprot(PMC_NOC_AXI_0_awprot),
        .pmc_noc_axi0_awqos(PMC_NOC_AXI_0_awqos),
        .pmc_noc_axi0_awready(PMC_NOC_AXI_0_awready),
        .pmc_noc_axi0_awregion(PMC_NOC_AXI_0_awregion),
        .pmc_noc_axi0_awsize(PMC_NOC_AXI_0_awsize),
        .pmc_noc_axi0_awuser(PMC_NOC_AXI_0_awuser),
        .pmc_noc_axi0_awvalid(PMC_NOC_AXI_0_awvalid),
        .pmc_noc_axi0_bid(PMC_NOC_AXI_0_bid),
        .pmc_noc_axi0_bready(PMC_NOC_AXI_0_bready),
        .pmc_noc_axi0_bresp(PMC_NOC_AXI_0_bresp),
        .pmc_noc_axi0_buser(PMC_NOC_AXI_0_buser),
        .pmc_noc_axi0_bvalid(PMC_NOC_AXI_0_bvalid),
        .pmc_noc_axi0_rdata(PMC_NOC_AXI_0_rdata),
        .pmc_noc_axi0_rid(PMC_NOC_AXI_0_rid),
        .pmc_noc_axi0_rlast(PMC_NOC_AXI_0_rlast),
        .pmc_noc_axi0_rready(PMC_NOC_AXI_0_rready),
        .pmc_noc_axi0_rresp(PMC_NOC_AXI_0_rresp),
        .pmc_noc_axi0_ruser(PMC_NOC_AXI_0_ruser),
        .pmc_noc_axi0_rvalid(PMC_NOC_AXI_0_rvalid),
        .pmc_noc_axi0_wdata(PMC_NOC_AXI_0_wdata),
        .pmc_noc_axi0_wid(PMC_NOC_AXI_0_wid),
        .pmc_noc_axi0_wlast(PMC_NOC_AXI_0_wlast),
        .pmc_noc_axi0_wready(PMC_NOC_AXI_0_wready),
        .pmc_noc_axi0_wstrb(PMC_NOC_AXI_0_wstrb),
        .pmc_noc_axi0_wuser(PMC_NOC_AXI_0_wuser),
        .pmc_noc_axi0_wvalid(PMC_NOC_AXI_0_wvalid),
        .s_axi_cfg_araddr(pspmc_0_IF_PS_CPM_s_axi_cfg_araddr),
        .s_axi_cfg_arburst(pspmc_0_IF_PS_CPM_s_axi_cfg_arburst),
        .s_axi_cfg_arcache(pspmc_0_IF_PS_CPM_s_axi_cfg_arcache),
        .s_axi_cfg_arid(pspmc_0_IF_PS_CPM_s_axi_cfg_arid),
        .s_axi_cfg_arlen(pspmc_0_IF_PS_CPM_s_axi_cfg_arlen),
        .s_axi_cfg_arlock(pspmc_0_IF_PS_CPM_s_axi_cfg_arlock),
        .s_axi_cfg_arprot(pspmc_0_IF_PS_CPM_s_axi_cfg_arprot),
        .s_axi_cfg_arqos(pspmc_0_IF_PS_CPM_s_axi_cfg_arqos),
        .s_axi_cfg_arready(pspmc_0_IF_PS_CPM_s_axi_cfg_arready),
        .s_axi_cfg_arregion(pspmc_0_IF_PS_CPM_s_axi_cfg_arregion),
        .s_axi_cfg_arsize(pspmc_0_IF_PS_CPM_s_axi_cfg_arsize),
        .s_axi_cfg_aruser(pspmc_0_IF_PS_CPM_s_axi_cfg_aruser),
        .s_axi_cfg_arvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_arvalid),
        .s_axi_cfg_awaddr(pspmc_0_IF_PS_CPM_s_axi_cfg_awaddr),
        .s_axi_cfg_awburst(pspmc_0_IF_PS_CPM_s_axi_cfg_awburst),
        .s_axi_cfg_awcache(pspmc_0_IF_PS_CPM_s_axi_cfg_awcache),
        .s_axi_cfg_awid(pspmc_0_IF_PS_CPM_s_axi_cfg_awid),
        .s_axi_cfg_awlen(pspmc_0_IF_PS_CPM_s_axi_cfg_awlen),
        .s_axi_cfg_awlock(pspmc_0_IF_PS_CPM_s_axi_cfg_awlock),
        .s_axi_cfg_awprot(pspmc_0_IF_PS_CPM_s_axi_cfg_awprot),
        .s_axi_cfg_awqos(pspmc_0_IF_PS_CPM_s_axi_cfg_awqos),
        .s_axi_cfg_awready(pspmc_0_IF_PS_CPM_s_axi_cfg_awready),
        .s_axi_cfg_awregion(pspmc_0_IF_PS_CPM_s_axi_cfg_awregion),
        .s_axi_cfg_awsize(pspmc_0_IF_PS_CPM_s_axi_cfg_awsize),
        .s_axi_cfg_awuser(pspmc_0_IF_PS_CPM_s_axi_cfg_awuser),
        .s_axi_cfg_awvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_awvalid),
        .s_axi_cfg_bid(pspmc_0_IF_PS_CPM_s_axi_cfg_bid),
        .s_axi_cfg_bready(pspmc_0_IF_PS_CPM_s_axi_cfg_bready),
        .s_axi_cfg_bresp(pspmc_0_IF_PS_CPM_s_axi_cfg_bresp),
        .s_axi_cfg_buser(pspmc_0_IF_PS_CPM_s_axi_cfg_buser),
        .s_axi_cfg_bvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_bvalid),
        .s_axi_cfg_rdata(pspmc_0_IF_PS_CPM_s_axi_cfg_rdata),
        .s_axi_cfg_rid(pspmc_0_IF_PS_CPM_s_axi_cfg_rid),
        .s_axi_cfg_rlast(pspmc_0_IF_PS_CPM_s_axi_cfg_rlast),
        .s_axi_cfg_rready(pspmc_0_IF_PS_CPM_s_axi_cfg_rready),
        .s_axi_cfg_rresp(pspmc_0_IF_PS_CPM_s_axi_cfg_rresp),
        .s_axi_cfg_ruser(pspmc_0_IF_PS_CPM_s_axi_cfg_ruser),
        .s_axi_cfg_rvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_rvalid),
        .s_axi_cfg_wdata(pspmc_0_IF_PS_CPM_s_axi_cfg_wdata),
        .s_axi_cfg_wid(pspmc_0_IF_PS_CPM_s_axi_cfg_wid),
        .s_axi_cfg_wlast(pspmc_0_IF_PS_CPM_s_axi_cfg_wlast),
        .s_axi_cfg_wready(pspmc_0_IF_PS_CPM_s_axi_cfg_wready),
        .s_axi_cfg_wstrb(pspmc_0_IF_PS_CPM_s_axi_cfg_wstrb),
        .s_axi_cfg_wuser(pspmc_0_IF_PS_CPM_s_axi_cfg_wuser),
        .s_axi_cfg_wvalid(pspmc_0_IF_PS_CPM_s_axi_cfg_wvalid),
        .s_axi_pcie_araddr(pspmc_0_IF_PS_CPM_s_axi_pcie_araddr),
        .s_axi_pcie_arburst(pspmc_0_IF_PS_CPM_s_axi_pcie_arburst),
        .s_axi_pcie_arcache(pspmc_0_IF_PS_CPM_s_axi_pcie_arcache),
        .s_axi_pcie_arid(pspmc_0_IF_PS_CPM_s_axi_pcie_arid),
        .s_axi_pcie_arlen(pspmc_0_IF_PS_CPM_s_axi_pcie_arlen),
        .s_axi_pcie_arlock(pspmc_0_IF_PS_CPM_s_axi_pcie_arlock),
        .s_axi_pcie_arprot(pspmc_0_IF_PS_CPM_s_axi_pcie_arprot),
        .s_axi_pcie_arqos(pspmc_0_IF_PS_CPM_s_axi_pcie_arqos),
        .s_axi_pcie_arready(pspmc_0_IF_PS_CPM_s_axi_pcie_arready),
        .s_axi_pcie_arregion(pspmc_0_IF_PS_CPM_s_axi_pcie_arregion),
        .s_axi_pcie_arsize(pspmc_0_IF_PS_CPM_s_axi_pcie_arsize),
        .s_axi_pcie_aruser(pspmc_0_IF_PS_CPM_s_axi_pcie_aruser),
        .s_axi_pcie_arvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_arvalid),
        .s_axi_pcie_awaddr(pspmc_0_IF_PS_CPM_s_axi_pcie_awaddr),
        .s_axi_pcie_awburst(pspmc_0_IF_PS_CPM_s_axi_pcie_awburst),
        .s_axi_pcie_awcache(pspmc_0_IF_PS_CPM_s_axi_pcie_awcache),
        .s_axi_pcie_awid(pspmc_0_IF_PS_CPM_s_axi_pcie_awid),
        .s_axi_pcie_awlen(pspmc_0_IF_PS_CPM_s_axi_pcie_awlen),
        .s_axi_pcie_awlock(pspmc_0_IF_PS_CPM_s_axi_pcie_awlock),
        .s_axi_pcie_awprot(pspmc_0_IF_PS_CPM_s_axi_pcie_awprot),
        .s_axi_pcie_awqos(pspmc_0_IF_PS_CPM_s_axi_pcie_awqos),
        .s_axi_pcie_awready(pspmc_0_IF_PS_CPM_s_axi_pcie_awready),
        .s_axi_pcie_awregion(pspmc_0_IF_PS_CPM_s_axi_pcie_awregion),
        .s_axi_pcie_awsize(pspmc_0_IF_PS_CPM_s_axi_pcie_awsize),
        .s_axi_pcie_awuser(pspmc_0_IF_PS_CPM_s_axi_pcie_awuser),
        .s_axi_pcie_awvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_awvalid),
        .s_axi_pcie_bid(pspmc_0_IF_PS_CPM_s_axi_pcie_bid),
        .s_axi_pcie_bready(pspmc_0_IF_PS_CPM_s_axi_pcie_bready),
        .s_axi_pcie_bresp(pspmc_0_IF_PS_CPM_s_axi_pcie_bresp),
        .s_axi_pcie_buser(pspmc_0_IF_PS_CPM_s_axi_pcie_buser),
        .s_axi_pcie_bvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_bvalid),
        .s_axi_pcie_rdata(pspmc_0_IF_PS_CPM_s_axi_pcie_rdata),
        .s_axi_pcie_rid(pspmc_0_IF_PS_CPM_s_axi_pcie_rid),
        .s_axi_pcie_rlast(pspmc_0_IF_PS_CPM_s_axi_pcie_rlast),
        .s_axi_pcie_rready(pspmc_0_IF_PS_CPM_s_axi_pcie_rready),
        .s_axi_pcie_rresp(pspmc_0_IF_PS_CPM_s_axi_pcie_rresp),
        .s_axi_pcie_ruser(pspmc_0_IF_PS_CPM_s_axi_pcie_ruser),
        .s_axi_pcie_rvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_rvalid),
        .s_axi_pcie_wdata(pspmc_0_IF_PS_CPM_s_axi_pcie_wdata),
        .s_axi_pcie_wid(pspmc_0_IF_PS_CPM_s_axi_pcie_wid),
        .s_axi_pcie_wlast(pspmc_0_IF_PS_CPM_s_axi_pcie_wlast),
        .s_axi_pcie_wready(pspmc_0_IF_PS_CPM_s_axi_pcie_wready),
        .s_axi_pcie_wstrb(pspmc_0_IF_PS_CPM_s_axi_pcie_wstrb),
        .s_axi_pcie_wuser(pspmc_0_IF_PS_CPM_s_axi_pcie_wuser),
        .s_axi_pcie_wvalid(pspmc_0_IF_PS_CPM_s_axi_pcie_wvalid),
        .xpipe0_powerdown(pspmc_0_IF_PS_CPM_xpipe0_powerdown),
        .xpipe0_rx_charisk(pspmc_0_IF_PS_CPM_xpipe0_rx_charisk),
        .xpipe0_rx_data(pspmc_0_IF_PS_CPM_xpipe0_rx_data),
        .xpipe0_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe0_rx_datavalid),
        .xpipe0_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe0_rx_elecidle),
        .xpipe0_rx_polarity(pspmc_0_IF_PS_CPM_xpipe0_rx_polarity),
        .xpipe0_rx_startblock(pspmc_0_IF_PS_CPM_xpipe0_rx_startblock),
        .xpipe0_rx_status(pspmc_0_IF_PS_CPM_xpipe0_rx_status),
        .xpipe0_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe0_rx_syncheader),
        .xpipe0_rx_termination(pspmc_0_IF_PS_CPM_xpipe0_rx_termination),
        .xpipe0_rx_valid(pspmc_0_IF_PS_CPM_xpipe0_rx_valid),
        .xpipe0_tx_charisk(pspmc_0_IF_PS_CPM_xpipe0_tx_charisk),
        .xpipe0_tx_compliance(pspmc_0_IF_PS_CPM_xpipe0_tx_compliance),
        .xpipe0_tx_data(pspmc_0_IF_PS_CPM_xpipe0_tx_data),
        .xpipe0_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe0_tx_datavalid),
        .xpipe0_tx_deemph(pspmc_0_IF_PS_CPM_xpipe0_tx_deemph),
        .xpipe0_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe0_tx_detectrxloopback),
        .xpipe0_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe0_tx_elecidle),
        .xpipe0_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe0_tx_maincursor),
        .xpipe0_tx_margin(pspmc_0_IF_PS_CPM_xpipe0_tx_margin),
        .xpipe0_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe0_tx_postcursor),
        .xpipe0_tx_precursor(pspmc_0_IF_PS_CPM_xpipe0_tx_precursor),
        .xpipe0_tx_startblock(pspmc_0_IF_PS_CPM_xpipe0_tx_startblock),
        .xpipe0_tx_swing(pspmc_0_IF_PS_CPM_xpipe0_tx_swing),
        .xpipe0_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe0_tx_syncheader),
        .xpipe10_phystatus(pspmc_0_IF_PS_CPM_xpipe10_phystatus),
        .xpipe10_powerdown(pspmc_0_IF_PS_CPM_xpipe10_powerdown),
        .xpipe10_rx_charisk(pspmc_0_IF_PS_CPM_xpipe10_rx_charisk),
        .xpipe10_rx_data(pspmc_0_IF_PS_CPM_xpipe10_rx_data),
        .xpipe10_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe10_rx_datavalid),
        .xpipe10_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe10_rx_elecidle),
        .xpipe10_rx_polarity(pspmc_0_IF_PS_CPM_xpipe10_rx_polarity),
        .xpipe10_rx_startblock(pspmc_0_IF_PS_CPM_xpipe10_rx_startblock),
        .xpipe10_rx_status(pspmc_0_IF_PS_CPM_xpipe10_rx_status),
        .xpipe10_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe10_rx_syncheader),
        .xpipe10_rx_termination(pspmc_0_IF_PS_CPM_xpipe10_rx_termination),
        .xpipe10_rx_valid(pspmc_0_IF_PS_CPM_xpipe10_rx_valid),
        .xpipe10_tx_charisk(pspmc_0_IF_PS_CPM_xpipe10_tx_charisk),
        .xpipe10_tx_compliance(pspmc_0_IF_PS_CPM_xpipe10_tx_compliance),
        .xpipe10_tx_data(pspmc_0_IF_PS_CPM_xpipe10_tx_data),
        .xpipe10_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe10_tx_datavalid),
        .xpipe10_tx_deemph(pspmc_0_IF_PS_CPM_xpipe10_tx_deemph),
        .xpipe10_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe10_tx_detectrxloopback),
        .xpipe10_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe10_tx_elecidle),
        .xpipe10_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe10_tx_maincursor),
        .xpipe10_tx_margin(pspmc_0_IF_PS_CPM_xpipe10_tx_margin),
        .xpipe10_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe10_tx_postcursor),
        .xpipe10_tx_precursor(pspmc_0_IF_PS_CPM_xpipe10_tx_precursor),
        .xpipe10_tx_startblock(pspmc_0_IF_PS_CPM_xpipe10_tx_startblock),
        .xpipe10_tx_swing(pspmc_0_IF_PS_CPM_xpipe10_tx_swing),
        .xpipe10_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe10_tx_syncheader),
        .xpipe11_phystatus(pspmc_0_IF_PS_CPM_xpipe11_phystatus),
        .xpipe11_powerdown(pspmc_0_IF_PS_CPM_xpipe11_powerdown),
        .xpipe11_rx_charisk(pspmc_0_IF_PS_CPM_xpipe11_rx_charisk),
        .xpipe11_rx_data(pspmc_0_IF_PS_CPM_xpipe11_rx_data),
        .xpipe11_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe11_rx_datavalid),
        .xpipe11_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe11_rx_elecidle),
        .xpipe11_rx_polarity(pspmc_0_IF_PS_CPM_xpipe11_rx_polarity),
        .xpipe11_rx_startblock(pspmc_0_IF_PS_CPM_xpipe11_rx_startblock),
        .xpipe11_rx_status(pspmc_0_IF_PS_CPM_xpipe11_rx_status),
        .xpipe11_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe11_rx_syncheader),
        .xpipe11_rx_termination(pspmc_0_IF_PS_CPM_xpipe11_rx_termination),
        .xpipe11_rx_valid(pspmc_0_IF_PS_CPM_xpipe11_rx_valid),
        .xpipe11_tx_charisk(pspmc_0_IF_PS_CPM_xpipe11_tx_charisk),
        .xpipe11_tx_compliance(pspmc_0_IF_PS_CPM_xpipe11_tx_compliance),
        .xpipe11_tx_data(pspmc_0_IF_PS_CPM_xpipe11_tx_data),
        .xpipe11_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe11_tx_datavalid),
        .xpipe11_tx_deemph(pspmc_0_IF_PS_CPM_xpipe11_tx_deemph),
        .xpipe11_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe11_tx_detectrxloopback),
        .xpipe11_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe11_tx_elecidle),
        .xpipe11_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe11_tx_maincursor),
        .xpipe11_tx_margin(pspmc_0_IF_PS_CPM_xpipe11_tx_margin),
        .xpipe11_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe11_tx_postcursor),
        .xpipe11_tx_precursor(pspmc_0_IF_PS_CPM_xpipe11_tx_precursor),
        .xpipe11_tx_startblock(pspmc_0_IF_PS_CPM_xpipe11_tx_startblock),
        .xpipe11_tx_swing(pspmc_0_IF_PS_CPM_xpipe11_tx_swing),
        .xpipe11_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe11_tx_syncheader),
        .xpipe12_phystatus(pspmc_0_IF_PS_CPM_xpipe12_phystatus),
        .xpipe12_powerdown(pspmc_0_IF_PS_CPM_xpipe12_powerdown),
        .xpipe12_rx_charisk(pspmc_0_IF_PS_CPM_xpipe12_rx_charisk),
        .xpipe12_rx_data(pspmc_0_IF_PS_CPM_xpipe12_rx_data),
        .xpipe12_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe12_rx_datavalid),
        .xpipe12_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe12_rx_elecidle),
        .xpipe12_rx_polarity(pspmc_0_IF_PS_CPM_xpipe12_rx_polarity),
        .xpipe12_rx_startblock(pspmc_0_IF_PS_CPM_xpipe12_rx_startblock),
        .xpipe12_rx_status(pspmc_0_IF_PS_CPM_xpipe12_rx_status),
        .xpipe12_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe12_rx_syncheader),
        .xpipe12_rx_termination(pspmc_0_IF_PS_CPM_xpipe12_rx_termination),
        .xpipe12_rx_valid(pspmc_0_IF_PS_CPM_xpipe12_rx_valid),
        .xpipe12_tx_charisk(pspmc_0_IF_PS_CPM_xpipe12_tx_charisk),
        .xpipe12_tx_compliance(pspmc_0_IF_PS_CPM_xpipe12_tx_compliance),
        .xpipe12_tx_data(pspmc_0_IF_PS_CPM_xpipe12_tx_data),
        .xpipe12_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe12_tx_datavalid),
        .xpipe12_tx_deemph(pspmc_0_IF_PS_CPM_xpipe12_tx_deemph),
        .xpipe12_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe12_tx_detectrxloopback),
        .xpipe12_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe12_tx_elecidle),
        .xpipe12_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe12_tx_maincursor),
        .xpipe12_tx_margin(pspmc_0_IF_PS_CPM_xpipe12_tx_margin),
        .xpipe12_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe12_tx_postcursor),
        .xpipe12_tx_precursor(pspmc_0_IF_PS_CPM_xpipe12_tx_precursor),
        .xpipe12_tx_startblock(pspmc_0_IF_PS_CPM_xpipe12_tx_startblock),
        .xpipe12_tx_swing(pspmc_0_IF_PS_CPM_xpipe12_tx_swing),
        .xpipe12_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe12_tx_syncheader),
        .xpipe13_phystatus(pspmc_0_IF_PS_CPM_xpipe13_phystatus),
        .xpipe13_powerdown(pspmc_0_IF_PS_CPM_xpipe13_powerdown),
        .xpipe13_rx_charisk(pspmc_0_IF_PS_CPM_xpipe13_rx_charisk),
        .xpipe13_rx_data(pspmc_0_IF_PS_CPM_xpipe13_rx_data),
        .xpipe13_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe13_rx_datavalid),
        .xpipe13_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe13_rx_elecidle),
        .xpipe13_rx_polarity(pspmc_0_IF_PS_CPM_xpipe13_rx_polarity),
        .xpipe13_rx_startblock(pspmc_0_IF_PS_CPM_xpipe13_rx_startblock),
        .xpipe13_rx_status(pspmc_0_IF_PS_CPM_xpipe13_rx_status),
        .xpipe13_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe13_rx_syncheader),
        .xpipe13_rx_termination(pspmc_0_IF_PS_CPM_xpipe13_rx_termination),
        .xpipe13_rx_valid(pspmc_0_IF_PS_CPM_xpipe13_rx_valid),
        .xpipe13_tx_charisk(pspmc_0_IF_PS_CPM_xpipe13_tx_charisk),
        .xpipe13_tx_compliance(pspmc_0_IF_PS_CPM_xpipe13_tx_compliance),
        .xpipe13_tx_data(pspmc_0_IF_PS_CPM_xpipe13_tx_data),
        .xpipe13_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe13_tx_datavalid),
        .xpipe13_tx_deemph(pspmc_0_IF_PS_CPM_xpipe13_tx_deemph),
        .xpipe13_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe13_tx_detectrxloopback),
        .xpipe13_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe13_tx_elecidle),
        .xpipe13_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe13_tx_maincursor),
        .xpipe13_tx_margin(pspmc_0_IF_PS_CPM_xpipe13_tx_margin),
        .xpipe13_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe13_tx_postcursor),
        .xpipe13_tx_precursor(pspmc_0_IF_PS_CPM_xpipe13_tx_precursor),
        .xpipe13_tx_startblock(pspmc_0_IF_PS_CPM_xpipe13_tx_startblock),
        .xpipe13_tx_swing(pspmc_0_IF_PS_CPM_xpipe13_tx_swing),
        .xpipe13_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe13_tx_syncheader),
        .xpipe14_phystatus(pspmc_0_IF_PS_CPM_xpipe14_phystatus),
        .xpipe14_powerdown(pspmc_0_IF_PS_CPM_xpipe14_powerdown),
        .xpipe14_rx_charisk(pspmc_0_IF_PS_CPM_xpipe14_rx_charisk),
        .xpipe14_rx_data(pspmc_0_IF_PS_CPM_xpipe14_rx_data),
        .xpipe14_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe14_rx_datavalid),
        .xpipe14_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe14_rx_elecidle),
        .xpipe14_rx_polarity(pspmc_0_IF_PS_CPM_xpipe14_rx_polarity),
        .xpipe14_rx_startblock(pspmc_0_IF_PS_CPM_xpipe14_rx_startblock),
        .xpipe14_rx_status(pspmc_0_IF_PS_CPM_xpipe14_rx_status),
        .xpipe14_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe14_rx_syncheader),
        .xpipe14_rx_termination(pspmc_0_IF_PS_CPM_xpipe14_rx_termination),
        .xpipe14_rx_valid(pspmc_0_IF_PS_CPM_xpipe14_rx_valid),
        .xpipe14_tx_charisk(pspmc_0_IF_PS_CPM_xpipe14_tx_charisk),
        .xpipe14_tx_compliance(pspmc_0_IF_PS_CPM_xpipe14_tx_compliance),
        .xpipe14_tx_data(pspmc_0_IF_PS_CPM_xpipe14_tx_data),
        .xpipe14_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe14_tx_datavalid),
        .xpipe14_tx_deemph(pspmc_0_IF_PS_CPM_xpipe14_tx_deemph),
        .xpipe14_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe14_tx_detectrxloopback),
        .xpipe14_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe14_tx_elecidle),
        .xpipe14_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe14_tx_maincursor),
        .xpipe14_tx_margin(pspmc_0_IF_PS_CPM_xpipe14_tx_margin),
        .xpipe14_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe14_tx_postcursor),
        .xpipe14_tx_precursor(pspmc_0_IF_PS_CPM_xpipe14_tx_precursor),
        .xpipe14_tx_startblock(pspmc_0_IF_PS_CPM_xpipe14_tx_startblock),
        .xpipe14_tx_swing(pspmc_0_IF_PS_CPM_xpipe14_tx_swing),
        .xpipe14_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe14_tx_syncheader),
        .xpipe15_phystatus(pspmc_0_IF_PS_CPM_xpipe15_phystatus),
        .xpipe15_powerdown(pspmc_0_IF_PS_CPM_xpipe15_powerdown),
        .xpipe15_rx_charisk(pspmc_0_IF_PS_CPM_xpipe15_rx_charisk),
        .xpipe15_rx_data(pspmc_0_IF_PS_CPM_xpipe15_rx_data),
        .xpipe15_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe15_rx_datavalid),
        .xpipe15_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe15_rx_elecidle),
        .xpipe15_rx_polarity(pspmc_0_IF_PS_CPM_xpipe15_rx_polarity),
        .xpipe15_rx_startblock(pspmc_0_IF_PS_CPM_xpipe15_rx_startblock),
        .xpipe15_rx_status(pspmc_0_IF_PS_CPM_xpipe15_rx_status),
        .xpipe15_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe15_rx_syncheader),
        .xpipe15_rx_termination(pspmc_0_IF_PS_CPM_xpipe15_rx_termination),
        .xpipe15_rx_valid(pspmc_0_IF_PS_CPM_xpipe15_rx_valid),
        .xpipe15_tx_charisk(pspmc_0_IF_PS_CPM_xpipe15_tx_charisk),
        .xpipe15_tx_compliance(pspmc_0_IF_PS_CPM_xpipe15_tx_compliance),
        .xpipe15_tx_data(pspmc_0_IF_PS_CPM_xpipe15_tx_data),
        .xpipe15_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe15_tx_datavalid),
        .xpipe15_tx_deemph(pspmc_0_IF_PS_CPM_xpipe15_tx_deemph),
        .xpipe15_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe15_tx_detectrxloopback),
        .xpipe15_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe15_tx_elecidle),
        .xpipe15_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe15_tx_maincursor),
        .xpipe15_tx_margin(pspmc_0_IF_PS_CPM_xpipe15_tx_margin),
        .xpipe15_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe15_tx_postcursor),
        .xpipe15_tx_precursor(pspmc_0_IF_PS_CPM_xpipe15_tx_precursor),
        .xpipe15_tx_startblock(pspmc_0_IF_PS_CPM_xpipe15_tx_startblock),
        .xpipe15_tx_swing(pspmc_0_IF_PS_CPM_xpipe15_tx_swing),
        .xpipe15_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe15_tx_syncheader),
        .xpipe1_phystatus(pspmc_0_IF_PS_CPM_xpipe1_phystatus),
        .xpipe1_powerdown(pspmc_0_IF_PS_CPM_xpipe1_powerdown),
        .xpipe1_rx_charisk(pspmc_0_IF_PS_CPM_xpipe1_rx_charisk),
        .xpipe1_rx_data(pspmc_0_IF_PS_CPM_xpipe1_rx_data),
        .xpipe1_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe1_rx_datavalid),
        .xpipe1_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe1_rx_elecidle),
        .xpipe1_rx_polarity(pspmc_0_IF_PS_CPM_xpipe1_rx_polarity),
        .xpipe1_rx_startblock(pspmc_0_IF_PS_CPM_xpipe1_rx_startblock),
        .xpipe1_rx_status(pspmc_0_IF_PS_CPM_xpipe1_rx_status),
        .xpipe1_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe1_rx_syncheader),
        .xpipe1_rx_termination(pspmc_0_IF_PS_CPM_xpipe1_rx_termination),
        .xpipe1_rx_valid(pspmc_0_IF_PS_CPM_xpipe1_rx_valid),
        .xpipe1_tx_charisk(pspmc_0_IF_PS_CPM_xpipe1_tx_charisk),
        .xpipe1_tx_compliance(pspmc_0_IF_PS_CPM_xpipe1_tx_compliance),
        .xpipe1_tx_data(pspmc_0_IF_PS_CPM_xpipe1_tx_data),
        .xpipe1_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe1_tx_datavalid),
        .xpipe1_tx_deemph(pspmc_0_IF_PS_CPM_xpipe1_tx_deemph),
        .xpipe1_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe1_tx_detectrxloopback),
        .xpipe1_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe1_tx_elecidle),
        .xpipe1_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe1_tx_maincursor),
        .xpipe1_tx_margin(pspmc_0_IF_PS_CPM_xpipe1_tx_margin),
        .xpipe1_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe1_tx_postcursor),
        .xpipe1_tx_precursor(pspmc_0_IF_PS_CPM_xpipe1_tx_precursor),
        .xpipe1_tx_startblock(pspmc_0_IF_PS_CPM_xpipe1_tx_startblock),
        .xpipe1_tx_swing(pspmc_0_IF_PS_CPM_xpipe1_tx_swing),
        .xpipe1_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe1_tx_syncheader),
        .xpipe2_phystatus(pspmc_0_IF_PS_CPM_xpipe2_phystatus),
        .xpipe2_powerdown(pspmc_0_IF_PS_CPM_xpipe2_powerdown),
        .xpipe2_rx_charisk(pspmc_0_IF_PS_CPM_xpipe2_rx_charisk),
        .xpipe2_rx_data(pspmc_0_IF_PS_CPM_xpipe2_rx_data),
        .xpipe2_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe2_rx_datavalid),
        .xpipe2_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe2_rx_elecidle),
        .xpipe2_rx_polarity(pspmc_0_IF_PS_CPM_xpipe2_rx_polarity),
        .xpipe2_rx_startblock(pspmc_0_IF_PS_CPM_xpipe2_rx_startblock),
        .xpipe2_rx_status(pspmc_0_IF_PS_CPM_xpipe2_rx_status),
        .xpipe2_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe2_rx_syncheader),
        .xpipe2_rx_termination(pspmc_0_IF_PS_CPM_xpipe2_rx_termination),
        .xpipe2_rx_valid(pspmc_0_IF_PS_CPM_xpipe2_rx_valid),
        .xpipe2_tx_charisk(pspmc_0_IF_PS_CPM_xpipe2_tx_charisk),
        .xpipe2_tx_compliance(pspmc_0_IF_PS_CPM_xpipe2_tx_compliance),
        .xpipe2_tx_data(pspmc_0_IF_PS_CPM_xpipe2_tx_data),
        .xpipe2_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe2_tx_datavalid),
        .xpipe2_tx_deemph(pspmc_0_IF_PS_CPM_xpipe2_tx_deemph),
        .xpipe2_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe2_tx_detectrxloopback),
        .xpipe2_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe2_tx_elecidle),
        .xpipe2_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe2_tx_maincursor),
        .xpipe2_tx_margin(pspmc_0_IF_PS_CPM_xpipe2_tx_margin),
        .xpipe2_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe2_tx_postcursor),
        .xpipe2_tx_precursor(pspmc_0_IF_PS_CPM_xpipe2_tx_precursor),
        .xpipe2_tx_startblock(pspmc_0_IF_PS_CPM_xpipe2_tx_startblock),
        .xpipe2_tx_swing(pspmc_0_IF_PS_CPM_xpipe2_tx_swing),
        .xpipe2_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe2_tx_syncheader),
        .xpipe3_phystatus(pspmc_0_IF_PS_CPM_xpipe3_phystatus),
        .xpipe3_powerdown(pspmc_0_IF_PS_CPM_xpipe3_powerdown),
        .xpipe3_rx_charisk(pspmc_0_IF_PS_CPM_xpipe3_rx_charisk),
        .xpipe3_rx_data(pspmc_0_IF_PS_CPM_xpipe3_rx_data),
        .xpipe3_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe3_rx_datavalid),
        .xpipe3_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe3_rx_elecidle),
        .xpipe3_rx_polarity(pspmc_0_IF_PS_CPM_xpipe3_rx_polarity),
        .xpipe3_rx_startblock(pspmc_0_IF_PS_CPM_xpipe3_rx_startblock),
        .xpipe3_rx_status(pspmc_0_IF_PS_CPM_xpipe3_rx_status),
        .xpipe3_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe3_rx_syncheader),
        .xpipe3_rx_termination(pspmc_0_IF_PS_CPM_xpipe3_rx_termination),
        .xpipe3_rx_valid(pspmc_0_IF_PS_CPM_xpipe3_rx_valid),
        .xpipe3_tx_charisk(pspmc_0_IF_PS_CPM_xpipe3_tx_charisk),
        .xpipe3_tx_compliance(pspmc_0_IF_PS_CPM_xpipe3_tx_compliance),
        .xpipe3_tx_data(pspmc_0_IF_PS_CPM_xpipe3_tx_data),
        .xpipe3_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe3_tx_datavalid),
        .xpipe3_tx_deemph(pspmc_0_IF_PS_CPM_xpipe3_tx_deemph),
        .xpipe3_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe3_tx_detectrxloopback),
        .xpipe3_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe3_tx_elecidle),
        .xpipe3_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe3_tx_maincursor),
        .xpipe3_tx_margin(pspmc_0_IF_PS_CPM_xpipe3_tx_margin),
        .xpipe3_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe3_tx_postcursor),
        .xpipe3_tx_precursor(pspmc_0_IF_PS_CPM_xpipe3_tx_precursor),
        .xpipe3_tx_startblock(pspmc_0_IF_PS_CPM_xpipe3_tx_startblock),
        .xpipe3_tx_swing(pspmc_0_IF_PS_CPM_xpipe3_tx_swing),
        .xpipe3_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe3_tx_syncheader),
        .xpipe4_phystatus(pspmc_0_IF_PS_CPM_xpipe4_phystatus),
        .xpipe4_powerdown(pspmc_0_IF_PS_CPM_xpipe4_powerdown),
        .xpipe4_rx_charisk(pspmc_0_IF_PS_CPM_xpipe4_rx_charisk),
        .xpipe4_rx_data(pspmc_0_IF_PS_CPM_xpipe4_rx_data),
        .xpipe4_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe4_rx_datavalid),
        .xpipe4_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe4_rx_elecidle),
        .xpipe4_rx_polarity(pspmc_0_IF_PS_CPM_xpipe4_rx_polarity),
        .xpipe4_rx_startblock(pspmc_0_IF_PS_CPM_xpipe4_rx_startblock),
        .xpipe4_rx_status(pspmc_0_IF_PS_CPM_xpipe4_rx_status),
        .xpipe4_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe4_rx_syncheader),
        .xpipe4_rx_termination(pspmc_0_IF_PS_CPM_xpipe4_rx_termination),
        .xpipe4_rx_valid(pspmc_0_IF_PS_CPM_xpipe4_rx_valid),
        .xpipe4_tx_charisk(pspmc_0_IF_PS_CPM_xpipe4_tx_charisk),
        .xpipe4_tx_compliance(pspmc_0_IF_PS_CPM_xpipe4_tx_compliance),
        .xpipe4_tx_data(pspmc_0_IF_PS_CPM_xpipe4_tx_data),
        .xpipe4_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe4_tx_datavalid),
        .xpipe4_tx_deemph(pspmc_0_IF_PS_CPM_xpipe4_tx_deemph),
        .xpipe4_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe4_tx_detectrxloopback),
        .xpipe4_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe4_tx_elecidle),
        .xpipe4_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe4_tx_maincursor),
        .xpipe4_tx_margin(pspmc_0_IF_PS_CPM_xpipe4_tx_margin),
        .xpipe4_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe4_tx_postcursor),
        .xpipe4_tx_precursor(pspmc_0_IF_PS_CPM_xpipe4_tx_precursor),
        .xpipe4_tx_startblock(pspmc_0_IF_PS_CPM_xpipe4_tx_startblock),
        .xpipe4_tx_swing(pspmc_0_IF_PS_CPM_xpipe4_tx_swing),
        .xpipe4_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe4_tx_syncheader),
        .xpipe5_phystatus(pspmc_0_IF_PS_CPM_xpipe5_phystatus),
        .xpipe5_powerdown(pspmc_0_IF_PS_CPM_xpipe5_powerdown),
        .xpipe5_rx_charisk(pspmc_0_IF_PS_CPM_xpipe5_rx_charisk),
        .xpipe5_rx_data(pspmc_0_IF_PS_CPM_xpipe5_rx_data),
        .xpipe5_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe5_rx_datavalid),
        .xpipe5_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe5_rx_elecidle),
        .xpipe5_rx_polarity(pspmc_0_IF_PS_CPM_xpipe5_rx_polarity),
        .xpipe5_rx_startblock(pspmc_0_IF_PS_CPM_xpipe5_rx_startblock),
        .xpipe5_rx_status(pspmc_0_IF_PS_CPM_xpipe5_rx_status),
        .xpipe5_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe5_rx_syncheader),
        .xpipe5_rx_termination(pspmc_0_IF_PS_CPM_xpipe5_rx_termination),
        .xpipe5_rx_valid(pspmc_0_IF_PS_CPM_xpipe5_rx_valid),
        .xpipe5_tx_charisk(pspmc_0_IF_PS_CPM_xpipe5_tx_charisk),
        .xpipe5_tx_compliance(pspmc_0_IF_PS_CPM_xpipe5_tx_compliance),
        .xpipe5_tx_data(pspmc_0_IF_PS_CPM_xpipe5_tx_data),
        .xpipe5_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe5_tx_datavalid),
        .xpipe5_tx_deemph(pspmc_0_IF_PS_CPM_xpipe5_tx_deemph),
        .xpipe5_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe5_tx_detectrxloopback),
        .xpipe5_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe5_tx_elecidle),
        .xpipe5_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe5_tx_maincursor),
        .xpipe5_tx_margin(pspmc_0_IF_PS_CPM_xpipe5_tx_margin),
        .xpipe5_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe5_tx_postcursor),
        .xpipe5_tx_precursor(pspmc_0_IF_PS_CPM_xpipe5_tx_precursor),
        .xpipe5_tx_startblock(pspmc_0_IF_PS_CPM_xpipe5_tx_startblock),
        .xpipe5_tx_swing(pspmc_0_IF_PS_CPM_xpipe5_tx_swing),
        .xpipe5_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe5_tx_syncheader),
        .xpipe6_phystatus(pspmc_0_IF_PS_CPM_xpipe6_phystatus),
        .xpipe6_powerdown(pspmc_0_IF_PS_CPM_xpipe6_powerdown),
        .xpipe6_rx_charisk(pspmc_0_IF_PS_CPM_xpipe6_rx_charisk),
        .xpipe6_rx_data(pspmc_0_IF_PS_CPM_xpipe6_rx_data),
        .xpipe6_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe6_rx_datavalid),
        .xpipe6_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe6_rx_elecidle),
        .xpipe6_rx_polarity(pspmc_0_IF_PS_CPM_xpipe6_rx_polarity),
        .xpipe6_rx_startblock(pspmc_0_IF_PS_CPM_xpipe6_rx_startblock),
        .xpipe6_rx_status(pspmc_0_IF_PS_CPM_xpipe6_rx_status),
        .xpipe6_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe6_rx_syncheader),
        .xpipe6_rx_termination(pspmc_0_IF_PS_CPM_xpipe6_rx_termination),
        .xpipe6_rx_valid(pspmc_0_IF_PS_CPM_xpipe6_rx_valid),
        .xpipe6_tx_charisk(pspmc_0_IF_PS_CPM_xpipe6_tx_charisk),
        .xpipe6_tx_compliance(pspmc_0_IF_PS_CPM_xpipe6_tx_compliance),
        .xpipe6_tx_data(pspmc_0_IF_PS_CPM_xpipe6_tx_data),
        .xpipe6_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe6_tx_datavalid),
        .xpipe6_tx_deemph(pspmc_0_IF_PS_CPM_xpipe6_tx_deemph),
        .xpipe6_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe6_tx_detectrxloopback),
        .xpipe6_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe6_tx_elecidle),
        .xpipe6_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe6_tx_maincursor),
        .xpipe6_tx_margin(pspmc_0_IF_PS_CPM_xpipe6_tx_margin),
        .xpipe6_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe6_tx_postcursor),
        .xpipe6_tx_precursor(pspmc_0_IF_PS_CPM_xpipe6_tx_precursor),
        .xpipe6_tx_startblock(pspmc_0_IF_PS_CPM_xpipe6_tx_startblock),
        .xpipe6_tx_swing(pspmc_0_IF_PS_CPM_xpipe6_tx_swing),
        .xpipe6_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe6_tx_syncheader),
        .xpipe7_phystatus(pspmc_0_IF_PS_CPM_xpipe7_phystatus),
        .xpipe7_powerdown(pspmc_0_IF_PS_CPM_xpipe7_powerdown),
        .xpipe7_rx_charisk(pspmc_0_IF_PS_CPM_xpipe7_rx_charisk),
        .xpipe7_rx_data(pspmc_0_IF_PS_CPM_xpipe7_rx_data),
        .xpipe7_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe7_rx_datavalid),
        .xpipe7_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe7_rx_elecidle),
        .xpipe7_rx_polarity(pspmc_0_IF_PS_CPM_xpipe7_rx_polarity),
        .xpipe7_rx_startblock(pspmc_0_IF_PS_CPM_xpipe7_rx_startblock),
        .xpipe7_rx_status(pspmc_0_IF_PS_CPM_xpipe7_rx_status),
        .xpipe7_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe7_rx_syncheader),
        .xpipe7_rx_termination(pspmc_0_IF_PS_CPM_xpipe7_rx_termination),
        .xpipe7_rx_valid(pspmc_0_IF_PS_CPM_xpipe7_rx_valid),
        .xpipe7_tx_charisk(pspmc_0_IF_PS_CPM_xpipe7_tx_charisk),
        .xpipe7_tx_compliance(pspmc_0_IF_PS_CPM_xpipe7_tx_compliance),
        .xpipe7_tx_data(pspmc_0_IF_PS_CPM_xpipe7_tx_data),
        .xpipe7_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe7_tx_datavalid),
        .xpipe7_tx_deemph(pspmc_0_IF_PS_CPM_xpipe7_tx_deemph),
        .xpipe7_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe7_tx_detectrxloopback),
        .xpipe7_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe7_tx_elecidle),
        .xpipe7_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe7_tx_maincursor),
        .xpipe7_tx_margin(pspmc_0_IF_PS_CPM_xpipe7_tx_margin),
        .xpipe7_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe7_tx_postcursor),
        .xpipe7_tx_precursor(pspmc_0_IF_PS_CPM_xpipe7_tx_precursor),
        .xpipe7_tx_startblock(pspmc_0_IF_PS_CPM_xpipe7_tx_startblock),
        .xpipe7_tx_swing(pspmc_0_IF_PS_CPM_xpipe7_tx_swing),
        .xpipe7_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe7_tx_syncheader),
        .xpipe8_phystatus(pspmc_0_IF_PS_CPM_xpipe8_phystatus),
        .xpipe8_powerdown(pspmc_0_IF_PS_CPM_xpipe8_powerdown),
        .xpipe8_rx_charisk(pspmc_0_IF_PS_CPM_xpipe8_rx_charisk),
        .xpipe8_rx_data(pspmc_0_IF_PS_CPM_xpipe8_rx_data),
        .xpipe8_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe8_rx_datavalid),
        .xpipe8_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe8_rx_elecidle),
        .xpipe8_rx_polarity(pspmc_0_IF_PS_CPM_xpipe8_rx_polarity),
        .xpipe8_rx_startblock(pspmc_0_IF_PS_CPM_xpipe8_rx_startblock),
        .xpipe8_rx_status(pspmc_0_IF_PS_CPM_xpipe8_rx_status),
        .xpipe8_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe8_rx_syncheader),
        .xpipe8_rx_termination(pspmc_0_IF_PS_CPM_xpipe8_rx_termination),
        .xpipe8_rx_valid(pspmc_0_IF_PS_CPM_xpipe8_rx_valid),
        .xpipe8_tx_charisk(pspmc_0_IF_PS_CPM_xpipe8_tx_charisk),
        .xpipe8_tx_compliance(pspmc_0_IF_PS_CPM_xpipe8_tx_compliance),
        .xpipe8_tx_data(pspmc_0_IF_PS_CPM_xpipe8_tx_data),
        .xpipe8_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe8_tx_datavalid),
        .xpipe8_tx_deemph(pspmc_0_IF_PS_CPM_xpipe8_tx_deemph),
        .xpipe8_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe8_tx_detectrxloopback),
        .xpipe8_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe8_tx_elecidle),
        .xpipe8_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe8_tx_maincursor),
        .xpipe8_tx_margin(pspmc_0_IF_PS_CPM_xpipe8_tx_margin),
        .xpipe8_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe8_tx_postcursor),
        .xpipe8_tx_precursor(pspmc_0_IF_PS_CPM_xpipe8_tx_precursor),
        .xpipe8_tx_startblock(pspmc_0_IF_PS_CPM_xpipe8_tx_startblock),
        .xpipe8_tx_swing(pspmc_0_IF_PS_CPM_xpipe8_tx_swing),
        .xpipe8_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe8_tx_syncheader),
        .xpipe9_phystatus(pspmc_0_IF_PS_CPM_xpipe9_phystatus),
        .xpipe9_powerdown(pspmc_0_IF_PS_CPM_xpipe9_powerdown),
        .xpipe9_rx_charisk(pspmc_0_IF_PS_CPM_xpipe9_rx_charisk),
        .xpipe9_rx_data(pspmc_0_IF_PS_CPM_xpipe9_rx_data),
        .xpipe9_rx_datavalid(pspmc_0_IF_PS_CPM_xpipe9_rx_datavalid),
        .xpipe9_rx_elecidle(pspmc_0_IF_PS_CPM_xpipe9_rx_elecidle),
        .xpipe9_rx_polarity(pspmc_0_IF_PS_CPM_xpipe9_rx_polarity),
        .xpipe9_rx_startblock(pspmc_0_IF_PS_CPM_xpipe9_rx_startblock),
        .xpipe9_rx_status(pspmc_0_IF_PS_CPM_xpipe9_rx_status),
        .xpipe9_rx_syncheader(pspmc_0_IF_PS_CPM_xpipe9_rx_syncheader),
        .xpipe9_rx_termination(pspmc_0_IF_PS_CPM_xpipe9_rx_termination),
        .xpipe9_rx_valid(pspmc_0_IF_PS_CPM_xpipe9_rx_valid),
        .xpipe9_tx_charisk(pspmc_0_IF_PS_CPM_xpipe9_tx_charisk),
        .xpipe9_tx_compliance(pspmc_0_IF_PS_CPM_xpipe9_tx_compliance),
        .xpipe9_tx_data(pspmc_0_IF_PS_CPM_xpipe9_tx_data),
        .xpipe9_tx_datavalid(pspmc_0_IF_PS_CPM_xpipe9_tx_datavalid),
        .xpipe9_tx_deemph(pspmc_0_IF_PS_CPM_xpipe9_tx_deemph),
        .xpipe9_tx_detectrxloopback(pspmc_0_IF_PS_CPM_xpipe9_tx_detectrxloopback),
        .xpipe9_tx_elecidle(pspmc_0_IF_PS_CPM_xpipe9_tx_elecidle),
        .xpipe9_tx_maincursor(pspmc_0_IF_PS_CPM_xpipe9_tx_maincursor),
        .xpipe9_tx_margin(pspmc_0_IF_PS_CPM_xpipe9_tx_margin),
        .xpipe9_tx_postcursor(pspmc_0_IF_PS_CPM_xpipe9_tx_postcursor),
        .xpipe9_tx_precursor(pspmc_0_IF_PS_CPM_xpipe9_tx_precursor),
        .xpipe9_tx_startblock(pspmc_0_IF_PS_CPM_xpipe9_tx_startblock),
        .xpipe9_tx_swing(pspmc_0_IF_PS_CPM_xpipe9_tx_swing),
        .xpipe9_tx_syncheader(pspmc_0_IF_PS_CPM_xpipe9_tx_syncheader),
        .xpipe_q0_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_ack),
        .xpipe_q0_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_cmd),
        .xpipe_q0_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_lanenum),
        .xpipe_q0_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_payload),
        .xpipe_q0_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_req_req),
        .xpipe_q0_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_ack),
        .xpipe_q0_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_cmd),
        .xpipe_q0_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_lanenum),
        .xpipe_q0_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_payload),
        .xpipe_q0_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q0_rxmargin_res_req),
        .xpipe_q1_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_ack),
        .xpipe_q1_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_cmd),
        .xpipe_q1_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_lanenum),
        .xpipe_q1_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_payload),
        .xpipe_q1_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_req_req),
        .xpipe_q1_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_ack),
        .xpipe_q1_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_cmd),
        .xpipe_q1_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_lanenum),
        .xpipe_q1_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_payload),
        .xpipe_q1_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q1_rxmargin_res_req),
        .xpipe_q2_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_ack),
        .xpipe_q2_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_cmd),
        .xpipe_q2_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_lanenum),
        .xpipe_q2_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_payload),
        .xpipe_q2_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_req_req),
        .xpipe_q2_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_ack),
        .xpipe_q2_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_cmd),
        .xpipe_q2_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_lanenum),
        .xpipe_q2_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_payload),
        .xpipe_q2_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q2_rxmargin_res_req),
        .xpipe_q3_rxmargin_req_ack(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_ack),
        .xpipe_q3_rxmargin_req_cmd(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_cmd),
        .xpipe_q3_rxmargin_req_lanenum(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_lanenum),
        .xpipe_q3_rxmargin_req_payload(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_payload),
        .xpipe_q3_rxmargin_req_req(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_req_req),
        .xpipe_q3_rxmargin_res_ack(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_ack),
        .xpipe_q3_rxmargin_res_cmd(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_cmd),
        .xpipe_q3_rxmargin_res_lanenum(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_lanenum),
        .xpipe_q3_rxmargin_res_payload(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_payload),
        .xpipe_q3_rxmargin_res_req(pspmc_0_IF_PS_CPM_xpipe_q3_rxmargin_res_req));
endmodule
