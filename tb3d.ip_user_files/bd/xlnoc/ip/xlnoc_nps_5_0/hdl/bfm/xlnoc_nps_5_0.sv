///////////////////////////////////////////////////////////
// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:noc_nps:1.0
// IP Revision: 0
//


(* X_CORE_INFO = "noc_nps_v1_0_2_0,Vivado 2018.1.0" *)
(* CHECK_LICENSE_TYPE = "noc_nps_0,noc_nps_v1_0_2_0,{}" *)

(* DowngradeIPIdentifiedWarnings = "yes" *)


module xlnoc_nps_5_0 
(
  IF_NOC_NPP_IN0_NOC_CREDIT_RETURN,
  IF_NOC_NPP_IN1_NOC_CREDIT_RETURN,
  IF_NOC_NPP_IN2_NOC_CREDIT_RETURN,
  IF_NOC_NPP_IN3_NOC_CREDIT_RETURN,
  IF_NOC_NPP_OUT0_NOC_CREDIT_RDY,
  IF_NOC_NPP_OUT0_NOC_FLIT,
  IF_NOC_NPP_OUT0_NOC_VALID,
  IF_NOC_NPP_OUT1_NOC_CREDIT_RDY,
  IF_NOC_NPP_OUT1_NOC_FLIT,
  IF_NOC_NPP_OUT1_NOC_VALID,
  IF_NOC_NPP_OUT2_NOC_CREDIT_RDY,
  IF_NOC_NPP_OUT2_NOC_FLIT,
  IF_NOC_NPP_OUT2_NOC_VALID,
  IF_NOC_NPP_OUT3_NOC_CREDIT_RDY,
  IF_NOC_NPP_OUT3_NOC_FLIT,
  IF_NOC_NPP_OUT3_NOC_VALID,
  IF_NOC_NPP_IN0_NOC_CREDIT_RDY,
  IF_NOC_NPP_IN0_NOC_FLIT,
  IF_NOC_NPP_IN0_NOC_VALID,
  IF_NOC_NPP_IN1_NOC_CREDIT_RDY,
  IF_NOC_NPP_IN1_NOC_FLIT,
  IF_NOC_NPP_IN1_NOC_VALID,
  IF_NOC_NPP_IN2_NOC_CREDIT_RDY,
  IF_NOC_NPP_IN2_NOC_FLIT,
  IF_NOC_NPP_IN2_NOC_VALID,
  IF_NOC_NPP_IN3_NOC_CREDIT_RDY,
  IF_NOC_NPP_IN3_NOC_FLIT,
  IF_NOC_NPP_IN3_NOC_VALID,
  IF_NOC_NPP_OUT0_NOC_CREDIT_RETURN,
  IF_NOC_NPP_OUT1_NOC_CREDIT_RETURN,
  IF_NOC_NPP_OUT2_NOC_CREDIT_RETURN,
  IF_NOC_NPP_OUT3_NOC_CREDIT_RETURN
);

(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_W CREDIT_RETURN" *)
output wire [7 : 0] IF_NOC_NPP_IN0_NOC_CREDIT_RETURN;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_N CREDIT_RETURN" *)
output wire [7 : 0] IF_NOC_NPP_IN1_NOC_CREDIT_RETURN;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_E CREDIT_RETURN" *)
output wire [7 : 0] IF_NOC_NPP_IN2_NOC_CREDIT_RETURN;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_S CREDIT_RETURN" *)
output wire [7 : 0] IF_NOC_NPP_IN3_NOC_CREDIT_RETURN;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_W CREDIT_RDY" *)
output wire IF_NOC_NPP_OUT0_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_W FLIT" *)
output wire [181 : 0] IF_NOC_NPP_OUT0_NOC_FLIT;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_W VALID" *)
output wire [7 : 0] IF_NOC_NPP_OUT0_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_N CREDIT_RDY" *)
output wire IF_NOC_NPP_OUT1_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_N FLIT" *)
output wire [181 : 0] IF_NOC_NPP_OUT1_NOC_FLIT;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_N VALID" *)
output wire [7 : 0] IF_NOC_NPP_OUT1_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_E CREDIT_RDY" *)
output wire IF_NOC_NPP_OUT2_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_E FLIT" *)
output wire [181 : 0] IF_NOC_NPP_OUT2_NOC_FLIT;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_E VALID" *)
output wire [7 : 0] IF_NOC_NPP_OUT2_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_S CREDIT_RDY" *)
output wire IF_NOC_NPP_OUT3_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_S FLIT" *)
output wire [181 : 0] IF_NOC_NPP_OUT3_NOC_FLIT;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_S VALID" *)
output wire [7 : 0] IF_NOC_NPP_OUT3_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_W CREDIT_RDY" *)
input wire IF_NOC_NPP_IN0_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_W FLIT" *)
input wire [181 : 0] IF_NOC_NPP_IN0_NOC_FLIT;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SNPP_W, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_W VALID" *)
input wire [7 : 0] IF_NOC_NPP_IN0_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_N CREDIT_RDY" *)
input wire IF_NOC_NPP_IN1_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_N FLIT" *)
input wire [181 : 0] IF_NOC_NPP_IN1_NOC_FLIT;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SNPP_N, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_N VALID" *)
input wire [7 : 0] IF_NOC_NPP_IN1_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_E CREDIT_RDY" *)
input wire IF_NOC_NPP_IN2_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_E FLIT" *)
input wire [181 : 0] IF_NOC_NPP_IN2_NOC_FLIT;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SNPP_E, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_E VALID" *)
input wire [7 : 0] IF_NOC_NPP_IN2_NOC_VALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_S CREDIT_RDY" *)
input wire IF_NOC_NPP_IN3_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_S FLIT" *)
input wire [181 : 0] IF_NOC_NPP_IN3_NOC_FLIT;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SNPP_S, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP_S VALID" *)
input wire [7 : 0] IF_NOC_NPP_IN3_NOC_VALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MNPP_W, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_W CREDIT_RETURN" *)
input wire [7 : 0] IF_NOC_NPP_OUT0_NOC_CREDIT_RETURN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MNPP_N, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_N CREDIT_RETURN" *)
input wire [7 : 0] IF_NOC_NPP_OUT1_NOC_CREDIT_RETURN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MNPP_E, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_E CREDIT_RETURN" *)
input wire [7 : 0] IF_NOC_NPP_OUT2_NOC_CREDIT_RETURN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MNPP_S, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP_S CREDIT_RETURN" *)
input wire [7 : 0] IF_NOC_NPP_OUT3_NOC_CREDIT_RETURN;


xlnoc_nps_5_0_top #
  (
     .REG_CLOCK_MUX ('H00000003),
     .REG_HIGH_ID0_P01 ('H55550000),
     .REG_HIGH_ID0_P23 ('Hffffaaaa),
     .REG_HIGH_ID10_P01 ('H55550000),
     .REG_HIGH_ID10_P23 ('Hffffaaaa),
     .REG_HIGH_ID11_P01 ('H55550000),
     .REG_HIGH_ID11_P23 ('Hffffaaaa),
     .REG_HIGH_ID12_P01 ('H55550000),
     .REG_HIGH_ID12_P23 ('Hffffaaaa),
     .REG_HIGH_ID13_P01 ('H55550000),
     .REG_HIGH_ID13_P23 ('Hffffaaaa),
     .REG_HIGH_ID14_P01 ('H55550000),
     .REG_HIGH_ID14_P23 ('Hffffaaaa),
     .REG_HIGH_ID15_P01 ('H55550000),
     .REG_HIGH_ID15_P23 ('Hffffaaaa),
     .REG_HIGH_ID16_P01 ('H55550000),
     .REG_HIGH_ID16_P23 ('Hffffaaaa),
     .REG_HIGH_ID17_P01 ('H55550000),
     .REG_HIGH_ID17_P23 ('Hffffaaaa),
     .REG_HIGH_ID18_P01 ('H55550000),
     .REG_HIGH_ID18_P23 ('Hffffaaaa),
     .REG_HIGH_ID19_P01 ('H55550000),
     .REG_HIGH_ID19_P23 ('Hffffaaaa),
     .REG_HIGH_ID1_P01 ('H55550000),
     .REG_HIGH_ID1_P23 ('Hffff5aaa),
     .REG_HIGH_ID20_P01 ('H55550000),
     .REG_HIGH_ID20_P23 ('Hffffaaaa),
     .REG_HIGH_ID21_P01 ('H55550000),
     .REG_HIGH_ID21_P23 ('Hffffaaaa),
     .REG_HIGH_ID22_P01 ('H55550000),
     .REG_HIGH_ID22_P23 ('Hffffaaaa),
     .REG_HIGH_ID23_P01 ('H55550000),
     .REG_HIGH_ID23_P23 ('Hffffaaaa),
     .REG_HIGH_ID24_P01 ('H55550000),
     .REG_HIGH_ID24_P23 ('Hffffaaaa),
     .REG_HIGH_ID25_P01 ('H55550000),
     .REG_HIGH_ID25_P23 ('Hffffaaaa),
     .REG_HIGH_ID26_P01 ('H55550000),
     .REG_HIGH_ID26_P23 ('Hffffaaaa),
     .REG_HIGH_ID27_P01 ('H55550000),
     .REG_HIGH_ID27_P23 ('Hffffaaaa),
     .REG_HIGH_ID28_P01 ('H55550000),
     .REG_HIGH_ID28_P23 ('Hffffaaaa),
     .REG_HIGH_ID29_P01 ('H55550000),
     .REG_HIGH_ID29_P23 ('Hffffaaaa),
     .REG_HIGH_ID2_P01 ('H55550000),
     .REG_HIGH_ID2_P23 ('Hffffaaaa),
     .REG_HIGH_ID30_P01 ('H55550000),
     .REG_HIGH_ID30_P23 ('Hffffaaaa),
     .REG_HIGH_ID31_P01 ('H55550000),
     .REG_HIGH_ID31_P23 ('Hffffaaaa),
     .REG_HIGH_ID32_P01 ('H55550000),
     .REG_HIGH_ID32_P23 ('Hffffaaaa),
     .REG_HIGH_ID33_P01 ('H55550000),
     .REG_HIGH_ID33_P23 ('Hffffaaaa),
     .REG_HIGH_ID34_P01 ('H55550000),
     .REG_HIGH_ID34_P23 ('Hffffaaaa),
     .REG_HIGH_ID35_P01 ('H55550000),
     .REG_HIGH_ID35_P23 ('Hffffaaaa),
     .REG_HIGH_ID36_P01 ('H55550000),
     .REG_HIGH_ID36_P23 ('Hffffaaaa),
     .REG_HIGH_ID37_P01 ('H55550000),
     .REG_HIGH_ID37_P23 ('Hffffaaaa),
     .REG_HIGH_ID38_P01 ('H55550000),
     .REG_HIGH_ID38_P23 ('Hffffaaaa),
     .REG_HIGH_ID39_P01 ('H55550000),
     .REG_HIGH_ID39_P23 ('Hffffaaaa),
     .REG_HIGH_ID3_P01 ('H55550000),
     .REG_HIGH_ID3_P23 ('Hffffaaaa),
     .REG_HIGH_ID40_P01 ('H55550000),
     .REG_HIGH_ID40_P23 ('Hffffaaaa),
     .REG_HIGH_ID41_P01 ('H55550000),
     .REG_HIGH_ID41_P23 ('Hffffaaaa),
     .REG_HIGH_ID42_P01 ('H55550000),
     .REG_HIGH_ID42_P23 ('Hffffaaaa),
     .REG_HIGH_ID43_P01 ('H55550000),
     .REG_HIGH_ID43_P23 ('Hffffaaaa),
     .REG_HIGH_ID44_P01 ('H55550000),
     .REG_HIGH_ID44_P23 ('Hffffaaaa),
     .REG_HIGH_ID45_P01 ('H55550000),
     .REG_HIGH_ID45_P23 ('Hffffaaaa),
     .REG_HIGH_ID46_P01 ('H55550000),
     .REG_HIGH_ID46_P23 ('Hffffaaaa),
     .REG_HIGH_ID47_P01 ('H55550000),
     .REG_HIGH_ID47_P23 ('Hffffaaaa),
     .REG_HIGH_ID48_P01 ('H55550000),
     .REG_HIGH_ID48_P23 ('Hffffaaaa),
     .REG_HIGH_ID49_P01 ('H55550000),
     .REG_HIGH_ID49_P23 ('Hffffaaaa),
     .REG_HIGH_ID4_P01 ('H55550000),
     .REG_HIGH_ID4_P23 ('Hffffaaaa),
     .REG_HIGH_ID50_P01 ('H55550000),
     .REG_HIGH_ID50_P23 ('Hffffaaaa),
     .REG_HIGH_ID51_P01 ('H55550000),
     .REG_HIGH_ID51_P23 ('Hffffaaaa),
     .REG_HIGH_ID52_P01 ('H55550000),
     .REG_HIGH_ID52_P23 ('Hffffaaaa),
     .REG_HIGH_ID53_P01 ('H55550000),
     .REG_HIGH_ID53_P23 ('Hffffaaaa),
     .REG_HIGH_ID54_P01 ('H55550000),
     .REG_HIGH_ID54_P23 ('Hffffaaaa),
     .REG_HIGH_ID55_P01 ('H55550000),
     .REG_HIGH_ID55_P23 ('Hffffaaaa),
     .REG_HIGH_ID56_P01 ('H55550000),
     .REG_HIGH_ID56_P23 ('Hffffaaaa),
     .REG_HIGH_ID57_P01 ('H55550000),
     .REG_HIGH_ID57_P23 ('Hffffaaaa),
     .REG_HIGH_ID58_P01 ('H55550000),
     .REG_HIGH_ID58_P23 ('Hffffaaaa),
     .REG_HIGH_ID59_P01 ('H55550000),
     .REG_HIGH_ID59_P23 ('Hffffaaaa),
     .REG_HIGH_ID5_P01 ('H55550000),
     .REG_HIGH_ID5_P23 ('Hffffaaaa),
     .REG_HIGH_ID60_P01 ('H55550000),
     .REG_HIGH_ID60_P23 ('Hffffaaaa),
     .REG_HIGH_ID61_P01 ('H55550000),
     .REG_HIGH_ID61_P23 ('Hffffaaaa),
     .REG_HIGH_ID62_P01 ('H55550000),
     .REG_HIGH_ID62_P23 ('Hffffaaaa),
     .REG_HIGH_ID63_P01 ('H55550000),
     .REG_HIGH_ID63_P23 ('Hffffaaaa),
     .REG_HIGH_ID6_P01 ('H55550000),
     .REG_HIGH_ID6_P23 ('Hffffaaaa),
     .REG_HIGH_ID7_P01 ('H55550000),
     .REG_HIGH_ID7_P23 ('Hffffaaaa),
     .REG_HIGH_ID8_P01 ('H55550000),
     .REG_HIGH_ID8_P23 ('Hffffaaaa),
     .REG_HIGH_ID9_P01 ('H5a550000),
     .REG_HIGH_ID9_P23 ('Hffffaaaa),
     .REG_ID ('H000),
     .REG_LOW_ID0_P01 ('H55550000),
     .REG_LOW_ID0_P23 ('Hffffaaaa),
     .REG_LOW_ID10_P01 ('H55550000),
     .REG_LOW_ID10_P23 ('Hffffaaaa),
     .REG_LOW_ID11_P01 ('H55550000),
     .REG_LOW_ID11_P23 ('Hffffaaaa),
     .REG_LOW_ID12_P01 ('H55550000),
     .REG_LOW_ID12_P23 ('Hffffaaaa),
     .REG_LOW_ID13_P01 ('H55550000),
     .REG_LOW_ID13_P23 ('Hffffaaaa),
     .REG_LOW_ID14_P01 ('H55550000),
     .REG_LOW_ID14_P23 ('Hffffaaaa),
     .REG_LOW_ID15_P01 ('H55550000),
     .REG_LOW_ID15_P23 ('Hffffaaaa),
     .REG_LOW_ID1_P01 ('H55550000),
     .REG_LOW_ID1_P23 ('Hffffaaaa),
     .REG_LOW_ID2_P01 ('H55550000),
     .REG_LOW_ID2_P23 ('Hffffaaaa),
     .REG_LOW_ID3_P01 ('H55550000),
     .REG_LOW_ID3_P23 ('Hffffaaaa),
     .REG_LOW_ID4_P01 ('H55550000),
     .REG_LOW_ID4_P23 ('Hffffaaaa),
     .REG_LOW_ID5_P01 ('H55550000),
     .REG_LOW_ID5_P23 ('Hffffaaaa),
     .REG_LOW_ID6_P01 ('H55550000),
     .REG_LOW_ID6_P23 ('Hffffaaaa),
     .REG_LOW_ID7_P01 ('H55550000),
     .REG_LOW_ID7_P23 ('Hffffaaaa),
     .REG_LOW_ID8_P01 ('H55550000),
     .REG_LOW_ID8_P23 ('Hffffaaaa),
     .REG_LOW_ID9_P01 ('H55550000),
     .REG_LOW_ID9_P23 ('Hffffaaaa),
     .REG_MID_ID0_P01 ('H55550000),
     .REG_MID_ID0_P23 ('Hffffaaaa),
     .REG_MID_ID1_P01 ('H55550000),
     .REG_MID_ID1_P23 ('Hffffaaaa),
     .REG_MID_ID2_P01 ('H55550000),
     .REG_MID_ID2_P23 ('Hffffaaaa),
     .REG_MID_ID3_P01 ('H55550000),
     .REG_MID_ID3_P23 ('Hffffaaaa),
     .REG_NOC_CTL ('HFF00),
     .REG_P00_P1_0_VCA_TOKEN ('H10101010),
     .REG_P00_P1_1_VCA_TOKEN ('H10101010),
     .REG_P01_P2_0_VCA_TOKEN ('H10101010),
     .REG_P01_P2_1_VCA_TOKEN ('H10101010),
     .REG_P02_P3_0_VCA_TOKEN ('H10101010),
     .REG_P02_P3_1_VCA_TOKEN ('H10101010),
     .REG_P10_P2_0_VCA_TOKEN ('H10101010),
     .REG_P10_P2_1_VCA_TOKEN ('H40ff1010),
     .REG_P11_P3_0_VCA_TOKEN ('H10101010),
     .REG_P11_P3_1_VCA_TOKEN ('H10101010),
     .REG_P12_P0_0_VCA_TOKEN ('H10101010),
     .REG_P12_P0_1_VCA_TOKEN ('H10101010),
     .REG_P20_P3_0_VCA_TOKEN ('H10101010),
     .REG_P20_P3_1_VCA_TOKEN ('H10101010),
     .REG_P21_P0_0_VCA_TOKEN ('H10101010),
     .REG_P21_P0_1_VCA_TOKEN ('H10101010),
     .REG_P22_P1_0_VCA_TOKEN ('H10101010),
     .REG_P22_P1_1_VCA_TOKEN ('H1010ff33),
     .REG_P30_P0_0_VCA_TOKEN ('H10101010),
     .REG_P30_P0_1_VCA_TOKEN ('H10101010),
     .REG_P31_P1_0_VCA_TOKEN ('H10101010),
     .REG_P31_P1_1_VCA_TOKEN ('H10101010),
     .REG_P32_P2_0_VCA_TOKEN ('H10101010),
     .REG_P32_P2_1_VCA_TOKEN ('H10101010)
) xlnoc_nps_5_0_top_INST (
    .IF_NOC_NPP_IN0_NOC_CREDIT_RETURN(IF_NOC_NPP_IN0_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_IN1_NOC_CREDIT_RETURN(IF_NOC_NPP_IN1_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_IN2_NOC_CREDIT_RETURN(IF_NOC_NPP_IN2_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_IN3_NOC_CREDIT_RETURN(IF_NOC_NPP_IN3_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_OUT0_NOC_CREDIT_RDY(IF_NOC_NPP_OUT0_NOC_CREDIT_RDY),
    .IF_NOC_NPP_OUT0_NOC_FLIT(IF_NOC_NPP_OUT0_NOC_FLIT),
    .IF_NOC_NPP_OUT0_NOC_VALID(IF_NOC_NPP_OUT0_NOC_VALID),
    .IF_NOC_NPP_OUT1_NOC_CREDIT_RDY(IF_NOC_NPP_OUT1_NOC_CREDIT_RDY),
    .IF_NOC_NPP_OUT1_NOC_FLIT(IF_NOC_NPP_OUT1_NOC_FLIT),
    .IF_NOC_NPP_OUT1_NOC_VALID(IF_NOC_NPP_OUT1_NOC_VALID),
    .IF_NOC_NPP_OUT2_NOC_CREDIT_RDY(IF_NOC_NPP_OUT2_NOC_CREDIT_RDY),
    .IF_NOC_NPP_OUT2_NOC_FLIT(IF_NOC_NPP_OUT2_NOC_FLIT),
    .IF_NOC_NPP_OUT2_NOC_VALID(IF_NOC_NPP_OUT2_NOC_VALID),
    .IF_NOC_NPP_OUT3_NOC_CREDIT_RDY(IF_NOC_NPP_OUT3_NOC_CREDIT_RDY),
    .IF_NOC_NPP_OUT3_NOC_FLIT(IF_NOC_NPP_OUT3_NOC_FLIT),
    .IF_NOC_NPP_OUT3_NOC_VALID(IF_NOC_NPP_OUT3_NOC_VALID),
    .IF_NOC_NPP_IN0_NOC_CREDIT_RDY(IF_NOC_NPP_IN0_NOC_CREDIT_RDY),
    .IF_NOC_NPP_IN0_NOC_FLIT(IF_NOC_NPP_IN0_NOC_FLIT),
    .IF_NOC_NPP_IN0_NOC_VALID(IF_NOC_NPP_IN0_NOC_VALID),
    .IF_NOC_NPP_IN1_NOC_CREDIT_RDY(IF_NOC_NPP_IN1_NOC_CREDIT_RDY),
    .IF_NOC_NPP_IN1_NOC_FLIT(IF_NOC_NPP_IN1_NOC_FLIT),
    .IF_NOC_NPP_IN1_NOC_VALID(IF_NOC_NPP_IN1_NOC_VALID),
    .IF_NOC_NPP_IN2_NOC_CREDIT_RDY(IF_NOC_NPP_IN2_NOC_CREDIT_RDY),
    .IF_NOC_NPP_IN2_NOC_FLIT(IF_NOC_NPP_IN2_NOC_FLIT),
    .IF_NOC_NPP_IN2_NOC_VALID(IF_NOC_NPP_IN2_NOC_VALID),
    .IF_NOC_NPP_IN3_NOC_CREDIT_RDY(IF_NOC_NPP_IN3_NOC_CREDIT_RDY),
    .IF_NOC_NPP_IN3_NOC_FLIT(IF_NOC_NPP_IN3_NOC_FLIT),
    .IF_NOC_NPP_IN3_NOC_VALID(IF_NOC_NPP_IN3_NOC_VALID),
    .IF_NOC_NPP_OUT0_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT0_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_OUT1_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT1_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_OUT2_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT2_NOC_CREDIT_RETURN),
    .IF_NOC_NPP_OUT3_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT3_NOC_CREDIT_RETURN)
);

endmodule
