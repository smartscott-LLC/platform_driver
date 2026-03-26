// =============================================================================
// Module  : tb3d_platform_top
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_platform_top.v
//
// Purpose : Unified platform integration top-level for the AMD Versal
//           Premium VP1802 (VPK180) evaluation board.
//
//           Integrates all four TB3-D subsystems into a single Vivado block-
//           design module with fully labelled AXI slave and AXI master ports
//           for direct point-to-point connection to platform IP:
//
//   ┌─────────────────────────────────────────────────────────────────────┐
//   │                      tb3d_platform_top                             │
//   │                                                                     │
//   │  ┌─────────────────────────────────────────────┐                   │
//   │  │           tb3d_engine_top                   │                   │
//   │  │  (encode/decode vector engine, DMA, CSR)    │                   │
//   │  └─────────────────────────────────────────────┘                   │
//   │                                                                     │
//   │  ┌─────────────────────────────────────────────┐                   │
//   │  │  tb3d_gtyp_xcvr (512-bit S/M_AXIS, 8-beat  │                   │
//   │  │  TX serialiser, 8-beat RX accumulator, CDC) │                   │
//   │  └─────────────────────────────────────────────┘                   │
//   │                                                                     │
//   │  ┌─────────────────────────────────────────────┐                   │
//   │  │       tb3d_microblaze_cache_if              │                   │
//   │  │  (MicroBlaze watchdog + cache preload)      │                   │
//   │  └─────────────────────────────────────────────┘                   │
//   │                                                                     │
//   │  ┌─────────────────────────────────────────────┐                   │
//   │  │         tb3d_pl_noc_bridge                  │                   │
//   │  │  (PL↔NoC transparent TB3-D logic injection) │                   │
//   │  └─────────────────────────────────────────────┘                   │
//   │                                                                     │
//   │  ┌─────────────────────────────────────────────┐                   │
//   │  │       tb3d_versal_dma_bridge                │                   │
//   │  │  (128↔512-bit AXI4-Stream width converter)  │                   │
//   │  └─────────────────────────────────────────────┘                   │
//   └─────────────────────────────────────────────────────────────────────┘
//
// External AXI Slave ports (connect inbound from platform masters):
//   S_AXI_CTRL   — Engine CSR (from MicroBlaze via AXI SmartConnect or NoC NSU)
//   S_AXI_MB     — MicroBlaze watchdog/cache-preload CSR (from MicroBlaze)
//   S_AXI_PL     — PL→NoC bridge slave (from CIPS M_AXI_FPD or PL master)
//
// External AXI Master ports (connect outbound to platform slaves):
//   M_AXI_NOC    — Engine DMA master → NoC NMU → LPDDR4/DDR4
//   M_AXI_CACHE  — Cache-preload master → NoC NMU → LPDDR4/DDR4
//   M_AXI_PL_NOC — PL bridge master → NoC NMU → LPDDR4/DDR4
//
// AXI4-Stream ports (CIPS AXI DMA paths, 128-bit narrow side):
//   S_AXIS_DMA   — AXI DMA MM2S → engine (via width converter upsizer)
//   M_AXIS_DMA   — Engine → AXI DMA S2MM (via width converter downsizer)
//
// GTYP ports:
//   gt_txdata / gt_rxdata / gt_txcharisk / gt_rxcharisk
//   gt_txusrclk2 / gt_rxusrclk2
//
// Interrupts:
//   pl_irq   — Engine interrupt → CIPS pl_ps_irq0
//   wdt_irq  — Watchdog interrupt → CIPS pl_ps_irq1 or MicroBlaze interrupt
//
// Board I/O:
//   led[3:0] — VPK180 LVCMOS18 LEDs (inherited from engine_top heartbeat)
//
// Internal wiring philosophy:
//   Combinational ("in-wire") wherever possible.  All AXI control signals
//   that traverse module boundaries are pure wire assignments.  Only valid/
//   ready handshaking registers inside sub-modules add pipeline latency.
//
// Parameters:
//   CACHE_DEPTH  — Engine Dragonfly Cache depth (default 512 bytes)
//   CACHE_ADDR_W — ceil(log2(CACHE_DEPTH))
//   SBUF_DEPTH   — Engine State Buffer depth (default 4096 entries)
//   SBUF_ADDR_W  — ceil(log2(SBUF_DEPTH))
//   DMA_NARROW_W — AXI4-Stream width of CIPS DMA (bits, default 128)
//
// Target  : Versal Premium VP1802 (VPK180)
// Tool    : Vivado 2024.x
// =============================================================================

`timescale 1ns / 1ps

module tb3d_platform_top #(
    parameter CACHE_DEPTH  = 512,
    parameter CACHE_ADDR_W = 9,
    parameter SBUF_DEPTH   = 4096,
    parameter SBUF_ADDR_W  = 12,
    parameter DMA_NARROW_W = 128      // CIPS DMA AXI4-Stream width (bits)
) (
    // =========================================================================
    // Clock and reset
    //   pl_clk    — primary AXI clock (NoC Clock Generator or CIPS pl_clk0,
    //               ≥ 300 MHz recommended for timing closure)
    //   pl_resetn — active-low synchronous reset (proc_sys_reset aresetn)
    // =========================================================================
    input  wire          pl_clk,
    input  wire          pl_resetn,

    // =========================================================================
    // GTYP Transceiver Clocks
    //   Tie to gt_txusrclk2 / gt_rxusrclk2 from the GT Wizard generated core.
    //   If the GTYP subsystem is unused, tie both to pl_clk and set bypass=1.
    // =========================================================================
    input  wire          gt_txusrclk2,
    input  wire          gt_rxusrclk2,

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite Engine CSR Slave (32-bit, 16-bit address)
    //   Connect: MicroBlaze AXI Data Master → AXI SmartConnect → this port
    //   Provides full R/W access to all TB3-D engine control registers.
    // =========================================================================
    input  wire [15:0]   s_axi_ctrl_awaddr,
    input  wire          s_axi_ctrl_awvalid,
    output wire          s_axi_ctrl_awready,

    input  wire [31:0]   s_axi_ctrl_wdata,
    input  wire [3:0]    s_axi_ctrl_wstrb,
    input  wire          s_axi_ctrl_wvalid,
    output wire          s_axi_ctrl_wready,

    output wire [1:0]    s_axi_ctrl_bresp,
    output wire          s_axi_ctrl_bvalid,
    input  wire          s_axi_ctrl_bready,

    input  wire [15:0]   s_axi_ctrl_araddr,
    input  wire          s_axi_ctrl_arvalid,
    output wire          s_axi_ctrl_arready,

    output wire [31:0]   s_axi_ctrl_rdata,
    output wire [1:0]    s_axi_ctrl_rresp,
    output wire          s_axi_ctrl_rvalid,
    input  wire          s_axi_ctrl_rready,

    // =========================================================================
    // S_AXI_MB — AXI4-Lite MicroBlaze Watchdog/Cache CSR Slave (32-bit)
    //   Connect: MicroBlaze AXI Data Master → AXI SmartConnect → this port
    //   Exposes watchdog control and cache-preload registers to MicroBlaze.
    // =========================================================================
    input  wire [15:0]   s_axi_mb_awaddr,
    input  wire          s_axi_mb_awvalid,
    output wire          s_axi_mb_awready,

    input  wire [31:0]   s_axi_mb_wdata,
    input  wire [3:0]    s_axi_mb_wstrb,
    input  wire          s_axi_mb_wvalid,
    output wire          s_axi_mb_wready,

    output wire [1:0]    s_axi_mb_bresp,
    output wire          s_axi_mb_bvalid,
    input  wire          s_axi_mb_bready,

    input  wire [15:0]   s_axi_mb_araddr,
    input  wire          s_axi_mb_arvalid,
    output wire          s_axi_mb_arready,

    output wire [31:0]   s_axi_mb_rdata,
    output wire [1:0]    s_axi_mb_rresp,
    output wire          s_axi_mb_rvalid,
    input  wire          s_axi_mb_rready,

    // =========================================================================
    // S_AXI_PL — AXI4 PL→NoC Bridge Slave (128-bit data)
    //   Connect: CIPS M_AXI_FPD (or any PL AXI4 master) → this port
    //   Data is TB3-D encoded (writes) / decoded (reads) transparently.
    // =========================================================================
    input  wire [63:0]   s_axi_pl_awaddr,
    input  wire [7:0]    s_axi_pl_awlen,
    input  wire [2:0]    s_axi_pl_awsize,
    input  wire [1:0]    s_axi_pl_awburst,
    input  wire [3:0]    s_axi_pl_awid,
    input  wire          s_axi_pl_awvalid,
    output wire          s_axi_pl_awready,

    input  wire [127:0]  s_axi_pl_wdata,
    input  wire [15:0]   s_axi_pl_wstrb,
    input  wire          s_axi_pl_wlast,
    input  wire          s_axi_pl_wvalid,
    output wire          s_axi_pl_wready,

    output wire [1:0]    s_axi_pl_bresp,
    output wire [3:0]    s_axi_pl_bid,
    output wire          s_axi_pl_bvalid,
    input  wire          s_axi_pl_bready,

    input  wire [63:0]   s_axi_pl_araddr,
    input  wire [7:0]    s_axi_pl_arlen,
    input  wire [2:0]    s_axi_pl_arsize,
    input  wire [1:0]    s_axi_pl_arburst,
    input  wire [3:0]    s_axi_pl_arid,
    input  wire          s_axi_pl_arvalid,
    output wire          s_axi_pl_arready,

    output wire [127:0]  s_axi_pl_rdata,
    output wire [1:0]    s_axi_pl_rresp,
    output wire [3:0]    s_axi_pl_rid,
    output wire          s_axi_pl_rlast,
    output wire          s_axi_pl_rvalid,
    input  wire          s_axi_pl_rready,

    // =========================================================================
    // M_AXI_NOC — AXI4 Engine DMA Master (64-bit, to NoC NMU → LPDDR4/DDR4)
    //   Connect: this port → NoC NMU → LPDDR4/DDR4 memory controller
    //   Used by the internal DMA controller for scatter-gather transfers.
    // =========================================================================
    output wire [63:0]   m_axi_noc_araddr,
    output wire [7:0]    m_axi_noc_arlen,
    output wire [2:0]    m_axi_noc_arsize,
    output wire [1:0]    m_axi_noc_arburst,
    output wire [3:0]    m_axi_noc_arid,
    output wire          m_axi_noc_arvalid,
    input  wire          m_axi_noc_arready,

    input  wire [63:0]   m_axi_noc_rdata,
    input  wire [1:0]    m_axi_noc_rresp,
    input  wire          m_axi_noc_rlast,
    input  wire [3:0]    m_axi_noc_rid,
    input  wire          m_axi_noc_rvalid,
    output wire          m_axi_noc_rready,

    output wire [63:0]   m_axi_noc_awaddr,
    output wire [7:0]    m_axi_noc_awlen,
    output wire [2:0]    m_axi_noc_awsize,
    output wire [1:0]    m_axi_noc_awburst,
    output wire [3:0]    m_axi_noc_awid,
    output wire          m_axi_noc_awvalid,
    input  wire          m_axi_noc_awready,

    output wire [63:0]   m_axi_noc_wdata,
    output wire [7:0]    m_axi_noc_wstrb,
    output wire          m_axi_noc_wlast,
    output wire          m_axi_noc_wvalid,
    input  wire          m_axi_noc_wready,

    input  wire [1:0]    m_axi_noc_bresp,
    input  wire [3:0]    m_axi_noc_bid,
    input  wire          m_axi_noc_bvalid,
    output wire          m_axi_noc_bready,

    // =========================================================================
    // M_AXI_CACHE — AXI4 Cache-Preload Master (64-bit, to NoC NMU)
    //   Connect: this port → NoC NMU → LPDDR4/DDR4
    //   Used by MicroBlaze cache-preload engine to warm instruction cache.
    // =========================================================================
    output wire [63:0]   m_axi_cache_araddr,
    output wire [7:0]    m_axi_cache_arlen,
    output wire [2:0]    m_axi_cache_arsize,
    output wire [1:0]    m_axi_cache_arburst,
    output wire [3:0]    m_axi_cache_arid,
    output wire          m_axi_cache_arvalid,
    input  wire          m_axi_cache_arready,

    input  wire [63:0]   m_axi_cache_rdata,
    input  wire [1:0]    m_axi_cache_rresp,
    input  wire          m_axi_cache_rlast,
    input  wire [3:0]    m_axi_cache_rid,
    input  wire          m_axi_cache_rvalid,
    output wire          m_axi_cache_rready,

    // =========================================================================
    // M_AXI_PL_NOC — AXI4 PL-Bridge Master (128-bit, to NoC NMU)
    //   Connect: this port → NoC NMU → LPDDR4/DDR4
    //   Carries TB3-D encoded write data and returns decoded read data.
    // =========================================================================
    output wire [63:0]   m_axi_pl_noc_awaddr,
    output wire [7:0]    m_axi_pl_noc_awlen,
    output wire [2:0]    m_axi_pl_noc_awsize,
    output wire [1:0]    m_axi_pl_noc_awburst,
    output wire [3:0]    m_axi_pl_noc_awid,
    output wire          m_axi_pl_noc_awvalid,
    input  wire          m_axi_pl_noc_awready,

    output wire [127:0]  m_axi_pl_noc_wdata,
    output wire [15:0]   m_axi_pl_noc_wstrb,
    output wire          m_axi_pl_noc_wlast,
    output wire          m_axi_pl_noc_wvalid,
    input  wire          m_axi_pl_noc_wready,

    input  wire [1:0]    m_axi_pl_noc_bresp,
    input  wire [3:0]    m_axi_pl_noc_bid,
    input  wire          m_axi_pl_noc_bvalid,
    output wire          m_axi_pl_noc_bready,

    output wire [63:0]   m_axi_pl_noc_araddr,
    output wire [7:0]    m_axi_pl_noc_arlen,
    output wire [2:0]    m_axi_pl_noc_arsize,
    output wire [1:0]    m_axi_pl_noc_arburst,
    output wire [3:0]    m_axi_pl_noc_arid,
    output wire          m_axi_pl_noc_arvalid,
    input  wire          m_axi_pl_noc_arready,

    input  wire [127:0]  m_axi_pl_noc_rdata,
    input  wire [1:0]    m_axi_pl_noc_rresp,
    input  wire [3:0]    m_axi_pl_noc_rid,
    input  wire          m_axi_pl_noc_rlast,
    input  wire          m_axi_pl_noc_rvalid,
    output wire          m_axi_pl_noc_rready,

    // =========================================================================
    // S_AXIS_DMA — AXI4-Stream Slave from CIPS AXI DMA MM2S (narrow width)
    //   Connect: CIPS AXI DMA MM2S output → this port
    //   Width converter upsizes from DMA_NARROW_W bits to 512 bits internally.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DMA TDATA" *)
    input  wire [DMA_NARROW_W-1:0] s_axis_dma_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DMA TVALID" *)
    input  wire                    s_axis_dma_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DMA TREADY" *)
    output wire                    s_axis_dma_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DMA TLAST" *)
    input  wire                    s_axis_dma_tlast,

    // =========================================================================
    // M_AXIS_DMA — AXI4-Stream Master to CIPS AXI DMA S2MM (narrow width)
    //   Connect: this port → CIPS AXI DMA S2MM input
    //   Width converter downsizes from 512 bits to DMA_NARROW_W bits.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DMA TDATA" *)
    output wire [DMA_NARROW_W-1:0] m_axis_dma_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DMA TVALID" *)
    output wire                    m_axis_dma_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DMA TREADY" *)
    input  wire                    m_axis_dma_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DMA TLAST" *)
    output wire                    m_axis_dma_tlast,

    // =========================================================================
    // GTYP Parallel Data Interface
    //   Connect to GT Wizard generated core TX/RX parallel data ports.
    //   Tie bypass_xcvr=1 and both clocks to pl_clk if GTYP unused.
    // =========================================================================
    output wire [63:0]   gt_txdata,
    input  wire [63:0]   gt_rxdata,
    output wire [7:0]    gt_txcharisk,
    input  wire [7:0]    gt_rxcharisk,

    // =========================================================================
    // Bypass controls (tie 1'b0 for normal TB3-D operation)
    // =========================================================================
    input  wire          bypass_xcvr,     // GTYP transceiver bypass
    input  wire          bypass_pl_noc,   // PL↔NoC bridge bypass

    // =========================================================================
    // Interrupts
    //   pl_irq  — Engine done/error → CIPS pl_ps_irq0
    //   wdt_irq — MicroBlaze watchdog timeout → CIPS pl_ps_irq1
    // =========================================================================
    output wire          pl_irq,
    output wire          wdt_irq,

    // =========================================================================
    // Board I/O — VPK180 LVCMOS18 LEDs (DS17/DS18/DS19/DS20)
    // =========================================================================
    output reg  [3:0]    led
);

    // =========================================================================
    // Internal wires — DMA bridge ↔ engine (512-bit)
    // =========================================================================
    wire [511:0] eng_s_axis_tdata;
    wire         eng_s_axis_tvalid;
    wire         eng_s_axis_tready;
    wire         eng_s_axis_tlast;

    wire [511:0] eng_m_axis_tdata;
    wire         eng_m_axis_tvalid;
    wire         eng_m_axis_tready;
    wire         eng_m_axis_tlast;

    // Internal engine status wires (used by MicroBlaze watchdog and LEDs)
    wire         eng_intr_req;

    // eng_busy: asserted whenever data is moving through the engine.
    //   - eng_s_axis_tvalid: DMA is pushing data into the engine
    //   - eng_m_axis_tvalid: engine has a result waiting to be consumed
    // Both signals are native to the pl_clk domain; no CDC needed.
    wire         eng_busy  = eng_s_axis_tvalid | eng_m_axis_tvalid;

    // eng_done: the engine raises intr_req for one cycle when a DMA transfer
    // or a vector-engine operation completes.  This is the correct signal to
    // use as a "done" indicator for the MicroBlaze watchdog.
    wire         eng_done  = eng_intr_req;

    // eng_error: tb3d_engine_top surfaces its internal dma_error through the
    // CSR status register (readable by MicroBlaze via S_AXI_CTRL).  The signal
    // is not exported as a dedicated top-level pin; MicroBlaze firmware polls
    // the STATUS register on each intr_req to distinguish done from error.
    wire         eng_error = 1'b0;

    // =========================================================================
    // DMA Width Converter (tb3d_versal_dma_bridge)
    //   Upsizes DMA_NARROW_W-bit AXI4-Stream from DMA MM2S → 512-bit engine
    //   Downsizes 512-bit engine output → DMA_NARROW_W-bit to DMA S2MM
    // =========================================================================
    tb3d_versal_dma_bridge #(
        .NARROW_W (DMA_NARROW_W)
    ) u_dma_bridge (
        .clk              (pl_clk),
        .rst_n            (pl_resetn),

        // Narrow DMA MM2S input → wide engine S_AXIS output
        .s_narrow_tdata   (s_axis_dma_tdata),
        .s_narrow_tvalid  (s_axis_dma_tvalid),
        .s_narrow_tready  (s_axis_dma_tready),
        .s_narrow_tlast   (s_axis_dma_tlast),

        .m_wide_tdata     (eng_s_axis_tdata),
        .m_wide_tvalid    (eng_s_axis_tvalid),
        .m_wide_tready    (eng_s_axis_tready),
        .m_wide_tlast     (eng_s_axis_tlast),

        // Wide engine M_AXIS input → narrow DMA S2MM output
        .s_wide_tdata     (eng_m_axis_tdata),
        .s_wide_tvalid    (eng_m_axis_tvalid),
        .s_wide_tready    (eng_m_axis_tready),
        .s_wide_tlast     (eng_m_axis_tlast),

        .m_narrow_tdata   (m_axis_dma_tdata),
        .m_narrow_tvalid  (m_axis_dma_tvalid),
        .m_narrow_tready  (m_axis_dma_tready),
        .m_narrow_tlast   (m_axis_dma_tlast)
    );

    // =========================================================================
    // TB3-D Engine Top (core encode/decode/DMA/CSR)
    // =========================================================================
    tb3d_engine_top #(
        .CACHE_DEPTH  (CACHE_DEPTH),
        .CACHE_ADDR_W (CACHE_ADDR_W),
        .SBUF_DEPTH   (SBUF_DEPTH),
        .SBUF_ADDR_W  (SBUF_ADDR_W)
    ) u_engine (
        .clk              (pl_clk),
        .rst_n            (pl_resetn),

        // AXI4-Lite CSR slave
        .s_axi_awaddr     (s_axi_ctrl_awaddr),
        .s_axi_awvalid    (s_axi_ctrl_awvalid),
        .s_axi_awready    (s_axi_ctrl_awready),
        .s_axi_wdata      (s_axi_ctrl_wdata),
        .s_axi_wstrb      (s_axi_ctrl_wstrb),
        .s_axi_wvalid     (s_axi_ctrl_wvalid),
        .s_axi_wready     (s_axi_ctrl_wready),
        .s_axi_bresp      (s_axi_ctrl_bresp),
        .s_axi_bvalid     (s_axi_ctrl_bvalid),
        .s_axi_bready     (s_axi_ctrl_bready),
        .s_axi_araddr     (s_axi_ctrl_araddr),
        .s_axi_arvalid    (s_axi_ctrl_arvalid),
        .s_axi_arready    (s_axi_ctrl_arready),
        .s_axi_rdata      (s_axi_ctrl_rdata),
        .s_axi_rresp      (s_axi_ctrl_rresp),
        .s_axi_rvalid     (s_axi_ctrl_rvalid),
        .s_axi_rready     (s_axi_ctrl_rready),

        // AXI4 DMA master → NoC NMU
        .m_axi_araddr     (m_axi_noc_araddr),
        .m_axi_arlen      (m_axi_noc_arlen),
        .m_axi_arsize     (m_axi_noc_arsize),
        .m_axi_arburst    (m_axi_noc_arburst),
        .m_axi_arid       (m_axi_noc_arid),
        .m_axi_arvalid    (m_axi_noc_arvalid),
        .m_axi_arready    (m_axi_noc_arready),
        .m_axi_rdata      (m_axi_noc_rdata),
        .m_axi_rresp      (m_axi_noc_rresp),
        .m_axi_rlast      (m_axi_noc_rlast),
        .m_axi_rid        (m_axi_noc_rid),
        .m_axi_rvalid     (m_axi_noc_rvalid),
        .m_axi_rready     (m_axi_noc_rready),
        .m_axi_awaddr     (m_axi_noc_awaddr),
        .m_axi_awlen      (m_axi_noc_awlen),
        .m_axi_awsize     (m_axi_noc_awsize),
        .m_axi_awburst    (m_axi_noc_awburst),
        .m_axi_awid       (m_axi_noc_awid),
        .m_axi_awvalid    (m_axi_noc_awvalid),
        .m_axi_awready    (m_axi_noc_awready),
        .m_axi_wdata      (m_axi_noc_wdata),
        .m_axi_wstrb      (m_axi_noc_wstrb),
        .m_axi_wlast      (m_axi_noc_wlast),
        .m_axi_wvalid     (m_axi_noc_wvalid),
        .m_axi_wready     (m_axi_noc_wready),
        .m_axi_bresp      (m_axi_noc_bresp),
        .m_axi_bid        (m_axi_noc_bid),
        .m_axi_bvalid     (m_axi_noc_bvalid),
        .m_axi_bready     (m_axi_noc_bready),

        // Interrupt
        .intr_req         (eng_intr_req),

        // AXI4-Stream (512-bit, via DMA bridge)
        .s_axis_tdata     (eng_s_axis_tdata),
        .s_axis_tvalid    (eng_s_axis_tvalid),
        .s_axis_tready    (eng_s_axis_tready),
        .s_axis_tlast     (eng_s_axis_tlast),

        .m_axis_tdata     (eng_m_axis_tdata),
        .m_axis_tvalid    (eng_m_axis_tvalid),
        .m_axis_tready    (eng_m_axis_tready),
        .m_axis_tlast     (eng_m_axis_tlast)
    );

    // =========================================================================
    // GTYP Transceiver TB3-D Codec
    //
    // TX path (pl_clk → gt_txusrclk2 → GT):
    //   The xcvr observes the engine M_AXIS bus.  When the DMA bridge accepts
    //   a beat (tvalid && tready), the xcvr captures the full 512-bit encoded
    //   word and serialises it as 8 consecutive 64-bit GT TX beats.  Because
    //   s_axis_tready on the xcvr is always 1 (the GT serialiser is free to
    //   accept as long as the prior word has been serialised), we gate the
    //   valid with the actual DMA-bridge handshake so only confirmed transfers
    //   are replicated to the SerDes.
    //
    // RX path (GT → gt_rxusrclk2 → pl_clk → M_AXIS):
    //   The xcvr accumulates 8 GT RX beats into a 512-bit word, applies 64×
    //   tb3d_decode, and presents the result on xcvr_m_axis.  Connect
    //   xcvr_m_axis to a separate AXI DMA S2MM channel or the engine S_AXIS
    //   as appropriate for the target system.  Here it is consumed internally
    //   (tready = 1'b1) — wire it to an external port if RX data is needed.
    // =========================================================================

    // 512-bit xcvr TX wires
    wire [511:0] xcvr_s_axis_tdata;
    wire         xcvr_s_axis_tvalid;
    wire         xcvr_s_axis_tready;   // driven by xcvr; not fed back to engine
    wire         xcvr_s_axis_tlast;

    // Monitor the engine M_AXIS: capture beats as the DMA bridge accepts them
    assign xcvr_s_axis_tdata  = eng_m_axis_tdata;
    assign xcvr_s_axis_tvalid = eng_m_axis_tvalid && eng_m_axis_tready;
    assign xcvr_s_axis_tlast  = eng_m_axis_tlast;

    // 512-bit xcvr RX wires
    wire [511:0] xcvr_m_axis_tdata;
    wire         xcvr_m_axis_tvalid;
    wire         xcvr_m_axis_tready;
    wire         xcvr_m_axis_tlast;

    tb3d_gtyp_xcvr u_xcvr (
        .pl_clk          (pl_clk),
        .gt_txusrclk2    (gt_txusrclk2),
        .gt_rxusrclk2    (gt_rxusrclk2),
        .rst_n           (pl_resetn),

        // S_AXIS: full 512-bit engine M_AXIS feed (observational tap)
        .s_axis_tdata    (xcvr_s_axis_tdata),
        .s_axis_tvalid   (xcvr_s_axis_tvalid),
        .s_axis_tready   (xcvr_s_axis_tready),
        .s_axis_tlast    (xcvr_s_axis_tlast),

        // M_AXIS: 512-bit decoded RX output
        .m_axis_tdata    (xcvr_m_axis_tdata),
        .m_axis_tvalid   (xcvr_m_axis_tvalid),
        .m_axis_tready   (xcvr_m_axis_tready),
        .m_axis_tlast    (xcvr_m_axis_tlast),

        .gt_txdata       (gt_txdata),
        .gt_rxdata       (gt_rxdata),
        .gt_txcharisk    (gt_txcharisk),
        .gt_rxcharisk    (gt_rxcharisk),

        .bypass          (bypass_xcvr)
    );

    // RX output is consumed by the platform (tready always asserted).
    // To route decoded GTYP RX data to the engine or a DMA channel, replace
    // this tie-off and connect xcvr_m_axis_* to the desired AXI4-Stream slave.
    assign xcvr_m_axis_tready = 1'b1;

    // =========================================================================
    // MicroBlaze Cache Interface / Watchdog
    // =========================================================================
    tb3d_microblaze_cache_if u_mb_cache (
        .clk              (pl_clk),
        .rst_n            (pl_resetn),

        // S_AXI_MB — AXI4-Lite slave (MicroBlaze data-master)
        .s_axi_awaddr     (s_axi_mb_awaddr),
        .s_axi_awvalid    (s_axi_mb_awvalid),
        .s_axi_awready    (s_axi_mb_awready),
        .s_axi_wdata      (s_axi_mb_wdata),
        .s_axi_wstrb      (s_axi_mb_wstrb),
        .s_axi_wvalid     (s_axi_mb_wvalid),
        .s_axi_wready     (s_axi_mb_wready),
        .s_axi_bresp      (s_axi_mb_bresp),
        .s_axi_bvalid     (s_axi_mb_bvalid),
        .s_axi_bready     (s_axi_mb_bready),
        .s_axi_araddr     (s_axi_mb_araddr),
        .s_axi_arvalid    (s_axi_mb_arvalid),
        .s_axi_arready    (s_axi_mb_arready),
        .s_axi_rdata      (s_axi_mb_rdata),
        .s_axi_rresp      (s_axi_mb_rresp),
        .s_axi_rvalid     (s_axi_mb_rvalid),
        .s_axi_rready     (s_axi_mb_rready),

        // M_AXI_CACHE — AXI4 master (cache preload → NoC NMU)
        .m_axi_araddr     (m_axi_cache_araddr),
        .m_axi_arlen      (m_axi_cache_arlen),
        .m_axi_arsize     (m_axi_cache_arsize),
        .m_axi_arburst    (m_axi_cache_arburst),
        .m_axi_arid       (m_axi_cache_arid),
        .m_axi_arvalid    (m_axi_cache_arvalid),
        .m_axi_arready    (m_axi_cache_arready),
        .m_axi_rdata      (m_axi_cache_rdata),
        .m_axi_rresp      (m_axi_cache_rresp),
        .m_axi_rlast      (m_axi_cache_rlast),
        .m_axi_rid        (m_axi_cache_rid),
        .m_axi_rvalid     (m_axi_cache_rvalid),
        .m_axi_rready     (m_axi_cache_rready),

        // Engine status (watchdog inputs)
        .engine_busy      (eng_busy),
        .engine_done      (eng_done),
        .engine_error     (eng_error),

        // Watchdog interrupt
        .wdt_irq          (wdt_irq)
    );

    // =========================================================================
    // PL ↔ NoC Bridge (transparent TB3-D logic injection)
    // =========================================================================
    tb3d_pl_noc_bridge u_pl_noc (
        .clk              (pl_clk),
        .rst_n            (pl_resetn),

        // S_AXI_PL slave (CIPS PL master input)
        .s_axi_awaddr     (s_axi_pl_awaddr),
        .s_axi_awlen      (s_axi_pl_awlen),
        .s_axi_awsize     (s_axi_pl_awsize),
        .s_axi_awburst    (s_axi_pl_awburst),
        .s_axi_awid       (s_axi_pl_awid),
        .s_axi_awvalid    (s_axi_pl_awvalid),
        .s_axi_awready    (s_axi_pl_awready),
        .s_axi_wdata      (s_axi_pl_wdata),
        .s_axi_wstrb      (s_axi_pl_wstrb),
        .s_axi_wlast      (s_axi_pl_wlast),
        .s_axi_wvalid     (s_axi_pl_wvalid),
        .s_axi_wready     (s_axi_pl_wready),
        .s_axi_bresp      (s_axi_pl_bresp),
        .s_axi_bid        (s_axi_pl_bid),
        .s_axi_bvalid     (s_axi_pl_bvalid),
        .s_axi_bready     (s_axi_pl_bready),
        .s_axi_araddr     (s_axi_pl_araddr),
        .s_axi_arlen      (s_axi_pl_arlen),
        .s_axi_arsize     (s_axi_pl_arsize),
        .s_axi_arburst    (s_axi_pl_arburst),
        .s_axi_arid       (s_axi_pl_arid),
        .s_axi_arvalid    (s_axi_pl_arvalid),
        .s_axi_arready    (s_axi_pl_arready),
        .s_axi_rdata      (s_axi_pl_rdata),
        .s_axi_rresp      (s_axi_pl_rresp),
        .s_axi_rid        (s_axi_pl_rid),
        .s_axi_rlast      (s_axi_pl_rlast),
        .s_axi_rvalid     (s_axi_pl_rvalid),
        .s_axi_rready     (s_axi_pl_rready),

        // M_AXI_PL_NOC master (TB3-D encoded → NoC NMU)
        .m_axi_awaddr     (m_axi_pl_noc_awaddr),
        .m_axi_awlen      (m_axi_pl_noc_awlen),
        .m_axi_awsize     (m_axi_pl_noc_awsize),
        .m_axi_awburst    (m_axi_pl_noc_awburst),
        .m_axi_awid       (m_axi_pl_noc_awid),
        .m_axi_awvalid    (m_axi_pl_noc_awvalid),
        .m_axi_awready    (m_axi_pl_noc_awready),
        .m_axi_wdata      (m_axi_pl_noc_wdata),
        .m_axi_wstrb      (m_axi_pl_noc_wstrb),
        .m_axi_wlast      (m_axi_pl_noc_wlast),
        .m_axi_wvalid     (m_axi_pl_noc_wvalid),
        .m_axi_wready     (m_axi_pl_noc_wready),
        .m_axi_bresp      (m_axi_pl_noc_bresp),
        .m_axi_bid        (m_axi_pl_noc_bid),
        .m_axi_bvalid     (m_axi_pl_noc_bvalid),
        .m_axi_bready     (m_axi_pl_noc_bready),
        .m_axi_araddr     (m_axi_pl_noc_araddr),
        .m_axi_arlen      (m_axi_pl_noc_arlen),
        .m_axi_arsize     (m_axi_pl_noc_arsize),
        .m_axi_arburst    (m_axi_pl_noc_arburst),
        .m_axi_arid       (m_axi_pl_noc_arid),
        .m_axi_arvalid    (m_axi_pl_noc_arvalid),
        .m_axi_arready    (m_axi_pl_noc_arready),
        .m_axi_rdata      (m_axi_pl_noc_rdata),
        .m_axi_rresp      (m_axi_pl_noc_rresp),
        .m_axi_rid        (m_axi_pl_noc_rid),
        .m_axi_rlast      (m_axi_pl_noc_rlast),
        .m_axi_rvalid     (m_axi_pl_noc_rvalid),
        .m_axi_rready     (m_axi_pl_noc_rready),

        .bypass           (bypass_pl_noc)
    );

    // =========================================================================
    // Interrupt outputs
    // =========================================================================
    assign pl_irq = eng_intr_req;

    // =========================================================================
    // Status LEDs (VPK180 — DS17 / DS18 / DS19 / DS20, LVCMOS18)
    //   led[0] — engine ready (always 1 after reset)
    //   led[1] — interrupt / DMA active
    //   led[2] — heartbeat (~4.5 Hz at 300 MHz)
    //   led[3] — watchdog IRQ indicator
    // =========================================================================
    reg [25:0] heartbeat_ctr;

    always @(posedge pl_clk) begin
        if (!pl_resetn) begin
            heartbeat_ctr <= 26'h0;
            led           <= 4'b0000;
        end else begin
            heartbeat_ctr <= heartbeat_ctr + 26'd1;
            led[0]        <= 1'b1;                // engine ready
            led[1]        <= eng_intr_req;         // interrupt / DMA active
            led[2]        <= heartbeat_ctr[25];    // ~4.5 Hz @ 300 MHz
            led[3]        <= wdt_irq;              // watchdog fired
        end
    end

endmodule
