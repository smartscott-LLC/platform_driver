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

-- MODULE VLNV: amd.com:blockdesign:xlnoc:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT xlnoc
  PORT (
    nps_2_SNPP_N_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_SNPP_N_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_2_SNPP_N_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_SNPP_N_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_2_MNPP_S_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_MNPP_S_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_2_MNPP_S_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_MNPP_S_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_2_SNPP_S_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_SNPP_S_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_2_SNPP_S_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_SNPP_S_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_2_MNPP_N_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_MNPP_N_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_2_MNPP_N_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_2_MNPP_N_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_4_SNPP_N_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_SNPP_N_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_4_SNPP_N_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_SNPP_N_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_4_MNPP_S_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_MNPP_S_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_4_MNPP_S_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_MNPP_S_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_4_SNPP_S_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_SNPP_S_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_4_SNPP_S_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_SNPP_S_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_4_MNPP_N_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_MNPP_N_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_4_MNPP_N_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_4_MNPP_N_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_3_SNPP_S_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_SNPP_S_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_3_SNPP_S_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_SNPP_S_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_3_MNPP_N_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_MNPP_N_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_3_MNPP_N_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_MNPP_N_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_3_SNPP_N_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_SNPP_N_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_3_SNPP_N_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_SNPP_N_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_3_MNPP_S_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_MNPP_S_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_3_MNPP_S_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_3_MNPP_S_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_0_SNPP_S_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_SNPP_S_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_0_SNPP_S_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_SNPP_S_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_0_MNPP_N_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_MNPP_N_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_0_MNPP_N_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_MNPP_N_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_0_SNPP_N_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_SNPP_N_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_0_SNPP_N_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_SNPP_N_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_0_MNPP_S_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_MNPP_S_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_0_MNPP_S_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_0_MNPP_S_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_5_MNPP_N_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_5_MNPP_N_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_5_MNPP_N_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_5_MNPP_N_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_5_SNPP_N_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_5_SNPP_N_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_5_SNPP_N_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_5_SNPP_N_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_1_MNPP_W_valid : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_1_MNPP_W_flit : OUT STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_1_MNPP_W_credit_return : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_1_MNPP_W_credit_rdy : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    nps_1_SNPP_W_valid : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_1_SNPP_W_flit : IN STD_LOGIC_VECTOR(181 DOWNTO 0);
    nps_1_SNPP_W_credit_return : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    nps_1_SNPP_W_credit_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : xlnoc
  PORT MAP (
    nps_2_SNPP_N_valid => nps_2_SNPP_N_valid,
    nps_2_SNPP_N_flit => nps_2_SNPP_N_flit,
    nps_2_SNPP_N_credit_return => nps_2_SNPP_N_credit_return,
    nps_2_SNPP_N_credit_rdy => nps_2_SNPP_N_credit_rdy,
    nps_2_MNPP_S_valid => nps_2_MNPP_S_valid,
    nps_2_MNPP_S_flit => nps_2_MNPP_S_flit,
    nps_2_MNPP_S_credit_return => nps_2_MNPP_S_credit_return,
    nps_2_MNPP_S_credit_rdy => nps_2_MNPP_S_credit_rdy,
    nps_2_SNPP_S_valid => nps_2_SNPP_S_valid,
    nps_2_SNPP_S_flit => nps_2_SNPP_S_flit,
    nps_2_SNPP_S_credit_return => nps_2_SNPP_S_credit_return,
    nps_2_SNPP_S_credit_rdy => nps_2_SNPP_S_credit_rdy,
    nps_2_MNPP_N_valid => nps_2_MNPP_N_valid,
    nps_2_MNPP_N_flit => nps_2_MNPP_N_flit,
    nps_2_MNPP_N_credit_return => nps_2_MNPP_N_credit_return,
    nps_2_MNPP_N_credit_rdy => nps_2_MNPP_N_credit_rdy,
    nps_4_SNPP_N_valid => nps_4_SNPP_N_valid,
    nps_4_SNPP_N_flit => nps_4_SNPP_N_flit,
    nps_4_SNPP_N_credit_return => nps_4_SNPP_N_credit_return,
    nps_4_SNPP_N_credit_rdy => nps_4_SNPP_N_credit_rdy,
    nps_4_MNPP_S_valid => nps_4_MNPP_S_valid,
    nps_4_MNPP_S_flit => nps_4_MNPP_S_flit,
    nps_4_MNPP_S_credit_return => nps_4_MNPP_S_credit_return,
    nps_4_MNPP_S_credit_rdy => nps_4_MNPP_S_credit_rdy,
    nps_4_SNPP_S_valid => nps_4_SNPP_S_valid,
    nps_4_SNPP_S_flit => nps_4_SNPP_S_flit,
    nps_4_SNPP_S_credit_return => nps_4_SNPP_S_credit_return,
    nps_4_SNPP_S_credit_rdy => nps_4_SNPP_S_credit_rdy,
    nps_4_MNPP_N_valid => nps_4_MNPP_N_valid,
    nps_4_MNPP_N_flit => nps_4_MNPP_N_flit,
    nps_4_MNPP_N_credit_return => nps_4_MNPP_N_credit_return,
    nps_4_MNPP_N_credit_rdy => nps_4_MNPP_N_credit_rdy,
    nps_3_SNPP_S_valid => nps_3_SNPP_S_valid,
    nps_3_SNPP_S_flit => nps_3_SNPP_S_flit,
    nps_3_SNPP_S_credit_return => nps_3_SNPP_S_credit_return,
    nps_3_SNPP_S_credit_rdy => nps_3_SNPP_S_credit_rdy,
    nps_3_MNPP_N_valid => nps_3_MNPP_N_valid,
    nps_3_MNPP_N_flit => nps_3_MNPP_N_flit,
    nps_3_MNPP_N_credit_return => nps_3_MNPP_N_credit_return,
    nps_3_MNPP_N_credit_rdy => nps_3_MNPP_N_credit_rdy,
    nps_3_SNPP_N_valid => nps_3_SNPP_N_valid,
    nps_3_SNPP_N_flit => nps_3_SNPP_N_flit,
    nps_3_SNPP_N_credit_return => nps_3_SNPP_N_credit_return,
    nps_3_SNPP_N_credit_rdy => nps_3_SNPP_N_credit_rdy,
    nps_3_MNPP_S_valid => nps_3_MNPP_S_valid,
    nps_3_MNPP_S_flit => nps_3_MNPP_S_flit,
    nps_3_MNPP_S_credit_return => nps_3_MNPP_S_credit_return,
    nps_3_MNPP_S_credit_rdy => nps_3_MNPP_S_credit_rdy,
    nps_0_SNPP_S_valid => nps_0_SNPP_S_valid,
    nps_0_SNPP_S_flit => nps_0_SNPP_S_flit,
    nps_0_SNPP_S_credit_return => nps_0_SNPP_S_credit_return,
    nps_0_SNPP_S_credit_rdy => nps_0_SNPP_S_credit_rdy,
    nps_0_MNPP_N_valid => nps_0_MNPP_N_valid,
    nps_0_MNPP_N_flit => nps_0_MNPP_N_flit,
    nps_0_MNPP_N_credit_return => nps_0_MNPP_N_credit_return,
    nps_0_MNPP_N_credit_rdy => nps_0_MNPP_N_credit_rdy,
    nps_0_SNPP_N_valid => nps_0_SNPP_N_valid,
    nps_0_SNPP_N_flit => nps_0_SNPP_N_flit,
    nps_0_SNPP_N_credit_return => nps_0_SNPP_N_credit_return,
    nps_0_SNPP_N_credit_rdy => nps_0_SNPP_N_credit_rdy,
    nps_0_MNPP_S_valid => nps_0_MNPP_S_valid,
    nps_0_MNPP_S_flit => nps_0_MNPP_S_flit,
    nps_0_MNPP_S_credit_return => nps_0_MNPP_S_credit_return,
    nps_0_MNPP_S_credit_rdy => nps_0_MNPP_S_credit_rdy,
    nps_5_MNPP_N_valid => nps_5_MNPP_N_valid,
    nps_5_MNPP_N_flit => nps_5_MNPP_N_flit,
    nps_5_MNPP_N_credit_return => nps_5_MNPP_N_credit_return,
    nps_5_MNPP_N_credit_rdy => nps_5_MNPP_N_credit_rdy,
    nps_5_SNPP_N_valid => nps_5_SNPP_N_valid,
    nps_5_SNPP_N_flit => nps_5_SNPP_N_flit,
    nps_5_SNPP_N_credit_return => nps_5_SNPP_N_credit_return,
    nps_5_SNPP_N_credit_rdy => nps_5_SNPP_N_credit_rdy,
    nps_1_MNPP_W_valid => nps_1_MNPP_W_valid,
    nps_1_MNPP_W_flit => nps_1_MNPP_W_flit,
    nps_1_MNPP_W_credit_return => nps_1_MNPP_W_credit_return,
    nps_1_MNPP_W_credit_rdy => nps_1_MNPP_W_credit_rdy,
    nps_1_SNPP_W_valid => nps_1_SNPP_W_valid,
    nps_1_SNPP_W_flit => nps_1_SNPP_W_flit,
    nps_1_SNPP_W_credit_return => nps_1_SNPP_W_credit_return,
    nps_1_SNPP_W_credit_rdy => nps_1_SNPP_W_credit_rdy
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file xlnoc.vhd when simulating
-- the module, xlnoc. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
