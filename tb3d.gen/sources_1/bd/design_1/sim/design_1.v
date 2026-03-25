//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Tue Mar 24 17:24:45 2026
//Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi_noc_cnt=1,da_board_cnt=5,da_cips_cnt=1,da_clkrst_cnt=3,da_mb_cnt=2,da_pcie_phy_versal_cnt=1,da_pcie_versal_cnt=1,da_qdma_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (ch0_lpddr4_trip1_ca_a,
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
    clk_100MHz,
    lpddr4_clk1_clk_n,
    lpddr4_clk1_clk_p,
    reset_rtl);
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CA_A" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch0_lpddr4_trip1, CAN_DEBUG false" *) output [5:0]ch0_lpddr4_trip1_ca_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CA_B" *) output [5:0]ch0_lpddr4_trip1_ca_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CK_C_A" *) output ch0_lpddr4_trip1_ck_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CK_C_B" *) output ch0_lpddr4_trip1_ck_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CK_T_A" *) output ch0_lpddr4_trip1_ck_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CK_T_B" *) output ch0_lpddr4_trip1_ck_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CKE_A" *) output ch0_lpddr4_trip1_cke_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CKE_B" *) output ch0_lpddr4_trip1_cke_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CS_A" *) output ch0_lpddr4_trip1_cs_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 CS_B" *) output ch0_lpddr4_trip1_cs_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DMI_A" *) inout [1:0]ch0_lpddr4_trip1_dmi_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DMI_B" *) inout [1:0]ch0_lpddr4_trip1_dmi_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQ_A" *) inout [15:0]ch0_lpddr4_trip1_dq_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQ_B" *) inout [15:0]ch0_lpddr4_trip1_dq_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQS_C_A" *) inout [1:0]ch0_lpddr4_trip1_dqs_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQS_C_B" *) inout [1:0]ch0_lpddr4_trip1_dqs_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQS_T_A" *) inout [1:0]ch0_lpddr4_trip1_dqs_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 DQS_T_B" *) inout [1:0]ch0_lpddr4_trip1_dqs_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip1 RESET_N" *) output ch0_lpddr4_trip1_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CA_A" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch1_lpddr4_trip1, CAN_DEBUG false" *) output [5:0]ch1_lpddr4_trip1_ca_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CA_B" *) output [5:0]ch1_lpddr4_trip1_ca_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CK_C_A" *) output ch1_lpddr4_trip1_ck_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CK_C_B" *) output ch1_lpddr4_trip1_ck_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CK_T_A" *) output ch1_lpddr4_trip1_ck_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CK_T_B" *) output ch1_lpddr4_trip1_ck_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CKE_A" *) output ch1_lpddr4_trip1_cke_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CKE_B" *) output ch1_lpddr4_trip1_cke_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CS_A" *) output ch1_lpddr4_trip1_cs_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 CS_B" *) output ch1_lpddr4_trip1_cs_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DMI_A" *) inout [1:0]ch1_lpddr4_trip1_dmi_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DMI_B" *) inout [1:0]ch1_lpddr4_trip1_dmi_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQ_A" *) inout [15:0]ch1_lpddr4_trip1_dq_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQ_B" *) inout [15:0]ch1_lpddr4_trip1_dq_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQS_C_A" *) inout [1:0]ch1_lpddr4_trip1_dqs_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQS_C_B" *) inout [1:0]ch1_lpddr4_trip1_dqs_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQS_T_A" *) inout [1:0]ch1_lpddr4_trip1_dqs_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 DQS_T_B" *) inout [1:0]ch1_lpddr4_trip1_dqs_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip1 RESET_N" *) output ch1_lpddr4_trip1_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk1 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lpddr4_clk1, CAN_DEBUG false, FREQ_HZ 200000000" *) input lpddr4_clk1_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk1 CLK_P" *) input lpddr4_clk1_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl;

  wire [5:0]ch0_lpddr4_trip1_ca_a;
  wire [5:0]ch0_lpddr4_trip1_ca_b;
  wire [0:0]\^ch0_lpddr4_trip1_ck_c_a ;
  wire [0:0]\^ch0_lpddr4_trip1_ck_c_b ;
  wire [0:0]\^ch0_lpddr4_trip1_ck_t_a ;
  wire [0:0]\^ch0_lpddr4_trip1_ck_t_b ;
  wire [0:0]\^ch0_lpddr4_trip1_cke_a ;
  wire [0:0]\^ch0_lpddr4_trip1_cke_b ;
  wire [0:0]\^ch0_lpddr4_trip1_cs_a ;
  wire [0:0]\^ch0_lpddr4_trip1_cs_b ;
  wire [1:0]ch0_lpddr4_trip1_dmi_a;
  wire [1:0]ch0_lpddr4_trip1_dmi_b;
  wire [15:0]ch0_lpddr4_trip1_dq_a;
  wire [15:0]ch0_lpddr4_trip1_dq_b;
  wire [1:0]ch0_lpddr4_trip1_dqs_c_a;
  wire [1:0]ch0_lpddr4_trip1_dqs_c_b;
  wire [1:0]ch0_lpddr4_trip1_dqs_t_a;
  wire [1:0]ch0_lpddr4_trip1_dqs_t_b;
  wire [0:0]\^ch0_lpddr4_trip1_reset_n ;
  wire [5:0]ch1_lpddr4_trip1_ca_a;
  wire [5:0]ch1_lpddr4_trip1_ca_b;
  wire [0:0]\^ch1_lpddr4_trip1_ck_c_a ;
  wire [0:0]\^ch1_lpddr4_trip1_ck_c_b ;
  wire [0:0]\^ch1_lpddr4_trip1_ck_t_a ;
  wire [0:0]\^ch1_lpddr4_trip1_ck_t_b ;
  wire [0:0]\^ch1_lpddr4_trip1_cke_a ;
  wire [0:0]\^ch1_lpddr4_trip1_cke_b ;
  wire [0:0]\^ch1_lpddr4_trip1_cs_a ;
  wire [0:0]\^ch1_lpddr4_trip1_cs_b ;
  wire [1:0]ch1_lpddr4_trip1_dmi_a;
  wire [1:0]ch1_lpddr4_trip1_dmi_b;
  wire [15:0]ch1_lpddr4_trip1_dq_a;
  wire [15:0]ch1_lpddr4_trip1_dq_b;
  wire [1:0]ch1_lpddr4_trip1_dqs_c_a;
  wire [1:0]ch1_lpddr4_trip1_dqs_c_b;
  wire [1:0]ch1_lpddr4_trip1_dqs_t_a;
  wire [1:0]ch1_lpddr4_trip1_dqs_t_b;
  wire [0:0]\^ch1_lpddr4_trip1_reset_n ;
  wire clk_100MHz;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire lpddr4_clk1_clk_n;
  wire lpddr4_clk1_clk_p;
  wire mdm_1_debug_sys_rst;
  wire microblaze_0_Clk;
  wire [0:31]microblaze_0_DLMB_ABUS;
  wire microblaze_0_DLMB_ADDRSTROBE;
  wire [0:3]microblaze_0_DLMB_BE;
  wire microblaze_0_DLMB_CE;
  wire [0:31]microblaze_0_DLMB_READDBUS;
  wire microblaze_0_DLMB_READSTROBE;
  wire microblaze_0_DLMB_READY;
  wire microblaze_0_DLMB_UE;
  wire microblaze_0_DLMB_WAIT;
  wire [0:31]microblaze_0_DLMB_WRITEDBUS;
  wire microblaze_0_DLMB_WRITESTROBE;
  wire [0:31]microblaze_0_ILMB_ABUS;
  wire microblaze_0_ILMB_ADDRSTROBE;
  wire microblaze_0_ILMB_CE;
  wire [0:31]microblaze_0_ILMB_READDBUS;
  wire microblaze_0_ILMB_READSTROBE;
  wire microblaze_0_ILMB_READY;
  wire microblaze_0_ILMB_UE;
  wire microblaze_0_ILMB_WAIT;
  wire reset_rtl;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire [0:0]rst_noc_clk_gen_300M_bus_struct_reset;
  wire rst_noc_clk_gen_300M_mb_reset;
  wire [7:0]tb3d_transcoder_0_legacy_out;
  wire [7:0]tb3d_transcoder_0_tb3d_out;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_0_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_1_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_1_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_1_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_1_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_1_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_1_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_1_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_1_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_1_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_2_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_2_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_2_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_2_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_2_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_2_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_2_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_2_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_2_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_3_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_3_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_3_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_3_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_3_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_3_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_3_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_3_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_3_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_LPD_AXI_NOC_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_LPD_AXI_NOC_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_LPD_AXI_NOC_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_LPD_AXI_NOC_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_LPD_AXI_NOC_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_LPD_AXI_NOC_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_LPD_AXI_NOC_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_LPD_AXI_NOC_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_WSTRB;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_PMC_NOC_AXI_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_PMC_NOC_AXI_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_PMC_NOC_AXI_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_PMC_NOC_AXI_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_PMC_NOC_AXI_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_PMC_NOC_AXI_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_BRESP;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_BUSER;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_PMC_NOC_AXI_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_PMC_NOC_AXI_0_RUSER;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_PMC_NOC_AXI_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_PMC_NOC_AXI_0_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_WVALID;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi1_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi2_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi3_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_lpd_axi_noc_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_pmc_axi_noc_axi0_clk;

  assign ch0_lpddr4_trip1_ck_c_a = \^ch0_lpddr4_trip1_ck_c_a [0];
  assign ch0_lpddr4_trip1_ck_c_b = \^ch0_lpddr4_trip1_ck_c_b [0];
  assign ch0_lpddr4_trip1_ck_t_a = \^ch0_lpddr4_trip1_ck_t_a [0];
  assign ch0_lpddr4_trip1_ck_t_b = \^ch0_lpddr4_trip1_ck_t_b [0];
  assign ch0_lpddr4_trip1_cke_a = \^ch0_lpddr4_trip1_cke_a [0];
  assign ch0_lpddr4_trip1_cke_b = \^ch0_lpddr4_trip1_cke_b [0];
  assign ch0_lpddr4_trip1_cs_a = \^ch0_lpddr4_trip1_cs_a [0];
  assign ch0_lpddr4_trip1_cs_b = \^ch0_lpddr4_trip1_cs_b [0];
  assign ch0_lpddr4_trip1_reset_n = \^ch0_lpddr4_trip1_reset_n [0];
  assign ch1_lpddr4_trip1_ck_c_a = \^ch1_lpddr4_trip1_ck_c_a [0];
  assign ch1_lpddr4_trip1_ck_c_b = \^ch1_lpddr4_trip1_ck_c_b [0];
  assign ch1_lpddr4_trip1_ck_t_a = \^ch1_lpddr4_trip1_ck_t_a [0];
  assign ch1_lpddr4_trip1_ck_t_b = \^ch1_lpddr4_trip1_ck_t_b [0];
  assign ch1_lpddr4_trip1_cke_a = \^ch1_lpddr4_trip1_cke_a [0];
  assign ch1_lpddr4_trip1_cke_b = \^ch1_lpddr4_trip1_cke_b [0];
  assign ch1_lpddr4_trip1_cs_a = \^ch1_lpddr4_trip1_cs_a [0];
  assign ch1_lpddr4_trip1_cs_b = \^ch1_lpddr4_trip1_cs_b [0];
  assign ch1_lpddr4_trip1_reset_n = \^ch1_lpddr4_trip1_reset_n [0];
  design_1_axi_noc_0_0 axi_noc_0
       (.CH0_LPDDR4_0_ca_a(ch0_lpddr4_trip1_ca_a),
        .CH0_LPDDR4_0_ca_b(ch0_lpddr4_trip1_ca_b),
        .CH0_LPDDR4_0_ck_c_a(\^ch0_lpddr4_trip1_ck_c_a ),
        .CH0_LPDDR4_0_ck_c_b(\^ch0_lpddr4_trip1_ck_c_b ),
        .CH0_LPDDR4_0_ck_t_a(\^ch0_lpddr4_trip1_ck_t_a ),
        .CH0_LPDDR4_0_ck_t_b(\^ch0_lpddr4_trip1_ck_t_b ),
        .CH0_LPDDR4_0_cke_a(\^ch0_lpddr4_trip1_cke_a ),
        .CH0_LPDDR4_0_cke_b(\^ch0_lpddr4_trip1_cke_b ),
        .CH0_LPDDR4_0_cs_a(\^ch0_lpddr4_trip1_cs_a ),
        .CH0_LPDDR4_0_cs_b(\^ch0_lpddr4_trip1_cs_b ),
        .CH0_LPDDR4_0_dmi_a(ch0_lpddr4_trip1_dmi_a),
        .CH0_LPDDR4_0_dmi_b(ch0_lpddr4_trip1_dmi_b),
        .CH0_LPDDR4_0_dq_a(ch0_lpddr4_trip1_dq_a),
        .CH0_LPDDR4_0_dq_b(ch0_lpddr4_trip1_dq_b),
        .CH0_LPDDR4_0_dqs_c_a(ch0_lpddr4_trip1_dqs_c_a),
        .CH0_LPDDR4_0_dqs_c_b(ch0_lpddr4_trip1_dqs_c_b),
        .CH0_LPDDR4_0_dqs_t_a(ch0_lpddr4_trip1_dqs_t_a),
        .CH0_LPDDR4_0_dqs_t_b(ch0_lpddr4_trip1_dqs_t_b),
        .CH0_LPDDR4_0_reset_n(\^ch0_lpddr4_trip1_reset_n ),
        .CH1_LPDDR4_0_ca_a(ch1_lpddr4_trip1_ca_a),
        .CH1_LPDDR4_0_ca_b(ch1_lpddr4_trip1_ca_b),
        .CH1_LPDDR4_0_ck_c_a(\^ch1_lpddr4_trip1_ck_c_a ),
        .CH1_LPDDR4_0_ck_c_b(\^ch1_lpddr4_trip1_ck_c_b ),
        .CH1_LPDDR4_0_ck_t_a(\^ch1_lpddr4_trip1_ck_t_a ),
        .CH1_LPDDR4_0_ck_t_b(\^ch1_lpddr4_trip1_ck_t_b ),
        .CH1_LPDDR4_0_cke_a(\^ch1_lpddr4_trip1_cke_a ),
        .CH1_LPDDR4_0_cke_b(\^ch1_lpddr4_trip1_cke_b ),
        .CH1_LPDDR4_0_cs_a(\^ch1_lpddr4_trip1_cs_a ),
        .CH1_LPDDR4_0_cs_b(\^ch1_lpddr4_trip1_cs_b ),
        .CH1_LPDDR4_0_dmi_a(ch1_lpddr4_trip1_dmi_a),
        .CH1_LPDDR4_0_dmi_b(ch1_lpddr4_trip1_dmi_b),
        .CH1_LPDDR4_0_dq_a(ch1_lpddr4_trip1_dq_a),
        .CH1_LPDDR4_0_dq_b(ch1_lpddr4_trip1_dq_b),
        .CH1_LPDDR4_0_dqs_c_a(ch1_lpddr4_trip1_dqs_c_a),
        .CH1_LPDDR4_0_dqs_c_b(ch1_lpddr4_trip1_dqs_c_b),
        .CH1_LPDDR4_0_dqs_t_a(ch1_lpddr4_trip1_dqs_t_a),
        .CH1_LPDDR4_0_dqs_t_b(ch1_lpddr4_trip1_dqs_t_b),
        .CH1_LPDDR4_0_reset_n(\^ch1_lpddr4_trip1_reset_n ),
        .S00_AXI_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
        .S00_AXI_arburst(versal_cips_0_FPD_CCI_NOC_0_ARBURST),
        .S00_AXI_arcache(versal_cips_0_FPD_CCI_NOC_0_ARCACHE),
        .S00_AXI_arid(versal_cips_0_FPD_CCI_NOC_0_ARID),
        .S00_AXI_arlen(versal_cips_0_FPD_CCI_NOC_0_ARLEN),
        .S00_AXI_arlock(versal_cips_0_FPD_CCI_NOC_0_ARLOCK),
        .S00_AXI_arprot(versal_cips_0_FPD_CCI_NOC_0_ARPROT),
        .S00_AXI_arqos(versal_cips_0_FPD_CCI_NOC_0_ARQOS),
        .S00_AXI_arready(versal_cips_0_FPD_CCI_NOC_0_ARREADY),
        .S00_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arsize(versal_cips_0_FPD_CCI_NOC_0_ARSIZE),
        .S00_AXI_aruser(versal_cips_0_FPD_CCI_NOC_0_ARUSER),
        .S00_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_0_ARVALID),
        .S00_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_0_AWADDR),
        .S00_AXI_awburst(versal_cips_0_FPD_CCI_NOC_0_AWBURST),
        .S00_AXI_awcache(versal_cips_0_FPD_CCI_NOC_0_AWCACHE),
        .S00_AXI_awid(versal_cips_0_FPD_CCI_NOC_0_AWID),
        .S00_AXI_awlen(versal_cips_0_FPD_CCI_NOC_0_AWLEN),
        .S00_AXI_awlock(versal_cips_0_FPD_CCI_NOC_0_AWLOCK),
        .S00_AXI_awprot(versal_cips_0_FPD_CCI_NOC_0_AWPROT),
        .S00_AXI_awqos(versal_cips_0_FPD_CCI_NOC_0_AWQOS),
        .S00_AXI_awready(versal_cips_0_FPD_CCI_NOC_0_AWREADY),
        .S00_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awsize(versal_cips_0_FPD_CCI_NOC_0_AWSIZE),
        .S00_AXI_awuser(versal_cips_0_FPD_CCI_NOC_0_AWUSER),
        .S00_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_0_AWVALID),
        .S00_AXI_bid(versal_cips_0_FPD_CCI_NOC_0_BID),
        .S00_AXI_bready(versal_cips_0_FPD_CCI_NOC_0_BREADY),
        .S00_AXI_bresp(versal_cips_0_FPD_CCI_NOC_0_BRESP),
        .S00_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_0_BVALID),
        .S00_AXI_rdata(versal_cips_0_FPD_CCI_NOC_0_RDATA),
        .S00_AXI_rid(versal_cips_0_FPD_CCI_NOC_0_RID),
        .S00_AXI_rlast(versal_cips_0_FPD_CCI_NOC_0_RLAST),
        .S00_AXI_rready(versal_cips_0_FPD_CCI_NOC_0_RREADY),
        .S00_AXI_rresp(versal_cips_0_FPD_CCI_NOC_0_RRESP),
        .S00_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_0_RVALID),
        .S00_AXI_wdata(versal_cips_0_FPD_CCI_NOC_0_WDATA),
        .S00_AXI_wlast(versal_cips_0_FPD_CCI_NOC_0_WLAST),
        .S00_AXI_wready(versal_cips_0_FPD_CCI_NOC_0_WREADY),
        .S00_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_0_WSTRB),
        .S00_AXI_wuser(versal_cips_0_FPD_CCI_NOC_0_WUSER),
        .S00_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_0_WVALID),
        .S01_AXI_araddr(versal_cips_0_FPD_CCI_NOC_1_ARADDR),
        .S01_AXI_arburst(versal_cips_0_FPD_CCI_NOC_1_ARBURST),
        .S01_AXI_arcache(versal_cips_0_FPD_CCI_NOC_1_ARCACHE),
        .S01_AXI_arid(versal_cips_0_FPD_CCI_NOC_1_ARID),
        .S01_AXI_arlen(versal_cips_0_FPD_CCI_NOC_1_ARLEN),
        .S01_AXI_arlock(versal_cips_0_FPD_CCI_NOC_1_ARLOCK),
        .S01_AXI_arprot(versal_cips_0_FPD_CCI_NOC_1_ARPROT),
        .S01_AXI_arqos(versal_cips_0_FPD_CCI_NOC_1_ARQOS),
        .S01_AXI_arready(versal_cips_0_FPD_CCI_NOC_1_ARREADY),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize(versal_cips_0_FPD_CCI_NOC_1_ARSIZE),
        .S01_AXI_aruser(versal_cips_0_FPD_CCI_NOC_1_ARUSER),
        .S01_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_1_ARVALID),
        .S01_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_1_AWADDR),
        .S01_AXI_awburst(versal_cips_0_FPD_CCI_NOC_1_AWBURST),
        .S01_AXI_awcache(versal_cips_0_FPD_CCI_NOC_1_AWCACHE),
        .S01_AXI_awid(versal_cips_0_FPD_CCI_NOC_1_AWID),
        .S01_AXI_awlen(versal_cips_0_FPD_CCI_NOC_1_AWLEN),
        .S01_AXI_awlock(versal_cips_0_FPD_CCI_NOC_1_AWLOCK),
        .S01_AXI_awprot(versal_cips_0_FPD_CCI_NOC_1_AWPROT),
        .S01_AXI_awqos(versal_cips_0_FPD_CCI_NOC_1_AWQOS),
        .S01_AXI_awready(versal_cips_0_FPD_CCI_NOC_1_AWREADY),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize(versal_cips_0_FPD_CCI_NOC_1_AWSIZE),
        .S01_AXI_awuser(versal_cips_0_FPD_CCI_NOC_1_AWUSER),
        .S01_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_1_AWVALID),
        .S01_AXI_bid(versal_cips_0_FPD_CCI_NOC_1_BID),
        .S01_AXI_bready(versal_cips_0_FPD_CCI_NOC_1_BREADY),
        .S01_AXI_bresp(versal_cips_0_FPD_CCI_NOC_1_BRESP),
        .S01_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_1_BVALID),
        .S01_AXI_rdata(versal_cips_0_FPD_CCI_NOC_1_RDATA),
        .S01_AXI_rid(versal_cips_0_FPD_CCI_NOC_1_RID),
        .S01_AXI_rlast(versal_cips_0_FPD_CCI_NOC_1_RLAST),
        .S01_AXI_rready(versal_cips_0_FPD_CCI_NOC_1_RREADY),
        .S01_AXI_rresp(versal_cips_0_FPD_CCI_NOC_1_RRESP),
        .S01_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_1_RVALID),
        .S01_AXI_wdata(versal_cips_0_FPD_CCI_NOC_1_WDATA),
        .S01_AXI_wlast(versal_cips_0_FPD_CCI_NOC_1_WLAST),
        .S01_AXI_wready(versal_cips_0_FPD_CCI_NOC_1_WREADY),
        .S01_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_1_WSTRB),
        .S01_AXI_wuser(versal_cips_0_FPD_CCI_NOC_1_WUSER),
        .S01_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_1_WVALID),
        .S02_AXI_araddr(versal_cips_0_FPD_CCI_NOC_2_ARADDR),
        .S02_AXI_arburst(versal_cips_0_FPD_CCI_NOC_2_ARBURST),
        .S02_AXI_arcache(versal_cips_0_FPD_CCI_NOC_2_ARCACHE),
        .S02_AXI_arid(versal_cips_0_FPD_CCI_NOC_2_ARID),
        .S02_AXI_arlen(versal_cips_0_FPD_CCI_NOC_2_ARLEN),
        .S02_AXI_arlock(versal_cips_0_FPD_CCI_NOC_2_ARLOCK),
        .S02_AXI_arprot(versal_cips_0_FPD_CCI_NOC_2_ARPROT),
        .S02_AXI_arqos(versal_cips_0_FPD_CCI_NOC_2_ARQOS),
        .S02_AXI_arready(versal_cips_0_FPD_CCI_NOC_2_ARREADY),
        .S02_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arsize(versal_cips_0_FPD_CCI_NOC_2_ARSIZE),
        .S02_AXI_aruser(versal_cips_0_FPD_CCI_NOC_2_ARUSER),
        .S02_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_2_ARVALID),
        .S02_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_2_AWADDR),
        .S02_AXI_awburst(versal_cips_0_FPD_CCI_NOC_2_AWBURST),
        .S02_AXI_awcache(versal_cips_0_FPD_CCI_NOC_2_AWCACHE),
        .S02_AXI_awid(versal_cips_0_FPD_CCI_NOC_2_AWID),
        .S02_AXI_awlen(versal_cips_0_FPD_CCI_NOC_2_AWLEN),
        .S02_AXI_awlock(versal_cips_0_FPD_CCI_NOC_2_AWLOCK),
        .S02_AXI_awprot(versal_cips_0_FPD_CCI_NOC_2_AWPROT),
        .S02_AXI_awqos(versal_cips_0_FPD_CCI_NOC_2_AWQOS),
        .S02_AXI_awready(versal_cips_0_FPD_CCI_NOC_2_AWREADY),
        .S02_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awsize(versal_cips_0_FPD_CCI_NOC_2_AWSIZE),
        .S02_AXI_awuser(versal_cips_0_FPD_CCI_NOC_2_AWUSER),
        .S02_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_2_AWVALID),
        .S02_AXI_bid(versal_cips_0_FPD_CCI_NOC_2_BID),
        .S02_AXI_bready(versal_cips_0_FPD_CCI_NOC_2_BREADY),
        .S02_AXI_bresp(versal_cips_0_FPD_CCI_NOC_2_BRESP),
        .S02_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_2_BVALID),
        .S02_AXI_rdata(versal_cips_0_FPD_CCI_NOC_2_RDATA),
        .S02_AXI_rid(versal_cips_0_FPD_CCI_NOC_2_RID),
        .S02_AXI_rlast(versal_cips_0_FPD_CCI_NOC_2_RLAST),
        .S02_AXI_rready(versal_cips_0_FPD_CCI_NOC_2_RREADY),
        .S02_AXI_rresp(versal_cips_0_FPD_CCI_NOC_2_RRESP),
        .S02_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_2_RVALID),
        .S02_AXI_wdata(versal_cips_0_FPD_CCI_NOC_2_WDATA),
        .S02_AXI_wlast(versal_cips_0_FPD_CCI_NOC_2_WLAST),
        .S02_AXI_wready(versal_cips_0_FPD_CCI_NOC_2_WREADY),
        .S02_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_2_WSTRB),
        .S02_AXI_wuser(versal_cips_0_FPD_CCI_NOC_2_WUSER),
        .S02_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_2_WVALID),
        .S03_AXI_araddr(versal_cips_0_FPD_CCI_NOC_3_ARADDR),
        .S03_AXI_arburst(versal_cips_0_FPD_CCI_NOC_3_ARBURST),
        .S03_AXI_arcache(versal_cips_0_FPD_CCI_NOC_3_ARCACHE),
        .S03_AXI_arid(versal_cips_0_FPD_CCI_NOC_3_ARID),
        .S03_AXI_arlen(versal_cips_0_FPD_CCI_NOC_3_ARLEN),
        .S03_AXI_arlock(versal_cips_0_FPD_CCI_NOC_3_ARLOCK),
        .S03_AXI_arprot(versal_cips_0_FPD_CCI_NOC_3_ARPROT),
        .S03_AXI_arqos(versal_cips_0_FPD_CCI_NOC_3_ARQOS),
        .S03_AXI_arready(versal_cips_0_FPD_CCI_NOC_3_ARREADY),
        .S03_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arsize(versal_cips_0_FPD_CCI_NOC_3_ARSIZE),
        .S03_AXI_aruser(versal_cips_0_FPD_CCI_NOC_3_ARUSER),
        .S03_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_3_ARVALID),
        .S03_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_3_AWADDR),
        .S03_AXI_awburst(versal_cips_0_FPD_CCI_NOC_3_AWBURST),
        .S03_AXI_awcache(versal_cips_0_FPD_CCI_NOC_3_AWCACHE),
        .S03_AXI_awid(versal_cips_0_FPD_CCI_NOC_3_AWID),
        .S03_AXI_awlen(versal_cips_0_FPD_CCI_NOC_3_AWLEN),
        .S03_AXI_awlock(versal_cips_0_FPD_CCI_NOC_3_AWLOCK),
        .S03_AXI_awprot(versal_cips_0_FPD_CCI_NOC_3_AWPROT),
        .S03_AXI_awqos(versal_cips_0_FPD_CCI_NOC_3_AWQOS),
        .S03_AXI_awready(versal_cips_0_FPD_CCI_NOC_3_AWREADY),
        .S03_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_awsize(versal_cips_0_FPD_CCI_NOC_3_AWSIZE),
        .S03_AXI_awuser(versal_cips_0_FPD_CCI_NOC_3_AWUSER),
        .S03_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_3_AWVALID),
        .S03_AXI_bid(versal_cips_0_FPD_CCI_NOC_3_BID),
        .S03_AXI_bready(versal_cips_0_FPD_CCI_NOC_3_BREADY),
        .S03_AXI_bresp(versal_cips_0_FPD_CCI_NOC_3_BRESP),
        .S03_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_3_BVALID),
        .S03_AXI_rdata(versal_cips_0_FPD_CCI_NOC_3_RDATA),
        .S03_AXI_rid(versal_cips_0_FPD_CCI_NOC_3_RID),
        .S03_AXI_rlast(versal_cips_0_FPD_CCI_NOC_3_RLAST),
        .S03_AXI_rready(versal_cips_0_FPD_CCI_NOC_3_RREADY),
        .S03_AXI_rresp(versal_cips_0_FPD_CCI_NOC_3_RRESP),
        .S03_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_3_RVALID),
        .S03_AXI_wdata(versal_cips_0_FPD_CCI_NOC_3_WDATA),
        .S03_AXI_wlast(versal_cips_0_FPD_CCI_NOC_3_WLAST),
        .S03_AXI_wready(versal_cips_0_FPD_CCI_NOC_3_WREADY),
        .S03_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_3_WSTRB),
        .S03_AXI_wuser(versal_cips_0_FPD_CCI_NOC_3_WUSER),
        .S03_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_3_WVALID),
        .S04_AXI_araddr(versal_cips_0_LPD_AXI_NOC_0_ARADDR),
        .S04_AXI_arburst(versal_cips_0_LPD_AXI_NOC_0_ARBURST),
        .S04_AXI_arcache(versal_cips_0_LPD_AXI_NOC_0_ARCACHE),
        .S04_AXI_arid(versal_cips_0_LPD_AXI_NOC_0_ARID),
        .S04_AXI_arlen(versal_cips_0_LPD_AXI_NOC_0_ARLEN),
        .S04_AXI_arlock(versal_cips_0_LPD_AXI_NOC_0_ARLOCK),
        .S04_AXI_arprot(versal_cips_0_LPD_AXI_NOC_0_ARPROT),
        .S04_AXI_arqos(versal_cips_0_LPD_AXI_NOC_0_ARQOS),
        .S04_AXI_arready(versal_cips_0_LPD_AXI_NOC_0_ARREADY),
        .S04_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_arsize(versal_cips_0_LPD_AXI_NOC_0_ARSIZE),
        .S04_AXI_aruser(versal_cips_0_LPD_AXI_NOC_0_ARUSER),
        .S04_AXI_arvalid(versal_cips_0_LPD_AXI_NOC_0_ARVALID),
        .S04_AXI_awaddr(versal_cips_0_LPD_AXI_NOC_0_AWADDR),
        .S04_AXI_awburst(versal_cips_0_LPD_AXI_NOC_0_AWBURST),
        .S04_AXI_awcache(versal_cips_0_LPD_AXI_NOC_0_AWCACHE),
        .S04_AXI_awid(versal_cips_0_LPD_AXI_NOC_0_AWID),
        .S04_AXI_awlen(versal_cips_0_LPD_AXI_NOC_0_AWLEN),
        .S04_AXI_awlock(versal_cips_0_LPD_AXI_NOC_0_AWLOCK),
        .S04_AXI_awprot(versal_cips_0_LPD_AXI_NOC_0_AWPROT),
        .S04_AXI_awqos(versal_cips_0_LPD_AXI_NOC_0_AWQOS),
        .S04_AXI_awready(versal_cips_0_LPD_AXI_NOC_0_AWREADY),
        .S04_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_awsize(versal_cips_0_LPD_AXI_NOC_0_AWSIZE),
        .S04_AXI_awuser(versal_cips_0_LPD_AXI_NOC_0_AWUSER),
        .S04_AXI_awvalid(versal_cips_0_LPD_AXI_NOC_0_AWVALID),
        .S04_AXI_bid(versal_cips_0_LPD_AXI_NOC_0_BID),
        .S04_AXI_bready(versal_cips_0_LPD_AXI_NOC_0_BREADY),
        .S04_AXI_bresp(versal_cips_0_LPD_AXI_NOC_0_BRESP),
        .S04_AXI_bvalid(versal_cips_0_LPD_AXI_NOC_0_BVALID),
        .S04_AXI_rdata(versal_cips_0_LPD_AXI_NOC_0_RDATA),
        .S04_AXI_rid(versal_cips_0_LPD_AXI_NOC_0_RID),
        .S04_AXI_rlast(versal_cips_0_LPD_AXI_NOC_0_RLAST),
        .S04_AXI_rready(versal_cips_0_LPD_AXI_NOC_0_RREADY),
        .S04_AXI_rresp(versal_cips_0_LPD_AXI_NOC_0_RRESP),
        .S04_AXI_rvalid(versal_cips_0_LPD_AXI_NOC_0_RVALID),
        .S04_AXI_wdata(versal_cips_0_LPD_AXI_NOC_0_WDATA),
        .S04_AXI_wlast(versal_cips_0_LPD_AXI_NOC_0_WLAST),
        .S04_AXI_wready(versal_cips_0_LPD_AXI_NOC_0_WREADY),
        .S04_AXI_wstrb(versal_cips_0_LPD_AXI_NOC_0_WSTRB),
        .S04_AXI_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_wvalid(versal_cips_0_LPD_AXI_NOC_0_WVALID),
        .S05_AXI_araddr(versal_cips_0_PMC_NOC_AXI_0_ARADDR),
        .S05_AXI_arburst(versal_cips_0_PMC_NOC_AXI_0_ARBURST),
        .S05_AXI_arcache(versal_cips_0_PMC_NOC_AXI_0_ARCACHE),
        .S05_AXI_arid(versal_cips_0_PMC_NOC_AXI_0_ARID),
        .S05_AXI_arlen(versal_cips_0_PMC_NOC_AXI_0_ARLEN),
        .S05_AXI_arlock(versal_cips_0_PMC_NOC_AXI_0_ARLOCK),
        .S05_AXI_arprot(versal_cips_0_PMC_NOC_AXI_0_ARPROT),
        .S05_AXI_arqos(versal_cips_0_PMC_NOC_AXI_0_ARQOS),
        .S05_AXI_arready(versal_cips_0_PMC_NOC_AXI_0_ARREADY),
        .S05_AXI_arregion(versal_cips_0_PMC_NOC_AXI_0_ARREGION),
        .S05_AXI_arsize(versal_cips_0_PMC_NOC_AXI_0_ARSIZE),
        .S05_AXI_aruser(versal_cips_0_PMC_NOC_AXI_0_ARUSER),
        .S05_AXI_arvalid(versal_cips_0_PMC_NOC_AXI_0_ARVALID),
        .S05_AXI_awaddr(versal_cips_0_PMC_NOC_AXI_0_AWADDR),
        .S05_AXI_awburst(versal_cips_0_PMC_NOC_AXI_0_AWBURST),
        .S05_AXI_awcache(versal_cips_0_PMC_NOC_AXI_0_AWCACHE),
        .S05_AXI_awid(versal_cips_0_PMC_NOC_AXI_0_AWID),
        .S05_AXI_awlen(versal_cips_0_PMC_NOC_AXI_0_AWLEN),
        .S05_AXI_awlock(versal_cips_0_PMC_NOC_AXI_0_AWLOCK),
        .S05_AXI_awprot(versal_cips_0_PMC_NOC_AXI_0_AWPROT),
        .S05_AXI_awqos(versal_cips_0_PMC_NOC_AXI_0_AWQOS),
        .S05_AXI_awready(versal_cips_0_PMC_NOC_AXI_0_AWREADY),
        .S05_AXI_awregion(versal_cips_0_PMC_NOC_AXI_0_AWREGION),
        .S05_AXI_awsize(versal_cips_0_PMC_NOC_AXI_0_AWSIZE),
        .S05_AXI_awuser(versal_cips_0_PMC_NOC_AXI_0_AWUSER),
        .S05_AXI_awvalid(versal_cips_0_PMC_NOC_AXI_0_AWVALID),
        .S05_AXI_bid(versal_cips_0_PMC_NOC_AXI_0_BID),
        .S05_AXI_bready(versal_cips_0_PMC_NOC_AXI_0_BREADY),
        .S05_AXI_bresp(versal_cips_0_PMC_NOC_AXI_0_BRESP),
        .S05_AXI_buser(versal_cips_0_PMC_NOC_AXI_0_BUSER),
        .S05_AXI_bvalid(versal_cips_0_PMC_NOC_AXI_0_BVALID),
        .S05_AXI_rdata(versal_cips_0_PMC_NOC_AXI_0_RDATA),
        .S05_AXI_rid(versal_cips_0_PMC_NOC_AXI_0_RID),
        .S05_AXI_rlast(versal_cips_0_PMC_NOC_AXI_0_RLAST),
        .S05_AXI_rready(versal_cips_0_PMC_NOC_AXI_0_RREADY),
        .S05_AXI_rresp(versal_cips_0_PMC_NOC_AXI_0_RRESP),
        .S05_AXI_ruser(versal_cips_0_PMC_NOC_AXI_0_RUSER),
        .S05_AXI_rvalid(versal_cips_0_PMC_NOC_AXI_0_RVALID),
        .S05_AXI_wdata(versal_cips_0_PMC_NOC_AXI_0_WDATA),
        .S05_AXI_wlast(versal_cips_0_PMC_NOC_AXI_0_WLAST),
        .S05_AXI_wready(versal_cips_0_PMC_NOC_AXI_0_WREADY),
        .S05_AXI_wstrb(versal_cips_0_PMC_NOC_AXI_0_WSTRB),
        .S05_AXI_wuser(versal_cips_0_PMC_NOC_AXI_0_WUSER),
        .S05_AXI_wvalid(versal_cips_0_PMC_NOC_AXI_0_WVALID),
        .aclk0(versal_cips_0_fpd_cci_noc_axi0_clk),
        .aclk1(versal_cips_0_fpd_cci_noc_axi1_clk),
        .aclk2(versal_cips_0_fpd_cci_noc_axi2_clk),
        .aclk3(versal_cips_0_fpd_cci_noc_axi3_clk),
        .aclk4(versal_cips_0_lpd_axi_noc_clk),
        .aclk5(versal_cips_0_pmc_axi_noc_axi0_clk),
        .aclk6(tb3d_transcoder_0_tb3d_out[0]),
        .aclk7(microblaze_0_Clk),
        .aclk8(tb3d_transcoder_0_legacy_out[0]),
        .sys_clk0_clk_n(lpddr4_clk1_clk_n),
        .sys_clk0_clk_p(lpddr4_clk1_clk_p));
  design_1_clk_wiz_0 clk_wiz
       (.clk_in1(clk_100MHz),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(mdm_1_debug_sys_rst));
  design_1_mdm_1_0 mdm_1
       (.Dbg_TDO_0(1'b0),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  (* BMM_INFO_PROCESSOR = "microblaze-le > design_1 microblaze_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  design_1_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_DLMB_BE),
        .Clk(microblaze_0_Clk),
        .DCE(microblaze_0_DLMB_CE),
        .DReady(microblaze_0_DLMB_READY),
        .DUE(microblaze_0_DLMB_UE),
        .DWait(microblaze_0_DLMB_WAIT),
        .D_AS(microblaze_0_DLMB_ADDRSTROBE),
        .Data_Addr(microblaze_0_DLMB_ABUS),
        .Data_Read(microblaze_0_DLMB_READDBUS),
        .Data_Write(microblaze_0_DLMB_WRITEDBUS),
        .ICE(microblaze_0_ILMB_CE),
        .IFetch(microblaze_0_ILMB_READSTROBE),
        .IReady(microblaze_0_ILMB_READY),
        .IUE(microblaze_0_ILMB_UE),
        .IWAIT(microblaze_0_ILMB_WAIT),
        .I_AS(microblaze_0_ILMB_ADDRSTROBE),
        .Instr(microblaze_0_ILMB_READDBUS),
        .Instr_Addr(microblaze_0_ILMB_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Read_Strobe(microblaze_0_DLMB_READSTROBE),
        .Reset(rst_noc_clk_gen_300M_mb_reset),
        .Write_Strobe(microblaze_0_DLMB_WRITESTROBE));
  microblaze_0_local_memory_imp_1K0VQXK microblaze_0_local_memory
       (.DLMB_abus(microblaze_0_DLMB_ABUS),
        .DLMB_addrstrobe(microblaze_0_DLMB_ADDRSTROBE),
        .DLMB_be(microblaze_0_DLMB_BE),
        .DLMB_ce(microblaze_0_DLMB_CE),
        .DLMB_readdbus(microblaze_0_DLMB_READDBUS),
        .DLMB_readstrobe(microblaze_0_DLMB_READSTROBE),
        .DLMB_ready(microblaze_0_DLMB_READY),
        .DLMB_ue(microblaze_0_DLMB_UE),
        .DLMB_wait(microblaze_0_DLMB_WAIT),
        .DLMB_writedbus(microblaze_0_DLMB_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_DLMB_WRITESTROBE),
        .ILMB_abus(microblaze_0_ILMB_ABUS),
        .ILMB_addrstrobe(microblaze_0_ILMB_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ILMB_CE),
        .ILMB_readdbus(microblaze_0_ILMB_READDBUS),
        .ILMB_readstrobe(microblaze_0_ILMB_READSTROBE),
        .ILMB_ready(microblaze_0_ILMB_READY),
        .ILMB_ue(microblaze_0_ILMB_UE),
        .ILMB_wait(microblaze_0_ILMB_WAIT),
        .LMB_Clk(microblaze_0_Clk),
        .SYS_Rst(rst_noc_clk_gen_300M_bus_struct_reset),
        .regcea(tb3d_transcoder_0_legacy_out));
  design_1_noc_clk_gen_1 noc_clk_gen
       (.axi_clk_0(microblaze_0_Clk),
        .axi_clk_in_0(clk_wiz_clk_out1),
        .axi_rst_in_0_n(rst_clk_wiz_100M_peripheral_aresetn));
  design_1_rst_clk_wiz_100M_1 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(mdm_1_debug_sys_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
  design_1_rst_noc_clk_gen_300M_0 rst_noc_clk_gen_300M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_noc_clk_gen_300M_bus_struct_reset),
        .dcm_locked(1'b1),
        .ext_reset_in(reset_rtl),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_noc_clk_gen_300M_mb_reset),
        .slowest_sync_clk(microblaze_0_Clk));
  design_1_tb3d_transcoder_0_0 tb3d_transcoder_0
       (.legacy_in({versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk,versal_cips_0_pmc_axi_noc_axi0_clk}),
        .legacy_out(tb3d_transcoder_0_legacy_out),
        .tb3d_in({microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk,microblaze_0_Clk}),
        .tb3d_out(tb3d_transcoder_0_tb3d_out));
  design_1_versal_cips_0_0 versal_cips_0
       (.FPD_CCI_NOC_0_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
        .FPD_CCI_NOC_0_arburst(versal_cips_0_FPD_CCI_NOC_0_ARBURST),
        .FPD_CCI_NOC_0_arcache(versal_cips_0_FPD_CCI_NOC_0_ARCACHE),
        .FPD_CCI_NOC_0_arid(versal_cips_0_FPD_CCI_NOC_0_ARID),
        .FPD_CCI_NOC_0_arlen(versal_cips_0_FPD_CCI_NOC_0_ARLEN),
        .FPD_CCI_NOC_0_arlock(versal_cips_0_FPD_CCI_NOC_0_ARLOCK),
        .FPD_CCI_NOC_0_arprot(versal_cips_0_FPD_CCI_NOC_0_ARPROT),
        .FPD_CCI_NOC_0_arqos(versal_cips_0_FPD_CCI_NOC_0_ARQOS),
        .FPD_CCI_NOC_0_arready(versal_cips_0_FPD_CCI_NOC_0_ARREADY),
        .FPD_CCI_NOC_0_arsize(versal_cips_0_FPD_CCI_NOC_0_ARSIZE),
        .FPD_CCI_NOC_0_aruser(versal_cips_0_FPD_CCI_NOC_0_ARUSER),
        .FPD_CCI_NOC_0_arvalid(versal_cips_0_FPD_CCI_NOC_0_ARVALID),
        .FPD_CCI_NOC_0_awaddr(versal_cips_0_FPD_CCI_NOC_0_AWADDR),
        .FPD_CCI_NOC_0_awburst(versal_cips_0_FPD_CCI_NOC_0_AWBURST),
        .FPD_CCI_NOC_0_awcache(versal_cips_0_FPD_CCI_NOC_0_AWCACHE),
        .FPD_CCI_NOC_0_awid(versal_cips_0_FPD_CCI_NOC_0_AWID),
        .FPD_CCI_NOC_0_awlen(versal_cips_0_FPD_CCI_NOC_0_AWLEN),
        .FPD_CCI_NOC_0_awlock(versal_cips_0_FPD_CCI_NOC_0_AWLOCK),
        .FPD_CCI_NOC_0_awprot(versal_cips_0_FPD_CCI_NOC_0_AWPROT),
        .FPD_CCI_NOC_0_awqos(versal_cips_0_FPD_CCI_NOC_0_AWQOS),
        .FPD_CCI_NOC_0_awready(versal_cips_0_FPD_CCI_NOC_0_AWREADY),
        .FPD_CCI_NOC_0_awsize(versal_cips_0_FPD_CCI_NOC_0_AWSIZE),
        .FPD_CCI_NOC_0_awuser(versal_cips_0_FPD_CCI_NOC_0_AWUSER),
        .FPD_CCI_NOC_0_awvalid(versal_cips_0_FPD_CCI_NOC_0_AWVALID),
        .FPD_CCI_NOC_0_bid(versal_cips_0_FPD_CCI_NOC_0_BID),
        .FPD_CCI_NOC_0_bready(versal_cips_0_FPD_CCI_NOC_0_BREADY),
        .FPD_CCI_NOC_0_bresp(versal_cips_0_FPD_CCI_NOC_0_BRESP),
        .FPD_CCI_NOC_0_bvalid(versal_cips_0_FPD_CCI_NOC_0_BVALID),
        .FPD_CCI_NOC_0_rdata(versal_cips_0_FPD_CCI_NOC_0_RDATA),
        .FPD_CCI_NOC_0_rid(versal_cips_0_FPD_CCI_NOC_0_RID),
        .FPD_CCI_NOC_0_rlast(versal_cips_0_FPD_CCI_NOC_0_RLAST),
        .FPD_CCI_NOC_0_rready(versal_cips_0_FPD_CCI_NOC_0_RREADY),
        .FPD_CCI_NOC_0_rresp(versal_cips_0_FPD_CCI_NOC_0_RRESP),
        .FPD_CCI_NOC_0_rvalid(versal_cips_0_FPD_CCI_NOC_0_RVALID),
        .FPD_CCI_NOC_0_wdata(versal_cips_0_FPD_CCI_NOC_0_WDATA),
        .FPD_CCI_NOC_0_wlast(versal_cips_0_FPD_CCI_NOC_0_WLAST),
        .FPD_CCI_NOC_0_wready(versal_cips_0_FPD_CCI_NOC_0_WREADY),
        .FPD_CCI_NOC_0_wstrb(versal_cips_0_FPD_CCI_NOC_0_WSTRB),
        .FPD_CCI_NOC_0_wuser(versal_cips_0_FPD_CCI_NOC_0_WUSER),
        .FPD_CCI_NOC_0_wvalid(versal_cips_0_FPD_CCI_NOC_0_WVALID),
        .FPD_CCI_NOC_1_araddr(versal_cips_0_FPD_CCI_NOC_1_ARADDR),
        .FPD_CCI_NOC_1_arburst(versal_cips_0_FPD_CCI_NOC_1_ARBURST),
        .FPD_CCI_NOC_1_arcache(versal_cips_0_FPD_CCI_NOC_1_ARCACHE),
        .FPD_CCI_NOC_1_arid(versal_cips_0_FPD_CCI_NOC_1_ARID),
        .FPD_CCI_NOC_1_arlen(versal_cips_0_FPD_CCI_NOC_1_ARLEN),
        .FPD_CCI_NOC_1_arlock(versal_cips_0_FPD_CCI_NOC_1_ARLOCK),
        .FPD_CCI_NOC_1_arprot(versal_cips_0_FPD_CCI_NOC_1_ARPROT),
        .FPD_CCI_NOC_1_arqos(versal_cips_0_FPD_CCI_NOC_1_ARQOS),
        .FPD_CCI_NOC_1_arready(versal_cips_0_FPD_CCI_NOC_1_ARREADY),
        .FPD_CCI_NOC_1_arsize(versal_cips_0_FPD_CCI_NOC_1_ARSIZE),
        .FPD_CCI_NOC_1_aruser(versal_cips_0_FPD_CCI_NOC_1_ARUSER),
        .FPD_CCI_NOC_1_arvalid(versal_cips_0_FPD_CCI_NOC_1_ARVALID),
        .FPD_CCI_NOC_1_awaddr(versal_cips_0_FPD_CCI_NOC_1_AWADDR),
        .FPD_CCI_NOC_1_awburst(versal_cips_0_FPD_CCI_NOC_1_AWBURST),
        .FPD_CCI_NOC_1_awcache(versal_cips_0_FPD_CCI_NOC_1_AWCACHE),
        .FPD_CCI_NOC_1_awid(versal_cips_0_FPD_CCI_NOC_1_AWID),
        .FPD_CCI_NOC_1_awlen(versal_cips_0_FPD_CCI_NOC_1_AWLEN),
        .FPD_CCI_NOC_1_awlock(versal_cips_0_FPD_CCI_NOC_1_AWLOCK),
        .FPD_CCI_NOC_1_awprot(versal_cips_0_FPD_CCI_NOC_1_AWPROT),
        .FPD_CCI_NOC_1_awqos(versal_cips_0_FPD_CCI_NOC_1_AWQOS),
        .FPD_CCI_NOC_1_awready(versal_cips_0_FPD_CCI_NOC_1_AWREADY),
        .FPD_CCI_NOC_1_awsize(versal_cips_0_FPD_CCI_NOC_1_AWSIZE),
        .FPD_CCI_NOC_1_awuser(versal_cips_0_FPD_CCI_NOC_1_AWUSER),
        .FPD_CCI_NOC_1_awvalid(versal_cips_0_FPD_CCI_NOC_1_AWVALID),
        .FPD_CCI_NOC_1_bid(versal_cips_0_FPD_CCI_NOC_1_BID),
        .FPD_CCI_NOC_1_bready(versal_cips_0_FPD_CCI_NOC_1_BREADY),
        .FPD_CCI_NOC_1_bresp(versal_cips_0_FPD_CCI_NOC_1_BRESP),
        .FPD_CCI_NOC_1_bvalid(versal_cips_0_FPD_CCI_NOC_1_BVALID),
        .FPD_CCI_NOC_1_rdata(versal_cips_0_FPD_CCI_NOC_1_RDATA),
        .FPD_CCI_NOC_1_rid(versal_cips_0_FPD_CCI_NOC_1_RID),
        .FPD_CCI_NOC_1_rlast(versal_cips_0_FPD_CCI_NOC_1_RLAST),
        .FPD_CCI_NOC_1_rready(versal_cips_0_FPD_CCI_NOC_1_RREADY),
        .FPD_CCI_NOC_1_rresp(versal_cips_0_FPD_CCI_NOC_1_RRESP),
        .FPD_CCI_NOC_1_rvalid(versal_cips_0_FPD_CCI_NOC_1_RVALID),
        .FPD_CCI_NOC_1_wdata(versal_cips_0_FPD_CCI_NOC_1_WDATA),
        .FPD_CCI_NOC_1_wlast(versal_cips_0_FPD_CCI_NOC_1_WLAST),
        .FPD_CCI_NOC_1_wready(versal_cips_0_FPD_CCI_NOC_1_WREADY),
        .FPD_CCI_NOC_1_wstrb(versal_cips_0_FPD_CCI_NOC_1_WSTRB),
        .FPD_CCI_NOC_1_wuser(versal_cips_0_FPD_CCI_NOC_1_WUSER),
        .FPD_CCI_NOC_1_wvalid(versal_cips_0_FPD_CCI_NOC_1_WVALID),
        .FPD_CCI_NOC_2_araddr(versal_cips_0_FPD_CCI_NOC_2_ARADDR),
        .FPD_CCI_NOC_2_arburst(versal_cips_0_FPD_CCI_NOC_2_ARBURST),
        .FPD_CCI_NOC_2_arcache(versal_cips_0_FPD_CCI_NOC_2_ARCACHE),
        .FPD_CCI_NOC_2_arid(versal_cips_0_FPD_CCI_NOC_2_ARID),
        .FPD_CCI_NOC_2_arlen(versal_cips_0_FPD_CCI_NOC_2_ARLEN),
        .FPD_CCI_NOC_2_arlock(versal_cips_0_FPD_CCI_NOC_2_ARLOCK),
        .FPD_CCI_NOC_2_arprot(versal_cips_0_FPD_CCI_NOC_2_ARPROT),
        .FPD_CCI_NOC_2_arqos(versal_cips_0_FPD_CCI_NOC_2_ARQOS),
        .FPD_CCI_NOC_2_arready(versal_cips_0_FPD_CCI_NOC_2_ARREADY),
        .FPD_CCI_NOC_2_arsize(versal_cips_0_FPD_CCI_NOC_2_ARSIZE),
        .FPD_CCI_NOC_2_aruser(versal_cips_0_FPD_CCI_NOC_2_ARUSER),
        .FPD_CCI_NOC_2_arvalid(versal_cips_0_FPD_CCI_NOC_2_ARVALID),
        .FPD_CCI_NOC_2_awaddr(versal_cips_0_FPD_CCI_NOC_2_AWADDR),
        .FPD_CCI_NOC_2_awburst(versal_cips_0_FPD_CCI_NOC_2_AWBURST),
        .FPD_CCI_NOC_2_awcache(versal_cips_0_FPD_CCI_NOC_2_AWCACHE),
        .FPD_CCI_NOC_2_awid(versal_cips_0_FPD_CCI_NOC_2_AWID),
        .FPD_CCI_NOC_2_awlen(versal_cips_0_FPD_CCI_NOC_2_AWLEN),
        .FPD_CCI_NOC_2_awlock(versal_cips_0_FPD_CCI_NOC_2_AWLOCK),
        .FPD_CCI_NOC_2_awprot(versal_cips_0_FPD_CCI_NOC_2_AWPROT),
        .FPD_CCI_NOC_2_awqos(versal_cips_0_FPD_CCI_NOC_2_AWQOS),
        .FPD_CCI_NOC_2_awready(versal_cips_0_FPD_CCI_NOC_2_AWREADY),
        .FPD_CCI_NOC_2_awsize(versal_cips_0_FPD_CCI_NOC_2_AWSIZE),
        .FPD_CCI_NOC_2_awuser(versal_cips_0_FPD_CCI_NOC_2_AWUSER),
        .FPD_CCI_NOC_2_awvalid(versal_cips_0_FPD_CCI_NOC_2_AWVALID),
        .FPD_CCI_NOC_2_bid(versal_cips_0_FPD_CCI_NOC_2_BID),
        .FPD_CCI_NOC_2_bready(versal_cips_0_FPD_CCI_NOC_2_BREADY),
        .FPD_CCI_NOC_2_bresp(versal_cips_0_FPD_CCI_NOC_2_BRESP),
        .FPD_CCI_NOC_2_bvalid(versal_cips_0_FPD_CCI_NOC_2_BVALID),
        .FPD_CCI_NOC_2_rdata(versal_cips_0_FPD_CCI_NOC_2_RDATA),
        .FPD_CCI_NOC_2_rid(versal_cips_0_FPD_CCI_NOC_2_RID),
        .FPD_CCI_NOC_2_rlast(versal_cips_0_FPD_CCI_NOC_2_RLAST),
        .FPD_CCI_NOC_2_rready(versal_cips_0_FPD_CCI_NOC_2_RREADY),
        .FPD_CCI_NOC_2_rresp(versal_cips_0_FPD_CCI_NOC_2_RRESP),
        .FPD_CCI_NOC_2_rvalid(versal_cips_0_FPD_CCI_NOC_2_RVALID),
        .FPD_CCI_NOC_2_wdata(versal_cips_0_FPD_CCI_NOC_2_WDATA),
        .FPD_CCI_NOC_2_wlast(versal_cips_0_FPD_CCI_NOC_2_WLAST),
        .FPD_CCI_NOC_2_wready(versal_cips_0_FPD_CCI_NOC_2_WREADY),
        .FPD_CCI_NOC_2_wstrb(versal_cips_0_FPD_CCI_NOC_2_WSTRB),
        .FPD_CCI_NOC_2_wuser(versal_cips_0_FPD_CCI_NOC_2_WUSER),
        .FPD_CCI_NOC_2_wvalid(versal_cips_0_FPD_CCI_NOC_2_WVALID),
        .FPD_CCI_NOC_3_araddr(versal_cips_0_FPD_CCI_NOC_3_ARADDR),
        .FPD_CCI_NOC_3_arburst(versal_cips_0_FPD_CCI_NOC_3_ARBURST),
        .FPD_CCI_NOC_3_arcache(versal_cips_0_FPD_CCI_NOC_3_ARCACHE),
        .FPD_CCI_NOC_3_arid(versal_cips_0_FPD_CCI_NOC_3_ARID),
        .FPD_CCI_NOC_3_arlen(versal_cips_0_FPD_CCI_NOC_3_ARLEN),
        .FPD_CCI_NOC_3_arlock(versal_cips_0_FPD_CCI_NOC_3_ARLOCK),
        .FPD_CCI_NOC_3_arprot(versal_cips_0_FPD_CCI_NOC_3_ARPROT),
        .FPD_CCI_NOC_3_arqos(versal_cips_0_FPD_CCI_NOC_3_ARQOS),
        .FPD_CCI_NOC_3_arready(versal_cips_0_FPD_CCI_NOC_3_ARREADY),
        .FPD_CCI_NOC_3_arsize(versal_cips_0_FPD_CCI_NOC_3_ARSIZE),
        .FPD_CCI_NOC_3_aruser(versal_cips_0_FPD_CCI_NOC_3_ARUSER),
        .FPD_CCI_NOC_3_arvalid(versal_cips_0_FPD_CCI_NOC_3_ARVALID),
        .FPD_CCI_NOC_3_awaddr(versal_cips_0_FPD_CCI_NOC_3_AWADDR),
        .FPD_CCI_NOC_3_awburst(versal_cips_0_FPD_CCI_NOC_3_AWBURST),
        .FPD_CCI_NOC_3_awcache(versal_cips_0_FPD_CCI_NOC_3_AWCACHE),
        .FPD_CCI_NOC_3_awid(versal_cips_0_FPD_CCI_NOC_3_AWID),
        .FPD_CCI_NOC_3_awlen(versal_cips_0_FPD_CCI_NOC_3_AWLEN),
        .FPD_CCI_NOC_3_awlock(versal_cips_0_FPD_CCI_NOC_3_AWLOCK),
        .FPD_CCI_NOC_3_awprot(versal_cips_0_FPD_CCI_NOC_3_AWPROT),
        .FPD_CCI_NOC_3_awqos(versal_cips_0_FPD_CCI_NOC_3_AWQOS),
        .FPD_CCI_NOC_3_awready(versal_cips_0_FPD_CCI_NOC_3_AWREADY),
        .FPD_CCI_NOC_3_awsize(versal_cips_0_FPD_CCI_NOC_3_AWSIZE),
        .FPD_CCI_NOC_3_awuser(versal_cips_0_FPD_CCI_NOC_3_AWUSER),
        .FPD_CCI_NOC_3_awvalid(versal_cips_0_FPD_CCI_NOC_3_AWVALID),
        .FPD_CCI_NOC_3_bid(versal_cips_0_FPD_CCI_NOC_3_BID),
        .FPD_CCI_NOC_3_bready(versal_cips_0_FPD_CCI_NOC_3_BREADY),
        .FPD_CCI_NOC_3_bresp(versal_cips_0_FPD_CCI_NOC_3_BRESP),
        .FPD_CCI_NOC_3_bvalid(versal_cips_0_FPD_CCI_NOC_3_BVALID),
        .FPD_CCI_NOC_3_rdata(versal_cips_0_FPD_CCI_NOC_3_RDATA),
        .FPD_CCI_NOC_3_rid(versal_cips_0_FPD_CCI_NOC_3_RID),
        .FPD_CCI_NOC_3_rlast(versal_cips_0_FPD_CCI_NOC_3_RLAST),
        .FPD_CCI_NOC_3_rready(versal_cips_0_FPD_CCI_NOC_3_RREADY),
        .FPD_CCI_NOC_3_rresp(versal_cips_0_FPD_CCI_NOC_3_RRESP),
        .FPD_CCI_NOC_3_rvalid(versal_cips_0_FPD_CCI_NOC_3_RVALID),
        .FPD_CCI_NOC_3_wdata(versal_cips_0_FPD_CCI_NOC_3_WDATA),
        .FPD_CCI_NOC_3_wlast(versal_cips_0_FPD_CCI_NOC_3_WLAST),
        .FPD_CCI_NOC_3_wready(versal_cips_0_FPD_CCI_NOC_3_WREADY),
        .FPD_CCI_NOC_3_wstrb(versal_cips_0_FPD_CCI_NOC_3_WSTRB),
        .FPD_CCI_NOC_3_wuser(versal_cips_0_FPD_CCI_NOC_3_WUSER),
        .FPD_CCI_NOC_3_wvalid(versal_cips_0_FPD_CCI_NOC_3_WVALID),
        .LPD_AXI_NOC_0_araddr(versal_cips_0_LPD_AXI_NOC_0_ARADDR),
        .LPD_AXI_NOC_0_arburst(versal_cips_0_LPD_AXI_NOC_0_ARBURST),
        .LPD_AXI_NOC_0_arcache(versal_cips_0_LPD_AXI_NOC_0_ARCACHE),
        .LPD_AXI_NOC_0_arid(versal_cips_0_LPD_AXI_NOC_0_ARID),
        .LPD_AXI_NOC_0_arlen(versal_cips_0_LPD_AXI_NOC_0_ARLEN),
        .LPD_AXI_NOC_0_arlock(versal_cips_0_LPD_AXI_NOC_0_ARLOCK),
        .LPD_AXI_NOC_0_arprot(versal_cips_0_LPD_AXI_NOC_0_ARPROT),
        .LPD_AXI_NOC_0_arqos(versal_cips_0_LPD_AXI_NOC_0_ARQOS),
        .LPD_AXI_NOC_0_arready(versal_cips_0_LPD_AXI_NOC_0_ARREADY),
        .LPD_AXI_NOC_0_arsize(versal_cips_0_LPD_AXI_NOC_0_ARSIZE),
        .LPD_AXI_NOC_0_aruser(versal_cips_0_LPD_AXI_NOC_0_ARUSER),
        .LPD_AXI_NOC_0_arvalid(versal_cips_0_LPD_AXI_NOC_0_ARVALID),
        .LPD_AXI_NOC_0_awaddr(versal_cips_0_LPD_AXI_NOC_0_AWADDR),
        .LPD_AXI_NOC_0_awburst(versal_cips_0_LPD_AXI_NOC_0_AWBURST),
        .LPD_AXI_NOC_0_awcache(versal_cips_0_LPD_AXI_NOC_0_AWCACHE),
        .LPD_AXI_NOC_0_awid(versal_cips_0_LPD_AXI_NOC_0_AWID),
        .LPD_AXI_NOC_0_awlen(versal_cips_0_LPD_AXI_NOC_0_AWLEN),
        .LPD_AXI_NOC_0_awlock(versal_cips_0_LPD_AXI_NOC_0_AWLOCK),
        .LPD_AXI_NOC_0_awprot(versal_cips_0_LPD_AXI_NOC_0_AWPROT),
        .LPD_AXI_NOC_0_awqos(versal_cips_0_LPD_AXI_NOC_0_AWQOS),
        .LPD_AXI_NOC_0_awready(versal_cips_0_LPD_AXI_NOC_0_AWREADY),
        .LPD_AXI_NOC_0_awsize(versal_cips_0_LPD_AXI_NOC_0_AWSIZE),
        .LPD_AXI_NOC_0_awuser(versal_cips_0_LPD_AXI_NOC_0_AWUSER),
        .LPD_AXI_NOC_0_awvalid(versal_cips_0_LPD_AXI_NOC_0_AWVALID),
        .LPD_AXI_NOC_0_bid(versal_cips_0_LPD_AXI_NOC_0_BID),
        .LPD_AXI_NOC_0_bready(versal_cips_0_LPD_AXI_NOC_0_BREADY),
        .LPD_AXI_NOC_0_bresp(versal_cips_0_LPD_AXI_NOC_0_BRESP),
        .LPD_AXI_NOC_0_bvalid(versal_cips_0_LPD_AXI_NOC_0_BVALID),
        .LPD_AXI_NOC_0_rdata(versal_cips_0_LPD_AXI_NOC_0_RDATA),
        .LPD_AXI_NOC_0_rid(versal_cips_0_LPD_AXI_NOC_0_RID),
        .LPD_AXI_NOC_0_rlast(versal_cips_0_LPD_AXI_NOC_0_RLAST),
        .LPD_AXI_NOC_0_rready(versal_cips_0_LPD_AXI_NOC_0_RREADY),
        .LPD_AXI_NOC_0_rresp(versal_cips_0_LPD_AXI_NOC_0_RRESP),
        .LPD_AXI_NOC_0_rvalid(versal_cips_0_LPD_AXI_NOC_0_RVALID),
        .LPD_AXI_NOC_0_wdata(versal_cips_0_LPD_AXI_NOC_0_WDATA),
        .LPD_AXI_NOC_0_wlast(versal_cips_0_LPD_AXI_NOC_0_WLAST),
        .LPD_AXI_NOC_0_wready(versal_cips_0_LPD_AXI_NOC_0_WREADY),
        .LPD_AXI_NOC_0_wstrb(versal_cips_0_LPD_AXI_NOC_0_WSTRB),
        .LPD_AXI_NOC_0_wvalid(versal_cips_0_LPD_AXI_NOC_0_WVALID),
        .PMC_NOC_AXI_0_araddr(versal_cips_0_PMC_NOC_AXI_0_ARADDR),
        .PMC_NOC_AXI_0_arburst(versal_cips_0_PMC_NOC_AXI_0_ARBURST),
        .PMC_NOC_AXI_0_arcache(versal_cips_0_PMC_NOC_AXI_0_ARCACHE),
        .PMC_NOC_AXI_0_arid(versal_cips_0_PMC_NOC_AXI_0_ARID),
        .PMC_NOC_AXI_0_arlen(versal_cips_0_PMC_NOC_AXI_0_ARLEN),
        .PMC_NOC_AXI_0_arlock(versal_cips_0_PMC_NOC_AXI_0_ARLOCK),
        .PMC_NOC_AXI_0_arprot(versal_cips_0_PMC_NOC_AXI_0_ARPROT),
        .PMC_NOC_AXI_0_arqos(versal_cips_0_PMC_NOC_AXI_0_ARQOS),
        .PMC_NOC_AXI_0_arready(versal_cips_0_PMC_NOC_AXI_0_ARREADY),
        .PMC_NOC_AXI_0_arregion(versal_cips_0_PMC_NOC_AXI_0_ARREGION),
        .PMC_NOC_AXI_0_arsize(versal_cips_0_PMC_NOC_AXI_0_ARSIZE),
        .PMC_NOC_AXI_0_aruser(versal_cips_0_PMC_NOC_AXI_0_ARUSER),
        .PMC_NOC_AXI_0_arvalid(versal_cips_0_PMC_NOC_AXI_0_ARVALID),
        .PMC_NOC_AXI_0_awaddr(versal_cips_0_PMC_NOC_AXI_0_AWADDR),
        .PMC_NOC_AXI_0_awburst(versal_cips_0_PMC_NOC_AXI_0_AWBURST),
        .PMC_NOC_AXI_0_awcache(versal_cips_0_PMC_NOC_AXI_0_AWCACHE),
        .PMC_NOC_AXI_0_awid(versal_cips_0_PMC_NOC_AXI_0_AWID),
        .PMC_NOC_AXI_0_awlen(versal_cips_0_PMC_NOC_AXI_0_AWLEN),
        .PMC_NOC_AXI_0_awlock(versal_cips_0_PMC_NOC_AXI_0_AWLOCK),
        .PMC_NOC_AXI_0_awprot(versal_cips_0_PMC_NOC_AXI_0_AWPROT),
        .PMC_NOC_AXI_0_awqos(versal_cips_0_PMC_NOC_AXI_0_AWQOS),
        .PMC_NOC_AXI_0_awready(versal_cips_0_PMC_NOC_AXI_0_AWREADY),
        .PMC_NOC_AXI_0_awregion(versal_cips_0_PMC_NOC_AXI_0_AWREGION),
        .PMC_NOC_AXI_0_awsize(versal_cips_0_PMC_NOC_AXI_0_AWSIZE),
        .PMC_NOC_AXI_0_awuser(versal_cips_0_PMC_NOC_AXI_0_AWUSER),
        .PMC_NOC_AXI_0_awvalid(versal_cips_0_PMC_NOC_AXI_0_AWVALID),
        .PMC_NOC_AXI_0_bid(versal_cips_0_PMC_NOC_AXI_0_BID),
        .PMC_NOC_AXI_0_bready(versal_cips_0_PMC_NOC_AXI_0_BREADY),
        .PMC_NOC_AXI_0_bresp(versal_cips_0_PMC_NOC_AXI_0_BRESP),
        .PMC_NOC_AXI_0_buser(versal_cips_0_PMC_NOC_AXI_0_BUSER),
        .PMC_NOC_AXI_0_bvalid(versal_cips_0_PMC_NOC_AXI_0_BVALID),
        .PMC_NOC_AXI_0_rdata(versal_cips_0_PMC_NOC_AXI_0_RDATA),
        .PMC_NOC_AXI_0_rid(versal_cips_0_PMC_NOC_AXI_0_RID),
        .PMC_NOC_AXI_0_rlast(versal_cips_0_PMC_NOC_AXI_0_RLAST),
        .PMC_NOC_AXI_0_rready(versal_cips_0_PMC_NOC_AXI_0_RREADY),
        .PMC_NOC_AXI_0_rresp(versal_cips_0_PMC_NOC_AXI_0_RRESP),
        .PMC_NOC_AXI_0_ruser(versal_cips_0_PMC_NOC_AXI_0_RUSER),
        .PMC_NOC_AXI_0_rvalid(versal_cips_0_PMC_NOC_AXI_0_RVALID),
        .PMC_NOC_AXI_0_wdata(versal_cips_0_PMC_NOC_AXI_0_WDATA),
        .PMC_NOC_AXI_0_wlast(versal_cips_0_PMC_NOC_AXI_0_WLAST),
        .PMC_NOC_AXI_0_wready(versal_cips_0_PMC_NOC_AXI_0_WREADY),
        .PMC_NOC_AXI_0_wstrb(versal_cips_0_PMC_NOC_AXI_0_WSTRB),
        .PMC_NOC_AXI_0_wuser(versal_cips_0_PMC_NOC_AXI_0_WUSER),
        .PMC_NOC_AXI_0_wvalid(versal_cips_0_PMC_NOC_AXI_0_WVALID),
        .fpd_cci_noc_axi0_clk(versal_cips_0_fpd_cci_noc_axi0_clk),
        .fpd_cci_noc_axi1_clk(versal_cips_0_fpd_cci_noc_axi1_clk),
        .fpd_cci_noc_axi2_clk(versal_cips_0_fpd_cci_noc_axi2_clk),
        .fpd_cci_noc_axi3_clk(versal_cips_0_fpd_cci_noc_axi3_clk),
        .lpd_axi_noc_clk(versal_cips_0_lpd_axi_noc_clk),
        .pmc_axi_noc_axi0_clk(versal_cips_0_pmc_axi_noc_axi0_clk));
endmodule

module microblaze_0_local_memory_imp_1K0VQXK
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst,
    regcea);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;
  input [7:0]regcea;

  wire [0:31]DLMB_abus;
  wire DLMB_addrstrobe;
  wire [0:3]DLMB_be;
  wire DLMB_ce;
  wire [0:31]DLMB_readdbus;
  wire DLMB_readstrobe;
  wire DLMB_ready;
  wire DLMB_ue;
  wire DLMB_wait;
  wire [0:31]DLMB_writedbus;
  wire DLMB_writestrobe;
  wire [0:31]ILMB_abus;
  wire ILMB_addrstrobe;
  wire ILMB_ce;
  wire [0:31]ILMB_readdbus;
  wire ILMB_readstrobe;
  wire ILMB_ready;
  wire ILMB_ue;
  wire ILMB_wait;
  wire LMB_Clk;
  wire SYS_Rst;
  wire [0:35]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;
  wire [7:0]regcea;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > design_1 microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  design_1_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  design_1_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(DLMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(DLMB_readdbus),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(DLMB_ready),
        .LMB_UE(DLMB_ue),
        .LMB_Wait(DLMB_wait),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus({DLMB_abus[0:27],1'b0,1'b0,1'b0,1'b0}),
        .M_AddrStrobe(DLMB_addrstrobe),
        .M_BE(DLMB_be),
        .M_DBus(DLMB_writedbus),
        .M_ReadStrobe(DLMB_readstrobe),
        .M_WriteStrobe(DLMB_writestrobe),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  design_1_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  design_1_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(ILMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(ILMB_readdbus),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(ILMB_ready),
        .LMB_UE(ILMB_ue),
        .LMB_Wait(ILMB_wait),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(ILMB_abus),
        .M_AddrStrobe(ILMB_addrstrobe),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(ILMB_readstrobe),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  design_1_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .regcea(regcea[0]),
        .regceb(regcea[0]),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule
