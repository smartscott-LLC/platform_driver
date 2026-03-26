
 
 
 
 
 
 
 


// (c) Copyright 2023-2024 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
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

#if defined(XILINX_SIMULATOR)// || defined(SC_ALD_EXT) || defined(XM_SYSTEMC) || defined(VCSSYSTEMC) || defined(MTI_SYSTEMC)
#define ENABLE_SIM_QDMA
#endif

#define MM_STUB_INTF_INIT(intf_type, intf_name, stub_type) \
    if(!intf_name)                                 \
    {                                              \
        stub_type.push_back(new xtlm::xtlm_aximm_initiator_stub("intf_type##_wr_stub", 128)); \
        stub_type.back()->initiator_socket(*intf_name); \
    }

#define MM_STUB_INTF_TARG(intf_type, intf_name, stub_type) \
    if(!intf_name)                                 \
    {                                              \
       stub_type.push_back(new xtlm::xtlm_aximm_target_stub("intf_type##_wr_stub", 128)); \
       intf_name->bind(stub_type.back()->target_socket);        \
    }
#define S_STUB_INTF_INIT(intf_type, intf_name, stub_type) \
    if(!intf_name)                                 \
    {                                              \
        stub_type.push_back(new xtlm::xtlm_axis_initiator_stub("intf_type##_wr_stub", 128)); \
        stub_type.back()->initiator_socket(*intf_name); \
    }

#define S_STUB_INTF_TARG(intf_type, intf_name, stub_type) \
    if(!intf_name)                                 \
    {                                              \
       stub_type.push_back(new xtlm::xtlm_axis_target_stub("intf_type##_wr_stub", 128)); \
       intf_name->bind(stub_type.back()->target_socket);        \
    }

#include "versal_cips_v3_4_8_tlm.h"
#include "RdWrTCPSocket.h"
#include "rwd_tlmmodel.h"
#include "extensions/pmc_aie_extension.h"
#include<fstream>
#include <dirent.h>
#include <cstring>
#include <sys/stat.h>

xtlm::xtlm_aximm_target_socket* __attribute__((weak)) get_aie_npi_rd_socket();
xtlm::xtlm_aximm_target_socket* __attribute__((weak)) get_aie_npi_wr_socket();

/***************************************************************************************
*   Global method, get registered with tlm2xtlm bridge
*   This function is called when tlm2xtlm bridge convert tlm payload to xtlm payload.
*
*   caller:     tlm2xtlm bridge
*   purpose:    To get master id and other parameters out of genattr_extension
*               and use master id to AxUSER PIN of xtlm payload.
*
*
***************************************************************************************/
void get_extensions_from_tlm(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp)
{
    if((xtlm_pay == NULL) || (gp == NULL))
        return;
    if((gp->get_command() == tlm::TLM_WRITE_COMMAND) && (xtlm_pay->get_awuser_size() > 0))
    {
  genattr_extension* ext = NULL;
  gp->get_extension(ext);
        if(ext == NULL)
            return;
  //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
  uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_awuser_ptr();
    unsigned int size  = xtlm_pay->get_awuser_size();
    *ptr = (unsigned char)val;

    }
    else if((gp->get_command() == tlm::TLM_READ_COMMAND) && (xtlm_pay->get_aruser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_aruser_ptr();
    unsigned int size  = xtlm_pay->get_aruser_size();
    *ptr = (unsigned char)val;
  }
}
void get_extensions_from_tlm_pmc_noc(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp)
{
    if((xtlm_pay == NULL) || (gp == NULL))
        return;
    if((gp->get_command() == tlm::TLM_WRITE_COMMAND) && (xtlm_pay->get_awuser_size() > 0))
    {
  genattr_extension* ext = NULL;
  gp->get_extension(ext);
        if(ext == NULL)
            return;
  //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
  uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_awuser_ptr();
    unsigned int size  = xtlm_pay->get_awuser_size();
    *ptr = (unsigned char)val;

    }
    else if((gp->get_command() == tlm::TLM_READ_COMMAND) && (xtlm_pay->get_aruser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_aruser_ptr();
    unsigned int size  = xtlm_pay->get_aruser_size();
    *ptr = (unsigned char)val;
  }
  if((gp->get_address() >= 0x20000000000) && (gp->get_address() <= 0x200FFFFFFFF)) {
        xsc::extension::pmc_aie_extension *m_pmc_aie_extension = new xsc::extension::pmc_aie_extension;
        xtlm_pay->set_extension(m_pmc_aie_extension);
  }
}

/***************************************************************************************
*   Global method, get registered with xtlm2tlm bridge
*   This function is called when xtlm2tlm bridge convert xtlm payload to tlm payload.
*
*   caller:     xtlm2tlm bridge
*   purpose:    To create and add master id and other parameters to genattr_extension.
*               Master id red from AxID PIN of xtlm payload.
*
*
***************************************************************************************/
void add_extensions_to_tlm(const xtlm::aximm_payload* xtlm_pay, tlm::tlm_generic_payload* gp)
{
    if(gp == NULL)
        return;
  uint8_t val = 0;
    if((gp->get_command() != tlm::TLM_WRITE_COMMAND) && (gp->get_command() != tlm::TLM_READ_COMMAND))
        return;
  //portion of master ID bits(master_id[5:0]) are derived from the AXI ID(AWID/ARID). (refere Zynq UltraScale+ TRM page.no:414,415)
  val = ((uint8_t)(xtlm_pay->get_axi_id())) && 0x3F;
  genattr_extension* ext = new genattr_extension;
  ext->set_master_id(val);
  gp->set_extension(ext);
  gp->set_streaming_width(gp->get_data_length());
  if(gp->get_command() != tlm::TLM_WRITE_COMMAND)
  {
    gp->set_byte_enable_length(0);
    gp->set_byte_enable_ptr(0);
  }
}

/*
template<int INIT_WIDTH, int TARGET_WIDTH>
class tlm_width_conversion :public sc_module {
  public:
    tlm_utils::simple_initiator_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, INIT_WIDTH> initsock;
    tlm_utils::simple_target_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, TARGET_WIDTH> tarsock;
    tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>(sc_module_name name):sc_module(name){
        tarsock.register_b_transport(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::b_transport);
        tarsock.register_get_direct_mem_ptr(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::get_direct_mem_ptr);
        tarsock.register_transport_dbg(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::transport_dbg);
    }
    private:
    void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay){
        initsock->b_transport(trans, delay);
    }
    unsigned int transport_dbg(tlm::tlm_generic_payload& trans){
        return initsock->transport_dbg(trans);
    }
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data){
        return initsock->get_direct_mem_ptr(trans, dmi_data);
    }
};
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
// File:            versal_cips_v3_4_tlm.cpp                                                                         //
//                                                                                                              //
// Description:     versal_cips_v3_4_8_tlm class is a sc_module, act as intermediate layer between                     //
//                  xilinx_zynqmp qemu wrapper and Vivado generated systemc simulation ip wrapper.              //
//                  it's basically created for supporting tlm based xilinx_zynqmp from xtlm based vivado        //
//                  generated systemc wrapper. this wrapper is live only when SELECTED_SIM_MODEL is set         //
//                  to tlm. it's also act as bridge between vivado wrapper and xilinx_zynqmp wrapper.           //
//                  it fill the the gap between input/output ports of vivado generated wrapper to               //
//                  xilinx_zynqmp wrapper signals. This wrapper is auto generated by ttcl scripts               //
//                  based on IP configuration in vivado.                                                        //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
namespace cips_tlm {
    void export_simulation();
    void setup_for_mcpath() __attribute__ ((constructor));
}
void StartThreadedTCPServer(RdWrTCPSocket* m_rdwrtcpsock);
//TODO update clk with original freq from PARAM
//constructor having three paramters
// 1. module name in sc_module_name objec,
// 2. reference to map object of name and integer value pairs
// 3. reference to map object of name and string value pairs
// All the model parameters (integer and string) which are configuration parameters
// of ZynqUltraScale+ IP propogated from Vivado
versal_cips_v3_4_8_tlm :: versal_cips_v3_4_8_tlm (sc_core::sc_module_name name,
  xsc::common_cpp::properties model_param_props) : sc_module(name) //registering module name with parent
    ,fpd_cci_noc_axi0_clk("fpd_cci_noc_axi0_clk")
    ,fpd_cci_noc_axi1_clk("fpd_cci_noc_axi1_clk")
    ,fpd_cci_noc_axi2_clk("fpd_cci_noc_axi2_clk")
    ,fpd_cci_noc_axi3_clk("fpd_cci_noc_axi3_clk")
    ,lpd_axi_noc_clk("lpd_axi_noc_clk")
    ,pmc_axi_noc_axi0_clk("pmc_axi_noc_axi0_clk")
    ,noc_pmc_axi_axi0_clk("noc_pmc_axi_axi0_clk")
    ,gem0_tsu_timer_cnt("gem0_tsu_timer_cnt")
    ,cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk")
    ,cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk")
    ,dma0_intrfc_clk("dma0_intrfc_clk")
    ,cpm_misc_irq("cpm_misc_irq")
    ,cpm_cor_irq("cpm_cor_irq")
    ,cpm_uncor_irq("cpm_uncor_irq")
    ,cpm_irq0("cpm_irq0")
    ,cpm_irq1("cpm_irq1")
    ,dma0_axi_aresetn("dma0_axi_aresetn")
    ,dma0_intrfc_resetn("dma0_intrfc_resetn")
    ,dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld")
    ,dma0_mgmt_req_rdy("dma0_mgmt_req_rdy")
    ,dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy")
    ,dma0_mgmt_req_vld("dma0_mgmt_req_vld")
    ,dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts")
    ,dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat")
    ,dma0_mgmt_req_cmd("dma0_mgmt_req_cmd")
    ,dma0_mgmt_req_fnc("dma0_mgmt_req_fnc")
    ,dma0_mgmt_req_msc("dma0_mgmt_req_msc")
    ,dma0_mgmt_req_adr("dma0_mgmt_req_adr")
    ,dma0_mgmt_req_dat("dma0_mgmt_req_dat")
    ,dma0_axis_c2h_dmawr_cmp("dma0_axis_c2h_dmawr_cmp")
    ,dma0_axis_c2h_dmawr_target_vch("dma0_axis_c2h_dmawr_target_vch")
    ,dma0_axis_c2h_dmawr_port_id("dma0_axis_c2h_dmawr_port_id")
    ,dma0_s_axis_c2h_tready("dma0_s_axis_c2h_tready")
    ,dma0_s_axis_c2h_tlast("dma0_s_axis_c2h_tlast")
    ,dma0_s_axis_c2h_tvalid("dma0_s_axis_c2h_tvalid")
    ,dma0_s_axis_c2h_tcrc("dma0_s_axis_c2h_tcrc")
    ,dma0_s_axis_c2h_tdata("dma0_s_axis_c2h_tdata")
    ,dma0_s_axis_c2h_mty("dma0_s_axis_c2h_mty")
    ,dma0_s_axis_c2h_ecc("dma0_s_axis_c2h_ecc")
    ,dma0_s_axis_c2h_ctrl_marker("dma0_s_axis_c2h_ctrl_marker")
    ,dma0_s_axis_c2h_ctrl_has_cmpt("dma0_s_axis_c2h_ctrl_has_cmpt")
    ,dma0_s_axis_c2h_ctrl_len("dma0_s_axis_c2h_ctrl_len")
    ,dma0_s_axis_c2h_ctrl_qid("dma0_s_axis_c2h_ctrl_qid")
    ,dma0_s_axis_c2h_ctrl_port_id("dma0_s_axis_c2h_ctrl_port_id")
    ,dma0_s_axis_c2h_cmpt_marker("dma0_s_axis_c2h_cmpt_marker")
    ,dma0_s_axis_c2h_cmpt_user_trig("dma0_s_axis_c2h_cmpt_user_trig")
    ,dma0_s_axis_c2h_cmpt_size("dma0_s_axis_c2h_cmpt_size")
    ,dma0_s_axis_c2h_cmpt_qid("dma0_s_axis_c2h_cmpt_qid")
    ,dma0_s_axis_c2h_cmpt_no_wrb_marker("dma0_s_axis_c2h_cmpt_no_wrb_marker")
    ,dma0_s_axis_c2h_cmpt_port_id("dma0_s_axis_c2h_cmpt_port_id")
    ,dma0_s_axis_c2h_cmpt_col_idx("dma0_s_axis_c2h_cmpt_col_idx")
    ,dma0_s_axis_c2h_cmpt_err_idx("dma0_s_axis_c2h_cmpt_err_idx")
    ,dma0_s_axis_c2h_cmpt_wait_pld_pkt_id("dma0_s_axis_c2h_cmpt_wait_pld_pkt_id")
    ,dma0_s_axis_c2h_cmpt_tready("dma0_s_axis_c2h_cmpt_tready")
    ,dma0_s_axis_c2h_cmpt_tvalid("dma0_s_axis_c2h_cmpt_tvalid")
    ,dma0_s_axis_c2h_cmpt_dpar("dma0_s_axis_c2h_cmpt_dpar")
    ,dma0_s_axis_c2h_cmpt_data("dma0_s_axis_c2h_cmpt_data")
    ,dma0_s_axis_c2h_cmpt_cmpt_type("dma0_s_axis_c2h_cmpt_cmpt_type")
    ,dma0_m_axis_h2c_tlast("dma0_m_axis_h2c_tlast")
    ,dma0_m_axis_h2c_err("dma0_m_axis_h2c_err")
    ,dma0_m_axis_h2c_tvalid("dma0_m_axis_h2c_tvalid")
    ,dma0_m_axis_h2c_tdata("dma0_m_axis_h2c_tdata")
    ,dma0_m_axis_h2c_zero_byte("dma0_m_axis_h2c_zero_byte")
    ,dma0_m_axis_h2c_tready("dma0_m_axis_h2c_tready")
    ,dma0_m_axis_h2c_tcrc("dma0_m_axis_h2c_tcrc")
    ,dma0_m_axis_h2c_mty("dma0_m_axis_h2c_mty")
    ,dma0_m_axis_h2c_qid("dma0_m_axis_h2c_qid")
    ,dma0_m_axis_h2c_mdata("dma0_m_axis_h2c_mdata")
    ,dma0_m_axis_h2c_port_id("dma0_m_axis_h2c_port_id")
    ,dma0_axis_c2h_status_last("dma0_axis_c2h_status_last")
    ,dma0_axis_c2h_status_drop("dma0_axis_c2h_status_drop")
    ,dma0_axis_c2h_status_error("dma0_axis_c2h_status_error")
    ,dma0_axis_c2h_status_valid("dma0_axis_c2h_status_valid")
    ,dma0_axis_c2h_status_status_cmp("dma0_axis_c2h_status_status_cmp")
    ,dma0_axis_c2h_status_qid("dma0_axis_c2h_status_qid")
    ,dma0_qsts_out_vld("dma0_qsts_out_vld")
    ,dma0_qsts_out_op("dma0_qsts_out_op")
    ,dma0_qsts_out_rdy("dma0_qsts_out_rdy")
    ,dma0_qsts_out_qid("dma0_qsts_out_qid")
    ,dma0_qsts_out_data("dma0_qsts_out_data")
    ,dma0_qsts_out_port_id("dma0_qsts_out_port_id")
    ,dma0_dsc_crdt_in_rdy("dma0_dsc_crdt_in_rdy")
    ,dma0_dsc_crdt_in_dir("dma0_dsc_crdt_in_dir")
    ,dma0_dsc_crdt_in_valid("dma0_dsc_crdt_in_valid")
    ,dma0_dsc_crdt_in_fence("dma0_dsc_crdt_in_fence")
    ,dma0_dsc_crdt_in_qid("dma0_dsc_crdt_in_qid")
    ,dma0_dsc_crdt_in_crdt("dma0_dsc_crdt_in_crdt")
    ,dma0_usr_irq_ack("dma0_usr_irq_ack")
    ,dma0_usr_irq_fail("dma0_usr_irq_fail")
    ,dma0_usr_irq_valid("dma0_usr_irq_valid")
    ,dma0_usr_irq_vec("dma0_usr_irq_vec")
    ,dma0_usr_irq_fnc("dma0_usr_irq_fnc")
    ,dma0_tm_dsc_sts_mm("dma0_tm_dsc_sts_mm")
    ,dma0_tm_dsc_sts_qen("dma0_tm_dsc_sts_qen")
    ,dma0_tm_dsc_sts_byp("dma0_tm_dsc_sts_byp")
    ,dma0_tm_dsc_sts_dir("dma0_tm_dsc_sts_dir")
    ,dma0_tm_dsc_sts_error("dma0_tm_dsc_sts_error")
    ,dma0_tm_dsc_sts_valid("dma0_tm_dsc_sts_valid")
    ,dma0_tm_dsc_sts_qinv("dma0_tm_dsc_sts_qinv")
    ,dma0_tm_dsc_sts_irq_arm("dma0_tm_dsc_sts_irq_arm")
    ,dma0_tm_dsc_sts_rdy("dma0_tm_dsc_sts_rdy")
    ,dma0_tm_dsc_sts_qid("dma0_tm_dsc_sts_qid")
    ,dma0_tm_dsc_sts_avl("dma0_tm_dsc_sts_avl")
    ,dma0_tm_dsc_sts_pidx("dma0_tm_dsc_sts_pidx")
    ,dma0_tm_dsc_sts_port_id("dma0_tm_dsc_sts_port_id")
    ,dma0_usr_flr_set("dma0_usr_flr_set")
    ,dma0_usr_flr_clear("dma0_usr_flr_clear")
    ,dma0_usr_flr_fnc("dma0_usr_flr_fnc")
    ,dma0_usr_flr_done_vld("dma0_usr_flr_done_vld")
    ,dma0_usr_flr_done_fnc("dma0_usr_flr_done_fnc")
    ,PCIE0_GT_grx_n("PCIE0_GT_grx_n")
    ,PCIE0_GT_gtx_n("PCIE0_GT_gtx_n")
    ,PCIE0_GT_grx_p("PCIE0_GT_grx_p")
    ,PCIE0_GT_gtx_p("PCIE0_GT_gtx_p")
    ,gt_refclk0_clk_n("gt_refclk0_clk_n")
    ,gt_refclk0_clk_p("gt_refclk0_clk_p")
    ,pmc_noc_clk("pmc_noc_clk", sc_time(2.5,sc_core::SC_NS))//clock period in NANOseconds = 1000/freq(in MZ)
#ifndef XM_SYSTEMC
    ,dummy_noc_pcie_sig("dummy_noc_pcie_sig")
#endif
    ,m_rp_bridge_FPD_CCI_NOC_0("m_rp_bridge_FPD_CCI_NOC_0")
    ,m_rp_bridge_FPD_CCI_NOC_1("m_rp_bridge_FPD_CCI_NOC_1")
    ,m_rp_bridge_FPD_CCI_NOC_2("m_rp_bridge_FPD_CCI_NOC_2")
    ,m_rp_bridge_FPD_CCI_NOC_3("m_rp_bridge_FPD_CCI_NOC_3")
    ,m_rp_bridge_LPD_AXI_NOC_0("m_rp_bridge_LPD_AXI_NOC_0")
    ,m_rp_bridge_PMC_NOC_AXI_0("m_rp_bridge_PMC_NOC_AXI_0")
    ,m_rp_bridge_CPM_PCIE_NOC_1("m_rp_bridge_CPM_PCIE_NOC_1")
    ,dummy_usr_irq_req("dummy_usr_irq_req")
    ,dummy_usr_irq_ack("dummy_usr_irq_ack")
{
    cips_tlm::export_simulation();
    fpd_cci_noc_clk = NULL;
    lpd_axi_noc_clk_sig = NULL;
        fpd_cci_noc_clk = new sc_core::sc_clock("fpd_cci_noc_clk",sc_time(1.2121223772279335,sc_core::SC_NS));
        lpd_axi_noc_clk_sig = new sc_core::sc_clock("lpd_axi_noc_clk_sig",sc_time(1.666668191668062,sc_core::SC_NS));
    {
        char str[] = "100_MHz";
        char * pch = strtok (str,"_");
        uint64_t clk_period =0;
        sscanf(pch, "%d", &clk_period);
        cpm_pcie_noc_axi0_clk_sig = new sc_core::sc_clock("cpm_pcie_noc_axi0_clk_sig", sc_core::sc_time(1000/clk_period,sc_core::SC_NS));
    }
  //  Start versal_cips_v3_4_8_tlm()
  //creating instances of xtlm slave sockets
  // pmc_noc interface related initialization...
  m_rwd_tlmmodel = NULL;
  m_rdwrtcpsock = NULL;
  m_rwd_thread = NULL;
  rwd_tlm2xtlm_brdg = NULL;
  rwd_pmc_interconnect = NULL;
  //initializing input clocks and pointers to NULL of sim_qdma when ps_noc_pcie IF is enabled..
#ifndef XM_SYSTEMC
  m_sim_qdma_ptr = NULL;
  sim_qdma_interconnect = NULL;
#endif
FPD_CCI_NOC_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_0_tlm_aximm_write_socket",128 );
FPD_CCI_NOC_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_0_tlm_aximm_read_socket",128 );
FPD_CCI_NOC_1_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_1_tlm_aximm_write_socket",128 );
FPD_CCI_NOC_1_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_1_tlm_aximm_read_socket",128 );
FPD_CCI_NOC_2_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_2_tlm_aximm_write_socket",128 );
FPD_CCI_NOC_2_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_2_tlm_aximm_read_socket",128 );
FPD_CCI_NOC_3_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_3_tlm_aximm_write_socket",128 );
FPD_CCI_NOC_3_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("FPD_CCI_NOC_3_tlm_aximm_read_socket",128 );
LPD_AXI_NOC_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("LPD_AXI_NOC_0_tlm_aximm_write_socket",128 );
LPD_AXI_NOC_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("LPD_AXI_NOC_0_tlm_aximm_read_socket",128 );
PMC_NOC_AXI_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("PMC_NOC_AXI_0_tlm_aximm_write_socket",128 );
PMC_NOC_AXI_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("PMC_NOC_AXI_0_tlm_aximm_read_socket",128 );
NOC_PMC_AXI_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_target_socket("NOC_PMC_AXI_0_tlm_aximm_write_socket",128);
NOC_PMC_AXI_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_target_socket("NOC_PMC_AXI_0_tlm_aximm_read_socket",128);
CPM_PCIE_NOC_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_0_tlm_aximm_write_socket",128 );
CPM_PCIE_NOC_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_0_tlm_aximm_read_socket",128 );
CPM_PCIE_NOC_1_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_1_tlm_aximm_write_socket",128 );
CPM_PCIE_NOC_1_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_1_tlm_aximm_read_socket",128 );
        //Adding AXIMM/AXIS interfaces here
dma0_st_rx_msg_tlm_axis_socket = new xtlm::xtlm_axis_initiator_socket("dma0_st_rx_msg_socket",32);
        axis_master_stub.push_back(new xtlm::xtlm_axis_initiator_stub("dma0_st_rx_msg_stub", 32));                
        axis_master_stub.back()->initiator_socket(*dma0_st_rx_msg_tlm_axis_socket); 
  
        //Adding AXIMM/AXIS interfaces here for XRAM
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  char* unix_addr = getenv("COSIM_MACHINE_PATH");
  char* skt_name;
  if (unix_addr != NULL){
      skt_name = strdup(unix_addr);
  } else if (tcpip_addr != NULL) {
      skt_name = strdup(tcpip_addr);
  } else {
      tcpip_addr = "NO_IP_ADDRESS";
      skt_name = strdup(tcpip_addr);
  }
  m_zynq3_tlm_model = new xilinx_versal_vitis("xilinx_versal_vitis",skt_name);

  //quantumkeeper value update
  char* qk_value = getenv("TLM_QUANTUM_IN_PS");
  if(qk_value != NULL) {
      double value = atof(qk_value);
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(value,SC_PS));
  } else {
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(20,SC_NS));
  }
  m_zynq3_tlm_model->m_qk.reset();


  //instantiating XTLM2TLM bridge and stiching it between
  //NOC_PMC_AXI_0_wr/rd_socket sockets to noc_pmc_axi_0 target socket of Zynqmp Qemu tlm wrapper
  m_xtlm2tlm_9 = new xtlm::xaximm_xtlm2tlm_t<128,32>("NOC_PMC_AXI_0_xtlm2tlm_bg");
  NOC_PMC_AXI_0_tlm_aximm_write_socket->bind(*m_xtlm2tlm_9->wr_socket);
  NOC_PMC_AXI_0_tlm_aximm_read_socket->bind(*m_xtlm2tlm_9->rd_socket);
  m_zynq3_tlm_model->noc_pmc_axi_0->bind(m_xtlm2tlm_9->initiator_socket);


  XRAM_connections();

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_pcie_0 initiator socket of zynqmp Qemu tlm wrapper to FPD_AXI_NOC_0_tlm_aximm_write_socket/rd_socket sockets
#ifndef XM_SYSTEMC 
  enable_sim_qdma();
#else
  disable_sim_qdma();
#endif

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_cci_0 initiator socket of zynqmp Qemu tlm wrapper to FPD_CCI_NOC_0_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_FPD_CCI_NOC_0.clk(fpd_cci_noc_axi0_clk);
  m_rp_bridge_FPD_CCI_NOC_0.wr_socket.bind(*FPD_CCI_NOC_0_tlm_aximm_write_socket);
  m_rp_bridge_FPD_CCI_NOC_0.rd_socket.bind(*FPD_CCI_NOC_0_tlm_aximm_read_socket);
  m_rp_bridge_FPD_CCI_NOC_0.target_socket.bind(*m_zynq3_tlm_model->fpd_cci_noc_0);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_cci_1 initiator socket of zynqmp Qemu tlm wrapper to FPD_CCI_NOC_1_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_FPD_CCI_NOC_1.clk(fpd_cci_noc_axi1_clk);
  m_rp_bridge_FPD_CCI_NOC_1.wr_socket.bind(*FPD_CCI_NOC_1_tlm_aximm_write_socket);
  m_rp_bridge_FPD_CCI_NOC_1.rd_socket.bind(*FPD_CCI_NOC_1_tlm_aximm_read_socket);
  m_rp_bridge_FPD_CCI_NOC_1.target_socket.bind(*m_zynq3_tlm_model->fpd_cci_noc_1);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_cci_2 initiator socket of zynqmp Qemu tlm wrapper to FPD_CCI_NOC_2_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_FPD_CCI_NOC_2.clk(fpd_cci_noc_axi2_clk);
  m_rp_bridge_FPD_CCI_NOC_2.wr_socket.bind(*FPD_CCI_NOC_2_tlm_aximm_write_socket);
  m_rp_bridge_FPD_CCI_NOC_2.rd_socket.bind(*FPD_CCI_NOC_2_tlm_aximm_read_socket);
  m_rp_bridge_FPD_CCI_NOC_2.target_socket.bind(*m_zynq3_tlm_model->fpd_cci_noc_2);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_cci_3 initiator socket of zynqmp Qemu tlm wrapper to FPD_CCI_NOC_3_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_FPD_CCI_NOC_3.clk(fpd_cci_noc_axi3_clk);
  m_rp_bridge_FPD_CCI_NOC_3.wr_socket.bind(*FPD_CCI_NOC_3_tlm_aximm_write_socket);
  m_rp_bridge_FPD_CCI_NOC_3.rd_socket.bind(*FPD_CCI_NOC_3_tlm_aximm_read_socket);
  m_rp_bridge_FPD_CCI_NOC_3.target_socket.bind(*m_zynq3_tlm_model->fpd_cci_noc_3);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_pcie_1 initiator socket of zynqmp Qemu tlm wrapper to FPD_AXI_NOC_1_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_CPM_PCIE_NOC_1.clk(cpm_pcie_noc_axi1_clk);
  m_rp_bridge_CPM_PCIE_NOC_1.wr_socket.bind(*CPM_PCIE_NOC_1_tlm_aximm_write_socket);
  m_rp_bridge_CPM_PCIE_NOC_1.rd_socket.bind(*CPM_PCIE_NOC_1_tlm_aximm_read_socket);
  m_rp_bridge_CPM_PCIE_NOC_1.target_socket.bind(*m_zynq3_tlm_model->cpm_pcie_noc_1);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_rpu_0 initiator socket of zynqmp Qemu tlm wrapper to LPD_AXI_NOC_0_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_LPD_AXI_NOC_0.clk(lpd_axi_noc_clk);
  m_rp_bridge_LPD_AXI_NOC_0.wr_socket.bind(*LPD_AXI_NOC_0_tlm_aximm_write_socket);
  m_rp_bridge_LPD_AXI_NOC_0.rd_socket.bind(*LPD_AXI_NOC_0_tlm_aximm_read_socket);
  m_rp_bridge_LPD_AXI_NOC_0.target_socket.bind(*m_zynq3_tlm_model->noc_lpd_axi_0);

  //instantiating TLM2XTLM bridge and stiching it between
  //if_pmc_noc_axi_0 initiator socket of zynqmp Qemu tlm wrapper to FPD_AXI_NOC_0_tlm_aximm_write_socket/rd_socket sockets
  rwd_tlmmodule_init();

  SC_METHOD(pl_ps_irq_method);
  dont_initialize();



  SC_METHOD(trigger_ps_pmc_noc_axi0_clk_pin);
  sensitive << pmc_noc_clk;
  dont_initialize();
  SC_METHOD(trigger_ps_noc_cci_axi0_clk_pin);
  sensitive << *fpd_cci_noc_clk;
  dont_initialize();
  SC_METHOD(trigger_ps_noc_cci_axi1_clk_pin);
  sensitive << *fpd_cci_noc_clk;
  dont_initialize();
  SC_METHOD(trigger_ps_noc_cci_axi2_clk_pin);
  sensitive << *fpd_cci_noc_clk;
  dont_initialize();
  SC_METHOD(trigger_ps_noc_cci_axi3_clk_pin);
  sensitive << *fpd_cci_noc_clk;
  dont_initialize();
  SC_METHOD(trigger_lpd_axi_noc_clk_pin);
  sensitive << *lpd_axi_noc_clk_sig;
  dont_initialize();
  SC_METHOD(trigger_noc_pmc_axi0_clk_pin);
  sensitive << pmc_noc_clk;
  dont_initialize();

  m_xtlm2tlm_9->registerUserExtensionHandlerCallback(add_extensions_to_tlm);
  m_rp_bridge_FPD_CCI_NOC_0.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);
  m_rp_bridge_FPD_CCI_NOC_1.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);
  m_rp_bridge_FPD_CCI_NOC_2.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);
  m_rp_bridge_FPD_CCI_NOC_3.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);
  m_rp_bridge_LPD_AXI_NOC_0.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);
  m_rp_bridge_PMC_NOC_AXI_0.registerUserExtensionHandlerCallback(&get_extensions_from_tlm_pmc_noc);

  m_zynq3_tlm_model->rst(qemu_rst);

  //initializing input clocks of sim_qdma when ps_noc_pcie IF is enabled..
#ifdef ENABLE_SIM_QDMA
#ifndef XM_SYSTEMC
  if(m_sim_qdma_ptr != NULL){
      m_sim_qdma_ptr->m_aximm_aclk.bind(*cpm_pcie_noc_axi0_clk_sig);
      m_sim_qdma_ptr->m_axictrl_aclk.bind(*cpm_pcie_noc_axi0_clk_sig);
  }
#endif
#endif
    SC_METHOD(trigger_ps_noc_pcie_axi0_clk_pin);
    sensitive << *cpm_pcie_noc_axi0_clk_sig;
    dont_initialize();
  //  End versal_cips_v3_4_8_tlm()
}

versal_cips_v3_4_8_tlm :: ~versal_cips_v3_4_8_tlm() {
  //deleting dynamically created objects
  if(fpd_cci_noc_clk != NULL) {
      delete fpd_cci_noc_clk;
      fpd_cci_noc_clk = NULL;
  }
  if(lpd_axi_noc_clk_sig != NULL) {
      delete lpd_axi_noc_clk_sig;
      lpd_axi_noc_clk_sig = NULL;
  }
  delete cpm_pcie_noc_axi0_clk_sig;
  cpm_pcie_noc_axi0_clk_sig = NULL;
    delete FPD_CCI_NOC_0_tlm_aximm_write_socket;
    delete FPD_CCI_NOC_0_tlm_aximm_read_socket;
FPD_CCI_NOC_0_tlm_aximm_write_socket = NULL;
FPD_CCI_NOC_0_tlm_aximm_read_socket = NULL;
    delete FPD_CCI_NOC_1_tlm_aximm_write_socket;
    delete FPD_CCI_NOC_1_tlm_aximm_read_socket;
FPD_CCI_NOC_1_tlm_aximm_write_socket = NULL;
FPD_CCI_NOC_1_tlm_aximm_read_socket = NULL;
    delete FPD_CCI_NOC_2_tlm_aximm_write_socket;
    delete FPD_CCI_NOC_2_tlm_aximm_read_socket;
FPD_CCI_NOC_2_tlm_aximm_write_socket = NULL;
FPD_CCI_NOC_2_tlm_aximm_read_socket = NULL;
    delete FPD_CCI_NOC_3_tlm_aximm_write_socket;
    delete FPD_CCI_NOC_3_tlm_aximm_read_socket;
FPD_CCI_NOC_3_tlm_aximm_write_socket = NULL;
FPD_CCI_NOC_3_tlm_aximm_read_socket = NULL;
    delete LPD_AXI_NOC_0_tlm_aximm_write_socket;
    delete LPD_AXI_NOC_0_tlm_aximm_read_socket;
LPD_AXI_NOC_0_tlm_aximm_write_socket = NULL;
LPD_AXI_NOC_0_tlm_aximm_read_socket = NULL;
    delete PMC_NOC_AXI_0_tlm_aximm_write_socket;
    delete PMC_NOC_AXI_0_tlm_aximm_read_socket;
PMC_NOC_AXI_0_tlm_aximm_write_socket = NULL;
PMC_NOC_AXI_0_tlm_aximm_read_socket = NULL;
    delete NOC_PMC_AXI_0_tlm_aximm_write_socket;
    delete NOC_PMC_AXI_0_tlm_aximm_read_socket;
NOC_PMC_AXI_0_tlm_aximm_write_socket = NULL;
NOC_PMC_AXI_0_tlm_aximm_read_socket = NULL;
    delete CPM_PCIE_NOC_0_tlm_aximm_write_socket;
    delete CPM_PCIE_NOC_0_tlm_aximm_read_socket;
CPM_PCIE_NOC_0_tlm_aximm_write_socket = NULL;
CPM_PCIE_NOC_0_tlm_aximm_read_socket = NULL;
    delete CPM_PCIE_NOC_1_tlm_aximm_write_socket;
    delete CPM_PCIE_NOC_1_tlm_aximm_read_socket;
CPM_PCIE_NOC_1_tlm_aximm_write_socket = NULL;
CPM_PCIE_NOC_1_tlm_aximm_read_socket = NULL;
    delete dma0_st_rx_msg_tlm_axis_socket;
dma0_st_rx_msg_tlm_axis_socket = NULL;

    delete m_xtlm2tlm_9;
    if(m_xtlm2tlm_10 != 0) {
        delete m_xtlm2tlm_10;
    }

  //deleting the thread object, RdWrTCPSocket and rwd_tlmmodel
  if(m_rwd_thread != NULL){
    delete m_rwd_thread;
    m_rwd_thread = NULL;
  }
  if(m_rdwrtcpsock != NULL){
    delete m_rdwrtcpsock;
    m_rdwrtcpsock = NULL;
  }
  if(m_rwd_tlmmodel != NULL){
    delete m_rwd_tlmmodel;
    m_rwd_tlmmodel = NULL;
  }
  if(rwd_tlm2xtlm_brdg != NULL){
    delete rwd_tlm2xtlm_brdg;
    rwd_tlm2xtlm_brdg = NULL;
  }
  if(rwd_pmc_interconnect != NULL){
    delete rwd_pmc_interconnect;
    rwd_pmc_interconnect = NULL;
  }
#ifndef XM_SYSTEMC
  if(m_sim_qdma_ptr != NULL){
    delete m_sim_qdma_ptr;
    m_sim_qdma_ptr = NULL;
  }
  if(sim_qdma_interconnect != NULL){
    delete sim_qdma_interconnect;
    sim_qdma_interconnect = NULL;
  }
#endif
}

void versal_cips_v3_4_8_tlm :: trigger_ps_pmc_noc_axi0_clk_pin() {
    pmc_axi_noc_axi0_clk.write(pmc_noc_clk.read());
}
//TODO: use of proper clock freq..
void versal_cips_v3_4_8_tlm :: trigger_ps_noc_pcie_axi0_clk_pin() {
  cpm_pcie_noc_axi0_clk.write(cpm_pcie_noc_axi0_clk_sig->read());
}

void versal_cips_v3_4_8_tlm :: trigger_ps_noc_cci_axi0_clk_pin() {
  fpd_cci_noc_axi0_clk.write((*fpd_cci_noc_clk).read());
}
void versal_cips_v3_4_8_tlm :: trigger_ps_noc_cci_axi1_clk_pin() {
  fpd_cci_noc_axi1_clk.write((*fpd_cci_noc_clk).read());
}
void versal_cips_v3_4_8_tlm :: trigger_ps_noc_cci_axi2_clk_pin() {
  fpd_cci_noc_axi2_clk.write((*fpd_cci_noc_clk).read());
}
void versal_cips_v3_4_8_tlm :: trigger_ps_noc_cci_axi3_clk_pin() {
  fpd_cci_noc_axi3_clk.write((*fpd_cci_noc_clk).read());
}
  void versal_cips_v3_4_8_tlm :: trigger_lpd_axi_noc_clk_pin() {
    lpd_axi_noc_clk.write((*lpd_axi_noc_clk_sig).read());
  }
  void versal_cips_v3_4_8_tlm :: trigger_noc_pmc_axi0_clk_pin() {
      noc_pmc_axi_axi0_clk.write(pmc_noc_clk.read());
  }

void versal_cips_v3_4_8_tlm :: pl_ps_irq_method() {
}

void versal_cips_v3_4_8_tlm :: start_of_simulation()
{
  qemu_rst.write(false);
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  char* unix_addr = getenv("COSIM_MACHINE_PATH");
  if(tcpip_addr == NULL && unix_addr == NULL) {
      std::cerr << "\n\n############################################################## \n#\n"
                << " #  You have set SELECTED_SIM_MODLE=TLM for Versal CIPS block.\n" 
                << " #  Since this requires software content, the QEMU based simulation in Vivado will not generate any transactions on master interfaces and will also not respond to any transactions on slave interfaces.\n" 
                << " #  To use SW driven simulation, create use the Vitis flow\n" 
                << "\n#\n##############################################################\n\n";
      //exit(0);
  }
  char* rwd = getenv("ENABLE_RDWR_DEBUG");
  if((rwd != NULL) && (strcasecmp(rwd, "true") == 0)) {
    char* rdwr_port = getenv("RDWR_DEBUG_PORT");
    int rdwr_port_number = 10100;
    std::cout << "ENABLE_RDWR_DEBUG is set"<<std::endl;
    if(rdwr_port == NULL) {
      std::cout << "\nRDWR_DEBUG_PORT is not mentioned. Default port number is 10100" << std::endl;
    }
    else {
      char* skt_name = strdup(rdwr_port);
      rdwr_port_number = atoi(skt_name);
      std::cout << "\nRDWR_DEBUG_PORT is " << dec << rdwr_port_number << std::endl;
    }
    m_rdwrtcpsock = new RdWrTCPSocket(rdwr_port_number);
    m_rwd_thread = new std::thread(StartThreadedTCPServer,m_rdwrtcpsock);
  }
}
void versal_cips_v3_4_8_tlm :: rwd_tlmmodule_init() {
    // instantiating xtlm_interconnect with 2 slave and one master interface
    xsc::common_cpp::properties imp_prop;
    imp_prop.addLong("C_NUM_SI","2");
    imp_prop.addLong("C_NUM_MI","1");
    imp_prop.addLong("C_ADDR_RANGES","1");

    std::string width = std::to_string(128);
    std::string addr_width = std::to_string(128);
    imp_prop.addLong("C_M00_AXI_DATA_WIDTH",width.c_str());
    imp_prop.addLong("C_M00_AXI_ADDR_WIDTH",addr_width.c_str());
    imp_prop.addLong("C_M00_A00_BASE_ADDRESS","0x0");
    imp_prop.addLong("C_M00_A00_ADDR_RANGE","0xFFFFFFFFFFFFFFFF");

    imp_prop.addLong("C_S00_AXI_DATA_WIDTH",width.c_str());
    imp_prop.addLong("C_S00_AXI_ADDR_WIDTH",addr_width.c_str());
    imp_prop.addLong("C_S01_AXI_DATA_WIDTH",width.c_str());
    imp_prop.addLong("C_S01_AXI_ADDR_WIDTH",addr_width.c_str());

    imp_prop.addLong("C_M00_S00_CONNECTIVITY","1");
    imp_prop.addLong("C_M00_S01_CONNECTIVITY","1");
    rwd_pmc_interconnect = new xtlm_simple_interconnect_model("rwd_pmc_interconnect",imp_prop);
    rwd_pmc_interconnect->initiator_wr_sockets[0]->bind(*PMC_NOC_AXI_0_tlm_aximm_write_socket);
    rwd_pmc_interconnect->initiator_rd_sockets[0]->bind(*PMC_NOC_AXI_0_tlm_aximm_read_socket);

    //intantiating rwd_tcpserver and rwd_tlmmodel here
    m_rwd_tlmmodel = dynamic_cast<rwd_tlmmodel*>(&rwd_interface::getInstance());
    rwd_tlm2xtlm_brdg = new rptlm2xtlm_converter<32, 128>("rwd_tlm2xtlm_brdg");

    m_rwd_tlmmodel->init_sock(rwd_tlm2xtlm_brdg->target_socket);
    rwd_tlm2xtlm_brdg->rd_socket.bind(*rwd_pmc_interconnect->target_rd_sockets[1]);
    rwd_tlm2xtlm_brdg->wr_socket.bind(*rwd_pmc_interconnect->target_wr_sockets[1]);
    rwd_tlm2xtlm_brdg->clk(pmc_axi_noc_axi0_clk);

    //Qemu to simple_interconnect
    m_rp_bridge_PMC_NOC_AXI_0.clk(pmc_axi_noc_axi0_clk);
    m_rp_bridge_PMC_NOC_AXI_0.wr_socket.bind(*rwd_pmc_interconnect->target_wr_sockets[0]);
    m_rp_bridge_PMC_NOC_AXI_0.rd_socket.bind(*rwd_pmc_interconnect->target_rd_sockets[0]);
    m_rp_bridge_PMC_NOC_AXI_0.target_socket.bind(*m_zynq3_tlm_model->pmc_noc_axi_0);

}
#ifndef XM_SYSTEMC
void versal_cips_v3_4_8_tlm :: enable_sim_qdma() {
  xsc::common_cpp::properties model_param_props;
  model_param_props.addBool("C_M_AXIMM_1_ENABLE", "true");
  model_param_props.addBool("C_M_AXIMM_2_ENABLE", "false");
  model_param_props.addLong("C_M_AXIMM_2_BURST_LEN","16");
  model_param_props.addLong("C_M_AXIMM_2_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_ADDR_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_2_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_2_AWUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_ARUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_WUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_RUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_BUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_BURST_LEN", "16");
  model_param_props.addLong("C_M_AXIMM_1_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_ADDR_WIDTH", "38");
  model_param_props.addLong("C_M_AXIMM_1_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_AWUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_ARUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_WUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_RUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_BUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXICTRL_ADDR_WIDTH", "64");
  std::string ctrl_data_width = std::to_string(32);
  model_param_props.addLong("C_M_AXICTRL_DATA_WIDTH", ctrl_data_width.c_str());
  model_param_props.addLong("C_M_AXICTRL_TRANSACTIONS_NUM", "4");
  model_param_props.addLong("C_M_AXIMM_BURST_LEN", "16");
  model_param_props.addLong("C_M_AXIMM_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_ADDR_WIDTH", "64");
  std::string mm_data_width = std::to_string(128);
  model_param_props.addLong("C_M_AXIMM_DATA_WIDTH", mm_data_width.c_str());
  model_param_props.addLong("C_M_AXIMM_AWUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_ARUSER_WIDTH","32");
  model_param_props.addLong("C_M_AXIMM_WUSER_WIDTH","1");
  model_param_props.addLong("C_M_AXIMM_RUSER_WIDTH","1");
  model_param_props.addLong("C_M_AXIMM_BUSER_WIDTH","1");
  model_param_props.addBitString("C_M_AXIMM_2_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXIMM_1_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXICTRL_START_DATA_VALUE", "10101010000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXICTRL_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXIMM_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBool("C_M_AXIMM_AUX_ENABLE", "false");
  model_param_props.addBool("C_STM_ITF_ENABLE", "false");
  model_param_props.addBool("C_S_AXIMM_ENABLE", "false");
  model_param_props.addLong("C_S_AXIMM_ADDR_WIDTH","0");
  model_param_props.addLong("C_S_AXIMM_WDATA_WIDTH","0");
  model_param_props.addLong("C_M_AXIMM_AUX_ADDR_WIDTH","32");
  model_param_props.addLong("C_M_AXIMM_AUX_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIS_TDATA_WIDTH", "32");
  model_param_props.addLong("C_S_AXIS_TDATA_WIDTH", "32");
  



  

  {
  PF_BAR_size_type *ptr = new PF_BAR_size_type;
      ptr->pf_id = 0xB03F;
      ptr->bar_id = 0;
      ptr->remap_addr = 0x0000000000000000;
        ptr->size = 4 * 1024;
      bar_info.push_back(ptr);
  }

#ifdef ENABLE_SIM_QDMA
  m_sim_qdma_ptr = new sim_qdma("sim_qdma", model_param_props,&bar_info);
  //m_sim_qdma_ptr = new sim_qdma("sim_qdma", model_param_props);
  dummy_noc_pcie_sig.write(true);
  m_sim_qdma_ptr->m_aximm_aresetn.bind(dummy_noc_pcie_sig);
  m_sim_qdma_ptr->m_axictrl_aresetn.bind(dummy_noc_pcie_sig);
  m_sim_qdma_ptr->usr_irq_req(dummy_usr_irq_req);
  m_sim_qdma_ptr->usr_irq_ack(dummy_usr_irq_ack);
#endif

  xsc::common_cpp::properties imp_prop;
  imp_prop.addLong("C_NUM_SI","2");
  imp_prop.addLong("C_NUM_MI","1");
  imp_prop.addLong("C_ADDR_RANGES","1");

  std::string width = std::to_string(128);
  imp_prop.addLong("C_M00_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_M00_AXI_ADDR_WIDTH","64");
  imp_prop.addLong("C_M00_A00_BASE_ADDRESS","0x0");
  imp_prop.addLong("C_M00_A00_ADDR_RANGE","0xFFFFFFFFFFFFFFFF");

  imp_prop.addLong("C_S00_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_S00_AXI_ADDR_WIDTH","64");
  imp_prop.addLong("C_S01_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_S01_AXI_ADDR_WIDTH","64");

  imp_prop.addLong("C_M00_S00_CONNECTIVITY","1");
  imp_prop.addLong("C_M00_S01_CONNECTIVITY","1");
#ifdef ENABLE_SIM_QDMA
  sim_qdma_interconnect = new xtlm_simple_interconnect_model("SIM_XDMA_interconnect",imp_prop);
  sim_qdma_interconnect->initiator_wr_sockets[0]->bind(*CPM_PCIE_NOC_0_tlm_aximm_write_socket);
  sim_qdma_interconnect->initiator_rd_sockets[0]->bind(*CPM_PCIE_NOC_0_tlm_aximm_read_socket);
  m_sim_qdma_ptr->initiator_ctrl_rd_socket->bind(*sim_qdma_interconnect->target_rd_sockets[1]);
  m_sim_qdma_ptr->initiator_ctrl_wr_socket->bind(*sim_qdma_interconnect->target_wr_sockets[1]);
  m_sim_qdma_ptr->initiator_mm_wr_socket->bind(*sim_qdma_interconnect->target_wr_sockets[0]);
  m_sim_qdma_ptr->initiator_mm_rd_socket->bind(*sim_qdma_interconnect->target_rd_sockets[0]);
#else 
  aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_tlm_aximm_write_socket_stub", 128));                
  aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_write_socket); 
  aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_tlm_aximm_read_socket_stub", 128));                
  aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_read_socket); 
#endif


}
#else
void versal_cips_v3_4_8_tlm :: disable_sim_qdma(){
    aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_tlm_aximm_write_socket_wr_stub", 128));
    aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_write_socket);
    aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_tlm_aximm_read_socket_wr_stub", 128));
    aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_read_socket);    
}
#endif
void StartThreadedTCPServer(RdWrTCPSocket* m_rdwrtcpsock) {
  m_rdwrtcpsock->StartTCPServer();
}
template <int IN_WIDTH, int OUT_WIDTH>
rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::rptlm2xtlm_converter(sc_module_name name):sc_module(name)
  ,target_socket("target_socket")
  ,wr_socket("init_wr_socket",OUT_WIDTH)
  ,rd_socket("init_rd_socket",OUT_WIDTH)
  ,m_btrans_conv("b_transport_converter")
  ,xtlm_bridge("tlm2xtlmbridge")
{
  target_socket.bind(m_btrans_conv.target_socket);
  m_btrans_conv.initiator_socket.bind(xtlm_bridge.target_socket);
  xtlm_bridge.rd_socket->bind(rd_socket);
  xtlm_bridge.wr_socket->bind(wr_socket);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::registerUserExtensionHandlerCallback(
  void (*callback)(xtlm::aximm_payload*,
    const tlm::tlm_generic_payload*)) {
  xtlm_bridge.registerUserExtensionHandlerCallback(callback);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::before_end_of_elaboration() {
  m_btrans_conv.clk(clk);
}

void versal_cips_v3_4_8_tlm :: before_end_of_elaboration() {
    if(get_aie_npi_wr_socket && get_aie_npi_rd_socket) {
        xtlm::xtlm_aximm_target_socket* wr_intf = get_aie_npi_wr_socket();
        xtlm::xtlm_aximm_target_socket* rd_intf = get_aie_npi_rd_socket();
        if(rd_intf && wr_intf) {
            m_rp_bridge_pmc_npi_aie2 = new rptlm2xtlm_converter<32,32 >("m_rp_bridge_pmc_npi_aie2");
            m_rp_bridge_pmc_npi_aie2->clk(fpd_cci_noc_axi0_clk);
            m_rp_bridge_pmc_npi_aie2->wr_socket.bind(*wr_intf);
            m_rp_bridge_pmc_npi_aie2->rd_socket.bind(*rd_intf);
            m_rp_bridge_pmc_npi_aie2->target_socket.bind(*m_zynq3_tlm_model->pmc_npi);
        } else {
            m_rp_bridge_pmc_npi_aie2 = NULL;
        }
    } 
    else 
    {
        m_rp_bridge_pmc_npi_aie2 = NULL;
    }
    m_zynq3_tlm_model->tie_off();
}

void versal_cips_v3_4_8_tlm :: end_of_elaboration() {
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_0_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_0_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_1_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_1_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_2_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_2_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_3_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,FPD_CCI_NOC_3_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,LPD_AXI_NOC_0_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,LPD_AXI_NOC_0_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,PMC_NOC_AXI_0_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,PMC_NOC_AXI_0_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_TARG(xtlm::xtlm_aximm_target_socket,NOC_PMC_AXI_0_tlm_aximm_read_socket,aximm_slave_stub)
        MM_STUB_INTF_TARG(xtlm::xtlm_aximm_target_socket,NOC_PMC_AXI_0_tlm_aximm_write_socket,aximm_slave_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,CPM_PCIE_NOC_0_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,CPM_PCIE_NOC_0_tlm_aximm_write_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,CPM_PCIE_NOC_1_tlm_aximm_read_socket,aximm_master_stub)
        MM_STUB_INTF_INIT(xtlm::xtlm_aximm_initiator_socket,CPM_PCIE_NOC_1_tlm_aximm_write_socket,aximm_master_stub)
        //Adding AXIMM/AXIS interfaces here
        S_STUB_INTF_INIT(xtlm::xtlm_axis_initiator_socket,dma0_st_rx_msg_tlm_axis_socket,axis_master_stub)


}
void versal_cips_v3_4_8_tlm :: XRAM_connections() {

  unsigned int intf_count = 0;

if(intf_count > 0) {
  unsigned int count = 0;
  std::stringstream ss;
  ss << intf_count;
  std::string str = ss.str();

  std::string intr_addr_width[4] = {
    "C_S00_AXI_ADDR_WIDTH",    
    "C_S01_AXI_ADDR_WIDTH",    
    "C_S02_AXI_ADDR_WIDTH",    
    "C_S03_AXI_ADDR_WIDTH" };    

  std::string intr_datawidth[4] = {
    "C_S00_AXI_DATA_WIDTH",
    "C_S01_AXI_DATA_WIDTH",
    "C_S02_AXI_DATA_WIDTH",
    "C_S03_AXI_DATA_WIDTH" };

  std::string intf_connectivity[4] = {
    "C_M00_S00_CONNECTIVITY",
    "C_M00_S01_CONNECTIVITY",
    "C_M00_S02_CONNECTIVITY",
    "C_M00_S03_CONNECTIVITY" };

  xsc::common_cpp::properties imp_prop;
  imp_prop.addLong("C_NUM_SI",str.c_str());
  imp_prop.addLong("C_NUM_MI","1");
  imp_prop.addLong("C_ADDR_RANGES","1");

  std::string width;

  imp_prop.addLong("C_M00_AXI_DATA_WIDTH","32");
  imp_prop.addLong("C_M00_AXI_ADDR_WIDTH","64");
  imp_prop.addLong("C_M00_A00_BASE_ADDRESS","0x0");
  imp_prop.addLong("C_M00_A00_ADDR_RANGE","0xFFFFFFFFFFFFFFFF");

  xram_interconnect = new xtlm_simple_interconnect_model("XRAM_interconnect",imp_prop);
  count =0;
  
  m_xtlm2tlm_10 = new xtlm::xaximm_xtlm2tlm_t<32,32>("XRAM_xtlm2tlm_bg");
  xram_interconnect->initiator_wr_sockets[0]->bind(*m_xtlm2tlm_10->wr_socket);
  xram_interconnect->initiator_rd_sockets[0]->bind(*m_xtlm2tlm_10->rd_socket);
  m_zynq3_tlm_model->s_axi_xram->bind(m_xtlm2tlm_10->initiator_socket);

} else {
   xram_interconnect = 0;
   m_xtlm2tlm_10 = 0;
}

}




namespace cips_tlm {
    bool findFileInDirectory(const std::string& directoryPath, const std::string& fileName) {
        DIR* dir = opendir(directoryPath.c_str());
        if (!dir) {
            return false;
        }

        struct dirent* entry;
        while ((entry = readdir(dir)) != NULL) {
            if (fileName == entry->d_name) {
                closedir(dir);
                return true;
            }
        }

        closedir(dir);
        return false;
    }
    void export_simulation() {
        static bool call = false;
        if(!call) {
            call = true;
            auto cosim_path = std::getenv("COSIM_MACHINE_PATH");
            if(cosim_path)  // return if env is already set
                return;
            const char* unix_sock = "unix:./qemu-rport-_pl@0";
            //int ret = std::system("ls qemu-rport-_pl@0 &> /dev/null");
            bool ret =findFileInDirectory(".", "qemu-rport-_pl@0");
            if(ret == false){
                return;
            }
            setenv("COSIM_MACHINE_PATH",unix_sock,0);
    
            std::string noc_mem_file = "noc_memory_config.txt";
            std::ifstream fin(noc_mem_file.c_str(), std::ios::in);
            if(!fin.good()) {
                return;
            }
            setenv("NOCSIM_MULTI_DRAM_FILE",noc_mem_file.c_str(),0);
        }
    }
    void setup_for_mcpath() {
        auto mcpath_env = std::getenv("QEMU_MACHINE_PATH");
        if(mcpath_env == nullptr)
            return;
        std::string noc_org_file_path(mcpath_env);
        noc_org_file_path.append("/noc_memory_config.txt");
        std::ifstream noc_org_file(noc_org_file_path.c_str());
        if (!noc_org_file.is_open())
            return;
        std::string line;
        std::ofstream new_noc_file("noc_memory_config_reloc.txt");
        if(!new_noc_file.is_open())
            return;
        while (std::getline(noc_org_file, line))
        {
            new_noc_file<< mcpath_env<< "/" <<line<<std::endl ;
        }
        noc_org_file.close();
        new_noc_file.close();
        std::string noc_full_path("noc_memory_config_reloc.txt");
        setenv("NOCSIM_MULTI_DRAM_FILE",noc_full_path.c_str(),1);
    }
}
