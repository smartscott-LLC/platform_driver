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
    parameter NUM_GTY_LANES         = 512
) (
    // =========================================================================
    // Clock & Reset
    // =========================================================================
    input  wire                     axi_clk,
    input  wire                     axi_rst_n,

    // =========================================================================
    // AXI4 Slave Interface (from NoC / Vivado SmartConnect)
    // This is the only interface visible to the system
    // =========================================================================

    // Write address channel
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_awaddr,
    input  wire [7:0]                 s_axi_awlen,
    input  wire [2:0]                 s_axi_awsize,
    input  wire [1:0]                 s_axi_awburst,
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_awid,
    input  wire                       s_axi_awvalid,
    output wire                       s_axi_awready,

    // Write data channel
    input  wire [AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    input  wire [(AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    input  wire                       s_axi_wlast,
    input  wire                       s_axi_wvalid,
    output wire                       s_axi_wready,

    // Write response channel
    output wire [1:0]                 s_axi_bresp,
    output wire [AXI_ID_WIDTH-1:0]    s_axi_bid,
    output wire                       s_axi_bvalid,
    input  wire                       s_axi_bready,

    // Read address channel
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_araddr,
    input  wire [7:0]                 s_axi_arlen,
    input  wire [2:0]                 s_axi_arsize,
    input  wire [1:0]                 s_axi_arburst,
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_arid,
    input  wire                       s_axi_arvalid,
    output wire                       s_axi_arready,

    // Read data channel
    output wire [AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    output wire [1:0]                 s_axi_rresp,
    output wire [AXI_ID_WIDTH-1:0]    s_axi_rid,
    output wire                       s_axi_rlast,
    output wire                       s_axi_rvalid,
    input  wire                       s_axi_rready,

    // =========================================================================
    // Control/Status Signals to Orchestrator (comb. paths, axi_clk)
    // =========================================================================
    output wire [31:0]                csr_control,
    output wire                       csr_global_en,
    output wire                       csr_gty_codec_en,
    output wire                       csr_intr_en,
    output wire                       csr_cache_en,
    output wire [3:0]                 csr_mode,

    // =========================================================================
    // Status Signals from Orchestrator (axi_clk domain)
    // =========================================================================
    input  wire [31:0]                status_flags,
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_locked,
    input  wire [NUM_GTY_LANES-1:0]   gty_lane_error,
    input  wire [31:0]                mb_status,
    input  wire [31:0]                cache_stats,
    input  wire [31:0]                dma_debug,

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
    // DMA Descriptor Queue (Placeholder)
    // Future enhancement: implement DMA command queueing for bulk transfers
    //
    // For now, DMA is orchestrated via Microblaze cache path and orchestrator
    // direct AXI4 master operations.
    // =========================================================================

    // Placeholder: DMA queue would go here
    // - Accept DMA descriptors (source, dest, length, mode)
    // - Queue them in internal FIFO
    // - Feed to orchestrator DMA master interface
    // - Track completion status

endmodule
