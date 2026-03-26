 

 
 
 
 
 
 
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

#ifndef __PS_PMC_TLM_H__
#define __PS_PMC_TLM_H__


#include "systemc.h"
#include "xtlm.h"
#include "xtlm_adaptors/xaximm_xtlm2tlm_t.h"
#include "xtlm_adaptors/xaximm_tlm2xtlm.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include <vector>
#include "genattr.h"
#include "xilinx_versal_vitis.h"
#include <stdlib.h>
#include "xtlm_simple_interconnect_model.h"
#include "RdWrTCPSocket.h"
#include "rwd_tlmmodel.h"
#include<thread>
 
 
 
 
#ifndef XM_SYSTEMC
#include "sim_qdma.h"
#define _INCLUDED_SIM_QDMA_
#endif
 
 
#include "b_transport_converter.h"
#include "utils/xtlm_axis_target_stub.h"
#include "utils/xtlm_axis_initiator_stub.h"
#include "utils/xtlm_aximm_target_stub.h"
#include "utils/xtlm_aximm_initiator_stub.h"

#ifndef _INCLUDED_SIM_QDMA_
#ifndef PF_BAR_STRUCT
typedef struct PF_BAR_st {
    uint32_t pf_id;
    uint32_t bar_id;
    uint64_t remap_addr;
} PF_BAR_st_type;
typedef struct pf_bar_size : PF_BAR_st {
    uint64_t size;
} PF_BAR_size_type;
#define PF_BAR_STRUCT
#endif
#endif

/***************************************************************************************
*
* A Simple Converter which converts Remote-port's simplae_intiator_sockets<32>->b_transport()
* calls to xTLM sockets bn_transport_x() calls..
*
* This is Only specific to remote-port so not creating seperate header for it.
*
***************************************************************************************/
template <int IN_WIDTH, int OUT_WIDTH>
class rptlm2xtlm_converter : public sc_module {
  public:
    sc_core::sc_in<bool> clk;
    tlm::tlm_target_socket<IN_WIDTH> target_socket;
    xtlm::xtlm_aximm_initiator_socket wr_socket;
    xtlm::xtlm_aximm_initiator_socket rd_socket;
    rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>(sc_module_name name);//:sc_module(name)
    void registerUserExtensionHandlerCallback(
			void (*callback)(xtlm::aximm_payload*,
				const tlm::tlm_generic_payload*));

    private:
    b_transport_converter<IN_WIDTH, OUT_WIDTH> m_btrans_conv;
    xtlm::xaximm_tlm2xtlm_t<OUT_WIDTH> xtlm_bridge;
    void before_end_of_elaboration();
};

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
extern void get_extensions_from_tlm(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp);

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
extern void add_extensions_to_tlm(const xtlm::aximm_payload* xtlm_pay, tlm::tlm_generic_payload* gp);



////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                    //
// File:        versal_cips_v3_4_tlm.h                                                                //
//                                                                                                    //
// Description: versal_cips_v3_4_8_tlm class is a sc_module, act as intermediate layer between          //
//              xilinx_zynqmp qemu wrapper and Vivado generated systemc simulation ip wrapper.        //
//              it's basically created for supporting tlm based xilinx_zynqmp from xtlm based vivado  //
//              generated systemc wrapper. this wrapper is live only when SELECTED_SIM_MODEL is set   //
//              to tlm. it's also act as bridge between vivado wrapper and xilinx_zynqmp wrapper.     //
//              it fill the the gap between input/output ports of vivado generated wrapper to         //
//              xilinx_zynqmp wrapper signals. This wrapper is auto generated by ttcl scripts         //
//              based on IP configuration in vivado.                                                  //
//                                                                                                    //
//                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
template<int INIT_WIDTH, int TARGET_WIDTH>
class tlm_width_conversion;
class versal_cips_v3_4_8_tlm : public sc_core::sc_module   {
//Adding Non-AXI port
    public:
//Adding ports other than AXIMM/S interface ports
    sc_core::sc_out<bool> fpd_cci_noc_axi0_clk;
    sc_core::sc_out<bool> fpd_cci_noc_axi1_clk;
    sc_core::sc_out<bool> fpd_cci_noc_axi2_clk;
    sc_core::sc_out<bool> fpd_cci_noc_axi3_clk;
    sc_core::sc_out<bool> lpd_axi_noc_clk;
    sc_core::sc_out<bool> pmc_axi_noc_axi0_clk;
    sc_core::sc_out<bool> noc_pmc_axi_axi0_clk;
    sc_core::sc_out<sc_dt::sc_bv<94> >  gem0_tsu_timer_cnt;
    sc_core::sc_out<bool> cpm_pcie_noc_axi0_clk;
    sc_core::sc_out<bool> cpm_pcie_noc_axi1_clk;
    sc_core::sc_in<bool> dma0_intrfc_clk;
    sc_core::sc_out<bool> cpm_misc_irq;
    sc_core::sc_out<bool> cpm_cor_irq;
    sc_core::sc_out<bool> cpm_uncor_irq;
    sc_core::sc_in<bool> cpm_irq0;
    sc_core::sc_in<bool> cpm_irq1;
    sc_core::sc_out<bool> dma0_axi_aresetn;
    sc_core::sc_in<bool> dma0_intrfc_resetn;
    sc_core::sc_out<bool> dma0_mgmt_cpl_vld;
    sc_core::sc_out<bool> dma0_mgmt_req_rdy;
    sc_core::sc_in<bool> dma0_mgmt_cpl_rdy;
    sc_core::sc_in<bool> dma0_mgmt_req_vld;
    sc_core::sc_out<sc_dt::sc_bv<2> >  dma0_mgmt_cpl_sts;
    sc_core::sc_out<sc_dt::sc_bv<32> >  dma0_mgmt_cpl_dat;
    sc_core::sc_in<sc_dt::sc_bv<2> >  dma0_mgmt_req_cmd;
    sc_core::sc_in<sc_dt::sc_bv<13> >  dma0_mgmt_req_fnc;
    sc_core::sc_in<sc_dt::sc_bv<6> >  dma0_mgmt_req_msc;
    sc_core::sc_in<sc_dt::sc_bv<32> >  dma0_mgmt_req_adr;
    sc_core::sc_in<sc_dt::sc_bv<32> >  dma0_mgmt_req_dat;
    sc_core::sc_out<bool> dma0_axis_c2h_dmawr_cmp;
    sc_core::sc_out<bool> dma0_axis_c2h_dmawr_target_vch;
    sc_core::sc_out<sc_dt::sc_bv<3> >  dma0_axis_c2h_dmawr_port_id;
    sc_core::sc_out<bool> dma0_s_axis_c2h_tready;
    sc_core::sc_in<bool> dma0_s_axis_c2h_tlast;
    sc_core::sc_in<bool> dma0_s_axis_c2h_tvalid;
    sc_core::sc_in<sc_dt::sc_bv<32> >  dma0_s_axis_c2h_tcrc;
    sc_core::sc_in<sc_dt::sc_bv<512> >  dma0_s_axis_c2h_tdata;
    sc_core::sc_in<sc_dt::sc_bv<6> >  dma0_s_axis_c2h_mty;
    sc_core::sc_in<sc_dt::sc_bv<7> >  dma0_s_axis_c2h_ecc;
    sc_core::sc_in<bool> dma0_s_axis_c2h_ctrl_marker;
    sc_core::sc_in<bool> dma0_s_axis_c2h_ctrl_has_cmpt;
    sc_core::sc_in<sc_dt::sc_bv<16> >  dma0_s_axis_c2h_ctrl_len;
    sc_core::sc_in<sc_dt::sc_bv<12> >  dma0_s_axis_c2h_ctrl_qid;
    sc_core::sc_in<sc_dt::sc_bv<3> >  dma0_s_axis_c2h_ctrl_port_id;
    sc_core::sc_in<bool> dma0_s_axis_c2h_cmpt_marker;
    sc_core::sc_in<bool> dma0_s_axis_c2h_cmpt_user_trig;
    sc_core::sc_in<sc_dt::sc_bv<2> >  dma0_s_axis_c2h_cmpt_size;
    sc_core::sc_in<sc_dt::sc_bv<13> >  dma0_s_axis_c2h_cmpt_qid;
    sc_core::sc_in<bool> dma0_s_axis_c2h_cmpt_no_wrb_marker;
    sc_core::sc_in<sc_dt::sc_bv<3> >  dma0_s_axis_c2h_cmpt_port_id;
    sc_core::sc_in<sc_dt::sc_bv<3> >  dma0_s_axis_c2h_cmpt_col_idx;
    sc_core::sc_in<sc_dt::sc_bv<3> >  dma0_s_axis_c2h_cmpt_err_idx;
    sc_core::sc_in<sc_dt::sc_bv<16> >  dma0_s_axis_c2h_cmpt_wait_pld_pkt_id;
    sc_core::sc_out<bool> dma0_s_axis_c2h_cmpt_tready;
    sc_core::sc_in<bool> dma0_s_axis_c2h_cmpt_tvalid;
    sc_core::sc_in<sc_dt::sc_bv<16> >  dma0_s_axis_c2h_cmpt_dpar;
    sc_core::sc_in<sc_dt::sc_bv<512> >  dma0_s_axis_c2h_cmpt_data;
    sc_core::sc_in<sc_dt::sc_bv<2> >  dma0_s_axis_c2h_cmpt_cmpt_type;
    sc_core::sc_out<bool> dma0_m_axis_h2c_tlast;
    sc_core::sc_out<bool> dma0_m_axis_h2c_err;
    sc_core::sc_out<bool> dma0_m_axis_h2c_tvalid;
    sc_core::sc_out<sc_dt::sc_bv<512> >  dma0_m_axis_h2c_tdata;
    sc_core::sc_out<bool> dma0_m_axis_h2c_zero_byte;
    sc_core::sc_in<bool> dma0_m_axis_h2c_tready;
    sc_core::sc_out<sc_dt::sc_bv<32> >  dma0_m_axis_h2c_tcrc;
    sc_core::sc_out<sc_dt::sc_bv<6> >  dma0_m_axis_h2c_mty;
    sc_core::sc_out<sc_dt::sc_bv<12> >  dma0_m_axis_h2c_qid;
    sc_core::sc_out<sc_dt::sc_bv<32> >  dma0_m_axis_h2c_mdata;
    sc_core::sc_out<sc_dt::sc_bv<3> >  dma0_m_axis_h2c_port_id;
    sc_core::sc_out<bool> dma0_axis_c2h_status_last;
    sc_core::sc_out<bool> dma0_axis_c2h_status_drop;
    sc_core::sc_out<bool> dma0_axis_c2h_status_error;
    sc_core::sc_out<bool> dma0_axis_c2h_status_valid;
    sc_core::sc_out<bool> dma0_axis_c2h_status_status_cmp;
    sc_core::sc_out<sc_dt::sc_bv<12> >  dma0_axis_c2h_status_qid;
    sc_core::sc_out<bool> dma0_qsts_out_vld;
    sc_core::sc_out<sc_dt::sc_bv<8> >  dma0_qsts_out_op;
    sc_core::sc_in<bool> dma0_qsts_out_rdy;
    sc_core::sc_out<sc_dt::sc_bv<13> >  dma0_qsts_out_qid;
    sc_core::sc_out<sc_dt::sc_bv<64> >  dma0_qsts_out_data;
    sc_core::sc_out<sc_dt::sc_bv<3> >  dma0_qsts_out_port_id;
    sc_core::sc_out<bool> dma0_dsc_crdt_in_rdy;
    sc_core::sc_in<bool> dma0_dsc_crdt_in_dir;
    sc_core::sc_in<bool> dma0_dsc_crdt_in_valid;
    sc_core::sc_in<bool> dma0_dsc_crdt_in_fence;
    sc_core::sc_in<sc_dt::sc_bv<12> >  dma0_dsc_crdt_in_qid;
    sc_core::sc_in<sc_dt::sc_bv<16> >  dma0_dsc_crdt_in_crdt;
    sc_core::sc_out<bool> dma0_usr_irq_ack;
    sc_core::sc_out<bool> dma0_usr_irq_fail;
    sc_core::sc_in<bool> dma0_usr_irq_valid;
    sc_core::sc_in<sc_dt::sc_bv<11> >  dma0_usr_irq_vec;
    sc_core::sc_in<sc_dt::sc_bv<13> >  dma0_usr_irq_fnc;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_mm;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_qen;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_byp;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_dir;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_error;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_valid;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_qinv;
    sc_core::sc_out<bool> dma0_tm_dsc_sts_irq_arm;
    sc_core::sc_in<bool> dma0_tm_dsc_sts_rdy;
    sc_core::sc_out<sc_dt::sc_bv<12> >  dma0_tm_dsc_sts_qid;
    sc_core::sc_out<sc_dt::sc_bv<16> >  dma0_tm_dsc_sts_avl;
    sc_core::sc_out<sc_dt::sc_bv<16> >  dma0_tm_dsc_sts_pidx;
    sc_core::sc_out<sc_dt::sc_bv<3> >  dma0_tm_dsc_sts_port_id;
    sc_core::sc_out<bool> dma0_usr_flr_set;
    sc_core::sc_out<bool> dma0_usr_flr_clear;
    sc_core::sc_out<sc_dt::sc_bv<13> >  dma0_usr_flr_fnc;
    sc_core::sc_in<bool> dma0_usr_flr_done_vld;
    sc_core::sc_in<sc_dt::sc_bv<13> >  dma0_usr_flr_done_fnc;
    sc_core::sc_in<sc_dt::sc_bv<8> >  PCIE0_GT_grx_n;
    sc_core::sc_out<sc_dt::sc_bv<8> >  PCIE0_GT_gtx_n;
    sc_core::sc_in<sc_dt::sc_bv<8> >  PCIE0_GT_grx_p;
    sc_core::sc_out<sc_dt::sc_bv<8> >  PCIE0_GT_gtx_p;
    sc_core::sc_in<bool> gt_refclk0_clk_n;
    sc_core::sc_in<bool> gt_refclk0_clk_p;

 

        //Adding AXIMM/AXIS interfaces here
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_0_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_0_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_1_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_1_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_2_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_2_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_3_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      FPD_CCI_NOC_3_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      LPD_AXI_NOC_0_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      LPD_AXI_NOC_0_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      PMC_NOC_AXI_0_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      PMC_NOC_AXI_0_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_target_socket*         NOC_PMC_AXI_0_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_target_socket*         NOC_PMC_AXI_0_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      CPM_PCIE_NOC_0_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      CPM_PCIE_NOC_0_tlm_aximm_read_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      CPM_PCIE_NOC_1_tlm_aximm_write_socket=0;
        xtlm::xtlm_aximm_initiator_socket*      CPM_PCIE_NOC_1_tlm_aximm_read_socket=0;
        //Adding AXIMM/AXIS interfaces here
        xtlm::xtlm_axis_initiator_socket*      dma0_st_rx_msg_tlm_axis_socket=0;

    
        //constructor having three paramters
        // 1. module name in sc_module_name objec,
        // 2. reference to map object of name and integer value pairs
        // 3. reference to map object of name and string value pairs
        // All the model parameters (integer and string) which are configuration parameters
        // of ZynqUltraScale+ IP propogated from Vivado
        versal_cips_v3_4_8_tlm (sc_core::sc_module_name name, xsc::common_cpp::properties model_param_props);
        ~versal_cips_v3_4_8_tlm();
        SC_HAS_PROCESS(versal_cips_v3_4_8_tlm);

private:
    //zynqmp tlm wrapper provided by Edgar
    //module with interfaces of standard tlm
    //and input/output ports at signal level
    xilinx_versal_vitis* m_zynq3_tlm_model;

    // Array of Xtlm2tlm Bridges
    // Converts Xtlm transactions to tlm transactions
    // Bridge's Xtlm wr/rd target sockets binds with
    // xtlm initiator sockets of zynq_ultra_ps_e_tlm and tlm simple initiator
    // socket with xilinx_zynqmp's target socket
    // Array of size 11

    xtlm::xaximm_xtlm2tlm_t<128,32> *m_xtlm2tlm_9;
    xtlm::xaximm_xtlm2tlm_t<32,32> *m_xtlm2tlm_10;

    rptlm2xtlm_converter<32,128 > m_rp_bridge_FPD_CCI_NOC_0;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_FPD_CCI_NOC_1;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_FPD_CCI_NOC_2;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_FPD_CCI_NOC_3;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_LPD_AXI_NOC_0;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_PMC_NOC_AXI_0;
    rptlm2xtlm_converter<32,128 > m_rp_bridge_CPM_PCIE_NOC_1;
       
    rptlm2xtlm_converter<32,32 > *m_rp_bridge_pmc_npi_aie2;

    sc_core::sc_clock pmc_noc_clk;
    sc_core::sc_clock *fpd_cci_noc_clk;
    sc_core::sc_clock *lpd_axi_noc_clk_sig;
    sc_core::sc_clock *cpm_pcie_noc_axi0_clk_sig;


    void trigger_ps_pmc_noc_axi0_clk_pin();
    void trigger_ps_noc_pcie_axi0_clk_pin();
    void trigger_ps_noc_cci_axi0_clk_pin();
    void trigger_ps_noc_cci_axi1_clk_pin();
    void trigger_ps_noc_cci_axi2_clk_pin();
    void trigger_ps_noc_cci_axi3_clk_pin();
    void trigger_lpd_axi_noc_clk_pin();
    void trigger_noc_pmc_axi0_clk_pin();
    void pl_ps_irq_method();

    sc_signal<bool> qemu_rst;
    void start_of_simulation();
    void rwd_tlmmodule_init();
    rwd_tlmmodel* m_rwd_tlmmodel;
    RdWrTCPSocket* m_rdwrtcpsock;
    std::thread* m_rwd_thread;
    rptlm2xtlm_converter<32,128 >* rwd_tlm2xtlm_brdg;
    xtlm_simple_interconnect_model* rwd_pmc_interconnect;
#ifndef XM_SYSTEMC
    sim_qdma* m_sim_qdma_ptr{nullptr};
    xtlm_simple_interconnect_model* sim_qdma_interconnect{nullptr};
    sc_core::sc_signal<bool> dummy_noc_pcie_sig;
#endif

#ifndef XM_SYSTEMC 
    void enable_sim_qdma();
#else 
    void disable_sim_qdma();
#endif
    
    //for stubbing axis interfaces of pcie.. TODO: in future they bind to sim_qdma
    sc_signal<sc_bv<16> > dummy_usr_irq_req;
    sc_signal<sc_bv<16> > dummy_usr_irq_ack;
    
    std::vector<xtlm::xtlm_axis_target_stub*>    axis_slave_stub;
    std::vector<xtlm::xtlm_axis_initiator_stub*> axis_master_stub;
    std::vector<xtlm::xtlm_aximm_target_stub*>    aximm_slave_stub;
    std::vector<xtlm::xtlm_aximm_initiator_stub*> aximm_master_stub;
    
    std::vector<PF_BAR_st_type*> bar_info;

    void before_end_of_elaboration();
    void end_of_elaboration();

    xtlm_simple_interconnect_model *xram_interconnect;
    void XRAM_connections();
    void export_simulation();

};
#endif

