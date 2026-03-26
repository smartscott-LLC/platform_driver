// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
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


// IP VLNV: xilinx.com:module_ref:tb3d_pcie_bridge:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module full_blown_tb3d_pcie_bridge_0_0 (
  clk,
  rst_n,
  completer_id,
  m_axis_rx_tdata,
  m_axis_rx_tkeep,
  m_axis_rx_tlast,
  m_axis_rx_tvalid,
  m_axis_rx_tready,
  m_axis_rx_tuser,
  s_axis_tx_tdata,
  s_axis_tx_tkeep,
  s_axis_tx_tlast,
  s_axis_tx_tvalid,
  s_axis_tx_tready,
  s_axis_tx_tuser,
  m_csr_awaddr,
  m_csr_awvalid,
  m_csr_awready,
  m_csr_wdata,
  m_csr_wstrb,
  m_csr_wvalid,
  m_csr_wready,
  m_csr_bresp,
  m_csr_bvalid,
  m_csr_bready,
  m_csr_araddr,
  m_csr_arvalid,
  m_csr_arready,
  m_csr_rdata,
  m_csr_rresp,
  m_csr_rvalid,
  m_csr_rready,
  m_dma_araddr,
  m_dma_arlen,
  m_dma_arsize,
  m_dma_arburst,
  m_dma_arvalid,
  m_dma_arready,
  m_dma_rdata,
  m_dma_rresp,
  m_dma_rlast,
  m_dma_rvalid,
  m_dma_rready,
  m_dma_awaddr,
  m_dma_awlen,
  m_dma_awsize,
  m_dma_awburst,
  m_dma_awvalid,
  m_dma_awready,
  m_dma_wdata,
  m_dma_wstrb,
  m_dma_wlast,
  m_dma_wvalid,
  m_dma_wready,
  m_dma_bresp,
  m_dma_bvalid,
  m_dma_bready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_axis_rx:s_axis_tx:m_csr:m_dma, FREQ_HZ 300000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire rst_n;
input wire [15 : 0] completer_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 22, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [63 : 0] m_axis_rx_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP" *)
input wire [7 : 0] m_axis_rx_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TLAST" *)
input wire m_axis_rx_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TVALID" *)
input wire m_axis_rx_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TREADY" *)
output wire m_axis_rx_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TUSER" *)
input wire [21 : 0] m_axis_rx_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_tx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [63 : 0] s_axis_tx_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP" *)
output wire [7 : 0] s_axis_tx_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TLAST" *)
output wire s_axis_tx_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TVALID" *)
output wire s_axis_tx_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TREADY" *)
input wire s_axis_tx_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TUSER" *)
output wire [3 : 0] s_axis_tx_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr AWADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_csr, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, NUM_READ_THREADS 1, NUM_\
WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire [15 : 0] m_csr_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr AWVALID" *)
output wire m_csr_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr AWREADY" *)
input wire m_csr_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr WDATA" *)
output wire [31 : 0] m_csr_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr WSTRB" *)
output wire [3 : 0] m_csr_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr WVALID" *)
output wire m_csr_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr WREADY" *)
input wire m_csr_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr BRESP" *)
input wire [1 : 0] m_csr_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr BVALID" *)
input wire m_csr_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr BREADY" *)
output wire m_csr_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr ARADDR" *)
output wire [15 : 0] m_csr_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr ARVALID" *)
output wire m_csr_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr ARREADY" *)
input wire m_csr_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr RDATA" *)
input wire [31 : 0] m_csr_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr RRESP" *)
input wire [1 : 0] m_csr_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr RVALID" *)
input wire m_csr_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_csr RREADY" *)
output wire m_csr_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_dma, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 300000000, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0, NUM_READ_THREADS 1, NUM_WR\
ITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire [63 : 0] m_dma_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARLEN" *)
output wire [7 : 0] m_dma_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARSIZE" *)
output wire [2 : 0] m_dma_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARBURST" *)
output wire [1 : 0] m_dma_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARVALID" *)
output wire m_dma_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma ARREADY" *)
input wire m_dma_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma RDATA" *)
input wire [63 : 0] m_dma_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma RRESP" *)
input wire [1 : 0] m_dma_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma RLAST" *)
input wire m_dma_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma RVALID" *)
input wire m_dma_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma RREADY" *)
output wire m_dma_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWADDR" *)
output wire [63 : 0] m_dma_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWLEN" *)
output wire [7 : 0] m_dma_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWSIZE" *)
output wire [2 : 0] m_dma_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWBURST" *)
output wire [1 : 0] m_dma_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWVALID" *)
output wire m_dma_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma AWREADY" *)
input wire m_dma_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma WDATA" *)
output wire [63 : 0] m_dma_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma WSTRB" *)
output wire [7 : 0] m_dma_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma WLAST" *)
output wire m_dma_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma WVALID" *)
output wire m_dma_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma WREADY" *)
input wire m_dma_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma BRESP" *)
input wire [1 : 0] m_dma_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma BVALID" *)
input wire m_dma_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dma BREADY" *)
output wire m_dma_bready;

  tb3d_pcie_bridge inst (
    .clk(clk),
    .rst_n(rst_n),
    .completer_id(completer_id),
    .m_axis_rx_tdata(m_axis_rx_tdata),
    .m_axis_rx_tkeep(m_axis_rx_tkeep),
    .m_axis_rx_tlast(m_axis_rx_tlast),
    .m_axis_rx_tvalid(m_axis_rx_tvalid),
    .m_axis_rx_tready(m_axis_rx_tready),
    .m_axis_rx_tuser(m_axis_rx_tuser),
    .s_axis_tx_tdata(s_axis_tx_tdata),
    .s_axis_tx_tkeep(s_axis_tx_tkeep),
    .s_axis_tx_tlast(s_axis_tx_tlast),
    .s_axis_tx_tvalid(s_axis_tx_tvalid),
    .s_axis_tx_tready(s_axis_tx_tready),
    .s_axis_tx_tuser(s_axis_tx_tuser),
    .m_csr_awaddr(m_csr_awaddr),
    .m_csr_awvalid(m_csr_awvalid),
    .m_csr_awready(m_csr_awready),
    .m_csr_wdata(m_csr_wdata),
    .m_csr_wstrb(m_csr_wstrb),
    .m_csr_wvalid(m_csr_wvalid),
    .m_csr_wready(m_csr_wready),
    .m_csr_bresp(m_csr_bresp),
    .m_csr_bvalid(m_csr_bvalid),
    .m_csr_bready(m_csr_bready),
    .m_csr_araddr(m_csr_araddr),
    .m_csr_arvalid(m_csr_arvalid),
    .m_csr_arready(m_csr_arready),
    .m_csr_rdata(m_csr_rdata),
    .m_csr_rresp(m_csr_rresp),
    .m_csr_rvalid(m_csr_rvalid),
    .m_csr_rready(m_csr_rready),
    .m_dma_araddr(m_dma_araddr),
    .m_dma_arlen(m_dma_arlen),
    .m_dma_arsize(m_dma_arsize),
    .m_dma_arburst(m_dma_arburst),
    .m_dma_arvalid(m_dma_arvalid),
    .m_dma_arready(m_dma_arready),
    .m_dma_rdata(m_dma_rdata),
    .m_dma_rresp(m_dma_rresp),
    .m_dma_rlast(m_dma_rlast),
    .m_dma_rvalid(m_dma_rvalid),
    .m_dma_rready(m_dma_rready),
    .m_dma_awaddr(m_dma_awaddr),
    .m_dma_awlen(m_dma_awlen),
    .m_dma_awsize(m_dma_awsize),
    .m_dma_awburst(m_dma_awburst),
    .m_dma_awvalid(m_dma_awvalid),
    .m_dma_awready(m_dma_awready),
    .m_dma_wdata(m_dma_wdata),
    .m_dma_wstrb(m_dma_wstrb),
    .m_dma_wlast(m_dma_wlast),
    .m_dma_wvalid(m_dma_wvalid),
    .m_dma_wready(m_dma_wready),
    .m_dma_bresp(m_dma_bresp),
    .m_dma_bvalid(m_dma_bvalid),
    .m_dma_bready(m_dma_bready)
  );
endmodule
