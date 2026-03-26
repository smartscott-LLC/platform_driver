//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Thu Mar 26 01:20:54 2026
//Host        : smarTech running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target full_blown.bd
//Design      : full_blown
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "full_blown,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=full_blown,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=23,numReposBlks=22,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=4,da_axi4_s2mm_cnt=2,da_axi_noc_cnt=1,da_board_cnt=3,da_bram_cntlr_cnt=1,da_cips_cnt=1,da_clkrst_cnt=2,da_mb_cnt=2,synth_mode=None}" *) (* HW_HANDOFF = "full_blown.hwdef" *) 
module full_blown
   (S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    UART_0_rxd,
    UART_0_txd,
    aclk0_0,
    ch0_lpddr4_trip1_ca_a,
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
    ch0_lpddr4_trip2_ca_a,
    ch0_lpddr4_trip2_ca_b,
    ch0_lpddr4_trip2_ck_c_a,
    ch0_lpddr4_trip2_ck_c_b,
    ch0_lpddr4_trip2_ck_t_a,
    ch0_lpddr4_trip2_ck_t_b,
    ch0_lpddr4_trip2_cke_a,
    ch0_lpddr4_trip2_cke_b,
    ch0_lpddr4_trip2_cs_a,
    ch0_lpddr4_trip2_cs_b,
    ch0_lpddr4_trip2_dmi_a,
    ch0_lpddr4_trip2_dmi_b,
    ch0_lpddr4_trip2_dq_a,
    ch0_lpddr4_trip2_dq_b,
    ch0_lpddr4_trip2_dqs_c_a,
    ch0_lpddr4_trip2_dqs_c_b,
    ch0_lpddr4_trip2_dqs_t_a,
    ch0_lpddr4_trip2_dqs_t_b,
    ch0_lpddr4_trip2_reset_n,
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
    ch1_lpddr4_trip2_ca_a,
    ch1_lpddr4_trip2_ca_b,
    ch1_lpddr4_trip2_ck_c_a,
    ch1_lpddr4_trip2_ck_c_b,
    ch1_lpddr4_trip2_ck_t_a,
    ch1_lpddr4_trip2_ck_t_b,
    ch1_lpddr4_trip2_cke_a,
    ch1_lpddr4_trip2_cke_b,
    ch1_lpddr4_trip2_cs_a,
    ch1_lpddr4_trip2_cs_b,
    ch1_lpddr4_trip2_dmi_a,
    ch1_lpddr4_trip2_dmi_b,
    ch1_lpddr4_trip2_dq_a,
    ch1_lpddr4_trip2_dq_b,
    ch1_lpddr4_trip2_dqs_c_a,
    ch1_lpddr4_trip2_dqs_c_b,
    ch1_lpddr4_trip2_dqs_t_a,
    ch1_lpddr4_trip2_dqs_t_b,
    ch1_lpddr4_trip2_reset_n,
    clk_100MHz,
    gt_refclk0_0_clk_n,
    gt_refclk0_0_clk_p,
    lpddr4_clk1_clk_n,
    lpddr4_clk1_clk_p,
    lpddr4_clk2_clk_n,
    lpddr4_clk2_clk_p,
    reset_rtl);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN full_blown_aclk0_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *) input [1:0]S00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *) input [3:0]S00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *) input [7:0]S00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *) input [0:0]S00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *) input [3:0]S00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output [0:0]S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREGION" *) input [3:0]S00_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *) input [2:0]S00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input [0:0]S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [63:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *) input [1:0]S00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *) input [3:0]S00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *) input [7:0]S00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *) input [0:0]S00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *) input [3:0]S00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output [0:0]S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREGION" *) input [3:0]S00_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *) input [2:0]S00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input [0:0]S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input [0:0]S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output [0:0]S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *) output [0:0]S00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input [0:0]S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output [0:0]S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *) input [0:0]S00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output [0:0]S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input [0:0]S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART_0 RxD" *) (* X_INTERFACE_MODE = "Master" *) input UART_0_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART_0 TxD" *) output UART_0_txd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK0_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK0_0, ASSOCIATED_BUSIF S00_AXI, CLK_DOMAIN full_blown_aclk0_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input aclk0_0;
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CA_A" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch0_lpddr4_trip2, CAN_DEBUG false" *) output [5:0]ch0_lpddr4_trip2_ca_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CA_B" *) output [5:0]ch0_lpddr4_trip2_ca_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CK_C_A" *) output ch0_lpddr4_trip2_ck_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CK_C_B" *) output ch0_lpddr4_trip2_ck_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CK_T_A" *) output ch0_lpddr4_trip2_ck_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CK_T_B" *) output ch0_lpddr4_trip2_ck_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CKE_A" *) output ch0_lpddr4_trip2_cke_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CKE_B" *) output ch0_lpddr4_trip2_cke_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CS_A" *) output ch0_lpddr4_trip2_cs_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 CS_B" *) output ch0_lpddr4_trip2_cs_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DMI_A" *) inout [1:0]ch0_lpddr4_trip2_dmi_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DMI_B" *) inout [1:0]ch0_lpddr4_trip2_dmi_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQ_A" *) inout [15:0]ch0_lpddr4_trip2_dq_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQ_B" *) inout [15:0]ch0_lpddr4_trip2_dq_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQS_C_A" *) inout [1:0]ch0_lpddr4_trip2_dqs_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQS_C_B" *) inout [1:0]ch0_lpddr4_trip2_dqs_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQS_T_A" *) inout [1:0]ch0_lpddr4_trip2_dqs_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 DQS_T_B" *) inout [1:0]ch0_lpddr4_trip2_dqs_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch0_lpddr4_trip2 RESET_N" *) output ch0_lpddr4_trip2_reset_n;
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CA_A" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch1_lpddr4_trip2, CAN_DEBUG false" *) output [5:0]ch1_lpddr4_trip2_ca_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CA_B" *) output [5:0]ch1_lpddr4_trip2_ca_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CK_C_A" *) output ch1_lpddr4_trip2_ck_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CK_C_B" *) output ch1_lpddr4_trip2_ck_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CK_T_A" *) output ch1_lpddr4_trip2_ck_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CK_T_B" *) output ch1_lpddr4_trip2_ck_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CKE_A" *) output ch1_lpddr4_trip2_cke_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CKE_B" *) output ch1_lpddr4_trip2_cke_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CS_A" *) output ch1_lpddr4_trip2_cs_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 CS_B" *) output ch1_lpddr4_trip2_cs_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DMI_A" *) inout [1:0]ch1_lpddr4_trip2_dmi_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DMI_B" *) inout [1:0]ch1_lpddr4_trip2_dmi_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQ_A" *) inout [15:0]ch1_lpddr4_trip2_dq_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQ_B" *) inout [15:0]ch1_lpddr4_trip2_dq_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQS_C_A" *) inout [1:0]ch1_lpddr4_trip2_dqs_c_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQS_C_B" *) inout [1:0]ch1_lpddr4_trip2_dqs_c_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQS_T_A" *) inout [1:0]ch1_lpddr4_trip2_dqs_t_a;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 DQS_T_B" *) inout [1:0]ch1_lpddr4_trip2_dqs_t_b;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lpddr4:1.0 ch1_lpddr4_trip2 RESET_N" *) output ch1_lpddr4_trip2_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN full_blown_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0_0 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk0_0, CAN_DEBUG false, FREQ_HZ 100000000" *) input gt_refclk0_0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0_0 CLK_P" *) input gt_refclk0_0_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk1 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lpddr4_clk1, CAN_DEBUG false, FREQ_HZ 200000000" *) input lpddr4_clk1_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk1 CLK_P" *) input lpddr4_clk1_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk2 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lpddr4_clk2, CAN_DEBUG false, FREQ_HZ 200000000" *) input lpddr4_clk2_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 lpddr4_clk2 CLK_P" *) input lpddr4_clk2_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;

  wire [63:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]S00_AXI_arready;
  wire [3:0]S00_AXI_arregion;
  wire [2:0]S00_AXI_arsize;
  wire [0:0]S00_AXI_arvalid;
  wire [63:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire [0:0]S00_AXI_awready;
  wire [3:0]S00_AXI_awregion;
  wire [2:0]S00_AXI_awsize;
  wire [0:0]S00_AXI_awvalid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [0:0]S00_AXI_rlast;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wlast;
  wire [0:0]S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire [0:0]SYS_Rst_1;
  wire UART_0_rxd;
  wire UART_0_txd;
  wire aclk0_0;
  wire axi_dma_0_mm2s_introut;
  wire axi_dma_0_s2mm_introut;
  wire [31:0]axi_fifo_mm_s_AXI_STR_TXD_TDATA;
  wire axi_fifo_mm_s_AXI_STR_TXD_TLAST;
  wire axi_fifo_mm_s_AXI_STR_TXD_TREADY;
  wire axi_fifo_mm_s_AXI_STR_TXD_TVALID;
  wire axi_fifo_mm_s_interrupt;
  wire axi_fifo_mm_s_s2mm_prmry_reset_out_n;
  wire [63:0]axi_noc_0_M00_AXI_ARADDR;
  wire [1:0]axi_noc_0_M00_AXI_ARBURST;
  wire [3:0]axi_noc_0_M00_AXI_ARCACHE;
  wire [1:0]axi_noc_0_M00_AXI_ARID;
  wire [7:0]axi_noc_0_M00_AXI_ARLEN;
  wire [0:0]axi_noc_0_M00_AXI_ARLOCK;
  wire [2:0]axi_noc_0_M00_AXI_ARPROT;
  wire [3:0]axi_noc_0_M00_AXI_ARQOS;
  wire axi_noc_0_M00_AXI_ARREADY;
  wire [2:0]axi_noc_0_M00_AXI_ARSIZE;
  wire [17:0]axi_noc_0_M00_AXI_ARUSER;
  wire [0:0]axi_noc_0_M00_AXI_ARVALID;
  wire [63:0]axi_noc_0_M00_AXI_AWADDR;
  wire [1:0]axi_noc_0_M00_AXI_AWBURST;
  wire [3:0]axi_noc_0_M00_AXI_AWCACHE;
  wire [1:0]axi_noc_0_M00_AXI_AWID;
  wire [7:0]axi_noc_0_M00_AXI_AWLEN;
  wire [0:0]axi_noc_0_M00_AXI_AWLOCK;
  wire [2:0]axi_noc_0_M00_AXI_AWPROT;
  wire [3:0]axi_noc_0_M00_AXI_AWQOS;
  wire axi_noc_0_M00_AXI_AWREADY;
  wire [2:0]axi_noc_0_M00_AXI_AWSIZE;
  wire [17:0]axi_noc_0_M00_AXI_AWUSER;
  wire [0:0]axi_noc_0_M00_AXI_AWVALID;
  wire [1:0]axi_noc_0_M00_AXI_BID;
  wire [0:0]axi_noc_0_M00_AXI_BREADY;
  wire [1:0]axi_noc_0_M00_AXI_BRESP;
  wire axi_noc_0_M00_AXI_BVALID;
  wire [31:0]axi_noc_0_M00_AXI_RDATA;
  wire [1:0]axi_noc_0_M00_AXI_RID;
  wire axi_noc_0_M00_AXI_RLAST;
  wire [0:0]axi_noc_0_M00_AXI_RREADY;
  wire [1:0]axi_noc_0_M00_AXI_RRESP;
  wire axi_noc_0_M00_AXI_RVALID;
  wire [31:0]axi_noc_0_M00_AXI_WDATA;
  wire [0:0]axi_noc_0_M00_AXI_WLAST;
  wire axi_noc_0_M00_AXI_WREADY;
  wire [3:0]axi_noc_0_M00_AXI_WSTRB;
  wire [0:0]axi_noc_0_M00_AXI_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]axi_noc_0_M01_AXI_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_ARCACHE;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_ARID;
  (* HARD_CONN = "true" *) wire [7:0]axi_noc_0_M01_AXI_ARLEN;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_ARQOS;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]axi_noc_0_M01_AXI_ARUSER;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]axi_noc_0_M01_AXI_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_AWCACHE;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_AWID;
  (* HARD_CONN = "true" *) wire [7:0]axi_noc_0_M01_AXI_AWLEN;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_AWQOS;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]axi_noc_0_M01_AXI_AWUSER;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_AWVALID;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_BID;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_BRESP;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]axi_noc_0_M01_AXI_RDATA;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_RID;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_RLAST;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]axi_noc_0_M01_AXI_RUSER;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]axi_noc_0_M01_AXI_WDATA;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_WLAST;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]axi_noc_0_M01_AXI_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]axi_noc_0_M01_AXI_WUSER;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_WVALID;
  wire [15:0]axi_smc_M00_AXI_ARADDR;
  wire axi_smc_M00_AXI_ARREADY;
  wire axi_smc_M00_AXI_ARVALID;
  wire [15:0]axi_smc_M00_AXI_AWADDR;
  wire axi_smc_M00_AXI_AWREADY;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [31:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [31:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WREADY;
  wire [3:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire [31:0]axi_smc_M01_AXI_ARADDR;
  wire axi_smc_M01_AXI_ARREADY;
  wire axi_smc_M01_AXI_ARVALID;
  wire [31:0]axi_smc_M01_AXI_AWADDR;
  wire axi_smc_M01_AXI_AWREADY;
  wire axi_smc_M01_AXI_AWVALID;
  wire axi_smc_M01_AXI_BREADY;
  wire [1:0]axi_smc_M01_AXI_BRESP;
  wire axi_smc_M01_AXI_BVALID;
  wire [31:0]axi_smc_M01_AXI_RDATA;
  wire axi_smc_M01_AXI_RREADY;
  wire [1:0]axi_smc_M01_AXI_RRESP;
  wire axi_smc_M01_AXI_RVALID;
  wire [31:0]axi_smc_M01_AXI_WDATA;
  wire axi_smc_M01_AXI_WREADY;
  wire [3:0]axi_smc_M01_AXI_WSTRB;
  wire axi_smc_M01_AXI_WVALID;
  wire [8:0]axi_smc_M02_AXI_ARADDR;
  wire axi_smc_M02_AXI_ARREADY;
  wire axi_smc_M02_AXI_ARVALID;
  wire [8:0]axi_smc_M02_AXI_AWADDR;
  wire axi_smc_M02_AXI_AWREADY;
  wire axi_smc_M02_AXI_AWVALID;
  wire axi_smc_M02_AXI_BREADY;
  wire [1:0]axi_smc_M02_AXI_BRESP;
  wire axi_smc_M02_AXI_BVALID;
  wire [31:0]axi_smc_M02_AXI_RDATA;
  wire axi_smc_M02_AXI_RREADY;
  wire [1:0]axi_smc_M02_AXI_RRESP;
  wire axi_smc_M02_AXI_RVALID;
  wire [31:0]axi_smc_M02_AXI_WDATA;
  wire axi_smc_M02_AXI_WREADY;
  wire [3:0]axi_smc_M02_AXI_WSTRB;
  wire axi_smc_M02_AXI_WVALID;
  wire [3:0]axi_smc_M03_AXI_ARADDR;
  wire axi_smc_M03_AXI_ARREADY;
  wire axi_smc_M03_AXI_ARVALID;
  wire [3:0]axi_smc_M03_AXI_AWADDR;
  wire axi_smc_M03_AXI_AWREADY;
  wire axi_smc_M03_AXI_AWVALID;
  wire axi_smc_M03_AXI_BREADY;
  wire [1:0]axi_smc_M03_AXI_BRESP;
  wire axi_smc_M03_AXI_BVALID;
  wire [31:0]axi_smc_M03_AXI_RDATA;
  wire axi_smc_M03_AXI_RREADY;
  wire [1:0]axi_smc_M03_AXI_RRESP;
  wire axi_smc_M03_AXI_RVALID;
  wire [31:0]axi_smc_M03_AXI_WDATA;
  wire axi_smc_M03_AXI_WREADY;
  wire [3:0]axi_smc_M03_AXI_WSTRB;
  wire axi_smc_M03_AXI_WVALID;
  wire [9:0]axi_smc_M04_AXI_ARADDR;
  wire axi_smc_M04_AXI_ARREADY;
  wire axi_smc_M04_AXI_ARVALID;
  wire [9:0]axi_smc_M04_AXI_AWADDR;
  wire axi_smc_M04_AXI_AWREADY;
  wire axi_smc_M04_AXI_AWVALID;
  wire axi_smc_M04_AXI_BREADY;
  wire [1:0]axi_smc_M04_AXI_BRESP;
  wire axi_smc_M04_AXI_BVALID;
  wire [31:0]axi_smc_M04_AXI_RDATA;
  wire axi_smc_M04_AXI_RREADY;
  wire [1:0]axi_smc_M04_AXI_RRESP;
  wire axi_smc_M04_AXI_RVALID;
  wire [31:0]axi_smc_M04_AXI_WDATA;
  wire axi_smc_M04_AXI_WREADY;
  wire axi_smc_M04_AXI_WVALID;
  wire [63:0]axis_subset_converter_M_AXIS_TDATA;
  wire axis_subset_converter_M_AXIS_TLAST;
  wire axis_subset_converter_M_AXIS_TREADY;
  wire axis_subset_converter_M_AXIS_TVALID;
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
  wire [5:0]ch0_lpddr4_trip2_ca_a;
  wire [5:0]ch0_lpddr4_trip2_ca_b;
  wire [0:0]\^ch0_lpddr4_trip2_ck_c_a ;
  wire [0:0]\^ch0_lpddr4_trip2_ck_c_b ;
  wire [0:0]\^ch0_lpddr4_trip2_ck_t_a ;
  wire [0:0]\^ch0_lpddr4_trip2_ck_t_b ;
  wire [0:0]\^ch0_lpddr4_trip2_cke_a ;
  wire [0:0]\^ch0_lpddr4_trip2_cke_b ;
  wire [0:0]\^ch0_lpddr4_trip2_cs_a ;
  wire [0:0]\^ch0_lpddr4_trip2_cs_b ;
  wire [1:0]ch0_lpddr4_trip2_dmi_a;
  wire [1:0]ch0_lpddr4_trip2_dmi_b;
  wire [15:0]ch0_lpddr4_trip2_dq_a;
  wire [15:0]ch0_lpddr4_trip2_dq_b;
  wire [1:0]ch0_lpddr4_trip2_dqs_c_a;
  wire [1:0]ch0_lpddr4_trip2_dqs_c_b;
  wire [1:0]ch0_lpddr4_trip2_dqs_t_a;
  wire [1:0]ch0_lpddr4_trip2_dqs_t_b;
  wire [0:0]\^ch0_lpddr4_trip2_reset_n ;
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
  wire [5:0]ch1_lpddr4_trip2_ca_a;
  wire [5:0]ch1_lpddr4_trip2_ca_b;
  wire [0:0]\^ch1_lpddr4_trip2_ck_c_a ;
  wire [0:0]\^ch1_lpddr4_trip2_ck_c_b ;
  wire [0:0]\^ch1_lpddr4_trip2_ck_t_a ;
  wire [0:0]\^ch1_lpddr4_trip2_ck_t_b ;
  wire [0:0]\^ch1_lpddr4_trip2_cke_a ;
  wire [0:0]\^ch1_lpddr4_trip2_cke_b ;
  wire [0:0]\^ch1_lpddr4_trip2_cs_a ;
  wire [0:0]\^ch1_lpddr4_trip2_cs_b ;
  wire [1:0]ch1_lpddr4_trip2_dmi_a;
  wire [1:0]ch1_lpddr4_trip2_dmi_b;
  wire [15:0]ch1_lpddr4_trip2_dq_a;
  wire [15:0]ch1_lpddr4_trip2_dq_b;
  wire [1:0]ch1_lpddr4_trip2_dqs_c_a;
  wire [1:0]ch1_lpddr4_trip2_dqs_c_b;
  wire [1:0]ch1_lpddr4_trip2_dqs_t_a;
  wire [1:0]ch1_lpddr4_trip2_dqs_t_b;
  wire [0:0]\^ch1_lpddr4_trip2_reset_n ;
  wire clk_100MHz;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire gt_refclk0_0_clk_n;
  wire gt_refclk0_0_clk_p;
  wire lpddr4_clk1_clk_n;
  wire lpddr4_clk1_clk_p;
  wire lpddr4_clk2_clk_n;
  wire lpddr4_clk2_clk_p;
  wire mdm_1_Debug_SYS_Rst;
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
  wire [31:0]microblaze_0_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_0_M_AXI_DP_ARPROT;
  wire microblaze_0_M_AXI_DP_ARREADY;
  wire microblaze_0_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_0_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_0_M_AXI_DP_AWPROT;
  wire microblaze_0_M_AXI_DP_AWREADY;
  wire microblaze_0_M_AXI_DP_AWVALID;
  wire microblaze_0_M_AXI_DP_BREADY;
  wire [1:0]microblaze_0_M_AXI_DP_BRESP;
  wire microblaze_0_M_AXI_DP_BVALID;
  wire [31:0]microblaze_0_M_AXI_DP_RDATA;
  wire microblaze_0_M_AXI_DP_RREADY;
  wire [1:0]microblaze_0_M_AXI_DP_RRESP;
  wire microblaze_0_M_AXI_DP_RVALID;
  wire [31:0]microblaze_0_M_AXI_DP_WDATA;
  wire microblaze_0_M_AXI_DP_WREADY;
  wire [3:0]microblaze_0_M_AXI_DP_WSTRB;
  wire microblaze_0_M_AXI_DP_WVALID;
  wire [31:0]microblaze_0_M_AXI_IP_ARADDR;
  wire [2:0]microblaze_0_M_AXI_IP_ARPROT;
  wire microblaze_0_M_AXI_IP_ARREADY;
  wire microblaze_0_M_AXI_IP_ARVALID;
  wire [31:0]microblaze_0_M_AXI_IP_RDATA;
  wire microblaze_0_M_AXI_IP_RREADY;
  wire [1:0]microblaze_0_M_AXI_IP_RRESP;
  wire microblaze_0_M_AXI_IP_RVALID;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire [0:1]microblaze_0_interrupt_ACK;
  wire [31:0]microblaze_0_interrupt_ADDRESS;
  wire microblaze_0_interrupt_INTERRUPT;
  wire [1:0]microblaze_0_intr;
  wire noc_clk_gen_SYS_CLK0_CLK_N;
  wire noc_clk_gen_SYS_CLK0_CLK_P;
  wire noc_clk_gen_SYS_CLK1_CLK_N;
  wire noc_clk_gen_SYS_CLK1_CLK_P;
  wire noc_clk_gen_axi_rst_0_n;
  wire reset_rtl;
  wire [0:0]rst_clk_wiz_100M_1_peripheral_aresetn;
  wire rst_clk_wiz_100M_mb_reset;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire tb3d_engine_top_0_intr_req;
  wire [63:0]tb3d_engine_top_0_m_axi_ARADDR;
  wire [1:0]tb3d_engine_top_0_m_axi_ARBURST;
  wire [3:0]tb3d_engine_top_0_m_axi_ARID;
  wire [7:0]tb3d_engine_top_0_m_axi_ARLEN;
  wire [0:0]tb3d_engine_top_0_m_axi_ARREADY;
  wire [2:0]tb3d_engine_top_0_m_axi_ARSIZE;
  wire tb3d_engine_top_0_m_axi_ARVALID;
  wire [63:0]tb3d_engine_top_0_m_axi_AWADDR;
  wire [1:0]tb3d_engine_top_0_m_axi_AWBURST;
  wire [3:0]tb3d_engine_top_0_m_axi_AWID;
  wire [7:0]tb3d_engine_top_0_m_axi_AWLEN;
  wire [0:0]tb3d_engine_top_0_m_axi_AWREADY;
  wire [2:0]tb3d_engine_top_0_m_axi_AWSIZE;
  wire tb3d_engine_top_0_m_axi_AWVALID;
  wire [3:0]tb3d_engine_top_0_m_axi_BID;
  wire tb3d_engine_top_0_m_axi_BREADY;
  wire [1:0]tb3d_engine_top_0_m_axi_BRESP;
  wire [0:0]tb3d_engine_top_0_m_axi_BVALID;
  wire [63:0]tb3d_engine_top_0_m_axi_RDATA;
  wire [3:0]tb3d_engine_top_0_m_axi_RID;
  wire [0:0]tb3d_engine_top_0_m_axi_RLAST;
  wire tb3d_engine_top_0_m_axi_RREADY;
  wire [1:0]tb3d_engine_top_0_m_axi_RRESP;
  wire [0:0]tb3d_engine_top_0_m_axi_RVALID;
  wire [63:0]tb3d_engine_top_0_m_axi_WDATA;
  wire tb3d_engine_top_0_m_axi_WLAST;
  wire [0:0]tb3d_engine_top_0_m_axi_WREADY;
  wire [7:0]tb3d_engine_top_0_m_axi_WSTRB;
  wire tb3d_engine_top_0_m_axi_WVALID;
  wire [511:0]tb3d_engine_top_0_vec_nibble_pairs_o;
  wire [511:0]tb3d_engine_top_0_vec_tb3d_bytes_o;
  wire [15:0]tb3d_pcie_bridge_0_m_csr_ARADDR;
  wire tb3d_pcie_bridge_0_m_csr_ARREADY;
  wire tb3d_pcie_bridge_0_m_csr_ARVALID;
  wire [15:0]tb3d_pcie_bridge_0_m_csr_AWADDR;
  wire tb3d_pcie_bridge_0_m_csr_AWREADY;
  wire tb3d_pcie_bridge_0_m_csr_AWVALID;
  wire tb3d_pcie_bridge_0_m_csr_BREADY;
  wire [1:0]tb3d_pcie_bridge_0_m_csr_BRESP;
  wire tb3d_pcie_bridge_0_m_csr_BVALID;
  wire [31:0]tb3d_pcie_bridge_0_m_csr_RDATA;
  wire tb3d_pcie_bridge_0_m_csr_RREADY;
  wire [1:0]tb3d_pcie_bridge_0_m_csr_RRESP;
  wire tb3d_pcie_bridge_0_m_csr_RVALID;
  wire [31:0]tb3d_pcie_bridge_0_m_csr_WDATA;
  wire tb3d_pcie_bridge_0_m_csr_WREADY;
  wire [3:0]tb3d_pcie_bridge_0_m_csr_WSTRB;
  wire tb3d_pcie_bridge_0_m_csr_WVALID;
  wire [63:0]tb3d_pcie_bridge_0_m_dma_ARADDR;
  wire [1:0]tb3d_pcie_bridge_0_m_dma_ARBURST;
  wire [7:0]tb3d_pcie_bridge_0_m_dma_ARLEN;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_ARREADY;
  wire [2:0]tb3d_pcie_bridge_0_m_dma_ARSIZE;
  wire tb3d_pcie_bridge_0_m_dma_ARVALID;
  wire [63:0]tb3d_pcie_bridge_0_m_dma_AWADDR;
  wire [1:0]tb3d_pcie_bridge_0_m_dma_AWBURST;
  wire [7:0]tb3d_pcie_bridge_0_m_dma_AWLEN;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_AWREADY;
  wire [2:0]tb3d_pcie_bridge_0_m_dma_AWSIZE;
  wire tb3d_pcie_bridge_0_m_dma_AWVALID;
  wire tb3d_pcie_bridge_0_m_dma_BREADY;
  wire [1:0]tb3d_pcie_bridge_0_m_dma_BRESP;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_BVALID;
  wire [63:0]tb3d_pcie_bridge_0_m_dma_RDATA;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_RLAST;
  wire tb3d_pcie_bridge_0_m_dma_RREADY;
  wire [1:0]tb3d_pcie_bridge_0_m_dma_RRESP;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_RVALID;
  wire [63:0]tb3d_pcie_bridge_0_m_dma_WDATA;
  wire tb3d_pcie_bridge_0_m_dma_WLAST;
  wire [0:0]tb3d_pcie_bridge_0_m_dma_WREADY;
  wire [7:0]tb3d_pcie_bridge_0_m_dma_WSTRB;
  wire tb3d_pcie_bridge_0_m_dma_WVALID;
  wire [63:0]tb3d_pcie_bridge_0_s_axis_tx_TDATA;
  wire [7:0]tb3d_pcie_bridge_0_s_axis_tx_TKEEP;
  wire tb3d_pcie_bridge_0_s_axis_tx_TLAST;
  wire tb3d_pcie_bridge_0_s_axis_tx_TREADY;
  wire tb3d_pcie_bridge_0_s_axis_tx_TVALID;
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
  wire [31:0]versal_cips_0_dma0_st_rx_msg_TDATA;
  wire versal_cips_0_dma0_st_rx_msg_TLAST;
  wire versal_cips_0_dma0_st_rx_msg_TREADY;
  wire versal_cips_0_dma0_st_rx_msg_TVALID;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi1_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi2_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi3_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_lpd_axi_noc_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_noc_pmc_axi_axi0_clk;
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
  assign ch0_lpddr4_trip2_ck_c_a = \^ch0_lpddr4_trip2_ck_c_a [0];
  assign ch0_lpddr4_trip2_ck_c_b = \^ch0_lpddr4_trip2_ck_c_b [0];
  assign ch0_lpddr4_trip2_ck_t_a = \^ch0_lpddr4_trip2_ck_t_a [0];
  assign ch0_lpddr4_trip2_ck_t_b = \^ch0_lpddr4_trip2_ck_t_b [0];
  assign ch0_lpddr4_trip2_cke_a = \^ch0_lpddr4_trip2_cke_a [0];
  assign ch0_lpddr4_trip2_cke_b = \^ch0_lpddr4_trip2_cke_b [0];
  assign ch0_lpddr4_trip2_cs_a = \^ch0_lpddr4_trip2_cs_a [0];
  assign ch0_lpddr4_trip2_cs_b = \^ch0_lpddr4_trip2_cs_b [0];
  assign ch0_lpddr4_trip2_reset_n = \^ch0_lpddr4_trip2_reset_n [0];
  assign ch1_lpddr4_trip1_ck_c_a = \^ch1_lpddr4_trip1_ck_c_a [0];
  assign ch1_lpddr4_trip1_ck_c_b = \^ch1_lpddr4_trip1_ck_c_b [0];
  assign ch1_lpddr4_trip1_ck_t_a = \^ch1_lpddr4_trip1_ck_t_a [0];
  assign ch1_lpddr4_trip1_ck_t_b = \^ch1_lpddr4_trip1_ck_t_b [0];
  assign ch1_lpddr4_trip1_cke_a = \^ch1_lpddr4_trip1_cke_a [0];
  assign ch1_lpddr4_trip1_cke_b = \^ch1_lpddr4_trip1_cke_b [0];
  assign ch1_lpddr4_trip1_cs_a = \^ch1_lpddr4_trip1_cs_a [0];
  assign ch1_lpddr4_trip1_cs_b = \^ch1_lpddr4_trip1_cs_b [0];
  assign ch1_lpddr4_trip1_reset_n = \^ch1_lpddr4_trip1_reset_n [0];
  assign ch1_lpddr4_trip2_ck_c_a = \^ch1_lpddr4_trip2_ck_c_a [0];
  assign ch1_lpddr4_trip2_ck_c_b = \^ch1_lpddr4_trip2_ck_c_b [0];
  assign ch1_lpddr4_trip2_ck_t_a = \^ch1_lpddr4_trip2_ck_t_a [0];
  assign ch1_lpddr4_trip2_ck_t_b = \^ch1_lpddr4_trip2_ck_t_b [0];
  assign ch1_lpddr4_trip2_cke_a = \^ch1_lpddr4_trip2_cke_a [0];
  assign ch1_lpddr4_trip2_cke_b = \^ch1_lpddr4_trip2_cke_b [0];
  assign ch1_lpddr4_trip2_cs_a = \^ch1_lpddr4_trip2_cs_a [0];
  assign ch1_lpddr4_trip2_cs_b = \^ch1_lpddr4_trip2_cs_b [0];
  assign ch1_lpddr4_trip2_reset_n = \^ch1_lpddr4_trip2_reset_n [0];
  full_blown_axi_dma_0_0 axi_dma_0
       (.axi_resetn(noc_clk_gen_axi_rst_0_n),
        .m_axi_mm2s_aclk(microblaze_0_Clk),
        .m_axi_mm2s_arready(1'b0),
        .m_axi_mm2s_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_mm2s_rlast(1'b0),
        .m_axi_mm2s_rresp({1'b0,1'b0}),
        .m_axi_mm2s_rvalid(1'b0),
        .m_axi_s2mm_aclk(microblaze_0_Clk),
        .m_axi_s2mm_awready(1'b0),
        .m_axi_s2mm_bresp({1'b0,1'b0}),
        .m_axi_s2mm_bvalid(1'b0),
        .m_axi_s2mm_wready(1'b0),
        .m_axi_sg_aclk(microblaze_0_Clk),
        .m_axi_sg_arready(1'b0),
        .m_axi_sg_awready(1'b0),
        .m_axi_sg_bresp({1'b0,1'b0}),
        .m_axi_sg_bvalid(1'b0),
        .m_axi_sg_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_sg_rlast(1'b0),
        .m_axi_sg_rresp({1'b0,1'b0}),
        .m_axi_sg_rvalid(1'b0),
        .m_axi_sg_wready(1'b0),
        .m_axis_mm2s_cntrl_tready(1'b1),
        .m_axis_mm2s_tready(1'b1),
        .mm2s_introut(axi_dma_0_mm2s_introut),
        .s2mm_introut(axi_dma_0_s2mm_introut),
        .s_axi_lite_aclk(microblaze_0_Clk),
        .s_axi_lite_araddr(axi_smc_M04_AXI_ARADDR),
        .s_axi_lite_arready(axi_smc_M04_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_smc_M04_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_smc_M04_AXI_AWADDR),
        .s_axi_lite_awready(axi_smc_M04_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_smc_M04_AXI_AWVALID),
        .s_axi_lite_bready(axi_smc_M04_AXI_BREADY),
        .s_axi_lite_bresp(axi_smc_M04_AXI_BRESP),
        .s_axi_lite_bvalid(axi_smc_M04_AXI_BVALID),
        .s_axi_lite_rdata(axi_smc_M04_AXI_RDATA),
        .s_axi_lite_rready(axi_smc_M04_AXI_RREADY),
        .s_axi_lite_rresp(axi_smc_M04_AXI_RRESP),
        .s_axi_lite_rvalid(axi_smc_M04_AXI_RVALID),
        .s_axi_lite_wdata(axi_smc_M04_AXI_WDATA),
        .s_axi_lite_wready(axi_smc_M04_AXI_WREADY),
        .s_axi_lite_wvalid(axi_smc_M04_AXI_WVALID),
        .s_axis_s2mm_sts_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_s2mm_sts_tkeep({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_sts_tlast(1'b0),
        .s_axis_s2mm_sts_tvalid(1'b0),
        .s_axis_s2mm_tdata(tb3d_pcie_bridge_0_s_axis_tx_TDATA),
        .s_axis_s2mm_tkeep(tb3d_pcie_bridge_0_s_axis_tx_TKEEP),
        .s_axis_s2mm_tlast(tb3d_pcie_bridge_0_s_axis_tx_TLAST),
        .s_axis_s2mm_tready(tb3d_pcie_bridge_0_s_axis_tx_TREADY),
        .s_axis_s2mm_tvalid(tb3d_pcie_bridge_0_s_axis_tx_TVALID));
  full_blown_axi_fifo_mm_s_0 axi_fifo_mm_s
       (.axi_str_rxd_tdata(versal_cips_0_dma0_st_rx_msg_TDATA),
        .axi_str_rxd_tlast(versal_cips_0_dma0_st_rx_msg_TLAST),
        .axi_str_rxd_tready(versal_cips_0_dma0_st_rx_msg_TREADY),
        .axi_str_rxd_tvalid(versal_cips_0_dma0_st_rx_msg_TVALID),
        .axi_str_txc_tready(1'b1),
        .axi_str_txd_tdata(axi_fifo_mm_s_AXI_STR_TXD_TDATA),
        .axi_str_txd_tlast(axi_fifo_mm_s_AXI_STR_TXD_TLAST),
        .axi_str_txd_tready(axi_fifo_mm_s_AXI_STR_TXD_TREADY),
        .axi_str_txd_tvalid(axi_fifo_mm_s_AXI_STR_TXD_TVALID),
        .interrupt(axi_fifo_mm_s_interrupt),
        .s2mm_prmry_reset_out_n(axi_fifo_mm_s_s2mm_prmry_reset_out_n),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(axi_smc_M01_AXI_ARADDR),
        .s_axi_aresetn(noc_clk_gen_axi_rst_0_n),
        .s_axi_arready(axi_smc_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M01_AXI_AWADDR),
        .s_axi_awready(axi_smc_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M01_AXI_AWVALID),
        .s_axi_bready(axi_smc_M01_AXI_BREADY),
        .s_axi_bresp(axi_smc_M01_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M01_AXI_BVALID),
        .s_axi_rdata(axi_smc_M01_AXI_RDATA),
        .s_axi_rready(axi_smc_M01_AXI_RREADY),
        .s_axi_rresp(axi_smc_M01_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M01_AXI_RVALID),
        .s_axi_wdata(axi_smc_M01_AXI_WDATA),
        .s_axi_wready(axi_smc_M01_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M01_AXI_WVALID));
  full_blown_axi_noc_0_0 axi_noc_0
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
        .CH0_LPDDR4_1_ca_a(ch0_lpddr4_trip2_ca_a),
        .CH0_LPDDR4_1_ca_b(ch0_lpddr4_trip2_ca_b),
        .CH0_LPDDR4_1_ck_c_a(\^ch0_lpddr4_trip2_ck_c_a ),
        .CH0_LPDDR4_1_ck_c_b(\^ch0_lpddr4_trip2_ck_c_b ),
        .CH0_LPDDR4_1_ck_t_a(\^ch0_lpddr4_trip2_ck_t_a ),
        .CH0_LPDDR4_1_ck_t_b(\^ch0_lpddr4_trip2_ck_t_b ),
        .CH0_LPDDR4_1_cke_a(\^ch0_lpddr4_trip2_cke_a ),
        .CH0_LPDDR4_1_cke_b(\^ch0_lpddr4_trip2_cke_b ),
        .CH0_LPDDR4_1_cs_a(\^ch0_lpddr4_trip2_cs_a ),
        .CH0_LPDDR4_1_cs_b(\^ch0_lpddr4_trip2_cs_b ),
        .CH0_LPDDR4_1_dmi_a(ch0_lpddr4_trip2_dmi_a),
        .CH0_LPDDR4_1_dmi_b(ch0_lpddr4_trip2_dmi_b),
        .CH0_LPDDR4_1_dq_a(ch0_lpddr4_trip2_dq_a),
        .CH0_LPDDR4_1_dq_b(ch0_lpddr4_trip2_dq_b),
        .CH0_LPDDR4_1_dqs_c_a(ch0_lpddr4_trip2_dqs_c_a),
        .CH0_LPDDR4_1_dqs_c_b(ch0_lpddr4_trip2_dqs_c_b),
        .CH0_LPDDR4_1_dqs_t_a(ch0_lpddr4_trip2_dqs_t_a),
        .CH0_LPDDR4_1_dqs_t_b(ch0_lpddr4_trip2_dqs_t_b),
        .CH0_LPDDR4_1_reset_n(\^ch0_lpddr4_trip2_reset_n ),
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
        .CH1_LPDDR4_1_ca_a(ch1_lpddr4_trip2_ca_a),
        .CH1_LPDDR4_1_ca_b(ch1_lpddr4_trip2_ca_b),
        .CH1_LPDDR4_1_ck_c_a(\^ch1_lpddr4_trip2_ck_c_a ),
        .CH1_LPDDR4_1_ck_c_b(\^ch1_lpddr4_trip2_ck_c_b ),
        .CH1_LPDDR4_1_ck_t_a(\^ch1_lpddr4_trip2_ck_t_a ),
        .CH1_LPDDR4_1_ck_t_b(\^ch1_lpddr4_trip2_ck_t_b ),
        .CH1_LPDDR4_1_cke_a(\^ch1_lpddr4_trip2_cke_a ),
        .CH1_LPDDR4_1_cke_b(\^ch1_lpddr4_trip2_cke_b ),
        .CH1_LPDDR4_1_cs_a(\^ch1_lpddr4_trip2_cs_a ),
        .CH1_LPDDR4_1_cs_b(\^ch1_lpddr4_trip2_cs_b ),
        .CH1_LPDDR4_1_dmi_a(ch1_lpddr4_trip2_dmi_a),
        .CH1_LPDDR4_1_dmi_b(ch1_lpddr4_trip2_dmi_b),
        .CH1_LPDDR4_1_dq_a(ch1_lpddr4_trip2_dq_a),
        .CH1_LPDDR4_1_dq_b(ch1_lpddr4_trip2_dq_b),
        .CH1_LPDDR4_1_dqs_c_a(ch1_lpddr4_trip2_dqs_c_a),
        .CH1_LPDDR4_1_dqs_c_b(ch1_lpddr4_trip2_dqs_c_b),
        .CH1_LPDDR4_1_dqs_t_a(ch1_lpddr4_trip2_dqs_t_a),
        .CH1_LPDDR4_1_dqs_t_b(ch1_lpddr4_trip2_dqs_t_b),
        .CH1_LPDDR4_1_reset_n(\^ch1_lpddr4_trip2_reset_n ),
        .M00_AXI_araddr(axi_noc_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_noc_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_noc_0_M00_AXI_ARID),
        .M00_AXI_arlen(axi_noc_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_noc_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_noc_0_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_noc_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .M00_AXI_aruser(axi_noc_0_M00_AXI_ARUSER),
        .M00_AXI_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_noc_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_noc_0_M00_AXI_AWID),
        .M00_AXI_awlen(axi_noc_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_noc_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_noc_0_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_noc_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .M00_AXI_awuser(axi_noc_0_M00_AXI_AWUSER),
        .M00_AXI_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_noc_0_M00_AXI_BID),
        .M00_AXI_bready(axi_noc_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_noc_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_noc_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_noc_0_M00_AXI_RDATA),
        .M00_AXI_rid(axi_noc_0_M00_AXI_RID),
        .M00_AXI_rlast(axi_noc_0_M00_AXI_RLAST),
        .M00_AXI_rready(axi_noc_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_noc_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_noc_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_noc_0_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_noc_0_M00_AXI_WLAST),
        .M00_AXI_wready(axi_noc_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_noc_0_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_noc_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(axi_noc_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .M01_AXI_arid(axi_noc_0_M01_AXI_ARID),
        .M01_AXI_arlen(axi_noc_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(axi_noc_0_M01_AXI_ARPROT),
        .M01_AXI_arqos(axi_noc_0_M01_AXI_ARQOS),
        .M01_AXI_arready(axi_noc_0_M01_AXI_ARREADY),
        .M01_AXI_arregion(axi_noc_0_M01_AXI_ARREGION),
        .M01_AXI_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .M01_AXI_aruser(axi_noc_0_M01_AXI_ARUSER),
        .M01_AXI_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(axi_noc_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .M01_AXI_awid(axi_noc_0_M01_AXI_AWID),
        .M01_AXI_awlen(axi_noc_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(axi_noc_0_M01_AXI_AWPROT),
        .M01_AXI_awqos(axi_noc_0_M01_AXI_AWQOS),
        .M01_AXI_awready(axi_noc_0_M01_AXI_AWREADY),
        .M01_AXI_awregion(axi_noc_0_M01_AXI_AWREGION),
        .M01_AXI_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .M01_AXI_awuser(axi_noc_0_M01_AXI_AWUSER),
        .M01_AXI_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .M01_AXI_bid(axi_noc_0_M01_AXI_BID),
        .M01_AXI_bready(axi_noc_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_noc_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_noc_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_noc_0_M01_AXI_RDATA),
        .M01_AXI_rid(axi_noc_0_M01_AXI_RID),
        .M01_AXI_rlast(axi_noc_0_M01_AXI_RLAST),
        .M01_AXI_rready(axi_noc_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_noc_0_M01_AXI_RRESP),
        .M01_AXI_ruser(axi_noc_0_M01_AXI_RUSER),
        .M01_AXI_rvalid(axi_noc_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_noc_0_M01_AXI_WDATA),
        .M01_AXI_wlast(axi_noc_0_M01_AXI_WLAST),
        .M01_AXI_wready(axi_noc_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .M01_AXI_wuser(axi_noc_0_M01_AXI_WUSER),
        .M01_AXI_wvalid(axi_noc_0_M01_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arregion(S00_AXI_arregion),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awregion(S00_AXI_awregion),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .S01_AXI_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
        .S01_AXI_arburst(versal_cips_0_FPD_CCI_NOC_0_ARBURST),
        .S01_AXI_arcache(versal_cips_0_FPD_CCI_NOC_0_ARCACHE),
        .S01_AXI_arid(versal_cips_0_FPD_CCI_NOC_0_ARID),
        .S01_AXI_arlen(versal_cips_0_FPD_CCI_NOC_0_ARLEN),
        .S01_AXI_arlock(versal_cips_0_FPD_CCI_NOC_0_ARLOCK),
        .S01_AXI_arprot(versal_cips_0_FPD_CCI_NOC_0_ARPROT),
        .S01_AXI_arqos(versal_cips_0_FPD_CCI_NOC_0_ARQOS),
        .S01_AXI_arready(versal_cips_0_FPD_CCI_NOC_0_ARREADY),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize(versal_cips_0_FPD_CCI_NOC_0_ARSIZE),
        .S01_AXI_aruser(versal_cips_0_FPD_CCI_NOC_0_ARUSER),
        .S01_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_0_ARVALID),
        .S01_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_0_AWADDR),
        .S01_AXI_awburst(versal_cips_0_FPD_CCI_NOC_0_AWBURST),
        .S01_AXI_awcache(versal_cips_0_FPD_CCI_NOC_0_AWCACHE),
        .S01_AXI_awid(versal_cips_0_FPD_CCI_NOC_0_AWID),
        .S01_AXI_awlen(versal_cips_0_FPD_CCI_NOC_0_AWLEN),
        .S01_AXI_awlock(versal_cips_0_FPD_CCI_NOC_0_AWLOCK),
        .S01_AXI_awprot(versal_cips_0_FPD_CCI_NOC_0_AWPROT),
        .S01_AXI_awqos(versal_cips_0_FPD_CCI_NOC_0_AWQOS),
        .S01_AXI_awready(versal_cips_0_FPD_CCI_NOC_0_AWREADY),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize(versal_cips_0_FPD_CCI_NOC_0_AWSIZE),
        .S01_AXI_awuser(versal_cips_0_FPD_CCI_NOC_0_AWUSER),
        .S01_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_0_AWVALID),
        .S01_AXI_bid(versal_cips_0_FPD_CCI_NOC_0_BID),
        .S01_AXI_bready(versal_cips_0_FPD_CCI_NOC_0_BREADY),
        .S01_AXI_bresp(versal_cips_0_FPD_CCI_NOC_0_BRESP),
        .S01_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_0_BVALID),
        .S01_AXI_rdata(versal_cips_0_FPD_CCI_NOC_0_RDATA),
        .S01_AXI_rid(versal_cips_0_FPD_CCI_NOC_0_RID),
        .S01_AXI_rlast(versal_cips_0_FPD_CCI_NOC_0_RLAST),
        .S01_AXI_rready(versal_cips_0_FPD_CCI_NOC_0_RREADY),
        .S01_AXI_rresp(versal_cips_0_FPD_CCI_NOC_0_RRESP),
        .S01_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_0_RVALID),
        .S01_AXI_wdata(versal_cips_0_FPD_CCI_NOC_0_WDATA),
        .S01_AXI_wlast(versal_cips_0_FPD_CCI_NOC_0_WLAST),
        .S01_AXI_wready(versal_cips_0_FPD_CCI_NOC_0_WREADY),
        .S01_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_0_WSTRB),
        .S01_AXI_wuser(versal_cips_0_FPD_CCI_NOC_0_WUSER),
        .S01_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_0_WVALID),
        .S02_AXI_araddr(versal_cips_0_FPD_CCI_NOC_1_ARADDR),
        .S02_AXI_arburst(versal_cips_0_FPD_CCI_NOC_1_ARBURST),
        .S02_AXI_arcache(versal_cips_0_FPD_CCI_NOC_1_ARCACHE),
        .S02_AXI_arid(versal_cips_0_FPD_CCI_NOC_1_ARID),
        .S02_AXI_arlen(versal_cips_0_FPD_CCI_NOC_1_ARLEN),
        .S02_AXI_arlock(versal_cips_0_FPD_CCI_NOC_1_ARLOCK),
        .S02_AXI_arprot(versal_cips_0_FPD_CCI_NOC_1_ARPROT),
        .S02_AXI_arqos(versal_cips_0_FPD_CCI_NOC_1_ARQOS),
        .S02_AXI_arready(versal_cips_0_FPD_CCI_NOC_1_ARREADY),
        .S02_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arsize(versal_cips_0_FPD_CCI_NOC_1_ARSIZE),
        .S02_AXI_aruser(versal_cips_0_FPD_CCI_NOC_1_ARUSER),
        .S02_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_1_ARVALID),
        .S02_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_1_AWADDR),
        .S02_AXI_awburst(versal_cips_0_FPD_CCI_NOC_1_AWBURST),
        .S02_AXI_awcache(versal_cips_0_FPD_CCI_NOC_1_AWCACHE),
        .S02_AXI_awid(versal_cips_0_FPD_CCI_NOC_1_AWID),
        .S02_AXI_awlen(versal_cips_0_FPD_CCI_NOC_1_AWLEN),
        .S02_AXI_awlock(versal_cips_0_FPD_CCI_NOC_1_AWLOCK),
        .S02_AXI_awprot(versal_cips_0_FPD_CCI_NOC_1_AWPROT),
        .S02_AXI_awqos(versal_cips_0_FPD_CCI_NOC_1_AWQOS),
        .S02_AXI_awready(versal_cips_0_FPD_CCI_NOC_1_AWREADY),
        .S02_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awsize(versal_cips_0_FPD_CCI_NOC_1_AWSIZE),
        .S02_AXI_awuser(versal_cips_0_FPD_CCI_NOC_1_AWUSER),
        .S02_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_1_AWVALID),
        .S02_AXI_bid(versal_cips_0_FPD_CCI_NOC_1_BID),
        .S02_AXI_bready(versal_cips_0_FPD_CCI_NOC_1_BREADY),
        .S02_AXI_bresp(versal_cips_0_FPD_CCI_NOC_1_BRESP),
        .S02_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_1_BVALID),
        .S02_AXI_rdata(versal_cips_0_FPD_CCI_NOC_1_RDATA),
        .S02_AXI_rid(versal_cips_0_FPD_CCI_NOC_1_RID),
        .S02_AXI_rlast(versal_cips_0_FPD_CCI_NOC_1_RLAST),
        .S02_AXI_rready(versal_cips_0_FPD_CCI_NOC_1_RREADY),
        .S02_AXI_rresp(versal_cips_0_FPD_CCI_NOC_1_RRESP),
        .S02_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_1_RVALID),
        .S02_AXI_wdata(versal_cips_0_FPD_CCI_NOC_1_WDATA),
        .S02_AXI_wlast(versal_cips_0_FPD_CCI_NOC_1_WLAST),
        .S02_AXI_wready(versal_cips_0_FPD_CCI_NOC_1_WREADY),
        .S02_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_1_WSTRB),
        .S02_AXI_wuser(versal_cips_0_FPD_CCI_NOC_1_WUSER),
        .S02_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_1_WVALID),
        .S03_AXI_araddr(versal_cips_0_FPD_CCI_NOC_2_ARADDR),
        .S03_AXI_arburst(versal_cips_0_FPD_CCI_NOC_2_ARBURST),
        .S03_AXI_arcache(versal_cips_0_FPD_CCI_NOC_2_ARCACHE),
        .S03_AXI_arid(versal_cips_0_FPD_CCI_NOC_2_ARID),
        .S03_AXI_arlen(versal_cips_0_FPD_CCI_NOC_2_ARLEN),
        .S03_AXI_arlock(versal_cips_0_FPD_CCI_NOC_2_ARLOCK),
        .S03_AXI_arprot(versal_cips_0_FPD_CCI_NOC_2_ARPROT),
        .S03_AXI_arqos(versal_cips_0_FPD_CCI_NOC_2_ARQOS),
        .S03_AXI_arready(versal_cips_0_FPD_CCI_NOC_2_ARREADY),
        .S03_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arsize(versal_cips_0_FPD_CCI_NOC_2_ARSIZE),
        .S03_AXI_aruser(versal_cips_0_FPD_CCI_NOC_2_ARUSER),
        .S03_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_2_ARVALID),
        .S03_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_2_AWADDR),
        .S03_AXI_awburst(versal_cips_0_FPD_CCI_NOC_2_AWBURST),
        .S03_AXI_awcache(versal_cips_0_FPD_CCI_NOC_2_AWCACHE),
        .S03_AXI_awid(versal_cips_0_FPD_CCI_NOC_2_AWID),
        .S03_AXI_awlen(versal_cips_0_FPD_CCI_NOC_2_AWLEN),
        .S03_AXI_awlock(versal_cips_0_FPD_CCI_NOC_2_AWLOCK),
        .S03_AXI_awprot(versal_cips_0_FPD_CCI_NOC_2_AWPROT),
        .S03_AXI_awqos(versal_cips_0_FPD_CCI_NOC_2_AWQOS),
        .S03_AXI_awready(versal_cips_0_FPD_CCI_NOC_2_AWREADY),
        .S03_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_awsize(versal_cips_0_FPD_CCI_NOC_2_AWSIZE),
        .S03_AXI_awuser(versal_cips_0_FPD_CCI_NOC_2_AWUSER),
        .S03_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_2_AWVALID),
        .S03_AXI_bid(versal_cips_0_FPD_CCI_NOC_2_BID),
        .S03_AXI_bready(versal_cips_0_FPD_CCI_NOC_2_BREADY),
        .S03_AXI_bresp(versal_cips_0_FPD_CCI_NOC_2_BRESP),
        .S03_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_2_BVALID),
        .S03_AXI_rdata(versal_cips_0_FPD_CCI_NOC_2_RDATA),
        .S03_AXI_rid(versal_cips_0_FPD_CCI_NOC_2_RID),
        .S03_AXI_rlast(versal_cips_0_FPD_CCI_NOC_2_RLAST),
        .S03_AXI_rready(versal_cips_0_FPD_CCI_NOC_2_RREADY),
        .S03_AXI_rresp(versal_cips_0_FPD_CCI_NOC_2_RRESP),
        .S03_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_2_RVALID),
        .S03_AXI_wdata(versal_cips_0_FPD_CCI_NOC_2_WDATA),
        .S03_AXI_wlast(versal_cips_0_FPD_CCI_NOC_2_WLAST),
        .S03_AXI_wready(versal_cips_0_FPD_CCI_NOC_2_WREADY),
        .S03_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_2_WSTRB),
        .S03_AXI_wuser(versal_cips_0_FPD_CCI_NOC_2_WUSER),
        .S03_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_2_WVALID),
        .S04_AXI_araddr(versal_cips_0_FPD_CCI_NOC_3_ARADDR),
        .S04_AXI_arburst(versal_cips_0_FPD_CCI_NOC_3_ARBURST),
        .S04_AXI_arcache(versal_cips_0_FPD_CCI_NOC_3_ARCACHE),
        .S04_AXI_arid(versal_cips_0_FPD_CCI_NOC_3_ARID),
        .S04_AXI_arlen(versal_cips_0_FPD_CCI_NOC_3_ARLEN),
        .S04_AXI_arlock(versal_cips_0_FPD_CCI_NOC_3_ARLOCK),
        .S04_AXI_arprot(versal_cips_0_FPD_CCI_NOC_3_ARPROT),
        .S04_AXI_arqos(versal_cips_0_FPD_CCI_NOC_3_ARQOS),
        .S04_AXI_arready(versal_cips_0_FPD_CCI_NOC_3_ARREADY),
        .S04_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_arsize(versal_cips_0_FPD_CCI_NOC_3_ARSIZE),
        .S04_AXI_aruser(versal_cips_0_FPD_CCI_NOC_3_ARUSER),
        .S04_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_3_ARVALID),
        .S04_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_3_AWADDR),
        .S04_AXI_awburst(versal_cips_0_FPD_CCI_NOC_3_AWBURST),
        .S04_AXI_awcache(versal_cips_0_FPD_CCI_NOC_3_AWCACHE),
        .S04_AXI_awid(versal_cips_0_FPD_CCI_NOC_3_AWID),
        .S04_AXI_awlen(versal_cips_0_FPD_CCI_NOC_3_AWLEN),
        .S04_AXI_awlock(versal_cips_0_FPD_CCI_NOC_3_AWLOCK),
        .S04_AXI_awprot(versal_cips_0_FPD_CCI_NOC_3_AWPROT),
        .S04_AXI_awqos(versal_cips_0_FPD_CCI_NOC_3_AWQOS),
        .S04_AXI_awready(versal_cips_0_FPD_CCI_NOC_3_AWREADY),
        .S04_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_awsize(versal_cips_0_FPD_CCI_NOC_3_AWSIZE),
        .S04_AXI_awuser(versal_cips_0_FPD_CCI_NOC_3_AWUSER),
        .S04_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_3_AWVALID),
        .S04_AXI_bid(versal_cips_0_FPD_CCI_NOC_3_BID),
        .S04_AXI_bready(versal_cips_0_FPD_CCI_NOC_3_BREADY),
        .S04_AXI_bresp(versal_cips_0_FPD_CCI_NOC_3_BRESP),
        .S04_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_3_BVALID),
        .S04_AXI_rdata(versal_cips_0_FPD_CCI_NOC_3_RDATA),
        .S04_AXI_rid(versal_cips_0_FPD_CCI_NOC_3_RID),
        .S04_AXI_rlast(versal_cips_0_FPD_CCI_NOC_3_RLAST),
        .S04_AXI_rready(versal_cips_0_FPD_CCI_NOC_3_RREADY),
        .S04_AXI_rresp(versal_cips_0_FPD_CCI_NOC_3_RRESP),
        .S04_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_3_RVALID),
        .S04_AXI_wdata(versal_cips_0_FPD_CCI_NOC_3_WDATA),
        .S04_AXI_wlast(versal_cips_0_FPD_CCI_NOC_3_WLAST),
        .S04_AXI_wready(versal_cips_0_FPD_CCI_NOC_3_WREADY),
        .S04_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_3_WSTRB),
        .S04_AXI_wuser(versal_cips_0_FPD_CCI_NOC_3_WUSER),
        .S04_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_3_WVALID),
        .S05_AXI_araddr(versal_cips_0_LPD_AXI_NOC_0_ARADDR),
        .S05_AXI_arburst(versal_cips_0_LPD_AXI_NOC_0_ARBURST),
        .S05_AXI_arcache(versal_cips_0_LPD_AXI_NOC_0_ARCACHE),
        .S05_AXI_arid(versal_cips_0_LPD_AXI_NOC_0_ARID),
        .S05_AXI_arlen(versal_cips_0_LPD_AXI_NOC_0_ARLEN),
        .S05_AXI_arlock(versal_cips_0_LPD_AXI_NOC_0_ARLOCK),
        .S05_AXI_arprot(versal_cips_0_LPD_AXI_NOC_0_ARPROT),
        .S05_AXI_arqos(versal_cips_0_LPD_AXI_NOC_0_ARQOS),
        .S05_AXI_arready(versal_cips_0_LPD_AXI_NOC_0_ARREADY),
        .S05_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_arsize(versal_cips_0_LPD_AXI_NOC_0_ARSIZE),
        .S05_AXI_aruser(versal_cips_0_LPD_AXI_NOC_0_ARUSER),
        .S05_AXI_arvalid(versal_cips_0_LPD_AXI_NOC_0_ARVALID),
        .S05_AXI_awaddr(versal_cips_0_LPD_AXI_NOC_0_AWADDR),
        .S05_AXI_awburst(versal_cips_0_LPD_AXI_NOC_0_AWBURST),
        .S05_AXI_awcache(versal_cips_0_LPD_AXI_NOC_0_AWCACHE),
        .S05_AXI_awid(versal_cips_0_LPD_AXI_NOC_0_AWID),
        .S05_AXI_awlen(versal_cips_0_LPD_AXI_NOC_0_AWLEN),
        .S05_AXI_awlock(versal_cips_0_LPD_AXI_NOC_0_AWLOCK),
        .S05_AXI_awprot(versal_cips_0_LPD_AXI_NOC_0_AWPROT),
        .S05_AXI_awqos(versal_cips_0_LPD_AXI_NOC_0_AWQOS),
        .S05_AXI_awready(versal_cips_0_LPD_AXI_NOC_0_AWREADY),
        .S05_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_awsize(versal_cips_0_LPD_AXI_NOC_0_AWSIZE),
        .S05_AXI_awuser(versal_cips_0_LPD_AXI_NOC_0_AWUSER),
        .S05_AXI_awvalid(versal_cips_0_LPD_AXI_NOC_0_AWVALID),
        .S05_AXI_bid(versal_cips_0_LPD_AXI_NOC_0_BID),
        .S05_AXI_bready(versal_cips_0_LPD_AXI_NOC_0_BREADY),
        .S05_AXI_bresp(versal_cips_0_LPD_AXI_NOC_0_BRESP),
        .S05_AXI_bvalid(versal_cips_0_LPD_AXI_NOC_0_BVALID),
        .S05_AXI_rdata(versal_cips_0_LPD_AXI_NOC_0_RDATA),
        .S05_AXI_rid(versal_cips_0_LPD_AXI_NOC_0_RID),
        .S05_AXI_rlast(versal_cips_0_LPD_AXI_NOC_0_RLAST),
        .S05_AXI_rready(versal_cips_0_LPD_AXI_NOC_0_RREADY),
        .S05_AXI_rresp(versal_cips_0_LPD_AXI_NOC_0_RRESP),
        .S05_AXI_rvalid(versal_cips_0_LPD_AXI_NOC_0_RVALID),
        .S05_AXI_wdata(versal_cips_0_LPD_AXI_NOC_0_WDATA),
        .S05_AXI_wlast(versal_cips_0_LPD_AXI_NOC_0_WLAST),
        .S05_AXI_wready(versal_cips_0_LPD_AXI_NOC_0_WREADY),
        .S05_AXI_wstrb(versal_cips_0_LPD_AXI_NOC_0_WSTRB),
        .S05_AXI_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_wvalid(versal_cips_0_LPD_AXI_NOC_0_WVALID),
        .S06_AXI_araddr(versal_cips_0_PMC_NOC_AXI_0_ARADDR),
        .S06_AXI_arburst(versal_cips_0_PMC_NOC_AXI_0_ARBURST),
        .S06_AXI_arcache(versal_cips_0_PMC_NOC_AXI_0_ARCACHE),
        .S06_AXI_arid(versal_cips_0_PMC_NOC_AXI_0_ARID),
        .S06_AXI_arlen(versal_cips_0_PMC_NOC_AXI_0_ARLEN),
        .S06_AXI_arlock(versal_cips_0_PMC_NOC_AXI_0_ARLOCK),
        .S06_AXI_arprot(versal_cips_0_PMC_NOC_AXI_0_ARPROT),
        .S06_AXI_arqos(versal_cips_0_PMC_NOC_AXI_0_ARQOS),
        .S06_AXI_arready(versal_cips_0_PMC_NOC_AXI_0_ARREADY),
        .S06_AXI_arregion(versal_cips_0_PMC_NOC_AXI_0_ARREGION),
        .S06_AXI_arsize(versal_cips_0_PMC_NOC_AXI_0_ARSIZE),
        .S06_AXI_aruser(versal_cips_0_PMC_NOC_AXI_0_ARUSER),
        .S06_AXI_arvalid(versal_cips_0_PMC_NOC_AXI_0_ARVALID),
        .S06_AXI_awaddr(versal_cips_0_PMC_NOC_AXI_0_AWADDR),
        .S06_AXI_awburst(versal_cips_0_PMC_NOC_AXI_0_AWBURST),
        .S06_AXI_awcache(versal_cips_0_PMC_NOC_AXI_0_AWCACHE),
        .S06_AXI_awid(versal_cips_0_PMC_NOC_AXI_0_AWID),
        .S06_AXI_awlen(versal_cips_0_PMC_NOC_AXI_0_AWLEN),
        .S06_AXI_awlock(versal_cips_0_PMC_NOC_AXI_0_AWLOCK),
        .S06_AXI_awprot(versal_cips_0_PMC_NOC_AXI_0_AWPROT),
        .S06_AXI_awqos(versal_cips_0_PMC_NOC_AXI_0_AWQOS),
        .S06_AXI_awready(versal_cips_0_PMC_NOC_AXI_0_AWREADY),
        .S06_AXI_awregion(versal_cips_0_PMC_NOC_AXI_0_AWREGION),
        .S06_AXI_awsize(versal_cips_0_PMC_NOC_AXI_0_AWSIZE),
        .S06_AXI_awuser(versal_cips_0_PMC_NOC_AXI_0_AWUSER),
        .S06_AXI_awvalid(versal_cips_0_PMC_NOC_AXI_0_AWVALID),
        .S06_AXI_bid(versal_cips_0_PMC_NOC_AXI_0_BID),
        .S06_AXI_bready(versal_cips_0_PMC_NOC_AXI_0_BREADY),
        .S06_AXI_bresp(versal_cips_0_PMC_NOC_AXI_0_BRESP),
        .S06_AXI_buser(versal_cips_0_PMC_NOC_AXI_0_BUSER),
        .S06_AXI_bvalid(versal_cips_0_PMC_NOC_AXI_0_BVALID),
        .S06_AXI_rdata(versal_cips_0_PMC_NOC_AXI_0_RDATA),
        .S06_AXI_rid(versal_cips_0_PMC_NOC_AXI_0_RID),
        .S06_AXI_rlast(versal_cips_0_PMC_NOC_AXI_0_RLAST),
        .S06_AXI_rready(versal_cips_0_PMC_NOC_AXI_0_RREADY),
        .S06_AXI_rresp(versal_cips_0_PMC_NOC_AXI_0_RRESP),
        .S06_AXI_ruser(versal_cips_0_PMC_NOC_AXI_0_RUSER),
        .S06_AXI_rvalid(versal_cips_0_PMC_NOC_AXI_0_RVALID),
        .S06_AXI_wdata(versal_cips_0_PMC_NOC_AXI_0_WDATA),
        .S06_AXI_wlast(versal_cips_0_PMC_NOC_AXI_0_WLAST),
        .S06_AXI_wready(versal_cips_0_PMC_NOC_AXI_0_WREADY),
        .S06_AXI_wstrb(versal_cips_0_PMC_NOC_AXI_0_WSTRB),
        .S06_AXI_wuser(versal_cips_0_PMC_NOC_AXI_0_WUSER),
        .S06_AXI_wvalid(versal_cips_0_PMC_NOC_AXI_0_WVALID),
        .S07_AXI_araddr(tb3d_engine_top_0_m_axi_ARADDR),
        .S07_AXI_arburst(tb3d_engine_top_0_m_axi_ARBURST),
        .S07_AXI_arcache({1'b0,1'b0,1'b1,1'b1}),
        .S07_AXI_arid(tb3d_engine_top_0_m_axi_ARID),
        .S07_AXI_arlen(tb3d_engine_top_0_m_axi_ARLEN),
        .S07_AXI_arlock(1'b0),
        .S07_AXI_arprot({1'b0,1'b0,1'b0}),
        .S07_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S07_AXI_arready(tb3d_engine_top_0_m_axi_ARREADY),
        .S07_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S07_AXI_arsize(tb3d_engine_top_0_m_axi_ARSIZE),
        .S07_AXI_arvalid(tb3d_engine_top_0_m_axi_ARVALID),
        .S07_AXI_awaddr(tb3d_engine_top_0_m_axi_AWADDR),
        .S07_AXI_awburst(tb3d_engine_top_0_m_axi_AWBURST),
        .S07_AXI_awcache({1'b0,1'b0,1'b1,1'b1}),
        .S07_AXI_awid(tb3d_engine_top_0_m_axi_AWID),
        .S07_AXI_awlen(tb3d_engine_top_0_m_axi_AWLEN),
        .S07_AXI_awlock(1'b0),
        .S07_AXI_awprot({1'b0,1'b0,1'b0}),
        .S07_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S07_AXI_awready(tb3d_engine_top_0_m_axi_AWREADY),
        .S07_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S07_AXI_awsize(tb3d_engine_top_0_m_axi_AWSIZE),
        .S07_AXI_awvalid(tb3d_engine_top_0_m_axi_AWVALID),
        .S07_AXI_bid(tb3d_engine_top_0_m_axi_BID),
        .S07_AXI_bready(tb3d_engine_top_0_m_axi_BREADY),
        .S07_AXI_bresp(tb3d_engine_top_0_m_axi_BRESP),
        .S07_AXI_bvalid(tb3d_engine_top_0_m_axi_BVALID),
        .S07_AXI_rdata(tb3d_engine_top_0_m_axi_RDATA),
        .S07_AXI_rid(tb3d_engine_top_0_m_axi_RID),
        .S07_AXI_rlast(tb3d_engine_top_0_m_axi_RLAST),
        .S07_AXI_rready(tb3d_engine_top_0_m_axi_RREADY),
        .S07_AXI_rresp(tb3d_engine_top_0_m_axi_RRESP),
        .S07_AXI_rvalid(tb3d_engine_top_0_m_axi_RVALID),
        .S07_AXI_wdata(tb3d_engine_top_0_m_axi_WDATA),
        .S07_AXI_wlast(tb3d_engine_top_0_m_axi_WLAST),
        .S07_AXI_wready(tb3d_engine_top_0_m_axi_WREADY),
        .S07_AXI_wstrb(tb3d_engine_top_0_m_axi_WSTRB),
        .S07_AXI_wvalid(tb3d_engine_top_0_m_axi_WVALID),
        .S08_AXI_araddr(tb3d_pcie_bridge_0_m_dma_ARADDR),
        .S08_AXI_arburst(tb3d_pcie_bridge_0_m_dma_ARBURST),
        .S08_AXI_arcache({1'b0,1'b0,1'b1,1'b1}),
        .S08_AXI_arlen(tb3d_pcie_bridge_0_m_dma_ARLEN),
        .S08_AXI_arlock(1'b0),
        .S08_AXI_arprot({1'b0,1'b0,1'b0}),
        .S08_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S08_AXI_arready(tb3d_pcie_bridge_0_m_dma_ARREADY),
        .S08_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S08_AXI_arsize(tb3d_pcie_bridge_0_m_dma_ARSIZE),
        .S08_AXI_arvalid(tb3d_pcie_bridge_0_m_dma_ARVALID),
        .S08_AXI_awaddr(tb3d_pcie_bridge_0_m_dma_AWADDR),
        .S08_AXI_awburst(tb3d_pcie_bridge_0_m_dma_AWBURST),
        .S08_AXI_awcache({1'b0,1'b0,1'b1,1'b1}),
        .S08_AXI_awlen(tb3d_pcie_bridge_0_m_dma_AWLEN),
        .S08_AXI_awlock(1'b0),
        .S08_AXI_awprot({1'b0,1'b0,1'b0}),
        .S08_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S08_AXI_awready(tb3d_pcie_bridge_0_m_dma_AWREADY),
        .S08_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S08_AXI_awsize(tb3d_pcie_bridge_0_m_dma_AWSIZE),
        .S08_AXI_awvalid(tb3d_pcie_bridge_0_m_dma_AWVALID),
        .S08_AXI_bready(tb3d_pcie_bridge_0_m_dma_BREADY),
        .S08_AXI_bresp(tb3d_pcie_bridge_0_m_dma_BRESP),
        .S08_AXI_bvalid(tb3d_pcie_bridge_0_m_dma_BVALID),
        .S08_AXI_rdata(tb3d_pcie_bridge_0_m_dma_RDATA),
        .S08_AXI_rlast(tb3d_pcie_bridge_0_m_dma_RLAST),
        .S08_AXI_rready(tb3d_pcie_bridge_0_m_dma_RREADY),
        .S08_AXI_rresp(tb3d_pcie_bridge_0_m_dma_RRESP),
        .S08_AXI_rvalid(tb3d_pcie_bridge_0_m_dma_RVALID),
        .S08_AXI_wdata(tb3d_pcie_bridge_0_m_dma_WDATA),
        .S08_AXI_wlast(tb3d_pcie_bridge_0_m_dma_WLAST),
        .S08_AXI_wready(tb3d_pcie_bridge_0_m_dma_WREADY),
        .S08_AXI_wstrb(tb3d_pcie_bridge_0_m_dma_WSTRB),
        .S08_AXI_wvalid(tb3d_pcie_bridge_0_m_dma_WVALID),
        .aclk0(aclk0_0),
        .aclk1(versal_cips_0_fpd_cci_noc_axi0_clk),
        .aclk2(versal_cips_0_fpd_cci_noc_axi1_clk),
        .aclk3(versal_cips_0_fpd_cci_noc_axi2_clk),
        .aclk4(versal_cips_0_fpd_cci_noc_axi3_clk),
        .aclk5(versal_cips_0_lpd_axi_noc_clk),
        .aclk6(versal_cips_0_pmc_axi_noc_axi0_clk),
        .aclk7(microblaze_0_Clk),
        .aclk8(versal_cips_0_noc_pmc_axi_axi0_clk),
        .sys_clk0_clk_n(noc_clk_gen_SYS_CLK0_CLK_N),
        .sys_clk0_clk_p(noc_clk_gen_SYS_CLK0_CLK_P),
        .sys_clk1_clk_n(noc_clk_gen_SYS_CLK1_CLK_N),
        .sys_clk1_clk_p(noc_clk_gen_SYS_CLK1_CLK_P));
  full_blown_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_smc_M01_AXI_ARADDR),
        .M01_AXI_arready(axi_smc_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_smc_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_smc_M01_AXI_AWADDR),
        .M01_AXI_awready(axi_smc_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_smc_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_smc_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_smc_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_smc_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_smc_M01_AXI_RDATA),
        .M01_AXI_rready(axi_smc_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_smc_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_smc_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_smc_M01_AXI_WDATA),
        .M01_AXI_wready(axi_smc_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_smc_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_smc_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_smc_M02_AXI_ARADDR),
        .M02_AXI_arready(axi_smc_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_smc_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_smc_M02_AXI_AWADDR),
        .M02_AXI_awready(axi_smc_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_smc_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_smc_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_smc_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_smc_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_smc_M02_AXI_RDATA),
        .M02_AXI_rready(axi_smc_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_smc_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_smc_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_smc_M02_AXI_WDATA),
        .M02_AXI_wready(axi_smc_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_smc_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_smc_M02_AXI_WVALID),
        .M03_AXI_araddr(axi_smc_M03_AXI_ARADDR),
        .M03_AXI_arready(axi_smc_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_smc_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_smc_M03_AXI_AWADDR),
        .M03_AXI_awready(axi_smc_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_smc_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_smc_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_smc_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_smc_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_smc_M03_AXI_RDATA),
        .M03_AXI_rready(axi_smc_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_smc_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_smc_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_smc_M03_AXI_WDATA),
        .M03_AXI_wready(axi_smc_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_smc_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_smc_M03_AXI_WVALID),
        .M04_AXI_araddr(axi_smc_M04_AXI_ARADDR),
        .M04_AXI_arready(axi_smc_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_smc_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_smc_M04_AXI_AWADDR),
        .M04_AXI_awready(axi_smc_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_smc_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_smc_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_smc_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_smc_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_smc_M04_AXI_RDATA),
        .M04_AXI_rready(axi_smc_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_smc_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_smc_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_smc_M04_AXI_WDATA),
        .M04_AXI_wready(axi_smc_M04_AXI_WREADY),
        .M04_AXI_wvalid(axi_smc_M04_AXI_WVALID),
        .S00_AXI_araddr(tb3d_pcie_bridge_0_m_csr_ARADDR),
        .S00_AXI_arprot({1'b0,1'b0,1'b0}),
        .S00_AXI_arready(tb3d_pcie_bridge_0_m_csr_ARREADY),
        .S00_AXI_arvalid(tb3d_pcie_bridge_0_m_csr_ARVALID),
        .S00_AXI_awaddr(tb3d_pcie_bridge_0_m_csr_AWADDR),
        .S00_AXI_awprot({1'b0,1'b0,1'b0}),
        .S00_AXI_awready(tb3d_pcie_bridge_0_m_csr_AWREADY),
        .S00_AXI_awvalid(tb3d_pcie_bridge_0_m_csr_AWVALID),
        .S00_AXI_bready(tb3d_pcie_bridge_0_m_csr_BREADY),
        .S00_AXI_bresp(tb3d_pcie_bridge_0_m_csr_BRESP),
        .S00_AXI_bvalid(tb3d_pcie_bridge_0_m_csr_BVALID),
        .S00_AXI_rdata(tb3d_pcie_bridge_0_m_csr_RDATA),
        .S00_AXI_rready(tb3d_pcie_bridge_0_m_csr_RREADY),
        .S00_AXI_rresp(tb3d_pcie_bridge_0_m_csr_RRESP),
        .S00_AXI_rvalid(tb3d_pcie_bridge_0_m_csr_RVALID),
        .S00_AXI_wdata(tb3d_pcie_bridge_0_m_csr_WDATA),
        .S00_AXI_wready(tb3d_pcie_bridge_0_m_csr_WREADY),
        .S00_AXI_wstrb(tb3d_pcie_bridge_0_m_csr_WSTRB),
        .S00_AXI_wvalid(tb3d_pcie_bridge_0_m_csr_WVALID),
        .S01_AXI_araddr(microblaze_0_M_AXI_DP_ARADDR),
        .S01_AXI_arprot(microblaze_0_M_AXI_DP_ARPROT),
        .S01_AXI_arready(microblaze_0_M_AXI_DP_ARREADY),
        .S01_AXI_arvalid(microblaze_0_M_AXI_DP_ARVALID),
        .S01_AXI_awaddr(microblaze_0_M_AXI_DP_AWADDR),
        .S01_AXI_awprot(microblaze_0_M_AXI_DP_AWPROT),
        .S01_AXI_awready(microblaze_0_M_AXI_DP_AWREADY),
        .S01_AXI_awvalid(microblaze_0_M_AXI_DP_AWVALID),
        .S01_AXI_bready(microblaze_0_M_AXI_DP_BREADY),
        .S01_AXI_bresp(microblaze_0_M_AXI_DP_BRESP),
        .S01_AXI_bvalid(microblaze_0_M_AXI_DP_BVALID),
        .S01_AXI_rdata(microblaze_0_M_AXI_DP_RDATA),
        .S01_AXI_rready(microblaze_0_M_AXI_DP_RREADY),
        .S01_AXI_rresp(microblaze_0_M_AXI_DP_RRESP),
        .S01_AXI_rvalid(microblaze_0_M_AXI_DP_RVALID),
        .S01_AXI_wdata(microblaze_0_M_AXI_DP_WDATA),
        .S01_AXI_wready(microblaze_0_M_AXI_DP_WREADY),
        .S01_AXI_wstrb(microblaze_0_M_AXI_DP_WSTRB),
        .S01_AXI_wvalid(microblaze_0_M_AXI_DP_WVALID),
        .S02_AXI_araddr(axi_noc_0_M00_AXI_ARADDR),
        .S02_AXI_arburst(axi_noc_0_M00_AXI_ARBURST),
        .S02_AXI_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .S02_AXI_arid(axi_noc_0_M00_AXI_ARID),
        .S02_AXI_arlen(axi_noc_0_M00_AXI_ARLEN),
        .S02_AXI_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .S02_AXI_arprot(axi_noc_0_M00_AXI_ARPROT),
        .S02_AXI_arqos(axi_noc_0_M00_AXI_ARQOS),
        .S02_AXI_arready(axi_noc_0_M00_AXI_ARREADY),
        .S02_AXI_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .S02_AXI_aruser(axi_noc_0_M00_AXI_ARUSER),
        .S02_AXI_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .S02_AXI_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .S02_AXI_awburst(axi_noc_0_M00_AXI_AWBURST),
        .S02_AXI_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .S02_AXI_awid(axi_noc_0_M00_AXI_AWID),
        .S02_AXI_awlen(axi_noc_0_M00_AXI_AWLEN),
        .S02_AXI_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .S02_AXI_awprot(axi_noc_0_M00_AXI_AWPROT),
        .S02_AXI_awqos(axi_noc_0_M00_AXI_AWQOS),
        .S02_AXI_awready(axi_noc_0_M00_AXI_AWREADY),
        .S02_AXI_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .S02_AXI_awuser(axi_noc_0_M00_AXI_AWUSER),
        .S02_AXI_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .S02_AXI_bid(axi_noc_0_M00_AXI_BID),
        .S02_AXI_bready(axi_noc_0_M00_AXI_BREADY),
        .S02_AXI_bresp(axi_noc_0_M00_AXI_BRESP),
        .S02_AXI_bvalid(axi_noc_0_M00_AXI_BVALID),
        .S02_AXI_rdata(axi_noc_0_M00_AXI_RDATA),
        .S02_AXI_rid(axi_noc_0_M00_AXI_RID),
        .S02_AXI_rlast(axi_noc_0_M00_AXI_RLAST),
        .S02_AXI_rready(axi_noc_0_M00_AXI_RREADY),
        .S02_AXI_rresp(axi_noc_0_M00_AXI_RRESP),
        .S02_AXI_rvalid(axi_noc_0_M00_AXI_RVALID),
        .S02_AXI_wdata(axi_noc_0_M00_AXI_WDATA),
        .S02_AXI_wlast(axi_noc_0_M00_AXI_WLAST),
        .S02_AXI_wready(axi_noc_0_M00_AXI_WREADY),
        .S02_AXI_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .S02_AXI_wvalid(axi_noc_0_M00_AXI_WVALID),
        .S03_AXI_araddr(microblaze_0_M_AXI_IP_ARADDR),
        .S03_AXI_arprot(microblaze_0_M_AXI_IP_ARPROT),
        .S03_AXI_arready(microblaze_0_M_AXI_IP_ARREADY),
        .S03_AXI_arvalid(microblaze_0_M_AXI_IP_ARVALID),
        .S03_AXI_rdata(microblaze_0_M_AXI_IP_RDATA),
        .S03_AXI_rready(microblaze_0_M_AXI_IP_RREADY),
        .S03_AXI_rresp(microblaze_0_M_AXI_IP_RRESP),
        .S03_AXI_rvalid(microblaze_0_M_AXI_IP_RVALID),
        .aclk(aclk0_0),
        .aclk1(microblaze_0_Clk),
        .aresetn(noc_clk_gen_axi_rst_0_n));
  full_blown_axi_uartlite_0_0 axi_uartlite_0
       (.rx(UART_0_rxd),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(axi_smc_M03_AXI_ARADDR),
        .s_axi_aresetn(noc_clk_gen_axi_rst_0_n),
        .s_axi_arready(axi_smc_M03_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M03_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M03_AXI_AWADDR),
        .s_axi_awready(axi_smc_M03_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M03_AXI_AWVALID),
        .s_axi_bready(axi_smc_M03_AXI_BREADY),
        .s_axi_bresp(axi_smc_M03_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M03_AXI_BVALID),
        .s_axi_rdata(axi_smc_M03_AXI_RDATA),
        .s_axi_rready(axi_smc_M03_AXI_RREADY),
        .s_axi_rresp(axi_smc_M03_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M03_AXI_RVALID),
        .s_axi_wdata(axi_smc_M03_AXI_WDATA),
        .s_axi_wready(axi_smc_M03_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M03_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M03_AXI_WVALID),
        .tx(UART_0_txd));
  full_blown_axis_subset_converter_0 axis_subset_converter
       (.aclk(microblaze_0_Clk),
        .aresetn(noc_clk_gen_axi_rst_0_n),
        .m_axis_tdata(axis_subset_converter_M_AXIS_TDATA),
        .m_axis_tlast(axis_subset_converter_M_AXIS_TLAST),
        .m_axis_tready(axis_subset_converter_M_AXIS_TREADY),
        .m_axis_tvalid(axis_subset_converter_M_AXIS_TVALID),
        .s_axis_tdata(axi_fifo_mm_s_AXI_STR_TXD_TDATA),
        .s_axis_tlast(axi_fifo_mm_s_AXI_STR_TXD_TLAST),
        .s_axis_tready(axi_fifo_mm_s_AXI_STR_TXD_TREADY),
        .s_axis_tvalid(axi_fifo_mm_s_AXI_STR_TXD_TVALID));
  full_blown_clk_wiz_0 clk_wiz
       (.clk_in1(clk_100MHz),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_rtl));
  full_blown_mdm_1_0 mdm_1
       (.Dbg_TDO_0(1'b0),
        .Debug_SYS_Rst(mdm_1_Debug_SYS_Rst));
  (* BMM_INFO_PROCESSOR = "microblaze-le > full_blown microblaze_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  full_blown_microblaze_0_0 microblaze_0
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
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(microblaze_0_interrupt_INTERRUPT),
        .Interrupt_Ack(microblaze_0_interrupt_ACK),
        .Interrupt_Address({microblaze_0_interrupt_ADDRESS[31],microblaze_0_interrupt_ADDRESS[30],microblaze_0_interrupt_ADDRESS[29],microblaze_0_interrupt_ADDRESS[28],microblaze_0_interrupt_ADDRESS[27],microblaze_0_interrupt_ADDRESS[26],microblaze_0_interrupt_ADDRESS[25],microblaze_0_interrupt_ADDRESS[24],microblaze_0_interrupt_ADDRESS[23],microblaze_0_interrupt_ADDRESS[22],microblaze_0_interrupt_ADDRESS[21],microblaze_0_interrupt_ADDRESS[20],microblaze_0_interrupt_ADDRESS[19],microblaze_0_interrupt_ADDRESS[18],microblaze_0_interrupt_ADDRESS[17],microblaze_0_interrupt_ADDRESS[16],microblaze_0_interrupt_ADDRESS[15],microblaze_0_interrupt_ADDRESS[14],microblaze_0_interrupt_ADDRESS[13],microblaze_0_interrupt_ADDRESS[12],microblaze_0_interrupt_ADDRESS[11],microblaze_0_interrupt_ADDRESS[10],microblaze_0_interrupt_ADDRESS[9],microblaze_0_interrupt_ADDRESS[8],microblaze_0_interrupt_ADDRESS[7],microblaze_0_interrupt_ADDRESS[6],microblaze_0_interrupt_ADDRESS[5],microblaze_0_interrupt_ADDRESS[4],microblaze_0_interrupt_ADDRESS[3],microblaze_0_interrupt_ADDRESS[2],microblaze_0_interrupt_ADDRESS[1],microblaze_0_interrupt_ADDRESS[0]}),
        .M_AXI_DP_ARADDR(microblaze_0_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_0_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_0_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_0_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_0_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_0_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_0_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_0_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_0_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_0_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_0_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_0_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_0_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_0_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_0_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_0_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_0_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_0_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_0_M_AXI_DP_WVALID),
        .M_AXI_IP_ARADDR(microblaze_0_M_AXI_IP_ARADDR),
        .M_AXI_IP_ARPROT(microblaze_0_M_AXI_IP_ARPROT),
        .M_AXI_IP_ARREADY(microblaze_0_M_AXI_IP_ARREADY),
        .M_AXI_IP_ARVALID(microblaze_0_M_AXI_IP_ARVALID),
        .M_AXI_IP_AWREADY(1'b0),
        .M_AXI_IP_BRESP({1'b0,1'b0}),
        .M_AXI_IP_BVALID(1'b0),
        .M_AXI_IP_RDATA(microblaze_0_M_AXI_IP_RDATA),
        .M_AXI_IP_RREADY(microblaze_0_M_AXI_IP_RREADY),
        .M_AXI_IP_RRESP(microblaze_0_M_AXI_IP_RRESP),
        .M_AXI_IP_RVALID(microblaze_0_M_AXI_IP_RVALID),
        .M_AXI_IP_WREADY(1'b0),
        .Read_Strobe(microblaze_0_DLMB_READSTROBE),
        .Reset(rst_clk_wiz_100M_mb_reset),
        .Write_Strobe(microblaze_0_DLMB_WRITESTROBE));
  full_blown_microblaze_0_axi_intc_0 microblaze_0_axi_intc
       (.interrupt_address(microblaze_0_interrupt_ADDRESS),
        .intr(microblaze_0_intr),
        .irq(microblaze_0_interrupt_INTERRUPT),
        .processor_ack({microblaze_0_interrupt_ACK[0],microblaze_0_interrupt_ACK[1]}),
        .processor_clk(microblaze_0_Clk),
        .processor_rst(SYS_Rst_1),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(axi_smc_M02_AXI_ARADDR),
        .s_axi_aresetn(noc_clk_gen_axi_rst_0_n),
        .s_axi_arready(axi_smc_M02_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M02_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M02_AXI_AWADDR),
        .s_axi_awready(axi_smc_M02_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M02_AXI_AWVALID),
        .s_axi_bready(axi_smc_M02_AXI_BREADY),
        .s_axi_bresp(axi_smc_M02_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M02_AXI_BVALID),
        .s_axi_rdata(axi_smc_M02_AXI_RDATA),
        .s_axi_rready(axi_smc_M02_AXI_RREADY),
        .s_axi_rresp(axi_smc_M02_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M02_AXI_RVALID),
        .s_axi_wdata(axi_smc_M02_AXI_WDATA),
        .s_axi_wready(axi_smc_M02_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M02_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M02_AXI_WVALID));
  microblaze_0_local_memory_imp_M2YEZC microblaze_0_local_memory
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
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_0_Clk),
        .SYS_Rst(SYS_Rst_1));
  assign microblaze_0_intr = {1'b0, 1'b0};
  full_blown_noc_clk_gen_0 noc_clk_gen
       (.axi_clk_0(microblaze_0_Clk),
        .axi_clk_in_0(clk_wiz_clk_out1),
        .axi_rst_0_n(noc_clk_gen_axi_rst_0_n),
        .axi_rst_in_0_n(rst_clk_wiz_100M_1_peripheral_aresetn),
        .sys_clk0_in_n(lpddr4_clk1_clk_n),
        .sys_clk0_in_p(lpddr4_clk1_clk_p),
        .sys_clk0_n(noc_clk_gen_SYS_CLK0_CLK_N),
        .sys_clk0_p(noc_clk_gen_SYS_CLK0_CLK_P),
        .sys_clk1_in_n(lpddr4_clk2_clk_n),
        .sys_clk1_in_p(lpddr4_clk2_clk_p),
        .sys_clk1_n(noc_clk_gen_SYS_CLK1_CLK_N),
        .sys_clk1_p(noc_clk_gen_SYS_CLK1_CLK_P));
  full_blown_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(axi_fifo_mm_s_s2mm_prmry_reset_out_n),
        .bus_struct_reset(SYS_Rst_1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(noc_clk_gen_axi_rst_0_n),
        .mb_debug_sys_rst(mdm_1_Debug_SYS_Rst),
        .mb_reset(rst_clk_wiz_100M_mb_reset),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(microblaze_0_Clk));
  full_blown_rst_clk_wiz_100M_1_0 rst_clk_wiz_100M_1
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_rtl),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_1_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
  full_blown_tb3d_engine_top_0_0 tb3d_engine_top_0
       (.clk(microblaze_0_Clk),
        .intr_req(tb3d_engine_top_0_intr_req),
        .m_axi_araddr(tb3d_engine_top_0_m_axi_ARADDR),
        .m_axi_arburst(tb3d_engine_top_0_m_axi_ARBURST),
        .m_axi_arid(tb3d_engine_top_0_m_axi_ARID),
        .m_axi_arlen(tb3d_engine_top_0_m_axi_ARLEN),
        .m_axi_arready(tb3d_engine_top_0_m_axi_ARREADY),
        .m_axi_arsize(tb3d_engine_top_0_m_axi_ARSIZE),
        .m_axi_arvalid(tb3d_engine_top_0_m_axi_ARVALID),
        .m_axi_awaddr(tb3d_engine_top_0_m_axi_AWADDR),
        .m_axi_awburst(tb3d_engine_top_0_m_axi_AWBURST),
        .m_axi_awid(tb3d_engine_top_0_m_axi_AWID),
        .m_axi_awlen(tb3d_engine_top_0_m_axi_AWLEN),
        .m_axi_awready(tb3d_engine_top_0_m_axi_AWREADY),
        .m_axi_awsize(tb3d_engine_top_0_m_axi_AWSIZE),
        .m_axi_awvalid(tb3d_engine_top_0_m_axi_AWVALID),
        .m_axi_bid(tb3d_engine_top_0_m_axi_BID),
        .m_axi_bready(tb3d_engine_top_0_m_axi_BREADY),
        .m_axi_bresp(tb3d_engine_top_0_m_axi_BRESP),
        .m_axi_bvalid(tb3d_engine_top_0_m_axi_BVALID),
        .m_axi_rdata(tb3d_engine_top_0_m_axi_RDATA),
        .m_axi_rid(tb3d_engine_top_0_m_axi_RID),
        .m_axi_rlast(tb3d_engine_top_0_m_axi_RLAST),
        .m_axi_rready(tb3d_engine_top_0_m_axi_RREADY),
        .m_axi_rresp(tb3d_engine_top_0_m_axi_RRESP),
        .m_axi_rvalid(tb3d_engine_top_0_m_axi_RVALID),
        .m_axi_wdata(tb3d_engine_top_0_m_axi_WDATA),
        .m_axi_wlast(tb3d_engine_top_0_m_axi_WLAST),
        .m_axi_wready(tb3d_engine_top_0_m_axi_WREADY),
        .m_axi_wstrb(tb3d_engine_top_0_m_axi_WSTRB),
        .m_axi_wvalid(tb3d_engine_top_0_m_axi_WVALID),
        .rst_n(rst_clk_wiz_100M_1_peripheral_aresetn),
        .s_axi_araddr(axi_smc_M00_AXI_ARADDR),
        .s_axi_arready(axi_smc_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M00_AXI_AWADDR),
        .s_axi_awready(axi_smc_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M00_AXI_AWVALID),
        .s_axi_bready(axi_smc_M00_AXI_BREADY),
        .s_axi_bresp(axi_smc_M00_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M00_AXI_BVALID),
        .s_axi_rdata(axi_smc_M00_AXI_RDATA),
        .s_axi_rready(axi_smc_M00_AXI_RREADY),
        .s_axi_rresp(axi_smc_M00_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M00_AXI_RVALID),
        .s_axi_wdata(axi_smc_M00_AXI_WDATA),
        .s_axi_wready(axi_smc_M00_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M00_AXI_WVALID),
        .vec_nibble_pairs_i({axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut,axi_dma_0_mm2s_introut}),
        .vec_nibble_pairs_o(tb3d_engine_top_0_vec_nibble_pairs_o),
        .vec_tb3d_bytes_i({axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut,axi_dma_0_s2mm_introut}),
        .vec_tb3d_bytes_o(tb3d_engine_top_0_vec_tb3d_bytes_o));
  full_blown_tb3d_pcie_bridge_0_0 tb3d_pcie_bridge_0
       (.clk(microblaze_0_Clk),
        .completer_id(tb3d_engine_top_0_vec_tb3d_bytes_o[15:0]),
        .m_axis_rx_tdata(axis_subset_converter_M_AXIS_TDATA),
        .m_axis_rx_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .m_axis_rx_tlast(axis_subset_converter_M_AXIS_TLAST),
        .m_axis_rx_tready(axis_subset_converter_M_AXIS_TREADY),
        .m_axis_rx_tuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axis_rx_tvalid(axis_subset_converter_M_AXIS_TVALID),
        .m_csr_araddr(tb3d_pcie_bridge_0_m_csr_ARADDR),
        .m_csr_arready(tb3d_pcie_bridge_0_m_csr_ARREADY),
        .m_csr_arvalid(tb3d_pcie_bridge_0_m_csr_ARVALID),
        .m_csr_awaddr(tb3d_pcie_bridge_0_m_csr_AWADDR),
        .m_csr_awready(tb3d_pcie_bridge_0_m_csr_AWREADY),
        .m_csr_awvalid(tb3d_pcie_bridge_0_m_csr_AWVALID),
        .m_csr_bready(tb3d_pcie_bridge_0_m_csr_BREADY),
        .m_csr_bresp(tb3d_pcie_bridge_0_m_csr_BRESP),
        .m_csr_bvalid(tb3d_pcie_bridge_0_m_csr_BVALID),
        .m_csr_rdata(tb3d_pcie_bridge_0_m_csr_RDATA),
        .m_csr_rready(tb3d_pcie_bridge_0_m_csr_RREADY),
        .m_csr_rresp(tb3d_pcie_bridge_0_m_csr_RRESP),
        .m_csr_rvalid(tb3d_pcie_bridge_0_m_csr_RVALID),
        .m_csr_wdata(tb3d_pcie_bridge_0_m_csr_WDATA),
        .m_csr_wready(tb3d_pcie_bridge_0_m_csr_WREADY),
        .m_csr_wstrb(tb3d_pcie_bridge_0_m_csr_WSTRB),
        .m_csr_wvalid(tb3d_pcie_bridge_0_m_csr_WVALID),
        .m_dma_araddr(tb3d_pcie_bridge_0_m_dma_ARADDR),
        .m_dma_arburst(tb3d_pcie_bridge_0_m_dma_ARBURST),
        .m_dma_arlen(tb3d_pcie_bridge_0_m_dma_ARLEN),
        .m_dma_arready(tb3d_pcie_bridge_0_m_dma_ARREADY),
        .m_dma_arsize(tb3d_pcie_bridge_0_m_dma_ARSIZE),
        .m_dma_arvalid(tb3d_pcie_bridge_0_m_dma_ARVALID),
        .m_dma_awaddr(tb3d_pcie_bridge_0_m_dma_AWADDR),
        .m_dma_awburst(tb3d_pcie_bridge_0_m_dma_AWBURST),
        .m_dma_awlen(tb3d_pcie_bridge_0_m_dma_AWLEN),
        .m_dma_awready(tb3d_pcie_bridge_0_m_dma_AWREADY),
        .m_dma_awsize(tb3d_pcie_bridge_0_m_dma_AWSIZE),
        .m_dma_awvalid(tb3d_pcie_bridge_0_m_dma_AWVALID),
        .m_dma_bready(tb3d_pcie_bridge_0_m_dma_BREADY),
        .m_dma_bresp(tb3d_pcie_bridge_0_m_dma_BRESP),
        .m_dma_bvalid(tb3d_pcie_bridge_0_m_dma_BVALID),
        .m_dma_rdata(tb3d_pcie_bridge_0_m_dma_RDATA),
        .m_dma_rlast(tb3d_pcie_bridge_0_m_dma_RLAST),
        .m_dma_rready(tb3d_pcie_bridge_0_m_dma_RREADY),
        .m_dma_rresp(tb3d_pcie_bridge_0_m_dma_RRESP),
        .m_dma_rvalid(tb3d_pcie_bridge_0_m_dma_RVALID),
        .m_dma_wdata(tb3d_pcie_bridge_0_m_dma_WDATA),
        .m_dma_wlast(tb3d_pcie_bridge_0_m_dma_WLAST),
        .m_dma_wready(tb3d_pcie_bridge_0_m_dma_WREADY),
        .m_dma_wstrb(tb3d_pcie_bridge_0_m_dma_WSTRB),
        .m_dma_wvalid(tb3d_pcie_bridge_0_m_dma_WVALID),
        .rst_n(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axis_tx_tdata(tb3d_pcie_bridge_0_s_axis_tx_TDATA),
        .s_axis_tx_tkeep(tb3d_pcie_bridge_0_s_axis_tx_TKEEP),
        .s_axis_tx_tlast(tb3d_pcie_bridge_0_s_axis_tx_TLAST),
        .s_axis_tx_tready(tb3d_pcie_bridge_0_s_axis_tx_TREADY),
        .s_axis_tx_tvalid(tb3d_pcie_bridge_0_s_axis_tx_TVALID));
  full_blown_versal_cips_0_0 versal_cips_0
       (.CPM_PCIE_NOC_0_arready(1'b0),
        .CPM_PCIE_NOC_0_awready(1'b0),
        .CPM_PCIE_NOC_0_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_0_bresp({1'b0,1'b0}),
        .CPM_PCIE_NOC_0_bvalid(1'b0),
        .CPM_PCIE_NOC_0_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_0_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_0_rlast(1'b0),
        .CPM_PCIE_NOC_0_rresp({1'b0,1'b0}),
        .CPM_PCIE_NOC_0_ruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_0_rvalid(1'b0),
        .CPM_PCIE_NOC_0_wready(1'b0),
        .CPM_PCIE_NOC_1_arready(1'b0),
        .CPM_PCIE_NOC_1_awready(1'b0),
        .CPM_PCIE_NOC_1_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_1_bresp({1'b0,1'b0}),
        .CPM_PCIE_NOC_1_bvalid(1'b0),
        .CPM_PCIE_NOC_1_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_1_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_1_rlast(1'b0),
        .CPM_PCIE_NOC_1_rresp({1'b0,1'b0}),
        .CPM_PCIE_NOC_1_ruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CPM_PCIE_NOC_1_rvalid(1'b0),
        .CPM_PCIE_NOC_1_wready(1'b0),
        .FPD_CCI_NOC_0_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
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
        .NOC_PMC_AXI_0_araddr(axi_noc_0_M01_AXI_ARADDR),
        .NOC_PMC_AXI_0_arburst(axi_noc_0_M01_AXI_ARBURST),
        .NOC_PMC_AXI_0_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .NOC_PMC_AXI_0_arid(axi_noc_0_M01_AXI_ARID),
        .NOC_PMC_AXI_0_arlen(axi_noc_0_M01_AXI_ARLEN),
        .NOC_PMC_AXI_0_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .NOC_PMC_AXI_0_arprot(axi_noc_0_M01_AXI_ARPROT),
        .NOC_PMC_AXI_0_arqos(axi_noc_0_M01_AXI_ARQOS),
        .NOC_PMC_AXI_0_arready(axi_noc_0_M01_AXI_ARREADY),
        .NOC_PMC_AXI_0_arregion(axi_noc_0_M01_AXI_ARREGION),
        .NOC_PMC_AXI_0_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .NOC_PMC_AXI_0_aruser(axi_noc_0_M01_AXI_ARUSER),
        .NOC_PMC_AXI_0_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .NOC_PMC_AXI_0_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .NOC_PMC_AXI_0_awburst(axi_noc_0_M01_AXI_AWBURST),
        .NOC_PMC_AXI_0_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .NOC_PMC_AXI_0_awid(axi_noc_0_M01_AXI_AWID),
        .NOC_PMC_AXI_0_awlen(axi_noc_0_M01_AXI_AWLEN),
        .NOC_PMC_AXI_0_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .NOC_PMC_AXI_0_awprot(axi_noc_0_M01_AXI_AWPROT),
        .NOC_PMC_AXI_0_awqos(axi_noc_0_M01_AXI_AWQOS),
        .NOC_PMC_AXI_0_awready(axi_noc_0_M01_AXI_AWREADY),
        .NOC_PMC_AXI_0_awregion(axi_noc_0_M01_AXI_AWREGION),
        .NOC_PMC_AXI_0_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .NOC_PMC_AXI_0_awuser(axi_noc_0_M01_AXI_AWUSER),
        .NOC_PMC_AXI_0_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .NOC_PMC_AXI_0_bid(axi_noc_0_M01_AXI_BID),
        .NOC_PMC_AXI_0_bready(axi_noc_0_M01_AXI_BREADY),
        .NOC_PMC_AXI_0_bresp(axi_noc_0_M01_AXI_BRESP),
        .NOC_PMC_AXI_0_bvalid(axi_noc_0_M01_AXI_BVALID),
        .NOC_PMC_AXI_0_rdata(axi_noc_0_M01_AXI_RDATA),
        .NOC_PMC_AXI_0_rid(axi_noc_0_M01_AXI_RID),
        .NOC_PMC_AXI_0_rlast(axi_noc_0_M01_AXI_RLAST),
        .NOC_PMC_AXI_0_rready(axi_noc_0_M01_AXI_RREADY),
        .NOC_PMC_AXI_0_rresp(axi_noc_0_M01_AXI_RRESP),
        .NOC_PMC_AXI_0_ruser(axi_noc_0_M01_AXI_RUSER),
        .NOC_PMC_AXI_0_rvalid(axi_noc_0_M01_AXI_RVALID),
        .NOC_PMC_AXI_0_wdata(axi_noc_0_M01_AXI_WDATA),
        .NOC_PMC_AXI_0_wid({1'b0,1'b0,1'b0,1'b0}),
        .NOC_PMC_AXI_0_wlast(axi_noc_0_M01_AXI_WLAST),
        .NOC_PMC_AXI_0_wready(axi_noc_0_M01_AXI_WREADY),
        .NOC_PMC_AXI_0_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .NOC_PMC_AXI_0_wuser(axi_noc_0_M01_AXI_WUSER),
        .NOC_PMC_AXI_0_wvalid(axi_noc_0_M01_AXI_WVALID),
        .PCIE0_GT_grx_n({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCIE0_GT_grx_p({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .cpm_irq0(axi_fifo_mm_s_interrupt),
        .cpm_irq1(1'b0),
        .dma0_dsc_crdt_in_crdt({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_dsc_crdt_in_dir(1'b0),
        .dma0_dsc_crdt_in_fence(1'b0),
        .dma0_dsc_crdt_in_qid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_dsc_crdt_in_valid(1'b0),
        .dma0_intrfc_clk(microblaze_0_Clk),
        .dma0_intrfc_resetn(1'b1),
        .dma0_m_axis_h2c_tready(1'b1),
        .dma0_mgmt_cpl_rdy(1'b1),
        .dma0_mgmt_req_adr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_cmd({1'b0,1'b0}),
        .dma0_mgmt_req_dat({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_fnc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_msc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_vld(1'b0),
        .dma0_qsts_out_rdy(1'b0),
        .dma0_s_axis_c2h_cmpt_cmpt_type({1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_col_idx({1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_dpar({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_err_idx({1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_marker(1'b0),
        .dma0_s_axis_c2h_cmpt_no_wrb_marker(1'b0),
        .dma0_s_axis_c2h_cmpt_port_id({1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_qid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_size({1'b0,1'b0}),
        .dma0_s_axis_c2h_cmpt_tvalid(1'b0),
        .dma0_s_axis_c2h_cmpt_user_trig(1'b0),
        .dma0_s_axis_c2h_cmpt_wait_pld_pkt_id({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_s_axis_c2h_ctrl_has_cmpt(tb3d_engine_top_0_vec_nibble_pairs_o[0]),
        .dma0_s_axis_c2h_ctrl_len(tb3d_engine_top_0_vec_nibble_pairs_o[15:0]),
        .dma0_s_axis_c2h_ctrl_marker(tb3d_engine_top_0_vec_nibble_pairs_o[0]),
        .dma0_s_axis_c2h_ctrl_port_id(tb3d_engine_top_0_vec_tb3d_bytes_o[2:0]),
        .dma0_s_axis_c2h_ctrl_qid(tb3d_engine_top_0_vec_tb3d_bytes_o[11:0]),
        .dma0_s_axis_c2h_ecc(tb3d_engine_top_0_vec_nibble_pairs_o[6:0]),
        .dma0_s_axis_c2h_mty(tb3d_engine_top_0_vec_nibble_pairs_o[5:0]),
        .dma0_s_axis_c2h_tcrc(tb3d_engine_top_0_vec_nibble_pairs_o[31:0]),
        .dma0_s_axis_c2h_tdata(tb3d_engine_top_0_vec_nibble_pairs_o),
        .dma0_s_axis_c2h_tlast(tb3d_engine_top_0_vec_tb3d_bytes_o[0]),
        .dma0_s_axis_c2h_tvalid(tb3d_engine_top_0_vec_tb3d_bytes_o[0]),
        .dma0_st_rx_msg_tdata(versal_cips_0_dma0_st_rx_msg_TDATA),
        .dma0_st_rx_msg_tlast(versal_cips_0_dma0_st_rx_msg_TLAST),
        .dma0_st_rx_msg_tready(versal_cips_0_dma0_st_rx_msg_TREADY),
        .dma0_st_rx_msg_tvalid(versal_cips_0_dma0_st_rx_msg_TVALID),
        .dma0_tm_dsc_sts_rdy(1'b1),
        .dma0_usr_flr_done_fnc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_usr_flr_done_vld(1'b0),
        .dma0_usr_irq_fnc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_usr_irq_valid(1'b0),
        .dma0_usr_irq_vec({tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req,tb3d_engine_top_0_intr_req}),
        .fpd_cci_noc_axi0_clk(versal_cips_0_fpd_cci_noc_axi0_clk),
        .fpd_cci_noc_axi1_clk(versal_cips_0_fpd_cci_noc_axi1_clk),
        .fpd_cci_noc_axi2_clk(versal_cips_0_fpd_cci_noc_axi2_clk),
        .fpd_cci_noc_axi3_clk(versal_cips_0_fpd_cci_noc_axi3_clk),
        .gt_refclk0_clk_n(gt_refclk0_0_clk_n),
        .gt_refclk0_clk_p(gt_refclk0_0_clk_p),
        .lpd_axi_noc_clk(versal_cips_0_lpd_axi_noc_clk),
        .noc_pmc_axi_axi0_clk(versal_cips_0_noc_pmc_axi_axi0_clk),
        .pmc_axi_noc_axi0_clk(versal_cips_0_pmc_axi_noc_axi0_clk));
endmodule

module microblaze_0_local_memory_imp_M2YEZC
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
    SYS_Rst);
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
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
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
  wire [0:39]microblaze_0_dlmb_cntlr_DIN;
  wire [39:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:4]microblaze_0_dlmb_cntlr_WE;
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
  wire [0:39]microblaze_0_ilmb_cntlr_DIN;
  wire [39:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:4]microblaze_0_ilmb_cntlr_WE;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00010000 40 > full_blown microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  full_blown_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[39],microblaze_0_dlmb_cntlr_DOUT[38],microblaze_0_dlmb_cntlr_DOUT[37],microblaze_0_dlmb_cntlr_DOUT[36],microblaze_0_dlmb_cntlr_DOUT[35],microblaze_0_dlmb_cntlr_DOUT[34],microblaze_0_dlmb_cntlr_DOUT[33],microblaze_0_dlmb_cntlr_DOUT[32],microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
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
  full_blown_dlmb_v10_0 dlmb_v10
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
        .M_ABus(DLMB_abus),
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
  full_blown_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[39],microblaze_0_ilmb_cntlr_DOUT[38],microblaze_0_ilmb_cntlr_DOUT[37],microblaze_0_ilmb_cntlr_DOUT[36],microblaze_0_ilmb_cntlr_DOUT[35],microblaze_0_ilmb_cntlr_DOUT[34],microblaze_0_ilmb_cntlr_DOUT[33],microblaze_0_ilmb_cntlr_DOUT[32],microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
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
  full_blown_ilmb_v10_0 ilmb_v10
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
  full_blown_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31],microblaze_0_dlmb_cntlr_DIN[32],microblaze_0_dlmb_cntlr_DIN[33],microblaze_0_dlmb_cntlr_DIN[34],microblaze_0_dlmb_cntlr_DIN[35],microblaze_0_dlmb_cntlr_DIN[36],microblaze_0_dlmb_cntlr_DIN[37],microblaze_0_dlmb_cntlr_DIN[38],microblaze_0_dlmb_cntlr_DIN[39]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31],microblaze_0_ilmb_cntlr_DIN[32],microblaze_0_ilmb_cntlr_DIN[33],microblaze_0_ilmb_cntlr_DIN[34],microblaze_0_ilmb_cntlr_DIN[35],microblaze_0_ilmb_cntlr_DIN[36],microblaze_0_ilmb_cntlr_DIN[37],microblaze_0_ilmb_cntlr_DIN[38],microblaze_0_ilmb_cntlr_DIN[39]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3],microblaze_0_dlmb_cntlr_WE[4]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3],microblaze_0_ilmb_cntlr_WE[4]}));
endmodule
