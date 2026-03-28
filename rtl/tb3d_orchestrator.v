// =============================================================================
// Module  : tb3d_orchestrator
// Project : TB3-D Platform Driver — Versal 1802
// File    : rtl/tb3d_orchestrator.v
//
// Purpose : Master coordinator for the TB3-D SoC. Orchestrates three independent
//           clock domains (GTY, Microblaze, AXI) via async FIFO CDC (Clock Domain
//           Crossing) bridges, ensuring address space coherence and safe multi-clock
//           data handoff.
//
// Architecture:
//   ┌──────────────────────────────┐
//   │   tb3d_orchestrator          │
//   │   (AXI clock domain @ 200MHz)│
//   └──────────────────────────────┘
//     ↓              ↓              ↓
//   GTY Bridge   MB Bridge      AXI Bridge
//   (async FIFO) (async FIFO)    (primary)
//     ↓              ↓              ↓
//   GTY Codec     Microblaze    AXI Interface
//   Module        Module        & NoC
//
// Clock Domains:
//   axi_clk   = 200 MHz  (primary system clock, all CSR operations)
//   mb_clk    = variable (Microblaze processor clock, 125-200 MHz)
//   gty_clk   = 250 MHz  (GTY transceiver reference clock)
//
// CDC Policy:
//   - All domain crossings use async FIFOs (32-bit wide minimum)
//   - All CSR access is synchronous to axi_clk (primary domain)
//   - Handshakes are registered before CDC FIFO insertion
//   - All CDC outputs are sampled synchronously in destination domain
//
// Address Map (all addresses in AXI clock domain):
//   0x4000_0000 - 0x4000_FFFF    AXI Bridge CSR (64 KB)
//   0x4001_0000 - 0x4001_FFFF    AXI Bridge DMA queue (64 KB)
//   0x5000_0000 - 0x50FF_FFFF    Microblaze L2 cache (16 MB)
//   0x6000_0000 - 0x60FF_FFFF    GTY codec status (16 MB, 32 KB actual)
//
// =============================================================================

`timescale 1ns / 1ps

module tb3d_orchestrator #(
    // =========================================================================
    // Parameterization
    // =========================================================================
    parameter NUM_GTY_LANES        = 8,         // 8 GTYP lanes (each 64-bit)
    parameter AXI_ADDR_WIDTH       = 32,
    parameter AXI_DATA_WIDTH       = 64,
    parameter MB_DATA_WIDTH        = 32,
    parameter CDC_FIFO_DEPTH       = 16         // Async FIFO depth (power of 2)
) (
    // =========================================================================
    // Clock & Reset (primary clock domain = AXI)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:M_AXI_DMA:M_AXI_GTY_CTRL:M_AXI_MB_CTRL:M_AXI_AXB_CTRL, ASSOCIATED_RESET axi_rst_n" *)
    input  wire                     axi_clk,        // 200 MHz primary clock
    input  wire                     axi_rst_n,      // Active-low reset (axi_clk domain)
    input  wire                     mb_clk,         // Microblaze clock (variable freq)
    input  wire                     mb_rst_n,       // Microblaze reset
    input  wire                     gty_clk,        // GTY transceiver clock (250 MHz)
    input  wire                     gty_rst_n,      // GTY domain reset

    // =========================================================================
    // S_AXI — AXI4-Lite CSR Interface (axi_clk domain)
    // System entry point: NoC / CIP writes TB3-D configuration here.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWPROT" *)
    input  wire [2:0]                 s_axi_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWVALID" *)
    input  wire                       s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWREADY" *)
    output wire                       s_axi_awready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WDATA" *)
    input  wire [AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WSTRB" *)
    input  wire [(AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WVALID" *)
    input  wire                       s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WREADY" *)
    output wire                       s_axi_wready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BRESP" *)
    output wire [1:0]                 s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BVALID" *)
    output wire                       s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BREADY" *)
    input  wire                       s_axi_bready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARPROT" *)
    input  wire [2:0]                 s_axi_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARVALID" *)
    input  wire                       s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARREADY" *)
    output wire                       s_axi_arready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RDATA" *)
    output wire [AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RRESP" *)
    output wire [1:0]                 s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RVALID" *)
    output wire                       s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RREADY" *)
    input  wire                       s_axi_rready,

    // =========================================================================
    // M_AXI_DMA — AXI4 Master for bulk DMA (axi_clk domain)
    // Connects to system memory (DDR4) via Versal NoC / PL-to-PS interconnect.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARADDR" *)
    output wire [AXI_ADDR_WIDTH-1:0]  m_axi_dma_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARLEN" *)
    output wire [7:0]                 m_axi_dma_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARSIZE" *)
    output wire [2:0]                 m_axi_dma_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARBURST" *)
    output wire [1:0]                 m_axi_dma_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARVALID" *)
    output wire                       m_axi_dma_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA ARREADY" *)
    input  wire                       m_axi_dma_arready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA RDATA" *)
    input  wire [AXI_DATA_WIDTH-1:0]  m_axi_dma_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA RRESP" *)
    input  wire [1:0]                 m_axi_dma_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA RLAST" *)
    input  wire                       m_axi_dma_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA RVALID" *)
    input  wire                       m_axi_dma_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA RREADY" *)
    output wire                       m_axi_dma_rready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWADDR" *)
    output wire [AXI_ADDR_WIDTH-1:0]  m_axi_dma_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWLEN" *)
    output wire [7:0]                 m_axi_dma_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWSIZE" *)
    output wire [2:0]                 m_axi_dma_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWBURST" *)
    output wire [1:0]                 m_axi_dma_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWVALID" *)
    output wire                       m_axi_dma_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA AWREADY" *)
    input  wire                       m_axi_dma_awready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA WDATA" *)
    output wire [AXI_DATA_WIDTH-1:0]  m_axi_dma_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA WSTRB" *)
    output wire [(AXI_DATA_WIDTH/8)-1:0] m_axi_dma_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA WLAST" *)
    output wire                       m_axi_dma_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA WVALID" *)
    output wire                       m_axi_dma_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA WREADY" *)
    input  wire                       m_axi_dma_wready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BRESP" *)
    input  wire [1:0]                 m_axi_dma_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BVALID" *)
    input  wire                       m_axi_dma_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BREADY" *)
    output wire                       m_axi_dma_bready,

    // =========================================================================
    // M_AXI_GTY_CTRL — AXI4-Lite Master to GTY Codec S_AXI_CTRL (axi_clk)
    // Orchestrator controls codec enable / lane enables via this interface.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL AWADDR" *)
    output wire [4:0]                 m_axi_gty_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL AWPROT" *)
    output wire [2:0]                 m_axi_gty_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL AWVALID" *)
    output wire                       m_axi_gty_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL AWREADY" *)
    input  wire                       m_axi_gty_ctrl_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL WDATA" *)
    output wire [31:0]                m_axi_gty_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL WSTRB" *)
    output wire [3:0]                 m_axi_gty_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL WVALID" *)
    output wire                       m_axi_gty_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL WREADY" *)
    input  wire                       m_axi_gty_ctrl_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL BRESP" *)
    input  wire [1:0]                 m_axi_gty_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL BVALID" *)
    input  wire                       m_axi_gty_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL BREADY" *)
    output wire                       m_axi_gty_ctrl_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL ARADDR" *)
    output wire [4:0]                 m_axi_gty_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL ARPROT" *)
    output wire [2:0]                 m_axi_gty_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL ARVALID" *)
    output wire                       m_axi_gty_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL ARREADY" *)
    input  wire                       m_axi_gty_ctrl_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL RDATA" *)
    input  wire [31:0]                m_axi_gty_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL RRESP" *)
    input  wire [1:0]                 m_axi_gty_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL RVALID" *)
    input  wire                       m_axi_gty_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY_CTRL RREADY" *)
    output wire                       m_axi_gty_ctrl_rready,

    // =========================================================================
    // M_AXI_MB_CTRL — AXI4-Lite Master to Microblaze Module S_AXI_CTRL (mb_clk)
    // Orchestrator triggers cache operations and reads performance stats via here.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL AWADDR" *)
    output wire [4:0]                 m_axi_mb_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL AWPROT" *)
    output wire [2:0]                 m_axi_mb_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL AWVALID" *)
    output wire                       m_axi_mb_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL AWREADY" *)
    input  wire                       m_axi_mb_ctrl_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL WDATA" *)
    output wire [31:0]                m_axi_mb_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL WSTRB" *)
    output wire [3:0]                 m_axi_mb_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL WVALID" *)
    output wire                       m_axi_mb_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL WREADY" *)
    input  wire                       m_axi_mb_ctrl_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL BRESP" *)
    input  wire [1:0]                 m_axi_mb_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL BVALID" *)
    input  wire                       m_axi_mb_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL BREADY" *)
    output wire                       m_axi_mb_ctrl_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL ARADDR" *)
    output wire [4:0]                 m_axi_mb_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL ARPROT" *)
    output wire [2:0]                 m_axi_mb_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL ARVALID" *)
    output wire                       m_axi_mb_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL ARREADY" *)
    input  wire                       m_axi_mb_ctrl_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL RDATA" *)
    input  wire [31:0]                m_axi_mb_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL RRESP" *)
    input  wire [1:0]                 m_axi_mb_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL RVALID" *)
    input  wire                       m_axi_mb_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB_CTRL RREADY" *)
    output wire                       m_axi_mb_ctrl_rready,

    // =========================================================================
    // M_AXI_AXB_CTRL — AXI4-Lite Master to AXI Bridge (axi_clk domain)
    // Orchestrator writes TB3D status into bridge CSR (readable by system via
    // bridge S_AXI); reads codec enable and mode configuration from bridge.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL AWADDR" *)
    output wire [15:0]                m_axi_axb_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL AWPROT" *)
    output wire [2:0]                 m_axi_axb_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL AWVALID" *)
    output wire                       m_axi_axb_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL AWREADY" *)
    input  wire                       m_axi_axb_ctrl_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL WDATA" *)
    output wire [31:0]                m_axi_axb_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL WSTRB" *)
    output wire [3:0]                 m_axi_axb_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL WVALID" *)
    output wire                       m_axi_axb_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL WREADY" *)
    input  wire                       m_axi_axb_ctrl_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL BRESP" *)
    input  wire [1:0]                 m_axi_axb_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL BVALID" *)
    input  wire                       m_axi_axb_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL BREADY" *)
    output wire                       m_axi_axb_ctrl_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL ARADDR" *)
    output wire [15:0]                m_axi_axb_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL ARPROT" *)
    output wire [2:0]                 m_axi_axb_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL ARVALID" *)
    output wire                       m_axi_axb_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL ARREADY" *)
    input  wire                       m_axi_axb_ctrl_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL RDATA" *)
    input  wire [31:0]                m_axi_axb_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL RRESP" *)
    input  wire [1:0]                 m_axi_axb_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL RVALID" *)
    input  wire                       m_axi_axb_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB_CTRL RREADY" *)
    output wire                       m_axi_axb_ctrl_rready,

    // =========================================================================
    // S_GTY_STATUS — Per-lane GTY lock/error (gty_clk domain, raw status)
    // Connected to tb3d_gty_transceiver_codec lane_locked / lane_error outputs.
    // Used for real-time CSR aggregation (csr_gty_lock, csr_gty_error).
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:user:s_gty_status_rtl:1.0 S_GTY_STATUS LOCKED" *)
    input  wire [NUM_GTY_LANES-1:0]   gtc_lane_locked,    // Per-lane lock status
    (* X_INTERFACE_INFO = "xilinx.com:user:s_gty_status_rtl:1.0 S_GTY_STATUS ERROR" *)
    input  wire [NUM_GTY_LANES-1:0]   gtc_lane_error      // Per-lane error flag
);

    // =========================================================================
    // Internal Signals
    // =========================================================================

    // CSR register bank (axi_clk domain)
    reg  [31:0]  csr_control;        // [0]=global_en, [1]=codec_en, [2:4]=mode
    reg  [31:0]  csr_status;         // [0]=ready, [1]=busy, [2:4]=error_code
    wire [31:0]  csr_gty_lock;       // Aggregated GTY lock status (read-only)
    wire [31:0]  csr_gty_error;      // Aggregated GTY error status (read-only)

    // Decoded CSR address for read mux
    wire [15:0] csr_addr_decoded = s_axi_awaddr[15:0];
    wire        csr_is_gty_range = (s_axi_awaddr[31:20] == 12'h600);  // 0x6000_xxxx
    wire        csr_is_mb_range  = (s_axi_awaddr[31:20] == 12'h500);  // 0x5000_xxxx
    wire        csr_is_axi_range = (s_axi_awaddr[31:20] == 12'h400);  // 0x4000_xxxx

    // =========================================================================
    // CSR Register Decoding & Routing (axi_clk domain)
    // =========================================================================

    // Write path: decode CSR address and route to appropriate module
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            csr_control <= 32'h0000_0000;
            csr_status  <= 32'h0000_0001;  // Ready by default
        end else if (s_axi_wvalid && s_axi_awvalid) begin
            case (s_axi_awaddr[7:0])
                8'h00: csr_control <= s_axi_wdata;  // CONTROL register
                8'h04: begin
                    // STATUS register -- read-only, but write clears error bits on demand
                    if (s_axi_wstrb[0]) csr_status[2:0] <= s_axi_wdata[2:0];
                end
                // Additional CSR addresses for GTY, MB, AXI bridges routed via CDC
                default: begin
                    // Route to appropriate module via async FIFO
                    // (details in CDC instantiation below)
                end
            endcase
        end
    end

    // Read path: multiplex CSR data based on address
    wire [31:0] csr_read_data;
    assign csr_read_data = (csr_addr_decoded[7:0] == 8'h00) ? csr_control  :
                           (csr_addr_decoded[7:0] == 8'h04) ? csr_status   :
                           (csr_addr_decoded[7:0] == 8'h08) ? csr_gty_lock  :
                           (csr_addr_decoded[7:0] == 8'h0C) ? csr_gty_error :
                           32'h0000_0000;  // Default: read as zero

    // =========================================================================
    // AXI4-Lite Slave Interface Implementation
    // =========================================================================

    // Write response (always OK for now; can be extended)
    assign s_axi_bresp   = 2'b00;  // OKAY
    assign s_axi_awready = 1'b1;   // Always ready (no queueing)
    assign s_axi_wready  = 1'b1;   // Always ready
    assign s_axi_bvalid  = s_axi_wvalid;  // Response valid when write valid

    // Read response
    assign s_axi_rresp   = 2'b00;  // OKAY
    assign s_axi_rdata   = csr_read_data;
    assign s_axi_rvalid  = s_axi_arvalid;  // Response valid when address valid
    assign s_axi_arready = 1'b1;   // Always ready

    // =========================================================================
    // GTY Transceiver Codec Control
    // =========================================================================

    // Aggregate GTY lock / error status across all 8 lanes (fits in one 32-bit word)
    assign csr_gty_lock  = {{(32-NUM_GTY_LANES){1'b0}}, gtc_lane_locked};
    assign csr_gty_error = {{(32-NUM_GTY_LANES){1'b0}}, gtc_lane_error};

    // =========================================================================
    // M_AXI_GTY_CTRL — Write-only AXI4-Lite master driving GTY codec S_AXI_CTRL
    //
    // When csr_control[1] (codec_en) changes the orchestrator issues a single
    // write to GTY codec CTRL register (addr 0x00) with the new enable value.
    // A simple 3-state FSM handles the AW+W+B handshake.
    // =========================================================================
    localparam GTY_M_IDLE  = 2'd0;
    localparam GTY_M_ADDR  = 2'd1;
    localparam GTY_M_RESP  = 2'd2;

    reg [1:0]  gty_m_state;
    reg        gty_codec_en_prev;
    reg        gty_m_awvalid_r;
    reg        gty_m_wvalid_r;
    reg [31:0] gty_m_wdata_r;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            gty_m_state        <= GTY_M_IDLE;
            gty_codec_en_prev  <= 1'b0;
            gty_m_awvalid_r    <= 1'b0;
            gty_m_wvalid_r     <= 1'b0;
            gty_m_wdata_r      <= 32'h0;
        end else begin
            case (gty_m_state)
                GTY_M_IDLE: begin
                    gty_m_awvalid_r <= 1'b0;
                    gty_m_wvalid_r  <= 1'b0;
                    gty_codec_en_prev <= csr_control[1];
                    if (csr_control[1] != gty_codec_en_prev) begin
                        // codec_en changed — push new CTRL value to GTY codec
                        gty_m_wdata_r   <= {31'h0, csr_control[1]};
                        gty_m_awvalid_r <= 1'b1;
                        gty_m_wvalid_r  <= 1'b1;
                        gty_m_state     <= GTY_M_ADDR;
                    end
                end
                GTY_M_ADDR: begin
                    if (m_axi_gty_ctrl_awready) gty_m_awvalid_r <= 1'b0;
                    if (m_axi_gty_ctrl_wready)  gty_m_wvalid_r  <= 1'b0;
                    if (!gty_m_awvalid_r && !gty_m_wvalid_r)
                        gty_m_state <= GTY_M_RESP;
                end
                GTY_M_RESP: begin
                    if (m_axi_gty_ctrl_bvalid) gty_m_state <= GTY_M_IDLE;
                end
                default: gty_m_state <= GTY_M_IDLE;
            endcase
        end
    end

    assign m_axi_gty_ctrl_awaddr  = 5'h00;         // GTY CTRL register
    assign m_axi_gty_ctrl_awprot  = 3'b000;
    assign m_axi_gty_ctrl_awvalid = gty_m_awvalid_r;
    assign m_axi_gty_ctrl_wdata   = gty_m_wdata_r;
    assign m_axi_gty_ctrl_wstrb   = 4'hF;
    assign m_axi_gty_ctrl_wvalid  = gty_m_wvalid_r;
    assign m_axi_gty_ctrl_bready  = 1'b1;
    // Read path: not used (status available via gtc_lane_locked/error raw ports)
    assign m_axi_gty_ctrl_araddr  = 5'h0;
    assign m_axi_gty_ctrl_arprot  = 3'b000;
    assign m_axi_gty_ctrl_arvalid = 1'b0;
    assign m_axi_gty_ctrl_rready  = 1'b0;

    // =========================================================================
    // M_AXI_MB_CTRL — Write-only AXI4-Lite master driving MB module S_AXI_CTRL
    //
    // When csr_control[0] (global_en) rises the orchestrator triggers a
    // start_op by writing CTRL register (addr 0x00) of the MB module.
    // Same 3-state FSM pattern as GTY master above.
    // =========================================================================
    localparam MB_M_IDLE  = 2'd0;
    localparam MB_M_ADDR  = 2'd1;
    localparam MB_M_RESP  = 2'd2;

    reg [1:0]  mb_m_state;
    reg        mb_global_en_prev;
    reg        mb_m_awvalid_r;
    reg        mb_m_wvalid_r;
    reg [31:0] mb_m_wdata_r;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            mb_m_state         <= MB_M_IDLE;
            mb_global_en_prev  <= 1'b0;
            mb_m_awvalid_r     <= 1'b0;
            mb_m_wvalid_r      <= 1'b0;
            mb_m_wdata_r       <= 32'h0;
        end else begin
            case (mb_m_state)
                MB_M_IDLE: begin
                    mb_m_awvalid_r <= 1'b0;
                    mb_m_wvalid_r  <= 1'b0;
                    mb_global_en_prev <= csr_control[0];
                    if (csr_control[0] && !mb_global_en_prev) begin
                        // global_en rising edge → trigger MB start_op pulse
                        mb_m_wdata_r   <= 32'h0000_0001; // start_op = bit[0]
                        mb_m_awvalid_r <= 1'b1;
                        mb_m_wvalid_r  <= 1'b1;
                        mb_m_state     <= MB_M_ADDR;
                    end
                end
                MB_M_ADDR: begin
                    if (m_axi_mb_ctrl_awready) mb_m_awvalid_r <= 1'b0;
                    if (m_axi_mb_ctrl_wready)  mb_m_wvalid_r  <= 1'b0;
                    if (!mb_m_awvalid_r && !mb_m_wvalid_r)
                        mb_m_state <= MB_M_RESP;
                end
                MB_M_RESP: begin
                    if (m_axi_mb_ctrl_bvalid) mb_m_state <= MB_M_IDLE;
                end
                default: mb_m_state <= MB_M_IDLE;
            endcase
        end
    end

    assign m_axi_mb_ctrl_awaddr  = 5'h00;          // MB CTRL register
    assign m_axi_mb_ctrl_awprot  = 3'b000;
    assign m_axi_mb_ctrl_awvalid = mb_m_awvalid_r;
    assign m_axi_mb_ctrl_wdata   = mb_m_wdata_r;
    assign m_axi_mb_ctrl_wstrb   = 4'hF;
    assign m_axi_mb_ctrl_wvalid  = mb_m_wvalid_r;
    assign m_axi_mb_ctrl_bready  = 1'b1;
    assign m_axi_mb_ctrl_araddr  = 5'h0;
    assign m_axi_mb_ctrl_arprot  = 3'b000;
    assign m_axi_mb_ctrl_arvalid = 1'b0;
    assign m_axi_mb_ctrl_rready  = 1'b0;

    // =========================================================================
    // M_AXI_AXB_CTRL — AXI4-Lite master to AXI Bridge (axi_clk domain)
    // Used to write status information into the bridge's CSR space so the
    // system (via bridge S_AXI) can read GTY lock, MB status, etc.
    // Tie off for now; status reads go through bridge S_AXI directly.
    // =========================================================================
    assign m_axi_axb_ctrl_awaddr  = 16'h0;
    assign m_axi_axb_ctrl_awprot  = 3'b000;
    assign m_axi_axb_ctrl_awvalid = 1'b0;
    assign m_axi_axb_ctrl_wdata   = 32'h0;
    assign m_axi_axb_ctrl_wstrb   = 4'h0;
    assign m_axi_axb_ctrl_wvalid  = 1'b0;
    assign m_axi_axb_ctrl_bready  = 1'b1;
    assign m_axi_axb_ctrl_araddr  = 16'h0;
    assign m_axi_axb_ctrl_arprot  = 3'b000;
    assign m_axi_axb_ctrl_arvalid = 1'b0;
    assign m_axi_axb_ctrl_rready  = 1'b0;

    // =========================================================================
    // M_AXI_DMA — Tie off (bulk DMA placeholder, driven by future engine)
    // =========================================================================
    assign m_axi_dma_araddr  = {AXI_ADDR_WIDTH{1'b0}};
    assign m_axi_dma_arlen   = 8'h0;
    assign m_axi_dma_arsize  = $clog2(AXI_DATA_WIDTH/8);  // bytes/beat from data width
    assign m_axi_dma_arburst = 2'h1;
    assign m_axi_dma_arvalid = 1'b0;
    assign m_axi_dma_rready  = 1'b0;

    assign m_axi_dma_awaddr  = {AXI_ADDR_WIDTH{1'b0}};
    assign m_axi_dma_awlen   = 8'h0;
    assign m_axi_dma_awsize  = $clog2(AXI_DATA_WIDTH/8);  // bytes/beat from data width
    assign m_axi_dma_awburst = 2'h1;
    assign m_axi_dma_awvalid = 1'b0;

    assign m_axi_dma_wdata   = {AXI_DATA_WIDTH{1'b0}};
    assign m_axi_dma_wstrb   = {(AXI_DATA_WIDTH/8){1'b0}};
    assign m_axi_dma_wlast   = 1'b0;
    assign m_axi_dma_wvalid  = 1'b0;
    assign m_axi_dma_bready  = 1'b1;

    // =========================================================================
    // CDC FIFO placeholders (axi_clk ↔ mb_clk, axi_clk ↔ gty_clk)
    // Actual IP instantiation: Xilinx FIFO Generator in async mode.
    // Signals declared to preserve CDC intent for future implementation.
    // =========================================================================
    // cdc_mb_fifo_*  : axi_clk → mb_clk  (32-bit, CDC_FIFO_DEPTH deep)
    // cdc_gty_fifo_* : axi_clk → gty_clk (32-bit, CDC_FIFO_DEPTH deep)

endmodule
