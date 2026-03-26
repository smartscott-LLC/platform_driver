-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- -------------------------------------------------------------------------------
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- MODULE VLNV: amd.com:blockdesign:full_blown:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT full_blown
  PORT (
    clk_100MHz : IN STD_LOGIC;
    reset_rtl : IN STD_LOGIC;
    S00_AXI_awaddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    S00_AXI_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXI_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S00_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_wlast : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_araddr : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    S00_AXI_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXI_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S00_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_rlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    S00_AXI_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    aclk0_0 : IN STD_LOGIC;
    ch0_lpddr4_trip1_dq_a : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch0_lpddr4_trip1_dq_b : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch0_lpddr4_trip1_dqs_t_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_dqs_t_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_dqs_c_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_dqs_c_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_ca_a : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch0_lpddr4_trip1_ca_b : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch0_lpddr4_trip1_cs_a : OUT STD_LOGIC;
    ch0_lpddr4_trip1_cs_b : OUT STD_LOGIC;
    ch0_lpddr4_trip1_ck_t_a : OUT STD_LOGIC;
    ch0_lpddr4_trip1_ck_t_b : OUT STD_LOGIC;
    ch0_lpddr4_trip1_ck_c_a : OUT STD_LOGIC;
    ch0_lpddr4_trip1_ck_c_b : OUT STD_LOGIC;
    ch0_lpddr4_trip1_cke_a : OUT STD_LOGIC;
    ch0_lpddr4_trip1_cke_b : OUT STD_LOGIC;
    ch0_lpddr4_trip1_dmi_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_dmi_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip1_reset_n : OUT STD_LOGIC;
    ch1_lpddr4_trip1_dq_a : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch1_lpddr4_trip1_dq_b : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch1_lpddr4_trip1_dqs_t_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_dqs_t_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_dqs_c_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_dqs_c_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_ca_a : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch1_lpddr4_trip1_ca_b : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch1_lpddr4_trip1_cs_a : OUT STD_LOGIC;
    ch1_lpddr4_trip1_cs_b : OUT STD_LOGIC;
    ch1_lpddr4_trip1_ck_t_a : OUT STD_LOGIC;
    ch1_lpddr4_trip1_ck_t_b : OUT STD_LOGIC;
    ch1_lpddr4_trip1_ck_c_a : OUT STD_LOGIC;
    ch1_lpddr4_trip1_ck_c_b : OUT STD_LOGIC;
    ch1_lpddr4_trip1_cke_a : OUT STD_LOGIC;
    ch1_lpddr4_trip1_cke_b : OUT STD_LOGIC;
    ch1_lpddr4_trip1_dmi_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_dmi_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip1_reset_n : OUT STD_LOGIC;
    lpddr4_clk1_clk_p : IN STD_LOGIC;
    lpddr4_clk1_clk_n : IN STD_LOGIC;
    ch0_lpddr4_trip2_dq_a : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch0_lpddr4_trip2_dq_b : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch0_lpddr4_trip2_dqs_t_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_dqs_t_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_dqs_c_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_dqs_c_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_ca_a : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch0_lpddr4_trip2_ca_b : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch0_lpddr4_trip2_cs_a : OUT STD_LOGIC;
    ch0_lpddr4_trip2_cs_b : OUT STD_LOGIC;
    ch0_lpddr4_trip2_ck_t_a : OUT STD_LOGIC;
    ch0_lpddr4_trip2_ck_t_b : OUT STD_LOGIC;
    ch0_lpddr4_trip2_ck_c_a : OUT STD_LOGIC;
    ch0_lpddr4_trip2_ck_c_b : OUT STD_LOGIC;
    ch0_lpddr4_trip2_cke_a : OUT STD_LOGIC;
    ch0_lpddr4_trip2_cke_b : OUT STD_LOGIC;
    ch0_lpddr4_trip2_dmi_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_dmi_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch0_lpddr4_trip2_reset_n : OUT STD_LOGIC;
    ch1_lpddr4_trip2_dq_a : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch1_lpddr4_trip2_dq_b : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ch1_lpddr4_trip2_dqs_t_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_dqs_t_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_dqs_c_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_dqs_c_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_ca_a : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch1_lpddr4_trip2_ca_b : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    ch1_lpddr4_trip2_cs_a : OUT STD_LOGIC;
    ch1_lpddr4_trip2_cs_b : OUT STD_LOGIC;
    ch1_lpddr4_trip2_ck_t_a : OUT STD_LOGIC;
    ch1_lpddr4_trip2_ck_t_b : OUT STD_LOGIC;
    ch1_lpddr4_trip2_ck_c_a : OUT STD_LOGIC;
    ch1_lpddr4_trip2_ck_c_b : OUT STD_LOGIC;
    ch1_lpddr4_trip2_cke_a : OUT STD_LOGIC;
    ch1_lpddr4_trip2_cke_b : OUT STD_LOGIC;
    ch1_lpddr4_trip2_dmi_a : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_dmi_b : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ch1_lpddr4_trip2_reset_n : OUT STD_LOGIC;
    lpddr4_clk2_clk_p : IN STD_LOGIC;
    lpddr4_clk2_clk_n : IN STD_LOGIC;
    gt_refclk0_0_clk_n : IN STD_LOGIC;
    gt_refclk0_0_clk_p : IN STD_LOGIC;
    UART_0_rxd : IN STD_LOGIC;
    UART_0_txd : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : full_blown
  PORT MAP (
    clk_100MHz => clk_100MHz,
    reset_rtl => reset_rtl,
    S00_AXI_awaddr => S00_AXI_awaddr,
    S00_AXI_awlen => S00_AXI_awlen,
    S00_AXI_awsize => S00_AXI_awsize,
    S00_AXI_awburst => S00_AXI_awburst,
    S00_AXI_awlock => S00_AXI_awlock,
    S00_AXI_awcache => S00_AXI_awcache,
    S00_AXI_awprot => S00_AXI_awprot,
    S00_AXI_awregion => S00_AXI_awregion,
    S00_AXI_awqos => S00_AXI_awqos,
    S00_AXI_awvalid => S00_AXI_awvalid,
    S00_AXI_awready => S00_AXI_awready,
    S00_AXI_wdata => S00_AXI_wdata,
    S00_AXI_wstrb => S00_AXI_wstrb,
    S00_AXI_wlast => S00_AXI_wlast,
    S00_AXI_wvalid => S00_AXI_wvalid,
    S00_AXI_wready => S00_AXI_wready,
    S00_AXI_bresp => S00_AXI_bresp,
    S00_AXI_bvalid => S00_AXI_bvalid,
    S00_AXI_bready => S00_AXI_bready,
    S00_AXI_araddr => S00_AXI_araddr,
    S00_AXI_arlen => S00_AXI_arlen,
    S00_AXI_arsize => S00_AXI_arsize,
    S00_AXI_arburst => S00_AXI_arburst,
    S00_AXI_arlock => S00_AXI_arlock,
    S00_AXI_arcache => S00_AXI_arcache,
    S00_AXI_arprot => S00_AXI_arprot,
    S00_AXI_arregion => S00_AXI_arregion,
    S00_AXI_arqos => S00_AXI_arqos,
    S00_AXI_arvalid => S00_AXI_arvalid,
    S00_AXI_arready => S00_AXI_arready,
    S00_AXI_rdata => S00_AXI_rdata,
    S00_AXI_rresp => S00_AXI_rresp,
    S00_AXI_rlast => S00_AXI_rlast,
    S00_AXI_rvalid => S00_AXI_rvalid,
    S00_AXI_rready => S00_AXI_rready,
    aclk0_0 => aclk0_0,
    ch0_lpddr4_trip1_dq_a => ch0_lpddr4_trip1_dq_a,
    ch0_lpddr4_trip1_dq_b => ch0_lpddr4_trip1_dq_b,
    ch0_lpddr4_trip1_dqs_t_a => ch0_lpddr4_trip1_dqs_t_a,
    ch0_lpddr4_trip1_dqs_t_b => ch0_lpddr4_trip1_dqs_t_b,
    ch0_lpddr4_trip1_dqs_c_a => ch0_lpddr4_trip1_dqs_c_a,
    ch0_lpddr4_trip1_dqs_c_b => ch0_lpddr4_trip1_dqs_c_b,
    ch0_lpddr4_trip1_ca_a => ch0_lpddr4_trip1_ca_a,
    ch0_lpddr4_trip1_ca_b => ch0_lpddr4_trip1_ca_b,
    ch0_lpddr4_trip1_cs_a => ch0_lpddr4_trip1_cs_a,
    ch0_lpddr4_trip1_cs_b => ch0_lpddr4_trip1_cs_b,
    ch0_lpddr4_trip1_ck_t_a => ch0_lpddr4_trip1_ck_t_a,
    ch0_lpddr4_trip1_ck_t_b => ch0_lpddr4_trip1_ck_t_b,
    ch0_lpddr4_trip1_ck_c_a => ch0_lpddr4_trip1_ck_c_a,
    ch0_lpddr4_trip1_ck_c_b => ch0_lpddr4_trip1_ck_c_b,
    ch0_lpddr4_trip1_cke_a => ch0_lpddr4_trip1_cke_a,
    ch0_lpddr4_trip1_cke_b => ch0_lpddr4_trip1_cke_b,
    ch0_lpddr4_trip1_dmi_a => ch0_lpddr4_trip1_dmi_a,
    ch0_lpddr4_trip1_dmi_b => ch0_lpddr4_trip1_dmi_b,
    ch0_lpddr4_trip1_reset_n => ch0_lpddr4_trip1_reset_n,
    ch1_lpddr4_trip1_dq_a => ch1_lpddr4_trip1_dq_a,
    ch1_lpddr4_trip1_dq_b => ch1_lpddr4_trip1_dq_b,
    ch1_lpddr4_trip1_dqs_t_a => ch1_lpddr4_trip1_dqs_t_a,
    ch1_lpddr4_trip1_dqs_t_b => ch1_lpddr4_trip1_dqs_t_b,
    ch1_lpddr4_trip1_dqs_c_a => ch1_lpddr4_trip1_dqs_c_a,
    ch1_lpddr4_trip1_dqs_c_b => ch1_lpddr4_trip1_dqs_c_b,
    ch1_lpddr4_trip1_ca_a => ch1_lpddr4_trip1_ca_a,
    ch1_lpddr4_trip1_ca_b => ch1_lpddr4_trip1_ca_b,
    ch1_lpddr4_trip1_cs_a => ch1_lpddr4_trip1_cs_a,
    ch1_lpddr4_trip1_cs_b => ch1_lpddr4_trip1_cs_b,
    ch1_lpddr4_trip1_ck_t_a => ch1_lpddr4_trip1_ck_t_a,
    ch1_lpddr4_trip1_ck_t_b => ch1_lpddr4_trip1_ck_t_b,
    ch1_lpddr4_trip1_ck_c_a => ch1_lpddr4_trip1_ck_c_a,
    ch1_lpddr4_trip1_ck_c_b => ch1_lpddr4_trip1_ck_c_b,
    ch1_lpddr4_trip1_cke_a => ch1_lpddr4_trip1_cke_a,
    ch1_lpddr4_trip1_cke_b => ch1_lpddr4_trip1_cke_b,
    ch1_lpddr4_trip1_dmi_a => ch1_lpddr4_trip1_dmi_a,
    ch1_lpddr4_trip1_dmi_b => ch1_lpddr4_trip1_dmi_b,
    ch1_lpddr4_trip1_reset_n => ch1_lpddr4_trip1_reset_n,
    lpddr4_clk1_clk_p => lpddr4_clk1_clk_p,
    lpddr4_clk1_clk_n => lpddr4_clk1_clk_n,
    ch0_lpddr4_trip2_dq_a => ch0_lpddr4_trip2_dq_a,
    ch0_lpddr4_trip2_dq_b => ch0_lpddr4_trip2_dq_b,
    ch0_lpddr4_trip2_dqs_t_a => ch0_lpddr4_trip2_dqs_t_a,
    ch0_lpddr4_trip2_dqs_t_b => ch0_lpddr4_trip2_dqs_t_b,
    ch0_lpddr4_trip2_dqs_c_a => ch0_lpddr4_trip2_dqs_c_a,
    ch0_lpddr4_trip2_dqs_c_b => ch0_lpddr4_trip2_dqs_c_b,
    ch0_lpddr4_trip2_ca_a => ch0_lpddr4_trip2_ca_a,
    ch0_lpddr4_trip2_ca_b => ch0_lpddr4_trip2_ca_b,
    ch0_lpddr4_trip2_cs_a => ch0_lpddr4_trip2_cs_a,
    ch0_lpddr4_trip2_cs_b => ch0_lpddr4_trip2_cs_b,
    ch0_lpddr4_trip2_ck_t_a => ch0_lpddr4_trip2_ck_t_a,
    ch0_lpddr4_trip2_ck_t_b => ch0_lpddr4_trip2_ck_t_b,
    ch0_lpddr4_trip2_ck_c_a => ch0_lpddr4_trip2_ck_c_a,
    ch0_lpddr4_trip2_ck_c_b => ch0_lpddr4_trip2_ck_c_b,
    ch0_lpddr4_trip2_cke_a => ch0_lpddr4_trip2_cke_a,
    ch0_lpddr4_trip2_cke_b => ch0_lpddr4_trip2_cke_b,
    ch0_lpddr4_trip2_dmi_a => ch0_lpddr4_trip2_dmi_a,
    ch0_lpddr4_trip2_dmi_b => ch0_lpddr4_trip2_dmi_b,
    ch0_lpddr4_trip2_reset_n => ch0_lpddr4_trip2_reset_n,
    ch1_lpddr4_trip2_dq_a => ch1_lpddr4_trip2_dq_a,
    ch1_lpddr4_trip2_dq_b => ch1_lpddr4_trip2_dq_b,
    ch1_lpddr4_trip2_dqs_t_a => ch1_lpddr4_trip2_dqs_t_a,
    ch1_lpddr4_trip2_dqs_t_b => ch1_lpddr4_trip2_dqs_t_b,
    ch1_lpddr4_trip2_dqs_c_a => ch1_lpddr4_trip2_dqs_c_a,
    ch1_lpddr4_trip2_dqs_c_b => ch1_lpddr4_trip2_dqs_c_b,
    ch1_lpddr4_trip2_ca_a => ch1_lpddr4_trip2_ca_a,
    ch1_lpddr4_trip2_ca_b => ch1_lpddr4_trip2_ca_b,
    ch1_lpddr4_trip2_cs_a => ch1_lpddr4_trip2_cs_a,
    ch1_lpddr4_trip2_cs_b => ch1_lpddr4_trip2_cs_b,
    ch1_lpddr4_trip2_ck_t_a => ch1_lpddr4_trip2_ck_t_a,
    ch1_lpddr4_trip2_ck_t_b => ch1_lpddr4_trip2_ck_t_b,
    ch1_lpddr4_trip2_ck_c_a => ch1_lpddr4_trip2_ck_c_a,
    ch1_lpddr4_trip2_ck_c_b => ch1_lpddr4_trip2_ck_c_b,
    ch1_lpddr4_trip2_cke_a => ch1_lpddr4_trip2_cke_a,
    ch1_lpddr4_trip2_cke_b => ch1_lpddr4_trip2_cke_b,
    ch1_lpddr4_trip2_dmi_a => ch1_lpddr4_trip2_dmi_a,
    ch1_lpddr4_trip2_dmi_b => ch1_lpddr4_trip2_dmi_b,
    ch1_lpddr4_trip2_reset_n => ch1_lpddr4_trip2_reset_n,
    lpddr4_clk2_clk_p => lpddr4_clk2_clk_p,
    lpddr4_clk2_clk_n => lpddr4_clk2_clk_n,
    gt_refclk0_0_clk_n => gt_refclk0_0_clk_n,
    gt_refclk0_0_clk_p => gt_refclk0_0_clk_p,
    UART_0_rxd => UART_0_rxd,
    UART_0_txd => UART_0_txd
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file full_blown.vhd when simulating
-- the module, full_blown. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
