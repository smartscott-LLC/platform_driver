-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Tue Mar 24 17:37:03 2026
-- Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_8be5_MC0_ddrc_0_phy_42590_stub.vhdl
-- Design      : bd_8be5_MC0_ddrc_0_phy_42590
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvp1802-lsvc4072-2MP-e-S
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sys_clk_p : in STD_LOGIC;
    sys_clk_n : in STD_LOGIC;
    ch0_lpddr4_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch0_lpddr4_cs_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_ck_t_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_ck_c_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_cke_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_ca_b : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch0_lpddr4_cs_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_ck_t_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_ck_c_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_cke_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch0_lpddr4_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_reset_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch1_lpddr4_cs_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_ck_t_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_ck_c_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_cke_a : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_ca_b : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch1_lpddr4_cs_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_ck_t_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_ck_c_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_cke_b : out STD_LOGIC_VECTOR ( 0 to 0 );
    ch1_lpddr4_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_reset_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    noc2dmc_valid_in_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_data_in_0 : in STD_LOGIC_VECTOR ( 181 downto 0 );
    noc2dmc_credit_rdy_0 : in STD_LOGIC;
    dmc2noc_credit_rtn_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_valid_in_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_data_in_1 : in STD_LOGIC_VECTOR ( 181 downto 0 );
    noc2dmc_credit_rdy_1 : in STD_LOGIC;
    dmc2noc_credit_rtn_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_valid_in_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_data_in_2 : in STD_LOGIC_VECTOR ( 181 downto 0 );
    noc2dmc_credit_rdy_2 : in STD_LOGIC;
    dmc2noc_credit_rtn_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_valid_in_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    noc2dmc_data_in_3 : in STD_LOGIC_VECTOR ( 181 downto 0 );
    noc2dmc_credit_rdy_3 : in STD_LOGIC;
    dmc2noc_credit_rtn_3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_valid_out_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_data_out_0 : out STD_LOGIC_VECTOR ( 181 downto 0 );
    dmc2noc_credit_rdy_0 : out STD_LOGIC;
    noc2dmc_credit_rtn_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_valid_out_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_data_out_1 : out STD_LOGIC_VECTOR ( 181 downto 0 );
    dmc2noc_credit_rdy_1 : out STD_LOGIC;
    noc2dmc_credit_rtn_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_valid_out_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_data_out_2 : out STD_LOGIC_VECTOR ( 181 downto 0 );
    dmc2noc_credit_rdy_2 : out STD_LOGIC;
    noc2dmc_credit_rtn_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_valid_out_3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dmc2noc_data_out_3 : out STD_LOGIC_VECTOR ( 181 downto 0 );
    dmc2noc_credit_rdy_3 : out STD_LOGIC;
    noc2dmc_credit_rtn_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    from_noc_0 : in STD_LOGIC;
    from_noc_1 : in STD_LOGIC;
    from_noc_2 : in STD_LOGIC;
    from_noc_3 : in STD_LOGIC
  );

  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "sys_clk_p,sys_clk_n,ch0_lpddr4_dq_a[15:0],ch0_lpddr4_dqs_t_a[1:0],ch0_lpddr4_dqs_c_a[1:0],ch0_lpddr4_ca_a[5:0],ch0_lpddr4_cs_a[0:0],ch0_lpddr4_ck_t_a[0:0],ch0_lpddr4_ck_c_a[0:0],ch0_lpddr4_cke_a[0:0],ch0_lpddr4_dmi_a[1:0],ch0_lpddr4_dq_b[15:0],ch0_lpddr4_dqs_t_b[1:0],ch0_lpddr4_dqs_c_b[1:0],ch0_lpddr4_ca_b[5:0],ch0_lpddr4_cs_b[0:0],ch0_lpddr4_ck_t_b[0:0],ch0_lpddr4_ck_c_b[0:0],ch0_lpddr4_cke_b[0:0],ch0_lpddr4_dmi_b[1:0],ch0_lpddr4_reset_n[0:0],ch1_lpddr4_dq_a[15:0],ch1_lpddr4_dqs_t_a[1:0],ch1_lpddr4_dqs_c_a[1:0],ch1_lpddr4_ca_a[5:0],ch1_lpddr4_cs_a[0:0],ch1_lpddr4_ck_t_a[0:0],ch1_lpddr4_ck_c_a[0:0],ch1_lpddr4_cke_a[0:0],ch1_lpddr4_dmi_a[1:0],ch1_lpddr4_dq_b[15:0],ch1_lpddr4_dqs_t_b[1:0],ch1_lpddr4_dqs_c_b[1:0],ch1_lpddr4_ca_b[5:0],ch1_lpddr4_cs_b[0:0],ch1_lpddr4_ck_t_b[0:0],ch1_lpddr4_ck_c_b[0:0],ch1_lpddr4_cke_b[0:0],ch1_lpddr4_dmi_b[1:0],ch1_lpddr4_reset_n[0:0],noc2dmc_valid_in_0[7:0],noc2dmc_data_in_0[181:0],noc2dmc_credit_rdy_0,dmc2noc_credit_rtn_0[7:0],noc2dmc_valid_in_1[7:0],noc2dmc_data_in_1[181:0],noc2dmc_credit_rdy_1,dmc2noc_credit_rtn_1[7:0],noc2dmc_valid_in_2[7:0],noc2dmc_data_in_2[181:0],noc2dmc_credit_rdy_2,dmc2noc_credit_rtn_2[7:0],noc2dmc_valid_in_3[7:0],noc2dmc_data_in_3[181:0],noc2dmc_credit_rdy_3,dmc2noc_credit_rtn_3[7:0],dmc2noc_valid_out_0[7:0],dmc2noc_data_out_0[181:0],dmc2noc_credit_rdy_0,noc2dmc_credit_rtn_0[7:0],dmc2noc_valid_out_1[7:0],dmc2noc_data_out_1[181:0],dmc2noc_credit_rdy_1,noc2dmc_credit_rtn_1[7:0],dmc2noc_valid_out_2[7:0],dmc2noc_data_out_2[181:0],dmc2noc_credit_rdy_2,noc2dmc_credit_rtn_2[7:0],dmc2noc_valid_out_3[7:0],dmc2noc_data_out_3[181:0],dmc2noc_credit_rdy_3,noc2dmc_credit_rtn_3[7:0],from_noc_0,from_noc_1,from_noc_2,from_noc_3";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of noc2dmc_valid_in_0 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_0 VALID";
  attribute X_INTERFACE_INFO of noc2dmc_data_in_0 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_0 FLIT";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rdy_0 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_0 CREDIT_RDY";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rtn_0 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_0 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of noc2dmc_valid_in_1 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_1 VALID";
  attribute X_INTERFACE_INFO of noc2dmc_data_in_1 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_1 FLIT";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rdy_1 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_1 CREDIT_RDY";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rtn_1 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_1 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of noc2dmc_valid_in_2 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_2 VALID";
  attribute X_INTERFACE_INFO of noc2dmc_data_in_2 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_2 FLIT";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rdy_2 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_2 CREDIT_RDY";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rtn_2 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_2 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of noc2dmc_valid_in_3 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_3 VALID";
  attribute X_INTERFACE_INFO of noc2dmc_data_in_3 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_3 FLIT";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rdy_3 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_3 CREDIT_RDY";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rtn_3 : signal is "xilinx.com:interface:npp:1.0 NPP_IN_3 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of dmc2noc_valid_out_0 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_0 VALID";
  attribute X_INTERFACE_INFO of dmc2noc_data_out_0 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_0 FLIT";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rdy_0 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_0 CREDIT_RDY";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rtn_0 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_0 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of dmc2noc_valid_out_1 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_1 VALID";
  attribute X_INTERFACE_INFO of dmc2noc_data_out_1 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_1 FLIT";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rdy_1 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_1 CREDIT_RDY";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rtn_1 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_1 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of dmc2noc_valid_out_2 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_2 VALID";
  attribute X_INTERFACE_INFO of dmc2noc_data_out_2 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_2 FLIT";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rdy_2 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_2 CREDIT_RDY";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rtn_2 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_2 CREDIT_RETURN";
  attribute X_INTERFACE_INFO of dmc2noc_valid_out_3 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_3 VALID";
  attribute X_INTERFACE_INFO of dmc2noc_data_out_3 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_3 FLIT";
  attribute X_INTERFACE_INFO of dmc2noc_credit_rdy_3 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_3 CREDIT_RDY";
  attribute X_INTERFACE_INFO of noc2dmc_credit_rtn_3 : signal is "xilinx.com:interface:npp:1.0 NPP_OUT_3 CREDIT_RETURN";
begin
end;
