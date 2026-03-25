//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Tue Mar 24 17:22:11 2026
//Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target xlnoc.bd
//Design      : xlnoc
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "xlnoc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=xlnoc,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=IPI,synth_mode=None}" *) (* HW_HANDOFF = "xlnoc.hwdef" *) 
module xlnoc
   (nps_0_MNPP_N_credit_rdy,
    nps_0_MNPP_N_credit_return,
    nps_0_MNPP_N_flit,
    nps_0_MNPP_N_valid,
    nps_0_MNPP_S_credit_rdy,
    nps_0_MNPP_S_credit_return,
    nps_0_MNPP_S_flit,
    nps_0_MNPP_S_valid,
    nps_0_SNPP_N_credit_rdy,
    nps_0_SNPP_N_credit_return,
    nps_0_SNPP_N_flit,
    nps_0_SNPP_N_valid,
    nps_0_SNPP_S_credit_rdy,
    nps_0_SNPP_S_credit_return,
    nps_0_SNPP_S_flit,
    nps_0_SNPP_S_valid,
    nps_1_MNPP_W_credit_rdy,
    nps_1_MNPP_W_credit_return,
    nps_1_MNPP_W_flit,
    nps_1_MNPP_W_valid,
    nps_1_SNPP_W_credit_rdy,
    nps_1_SNPP_W_credit_return,
    nps_1_SNPP_W_flit,
    nps_1_SNPP_W_valid,
    nps_2_MNPP_N_credit_rdy,
    nps_2_MNPP_N_credit_return,
    nps_2_MNPP_N_flit,
    nps_2_MNPP_N_valid,
    nps_2_MNPP_S_credit_rdy,
    nps_2_MNPP_S_credit_return,
    nps_2_MNPP_S_flit,
    nps_2_MNPP_S_valid,
    nps_2_SNPP_N_credit_rdy,
    nps_2_SNPP_N_credit_return,
    nps_2_SNPP_N_flit,
    nps_2_SNPP_N_valid,
    nps_2_SNPP_S_credit_rdy,
    nps_2_SNPP_S_credit_return,
    nps_2_SNPP_S_flit,
    nps_2_SNPP_S_valid,
    nps_3_MNPP_N_credit_rdy,
    nps_3_MNPP_N_credit_return,
    nps_3_MNPP_N_flit,
    nps_3_MNPP_N_valid,
    nps_3_MNPP_S_credit_rdy,
    nps_3_MNPP_S_credit_return,
    nps_3_MNPP_S_flit,
    nps_3_MNPP_S_valid,
    nps_3_SNPP_N_credit_rdy,
    nps_3_SNPP_N_credit_return,
    nps_3_SNPP_N_flit,
    nps_3_SNPP_N_valid,
    nps_3_SNPP_S_credit_rdy,
    nps_3_SNPP_S_credit_return,
    nps_3_SNPP_S_flit,
    nps_3_SNPP_S_valid,
    nps_4_MNPP_N_credit_rdy,
    nps_4_MNPP_N_credit_return,
    nps_4_MNPP_N_flit,
    nps_4_MNPP_N_valid,
    nps_4_MNPP_S_credit_rdy,
    nps_4_MNPP_S_credit_return,
    nps_4_MNPP_S_flit,
    nps_4_MNPP_S_valid,
    nps_4_SNPP_N_credit_rdy,
    nps_4_SNPP_N_credit_return,
    nps_4_SNPP_N_flit,
    nps_4_SNPP_N_valid,
    nps_4_SNPP_S_credit_rdy,
    nps_4_SNPP_S_credit_return,
    nps_4_SNPP_S_flit,
    nps_4_SNPP_S_valid,
    nps_5_MNPP_N_credit_rdy,
    nps_5_MNPP_N_credit_return,
    nps_5_MNPP_N_flit,
    nps_5_MNPP_N_valid,
    nps_5_SNPP_N_credit_rdy,
    nps_5_SNPP_N_credit_return,
    nps_5_SNPP_N_flit,
    nps_5_SNPP_N_valid);
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_0_MNPP_N, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_0_MNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_N CREDIT_RETURN" *) input [7:0]nps_0_MNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_N FLIT" *) output [181:0]nps_0_MNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_N VALID" *) output [7:0]nps_0_MNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_0_MNPP_S, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_0_MNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_S CREDIT_RETURN" *) input [7:0]nps_0_MNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_S FLIT" *) output [181:0]nps_0_MNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_MNPP_S VALID" *) output [7:0]nps_0_MNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_0_SNPP_N, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_0_SNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_N CREDIT_RETURN" *) output [7:0]nps_0_SNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_N FLIT" *) input [181:0]nps_0_SNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_N VALID" *) input [7:0]nps_0_SNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_0_SNPP_S, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_0_SNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_S CREDIT_RETURN" *) output [7:0]nps_0_SNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_S FLIT" *) input [181:0]nps_0_SNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_0_SNPP_S VALID" *) input [7:0]nps_0_SNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_MNPP_W CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_1_MNPP_W, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_1_MNPP_W_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_MNPP_W CREDIT_RETURN" *) input [7:0]nps_1_MNPP_W_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_MNPP_W FLIT" *) output [181:0]nps_1_MNPP_W_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_MNPP_W VALID" *) output [7:0]nps_1_MNPP_W_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_SNPP_W CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_1_SNPP_W, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_1_SNPP_W_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_SNPP_W CREDIT_RETURN" *) output [7:0]nps_1_SNPP_W_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_SNPP_W FLIT" *) input [181:0]nps_1_SNPP_W_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_1_SNPP_W VALID" *) input [7:0]nps_1_SNPP_W_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_2_MNPP_N, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_2_MNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_N CREDIT_RETURN" *) input [7:0]nps_2_MNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_N FLIT" *) output [181:0]nps_2_MNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_N VALID" *) output [7:0]nps_2_MNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_2_MNPP_S, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_2_MNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_S CREDIT_RETURN" *) input [7:0]nps_2_MNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_S FLIT" *) output [181:0]nps_2_MNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_MNPP_S VALID" *) output [7:0]nps_2_MNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_2_SNPP_N, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_2_SNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_N CREDIT_RETURN" *) output [7:0]nps_2_SNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_N FLIT" *) input [181:0]nps_2_SNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_N VALID" *) input [7:0]nps_2_SNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_2_SNPP_S, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_2_SNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_S CREDIT_RETURN" *) output [7:0]nps_2_SNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_S FLIT" *) input [181:0]nps_2_SNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_2_SNPP_S VALID" *) input [7:0]nps_2_SNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_3_MNPP_N, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_3_MNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_N CREDIT_RETURN" *) input [7:0]nps_3_MNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_N FLIT" *) output [181:0]nps_3_MNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_N VALID" *) output [7:0]nps_3_MNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_3_MNPP_S, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_3_MNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_S CREDIT_RETURN" *) input [7:0]nps_3_MNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_S FLIT" *) output [181:0]nps_3_MNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_MNPP_S VALID" *) output [7:0]nps_3_MNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_3_SNPP_N, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_3_SNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_N CREDIT_RETURN" *) output [7:0]nps_3_SNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_N FLIT" *) input [181:0]nps_3_SNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_N VALID" *) input [7:0]nps_3_SNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_3_SNPP_S, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_3_SNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_S CREDIT_RETURN" *) output [7:0]nps_3_SNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_S FLIT" *) input [181:0]nps_3_SNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_3_SNPP_S VALID" *) input [7:0]nps_3_SNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_4_MNPP_N, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_4_MNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_N CREDIT_RETURN" *) input [7:0]nps_4_MNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_N FLIT" *) output [181:0]nps_4_MNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_N VALID" *) output [7:0]nps_4_MNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_4_MNPP_S, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_4_MNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_S CREDIT_RETURN" *) input [7:0]nps_4_MNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_S FLIT" *) output [181:0]nps_4_MNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_MNPP_S VALID" *) output [7:0]nps_4_MNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_4_SNPP_N, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_4_SNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_N CREDIT_RETURN" *) output [7:0]nps_4_SNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_N FLIT" *) input [181:0]nps_4_SNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_N VALID" *) input [7:0]nps_4_SNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_S CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_4_SNPP_S, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_4_SNPP_S_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_S CREDIT_RETURN" *) output [7:0]nps_4_SNPP_S_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_S FLIT" *) input [181:0]nps_4_SNPP_S_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_4_SNPP_S VALID" *) input [7:0]nps_4_SNPP_S_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_MNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_5_MNPP_N, CAN_DEBUG false, NOC_ID -1, WRITE_BUFFER_SIZE 80" *) output [0:0]nps_5_MNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_MNPP_N CREDIT_RETURN" *) input [7:0]nps_5_MNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_MNPP_N FLIT" *) output [181:0]nps_5_MNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_MNPP_N VALID" *) output [7:0]nps_5_MNPP_N_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_SNPP_N CREDIT_RDY" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nps_5_SNPP_N, CAN_DEBUG false, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, WRITE_BUFFER_SIZE 80, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [0:0]nps_5_SNPP_N_credit_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_SNPP_N CREDIT_RETURN" *) output [7:0]nps_5_SNPP_N_credit_return;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_SNPP_N FLIT" *) input [181:0]nps_5_SNPP_N_flit;
  (* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 nps_5_SNPP_N VALID" *) input [7:0]nps_5_SNPP_N_valid;


endmodule
