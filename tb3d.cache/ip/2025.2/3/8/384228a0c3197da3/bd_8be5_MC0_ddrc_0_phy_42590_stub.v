// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 24 17:37:02 2026
// Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_8be5_MC0_ddrc_0_phy_42590_stub.v
// Design      : bd_8be5_MC0_ddrc_0_phy_42590
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvp1802-lsvc4072-2MP-e-S
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* DowngradeIPIdentifiedWarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(sys_clk_p, sys_clk_n, ch0_lpddr4_dq_a, 
  ch0_lpddr4_dqs_t_a, ch0_lpddr4_dqs_c_a, ch0_lpddr4_ca_a, ch0_lpddr4_cs_a, 
  ch0_lpddr4_ck_t_a, ch0_lpddr4_ck_c_a, ch0_lpddr4_cke_a, ch0_lpddr4_dmi_a, 
  ch0_lpddr4_dq_b, ch0_lpddr4_dqs_t_b, ch0_lpddr4_dqs_c_b, ch0_lpddr4_ca_b, 
  ch0_lpddr4_cs_b, ch0_lpddr4_ck_t_b, ch0_lpddr4_ck_c_b, ch0_lpddr4_cke_b, 
  ch0_lpddr4_dmi_b, ch0_lpddr4_reset_n, ch1_lpddr4_dq_a, ch1_lpddr4_dqs_t_a, 
  ch1_lpddr4_dqs_c_a, ch1_lpddr4_ca_a, ch1_lpddr4_cs_a, ch1_lpddr4_ck_t_a, 
  ch1_lpddr4_ck_c_a, ch1_lpddr4_cke_a, ch1_lpddr4_dmi_a, ch1_lpddr4_dq_b, 
  ch1_lpddr4_dqs_t_b, ch1_lpddr4_dqs_c_b, ch1_lpddr4_ca_b, ch1_lpddr4_cs_b, 
  ch1_lpddr4_ck_t_b, ch1_lpddr4_ck_c_b, ch1_lpddr4_cke_b, ch1_lpddr4_dmi_b, 
  ch1_lpddr4_reset_n, noc2dmc_valid_in_0, noc2dmc_data_in_0, noc2dmc_credit_rdy_0, 
  dmc2noc_credit_rtn_0, noc2dmc_valid_in_1, noc2dmc_data_in_1, noc2dmc_credit_rdy_1, 
  dmc2noc_credit_rtn_1, noc2dmc_valid_in_2, noc2dmc_data_in_2, noc2dmc_credit_rdy_2, 
  dmc2noc_credit_rtn_2, noc2dmc_valid_in_3, noc2dmc_data_in_3, noc2dmc_credit_rdy_3, 
  dmc2noc_credit_rtn_3, dmc2noc_valid_out_0, dmc2noc_data_out_0, dmc2noc_credit_rdy_0, 
  noc2dmc_credit_rtn_0, dmc2noc_valid_out_1, dmc2noc_data_out_1, dmc2noc_credit_rdy_1, 
  noc2dmc_credit_rtn_1, dmc2noc_valid_out_2, dmc2noc_data_out_2, dmc2noc_credit_rdy_2, 
  noc2dmc_credit_rtn_2, dmc2noc_valid_out_3, dmc2noc_data_out_3, dmc2noc_credit_rdy_3, 
  noc2dmc_credit_rtn_3, from_noc_0, from_noc_1, from_noc_2, from_noc_3)
/* synthesis syn_black_box black_box_pad_pin="sys_clk_p,sys_clk_n,ch0_lpddr4_dq_a[15:0],ch0_lpddr4_dqs_t_a[1:0],ch0_lpddr4_dqs_c_a[1:0],ch0_lpddr4_ca_a[5:0],ch0_lpddr4_cs_a[0:0],ch0_lpddr4_ck_t_a[0:0],ch0_lpddr4_ck_c_a[0:0],ch0_lpddr4_cke_a[0:0],ch0_lpddr4_dmi_a[1:0],ch0_lpddr4_dq_b[15:0],ch0_lpddr4_dqs_t_b[1:0],ch0_lpddr4_dqs_c_b[1:0],ch0_lpddr4_ca_b[5:0],ch0_lpddr4_cs_b[0:0],ch0_lpddr4_ck_t_b[0:0],ch0_lpddr4_ck_c_b[0:0],ch0_lpddr4_cke_b[0:0],ch0_lpddr4_dmi_b[1:0],ch0_lpddr4_reset_n[0:0],ch1_lpddr4_dq_a[15:0],ch1_lpddr4_dqs_t_a[1:0],ch1_lpddr4_dqs_c_a[1:0],ch1_lpddr4_ca_a[5:0],ch1_lpddr4_cs_a[0:0],ch1_lpddr4_ck_t_a[0:0],ch1_lpddr4_ck_c_a[0:0],ch1_lpddr4_cke_a[0:0],ch1_lpddr4_dmi_a[1:0],ch1_lpddr4_dq_b[15:0],ch1_lpddr4_dqs_t_b[1:0],ch1_lpddr4_dqs_c_b[1:0],ch1_lpddr4_ca_b[5:0],ch1_lpddr4_cs_b[0:0],ch1_lpddr4_ck_t_b[0:0],ch1_lpddr4_ck_c_b[0:0],ch1_lpddr4_cke_b[0:0],ch1_lpddr4_dmi_b[1:0],ch1_lpddr4_reset_n[0:0],noc2dmc_valid_in_0[7:0],noc2dmc_data_in_0[181:0],noc2dmc_credit_rdy_0,dmc2noc_credit_rtn_0[7:0],noc2dmc_valid_in_1[7:0],noc2dmc_data_in_1[181:0],noc2dmc_credit_rdy_1,dmc2noc_credit_rtn_1[7:0],noc2dmc_valid_in_2[7:0],noc2dmc_data_in_2[181:0],noc2dmc_credit_rdy_2,dmc2noc_credit_rtn_2[7:0],noc2dmc_valid_in_3[7:0],noc2dmc_data_in_3[181:0],noc2dmc_credit_rdy_3,dmc2noc_credit_rtn_3[7:0],dmc2noc_valid_out_0[7:0],dmc2noc_data_out_0[181:0],dmc2noc_credit_rdy_0,noc2dmc_credit_rtn_0[7:0],dmc2noc_valid_out_1[7:0],dmc2noc_data_out_1[181:0],dmc2noc_credit_rdy_1,noc2dmc_credit_rtn_1[7:0],dmc2noc_valid_out_2[7:0],dmc2noc_data_out_2[181:0],dmc2noc_credit_rdy_2,noc2dmc_credit_rtn_2[7:0],dmc2noc_valid_out_3[7:0],dmc2noc_data_out_3[181:0],dmc2noc_credit_rdy_3,noc2dmc_credit_rtn_3[7:0],from_noc_0,from_noc_1,from_noc_2,from_noc_3" */;
  input sys_clk_p;
  input sys_clk_n;
  inout [15:0]ch0_lpddr4_dq_a;
  inout [1:0]ch0_lpddr4_dqs_t_a;
  inout [1:0]ch0_lpddr4_dqs_c_a;
  output [5:0]ch0_lpddr4_ca_a;
  output [0:0]ch0_lpddr4_cs_a;
  output [0:0]ch0_lpddr4_ck_t_a;
  output [0:0]ch0_lpddr4_ck_c_a;
  output [0:0]ch0_lpddr4_cke_a;
  inout [1:0]ch0_lpddr4_dmi_a;
  inout [15:0]ch0_lpddr4_dq_b;
  inout [1:0]ch0_lpddr4_dqs_t_b;
  inout [1:0]ch0_lpddr4_dqs_c_b;
  output [5:0]ch0_lpddr4_ca_b;
  output [0:0]ch0_lpddr4_cs_b;
  output [0:0]ch0_lpddr4_ck_t_b;
  output [0:0]ch0_lpddr4_ck_c_b;
  output [0:0]ch0_lpddr4_cke_b;
  inout [1:0]ch0_lpddr4_dmi_b;
  output [0:0]ch0_lpddr4_reset_n;
  inout [15:0]ch1_lpddr4_dq_a;
  inout [1:0]ch1_lpddr4_dqs_t_a;
  inout [1:0]ch1_lpddr4_dqs_c_a;
  output [5:0]ch1_lpddr4_ca_a;
  output [0:0]ch1_lpddr4_cs_a;
  output [0:0]ch1_lpddr4_ck_t_a;
  output [0:0]ch1_lpddr4_ck_c_a;
  output [0:0]ch1_lpddr4_cke_a;
  inout [1:0]ch1_lpddr4_dmi_a;
  inout [15:0]ch1_lpddr4_dq_b;
  inout [1:0]ch1_lpddr4_dqs_t_b;
  inout [1:0]ch1_lpddr4_dqs_c_b;
  output [5:0]ch1_lpddr4_ca_b;
  output [0:0]ch1_lpddr4_cs_b;
  output [0:0]ch1_lpddr4_ck_t_b;
  output [0:0]ch1_lpddr4_ck_c_b;
  output [0:0]ch1_lpddr4_cke_b;
  inout [1:0]ch1_lpddr4_dmi_b;
  output [0:0]ch1_lpddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_0 VALID" *) input [7:0]noc2dmc_valid_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_0 FLIT" *) input [181:0]noc2dmc_data_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_0 CREDIT_RDY" *) input noc2dmc_credit_rdy_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_0 CREDIT_RETURN" *) output [7:0]dmc2noc_credit_rtn_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_1 VALID" *) input [7:0]noc2dmc_valid_in_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_1 FLIT" *) input [181:0]noc2dmc_data_in_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_1 CREDIT_RDY" *) input noc2dmc_credit_rdy_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_1 CREDIT_RETURN" *) output [7:0]dmc2noc_credit_rtn_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_2 VALID" *) input [7:0]noc2dmc_valid_in_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_2 FLIT" *) input [181:0]noc2dmc_data_in_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_2 CREDIT_RDY" *) input noc2dmc_credit_rdy_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_2 CREDIT_RETURN" *) output [7:0]dmc2noc_credit_rtn_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_3 VALID" *) input [7:0]noc2dmc_valid_in_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_3 FLIT" *) input [181:0]noc2dmc_data_in_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_3 CREDIT_RDY" *) input noc2dmc_credit_rdy_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_IN_3 CREDIT_RETURN" *) output [7:0]dmc2noc_credit_rtn_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_0 VALID" *) output [7:0]dmc2noc_valid_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_0 FLIT" *) output [181:0]dmc2noc_data_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_0 CREDIT_RDY" *) output dmc2noc_credit_rdy_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_0 CREDIT_RETURN" *) input [7:0]noc2dmc_credit_rtn_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_1 VALID" *) output [7:0]dmc2noc_valid_out_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_1 FLIT" *) output [181:0]dmc2noc_data_out_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_1 CREDIT_RDY" *) output dmc2noc_credit_rdy_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_1 CREDIT_RETURN" *) input [7:0]noc2dmc_credit_rtn_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_2 VALID" *) output [7:0]dmc2noc_valid_out_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_2 FLIT" *) output [181:0]dmc2noc_data_out_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_2 CREDIT_RDY" *) output dmc2noc_credit_rdy_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_2 CREDIT_RETURN" *) input [7:0]noc2dmc_credit_rtn_2;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_3 VALID" *) output [7:0]dmc2noc_valid_out_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_3 FLIT" *) output [181:0]dmc2noc_data_out_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_3 CREDIT_RDY" *) output dmc2noc_credit_rdy_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 NPP_OUT_3 CREDIT_RETURN" *) input [7:0]noc2dmc_credit_rtn_3;
  input from_noc_0;
  input from_noc_1;
  input from_noc_2;
  input from_noc_3;
endmodule
