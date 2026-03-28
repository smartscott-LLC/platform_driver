// =============================================================================
// Module  : tb3d_axi_bridge_module
// Project : TB3-D Platform Driver — Versal 1802
// File    : rtl/tb3d_axi_bridge_module.v
//
// Purpose : AXI4 bridge for TB3-D system integration. Acts as the glue layer
//           between the orchestrator CSR interface and the Versal NoC/CIP.
//
//           Responsibilities:
//           1. Instantiate AXI CSR slave (tb3d_axi_csr_slave)
//           2. Provide AXI4 slave interface to NoC (for CSR + DMA descriptors)
//           3. Route CSR control signals to orchestrator (via combinational outputs)
//           4. Aggregate and route status signals back to CSR bridge
//           5. Manage DMA descriptor queue (future enhancement)
//           6. Provide AXI4 master interface for DMA operations (from orchestrator)
//
// Clock Domain: axi_clk (200 MHz, primary system clock)
//
// Address Space (as seen by NoC):
//   0x4000_0000–0x4000_FFFF    CSR registers (40 KB used, 64 KB aliased)
//   0x4001_0000–0x4001_FFFF    DMA descriptor queue (future, reserved)
//
// =============================================================================

`timescale 1ns / 1ps

module tb3d_axi_bridge_module #(
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_ID_WIDTH          = 4,
    parameter NUM_GTY_LANES         = 8
) (
    // =========================================================================
    // Clock & Reset
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:M_AXI_DMA, ASSOCIATED_RESET axi_rst_n" *)
    input  wire                     axi_clk,
    input  wire                     axi_rst_n,

    // =========================================================================
    // AXI4 Slave Interface (from NoC / Vivado SmartConnect)
    // This is the only interface visible to the system
    // =========================================================================

    // Write address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWLEN" *)
    input  wire [7:0]                 s_axi_awlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWSIZE" *)
    input  wire [2:0]                 s_axi_awsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWBURST" *)
    input  wire [1:0]                 s_axi_awburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWID" *)
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_awid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWVALID" *)
    input  wire                       s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWREADY" *)
    output wire                       s_axi_awready,

    // Write data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WDATA" *)
    input  wire [AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WSTRB" *)
    input  wire [(AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WLAST" *)
    input  wire                       s_axi_wlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WVALID" *)
    input  wire                       s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WREADY" *)
    output wire                       s_axi_wready,

    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BRESP" *)
    output wire [1:0]                 s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BID" *)
    output wire [AXI_ID_WIDTH-1:0]    s_axi_bid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BVALID" *)
    output wire                       s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BREADY" *)
    input  wire                       s_axi_bready,

    // Read address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARADDR" *)
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARLEN" *)
    input  wire [7:0]                 s_axi_arlen,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARSIZE" *)
    input  wire [2:0]                 s_axi_arsize,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARBURST" *)
    input  wire [1:0]                 s_axi_arburst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARID" *)
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_arid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARVALID" *)
    input  wire                       s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARREADY" *)
    output wire                       s_axi_arready,

    // Read data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RDATA" *)
    output wire [AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RRESP" *)
    output wire [1:0]                 s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RID" *)
    output wire [AXI_ID_WIDTH-1:0]    s_axi_rid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RLAST" *)
    output wire                       s_axi_rlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RVALID" *)
    output wire                       s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RREADY" *)
    input  wire                       s_axi_rready,

    // =========================================================================
    // Control/Status Interface to Orchestrator (M_ORCH_CTRL, axi_clk domain)
    // These signals carry TB3D codec configuration from the CSR register bank
    // to the orchestrator, and status back.  Grouped as the M_ORCH_CTRL bundle.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL CONTROL" *)
    output wire [31:0]                csr_control,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL GLOBAL_EN" *)
    output wire                       csr_global_en,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL GTY_CODEC_EN" *)
    output wire                       csr_gty_codec_en,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL INTR_EN" *)
    output wire                       csr_intr_en,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL CACHE_EN" *)
    output wire                       csr_cache_en,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL MODE" *)
    output wire [3:0]                 csr_mode,

    // =========================================================================
    // Status Signals from Orchestrator (M_ORCH_CTRL bundle, axi_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL STATUS_FLAGS" *)
    input  wire [31:0]                status_flags,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL GTY_LANE_LOCKED" *)
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_locked,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL GTY_LANE_ERROR" *)
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_error,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL MB_STATUS" *)
    input  wire [31:0]                mb_status,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL CACHE_STATS" *)
    input  wire [31:0]                cache_stats,
    (* X_INTERFACE_INFO = "xilinx.com:user:m_orch_ctrl_rtl:1.0 M_ORCH_CTRL DMA_DEBUG" *)
    input  wire [31:0]                dma_debug,

    // =========================================================================
    // M_AXI_DMA — AXI4 Master for DMA (axi_clk domain)
    // DMA read/write to system memory (DDR4 via Versal PL-to-PS interconnect).
    // =========================================================================
    // Write address channel
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
    // Write data channel
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
    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BRESP" *)
    input  wire [1:0]                 m_axi_dma_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BVALID" *)
    input  wire                       m_axi_dma_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_DMA BREADY" *)
    output wire                       m_axi_dma_bready,
    // Read address channel
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
    // Read data channel
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

    // =========================================================================
    // Interrupt Output
    // =========================================================================
    output wire                       intr_o           // Interrupt to system (if enabled)
);

    // =========================================================================
    // Internal Signals
    // =========================================================================

    // AXI4-Lite CSR slave interface (internal, reduced width)
    wire [15:0]                       csr_awaddr;
    wire                              csr_awvalid;
    wire                              csr_awready;

    wire [31:0]                       csr_wdata;
    wire [3:0]                        csr_wstrb;
    wire                              csr_wvalid;
    wire                              csr_wready;

    wire [1:0]                        csr_bresp;
    wire                              csr_bvalid;
    wire                              csr_bready;

    wire [15:0]                       csr_araddr;
    wire                              csr_arvalid;
    wire                              csr_arready;

    wire [31:0]                       csr_rdata;
    wire [1:0]                        csr_rresp;
    wire                              csr_rvalid;
    wire                              csr_rready;

    // Interrupt unused internally, just routed out
    wire                              intr_enable;

    // =========================================================================
    // Address Decoder & Routing
    // 
    // Route incoming AXI4 transactions to CSR slave or DMA queue based on address
    // CSR range: 0x4000_0000–0x4000_FFFF
    // DMA range: 0x4001_0000–0x4001_FFFF (future)
    // =========================================================================

    wire                              is_csr_range;
    assign is_csr_range = (~s_axi_awaddr[16]);  // Addresses 0x4000_xxxx

    // For write path: route CSR or discard DMA writes (not implemented yet)
    assign csr_awaddr   = is_csr_range ? s_axi_awaddr[15:0] : 16'h0;
    assign csr_awvalid  = is_csr_range ? s_axi_awvalid : 1'b0;
    assign csr_wdata    = s_axi_wdata[31:0];  // Take lower 32 bits from 64-bit AXI
    assign csr_wstrb    = s_axi_wstrb[3:0];   // Take lower 4 bytes
    assign csr_wvalid   = is_csr_range ? s_axi_wvalid : 1'b0;

    // For read path: route CSR
    assign csr_araddr   = is_csr_range ? s_axi_araddr[15:0] : 16'h0;
    assign csr_arvalid  = is_csr_range ? s_axi_arvalid : 1'b0;

    // AXI4 → AXI4-Lite write response passthrough
    assign s_axi_awready = csr_awready;
    assign s_axi_wready  = csr_wready;
    assign s_axi_bresp   = csr_bresp;
    assign s_axi_bvalid  = csr_bvalid;
    assign csr_bready    = s_axi_bready;

    // AXI4 → AXI4-Lite read response passthrough
    assign s_axi_arready = csr_arready;
    assign s_axi_rdata   = {32'h0000_0000, csr_rdata};  // Pad to 64 bits
    assign s_axi_rresp   = csr_rresp;
    assign s_axi_rvalid  = csr_rvalid;
    assign csr_rready    = s_axi_rready;

    // ID passthrough (needed for AXI4)
    assign s_axi_bid     = s_axi_awid;  // Assumes ID same for req/resp (simplifed)
    assign s_axi_rid     = s_axi_arid;

    // Last signal passthrough (CSR doesn't use multi-beat, always last)
    assign s_axi_rlast   = s_axi_rvalid;

    // =========================================================================
    // Instantiate CSR Slave Module
    // =========================================================================

    tb3d_axi_csr_slave #(
        .AXI_ADDR_WIDTH         (16),
        .AXI_DATA_WIDTH         (32),
        .NUM_GTY_LANES          (NUM_GTY_LANES)
    ) csr_slave_inst (
        .axi_clk                (axi_clk),
        .axi_rst_n              (axi_rst_n),

        // AXI4-Lite ports
        .s_axi_awaddr           (csr_awaddr),
        .s_axi_awprot           (3'b000),
        .s_axi_awvalid          (csr_awvalid),
        .s_axi_awready          (csr_awready),

        .s_axi_wdata            (csr_wdata),
        .s_axi_wstrb            (csr_wstrb),
        .s_axi_wvalid           (csr_wvalid),
        .s_axi_wready           (csr_wready),

        .s_axi_bresp            (csr_bresp),
        .s_axi_bvalid           (csr_bvalid),
        .s_axi_bready           (csr_bready),

        .s_axi_araddr           (csr_araddr),
        .s_axi_arprot           (3'b000),
        .s_axi_arvalid          (csr_arvalid),
        .s_axi_arready          (csr_arready),

        .s_axi_rdata            (csr_rdata),
        .s_axi_rresp            (csr_rresp),
        .s_axi_rvalid           (csr_rvalid),
        .s_axi_rready           (csr_rready),

        // Control outputs
        .csr_control            (csr_control),
        .csr_global_en          (csr_global_en),
        .csr_gty_codec_en       (csr_gty_codec_en),
        .csr_intr_en            (csr_intr_en),
        .csr_cache_en           (csr_cache_en),
        .csr_mode               (csr_mode),

        // Status inputs
        .status_flags           (status_flags),
        .gty_lane_locked        (gty_lane_locked),
        .gty_lane_error         (gty_lane_error),
        .mb_status              (mb_status),
        .cache_stats            (cache_stats),
        .dma_debug              (dma_debug),

        // Interrupt
        .intr_enable_o          (intr_enable),
        .intr_ack_i             ()  // Not used in this version
    );

    // =========================================================================
    // Interrupt Output
    // =========================================================================
    assign intr_o = intr_enable;

    // =========================================================================
    // M_AXI_DMA — Tie-off (DMA descriptor queue placeholder)
    // Full DMA command queueing will be implemented in a future phase.
    // For now the master port is declared and tied to idle so Vivado BD
    // can route and address-assign the interface correctly.
    // =========================================================================
    assign m_axi_dma_awaddr  = {AXI_ADDR_WIDTH{1'b0}};
    assign m_axi_dma_awlen   = 8'h0;
    assign m_axi_dma_awsize  = $clog2(AXI_DATA_WIDTH/8);  // bytes/beat from data width
    assign m_axi_dma_awburst = 2'h1;   // INCR
    assign m_axi_dma_awvalid = 1'b0;

    assign m_axi_dma_wdata   = {AXI_DATA_WIDTH{1'b0}};
    assign m_axi_dma_wstrb   = {(AXI_DATA_WIDTH/8){1'b0}};
    assign m_axi_dma_wlast   = 1'b0;
    assign m_axi_dma_wvalid  = 1'b0;
    assign m_axi_dma_bready  = 1'b1;

    assign m_axi_dma_araddr  = {AXI_ADDR_WIDTH{1'b0}};
    assign m_axi_dma_arlen   = 8'h0;
    assign m_axi_dma_arsize  = $clog2(AXI_DATA_WIDTH/8);  // bytes/beat from data width
    assign m_axi_dma_arburst = 2'h1;
    assign m_axi_dma_arvalid = 1'b0;
    assign m_axi_dma_rready  = 1'b0;

endmodule
