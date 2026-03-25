// =============================================================================
// Module  : tb3d_top
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_top.v
//
// Purpose : Complete top-level module for the TB3-D FPGA implementation
//           targeting Xilinx Series 7 devices on the KC705 evaluation board.
//
// Target  : Kintex-7  XC7K325T-2FFG900C  (KC705)
// Tool    : Vivado 2022.2 or later
//           See vivado/tb3d.tcl for project creation and vivado/tb3d.xdc for
//           pin/timing constraints.
//
// External Pins:
//   PCIe x4 Gen2:
//     pcie_refclk_p/n   — 100 MHz reference clock (HCSL differential input)
//                         Connects to MGTREFCLK0 (Bank 116) via IBUFDS_GTE2.
//     pcie_perst_n      — PCIe fundamental reset from host (active-low)
//     pcie_rx_p/n[3:0]  — Serial receive lanes (GTX)
//     pcie_tx_p/n[3:0]  — Serial transmit lanes (GTX)
//
//   Board utilities:
//     cpu_resetn        — Board power-on reset button (active-low, G26)
//     led[3:0]          — Status LEDs (AB8/AA8/AC9/AB9, LVCMOS15)
//       led[0] = PCIe link up
//       led[1] = Interrupt / DMA active
//       led[2] = Error indicator (readable via CSR STATUS[2])
//       led[3] = Heartbeat blink (~0.067 Hz)
//
// Internal clock domain:
//   clk   — user_clk_out from Xilinx PCIe IP (250 MHz, all user logic)
//           Single clock domain; no CDC crossings in user fabric.
//
// PCIe IP instantiation:
//   The Xilinx 7 Series Integrated Block for PCI Express (pcie_7x_1 v3.3) is
//   generated via Vivado IP Catalog (see vivado/tb3d.tcl §3) and wrapped by
//   tb3d_pcie_7series.  A stub version (vivado/ip/tb3d_pcie_7series/) is
//   provided for elaboration and simulation; replace it with the generated IP
//   before hardware build.
//
//   AXI4-Stream interface: 64-bit data path at 250 MHz.
//   BAR0: 64 KB non-prefetchable → AXI4-Lite CSR
//   BAR2/3: 256 MB prefetchable 64-bit → AXI4 DMA
//
// Reset strategy:
//   user_reset_out (active-high) from the PCIe IP is the primary reset source.
//   A two-stage synchroniser gates cpu_resetn into the user_clk domain.
//   sys_rst_n is active-low and gated by PCIe link-up so all registers are
//   clean before the host enumerates the device.
// =============================================================================

`timescale 1ns / 1ps

module tb3d_top (
    // =========================================================================
    // PCIe reference clock — 100 MHz differential HCSL
    // Connects to IBUFDS_GTE2; pin locations: pcie_refclk_p=B8, n=A8
    // =========================================================================
    input  wire         pcie_refclk_p,
    input  wire         pcie_refclk_n,

    // =========================================================================
    // PCIe link pins — ×4 Gen2 (GTX Bank 116)
    // =========================================================================
    input  wire         pcie_perst_n,     // Active-low PCIe slot reset
    input  wire  [3:0]  pcie_rx_p,        // Receive differential pairs (P)
    input  wire  [3:0]  pcie_rx_n,        // Receive differential pairs (N)
    output wire  [3:0]  pcie_tx_p,        // Transmit differential pairs (P)
    output wire  [3:0]  pcie_tx_n,        // Transmit differential pairs (N)

    // =========================================================================
    // Board I/O
    // =========================================================================
    input  wire         cpu_resetn,       // North push-button reset (active-low)
    output reg   [3:0]  led               // LVCMOS15 status LEDs
);

    // =========================================================================
    // PCIe reference clock — IBUFDS_GTE2 primitive (Series 7)
    // Converts the differential HCSL input to the single-ended clock needed
    // by the PCIe IP transceiver PLL.  Do not connect refclk to fabric logic.
    // =========================================================================
    wire sys_clk;   // 100 MHz, to PCIe IP sys_clk port only
    IBUFDS_GTE2 u_ibufds_refclk (
        .I     (pcie_refclk_p),
        .IB    (pcie_refclk_n),
        .CEB   (1'b0),
        .O     (sys_clk),
        .ODIV2 (/* unused */)
    );

    // =========================================================================
    // Clock and reset
    // user_clk_out : 250 MHz core clock from PCIe IP PLL
    // user_reset   : active-high synchronous reset from PCIe IP
    // pcie_link_up : data-link layer up flag
    // =========================================================================
    wire clk;             // user_clk_out — 250 MHz, all user logic
    wire pcie_reset_raw;  // user_reset_out (active-high) from IP
    wire pcie_link_up;    // user_lnk_up from IP

    // Combine active-low board reset and active-high IP reset into
    // a unified active-low synchronous reset for all user registers.
    wire pcie_rst_n = !pcie_reset_raw && cpu_resetn;

    // Two-stage reset synchroniser — async assert, sync deassert.
    // Captures pcie_rst_n cleanly into the user_clk domain.
    (* ASYNC_REG = "TRUE" *) reg rst_meta;
    (* ASYNC_REG = "TRUE" *) reg rst_sync1;
    always @(posedge clk or negedge pcie_rst_n) begin
        if (!pcie_rst_n) begin
            rst_meta  <= 1'b0;
            rst_sync1 <= 1'b0;
        end else begin
            rst_meta  <= 1'b1;
            rst_sync1 <= rst_meta;
        end
    end
    // Gate by link-up: hold reset until the PCIe link is established so the
    // engine is clean when the host enumerates the endpoint.
    wire sys_rst_n = rst_sync1 && pcie_link_up;

    // =========================================================================
    // Xilinx 7-Series PCIe IP — pcie_7x_1 (wrapped as tb3d_pcie_7series)
    //
    // Configuration (set in vivado/tb3d.tcl):
    //   Device   : xc7k325t  Lane width : X4  Link speed : Gen2 (5 GT/s)
    //   Data path: 64-bit AXI-Stream at 250 MHz
    //   BAR0     : 64 KB non-prefetchable 32-bit
    //   BAR2/3   : 256 MB prefetchable 64-bit
    //   MSI      : enabled (1 vector)
    //   Vendor ID: 10EE  Device ID: 7013
    //
    // The stub in vivado/ip/tb3d_pcie_7series/ allows elaboration.
    // Replace with generated IP before building hardware.
    // =========================================================================

    // AXI4-Stream RX (PCIe IP → bridge)
    wire [63:0]  rx_tdata;
    wire [7:0]   rx_tkeep;
    wire         rx_tlast;
    wire         rx_tvalid;
    wire         rx_tready;
    wire [21:0]  rx_tuser;

    // AXI4-Stream TX (bridge → PCIe IP)
    wire [63:0]  tx_tdata;
    wire [7:0]   tx_tkeep;
    wire         tx_tlast;
    wire         tx_tvalid;
    wire         tx_tready;
    wire [3:0]   tx_tuser;

    // Configuration outputs from PCIe IP
    wire [7:0]   cfg_bus_num;
    wire [4:0]   cfg_dev_num;
    wire [2:0]   cfg_func_num;

    // MSI interrupt interface
    wire         cfg_interrupt_req;
    wire         cfg_interrupt_rdy;
    wire         cfg_interrupt_msienable;

    // Flow-control credits (tie-off fc_sel; values unused by bridge)
    wire [2:0]   fc_sel = 3'b000;

    tb3d_pcie_7series u_pcie_ip (
        // Clocks and reset
        .sys_clk            (sys_clk),
        .sys_rst_n          (pcie_perst_n),

        // Serial I/O
        .pci_exp_rxp        (pcie_rx_p),
        .pci_exp_rxn        (pcie_rx_n),
        .pci_exp_txp        (pcie_tx_p),
        .pci_exp_txn        (pcie_tx_n),

        // User clock and reset
        .user_clk_out       (clk),
        .user_reset_out     (pcie_reset_raw),
        .user_lnk_up        (pcie_link_up),

        // AXI4-Stream RX
        .m_axis_rx_tdata    (rx_tdata),
        .m_axis_rx_tkeep    (rx_tkeep),
        .m_axis_rx_tlast    (rx_tlast),
        .m_axis_rx_tvalid   (rx_tvalid),
        .m_axis_rx_tready   (rx_tready),
        .m_axis_rx_tuser    (rx_tuser),

        // AXI4-Stream TX
        .s_axis_tx_tdata    (tx_tdata),
        .s_axis_tx_tkeep    (tx_tkeep),
        .s_axis_tx_tlast    (tx_tlast),
        .s_axis_tx_tvalid   (tx_tvalid),
        .s_axis_tx_tready   (tx_tready),
        .s_axis_tx_tuser    (tx_tuser),

        // Flow control (unused; tie off sel)
        .fc_cpld            (/* unused */),
        .fc_cplh            (/* unused */),
        .fc_npd             (/* unused */),
        .fc_nph             (/* unused */),
        .fc_pd              (/* unused */),
        .fc_ph              (/* unused */),
        .fc_sel             (fc_sel),

        // Configuration space
        .cfg_bus_number     (cfg_bus_num),
        .cfg_device_number  (cfg_dev_num),
        .cfg_function_number(cfg_func_num),
        .cfg_status         (/* unused */),
        .cfg_command        (/* unused */),
        .cfg_dstatus        (/* unused */),
        .cfg_dcommand       (/* unused */),
        .cfg_lcommand       (/* unused */),
        .cfg_lstatus        (/* unused */),

        // Interrupt (MSI)
        .cfg_interrupt          (cfg_interrupt_req),
        .cfg_interrupt_rdy      (cfg_interrupt_rdy),
        .cfg_interrupt_assert   (1'b0),          // MSI mode (not INTx)
        .cfg_interrupt_di       (8'h00),         // vector 0
        .cfg_interrupt_do       (/* unused */),
        .cfg_interrupt_mmenable (/* unused */),
        .cfg_interrupt_msienable(cfg_interrupt_msienable),
        .cfg_interrupt_msixenable(/* unused */),
        .cfg_interrupt_msixfm   (/* unused */),
        .cfg_interrupt_stat     (1'b0),

        // Error reporting (tie off — not used in this revision)
        .cfg_err_cor             (1'b0),
        .cfg_err_ur              (1'b0),
        .cfg_err_ecrc            (1'b0),
        .cfg_err_cpl_timeout     (1'b0),
        .cfg_err_cpl_abort       (1'b0),
        .cfg_err_cpl_unexpect    (1'b0),
        .cfg_err_posted          (1'b0),
        .cfg_err_locked          (1'b0),
        .cfg_err_tlp_cpl_header  (48'h0),
        .cfg_err_cpl_rdy         (/* unused */),

        // Power management (tie off)
        .cfg_turnoff_ok          (1'b1),
        .cfg_to_turnoff          (/* unused */),
        .cfg_trn_pending         (1'b0),
        .cfg_pm_halt_aspm_l0s    (1'b0),
        .cfg_pm_halt_aspm_l1     (1'b0),
        .cfg_pm_force_state_en   (1'b0),
        .cfg_pm_force_state      (2'b00),
        .cfg_dsn                 (64'h0),

        // TX buffer
        .tx_buf_av               (/* unused */),
        .tx_err_drop             (/* unused */),
        .tx_cfg_req              (/* unused */),
        .tx_cfg_gnt              (1'b1)
    );

    // =========================================================================
    // PCIe Bridge — TLP parser/generator (Xilinx AXI4-Stream ↔ AXI4)
    // Completer ID = {bus, device, function}
    // =========================================================================
    wire [15:0] completer_id = {cfg_bus_num, cfg_dev_num, cfg_func_num};

    wire [15:0] pcie_csr_awaddr;
    wire        pcie_csr_awvalid;
    wire        pcie_csr_awready;
    wire [31:0] pcie_csr_wdata;
    wire [3:0]  pcie_csr_wstrb;
    wire        pcie_csr_wvalid;
    wire        pcie_csr_wready;
    wire [1:0]  pcie_csr_bresp;
    wire        pcie_csr_bvalid;
    wire        pcie_csr_bready;
    wire [15:0] pcie_csr_araddr;
    wire        pcie_csr_arvalid;
    wire        pcie_csr_arready;
    wire [31:0] pcie_csr_rdata;
    wire [1:0]  pcie_csr_rresp;
    wire        pcie_csr_rvalid;
    wire        pcie_csr_rready;

    wire [63:0] pcie_dma_araddr;
    wire [7:0]  pcie_dma_arlen;
    wire [2:0]  pcie_dma_arsize;
    wire [1:0]  pcie_dma_arburst;
    wire        pcie_dma_arvalid;
    wire        pcie_dma_arready;
    wire [63:0] pcie_dma_rdata;
    wire [1:0]  pcie_dma_rresp;
    wire        pcie_dma_rlast;
    wire        pcie_dma_rvalid;
    wire        pcie_dma_rready;
    wire [63:0] pcie_dma_awaddr;
    wire [7:0]  pcie_dma_awlen;
    wire [2:0]  pcie_dma_awsize;
    wire [1:0]  pcie_dma_awburst;
    wire        pcie_dma_awvalid;
    wire        pcie_dma_awready;
    wire [63:0] pcie_dma_wdata;
    wire [7:0]  pcie_dma_wstrb;
    wire        pcie_dma_wlast;
    wire        pcie_dma_wvalid;
    wire        pcie_dma_wready;
    wire [1:0]  pcie_dma_bresp;
    wire        pcie_dma_bvalid;
    wire        pcie_dma_bready;

    // Tie-off AXI4 slave responses for engine DMA master port.
    // No external DMA slave is connected in this revision; the DMA controller
    // will stall on reads (rvalid=0) and writes are silently accepted.
    assign pcie_dma_arready = 1'b1;
    assign pcie_dma_rdata   = 64'h0;
    assign pcie_dma_rresp   = 2'b00;   // OKAY
    assign pcie_dma_rlast   = 1'b1;
    assign pcie_dma_rvalid  = 1'b0;
    assign pcie_dma_awready = 1'b1;
    assign pcie_dma_wready  = 1'b1;
    assign pcie_dma_bresp   = 2'b00;   // OKAY
    assign pcie_dma_bvalid  = 1'b0;

    // Separate AXI4 DMA wires for the bridge's inbound DMA master port.
    wire [63:0] bdma_araddr;
    wire [7:0]  bdma_arlen;
    wire [2:0]  bdma_arsize;
    wire [1:0]  bdma_arburst;
    wire        bdma_arvalid;
    wire        bdma_rready;
    wire [63:0] bdma_awaddr;
    wire [7:0]  bdma_awlen;
    wire [2:0]  bdma_awsize;
    wire [1:0]  bdma_awburst;
    wire        bdma_awvalid;
    wire [63:0] bdma_wdata;
    wire [7:0]  bdma_wstrb;
    wire        bdma_wlast;
    wire        bdma_wvalid;
    wire        bdma_bready;

    wire        bdma_arready;
    wire [63:0] bdma_rdata;
    wire [1:0]  bdma_rresp;
    wire        bdma_rlast;
    wire        bdma_rvalid;
    wire        bdma_awready;
    wire        bdma_wready;
    wire [1:0]  bdma_bresp;
    wire        bdma_bvalid;

    assign bdma_arready = 1'b1;
    assign bdma_rdata   = 64'h0;
    assign bdma_rresp   = 2'b00;
    assign bdma_rlast   = 1'b1;
    assign bdma_rvalid  = 1'b0;
    assign bdma_awready = 1'b1;
    assign bdma_wready  = 1'b1;
    assign bdma_bresp   = 2'b00;
    assign bdma_bvalid  = 1'b0;

    tb3d_pcie_bridge u_bridge (
        .clk                (clk),
        .rst_n              (sys_rst_n),

        .completer_id       (completer_id),

        // AXI4-Stream RX from PCIe IP
        .m_axis_rx_tdata    (rx_tdata),
        .m_axis_rx_tkeep    (rx_tkeep),
        .m_axis_rx_tlast    (rx_tlast),
        .m_axis_rx_tvalid   (rx_tvalid),
        .m_axis_rx_tready   (rx_tready),
        .m_axis_rx_tuser    (rx_tuser),

        // AXI4-Stream TX to PCIe IP
        .s_axis_tx_tdata    (tx_tdata),
        .s_axis_tx_tkeep    (tx_tkeep),
        .s_axis_tx_tlast    (tx_tlast),
        .s_axis_tx_tvalid   (tx_tvalid),
        .s_axis_tx_tready   (tx_tready),
        .s_axis_tx_tuser    (tx_tuser),

        // AXI4-Lite master — CSR (BAR0)
        .m_csr_awaddr       (pcie_csr_awaddr),
        .m_csr_awvalid      (pcie_csr_awvalid),
        .m_csr_awready      (pcie_csr_awready),
        .m_csr_wdata        (pcie_csr_wdata),
        .m_csr_wstrb        (pcie_csr_wstrb),
        .m_csr_wvalid       (pcie_csr_wvalid),
        .m_csr_wready       (pcie_csr_wready),
        .m_csr_bresp        (pcie_csr_bresp),
        .m_csr_bvalid       (pcie_csr_bvalid),
        .m_csr_bready       (pcie_csr_bready),
        .m_csr_araddr       (pcie_csr_araddr),
        .m_csr_arvalid      (pcie_csr_arvalid),
        .m_csr_arready      (pcie_csr_arready),
        .m_csr_rdata        (pcie_csr_rdata),
        .m_csr_rresp        (pcie_csr_rresp),
        .m_csr_rvalid       (pcie_csr_rvalid),
        .m_csr_rready       (pcie_csr_rready),

        // AXI4 master — DMA (BAR2)
        .m_dma_araddr       (bdma_araddr),
        .m_dma_arlen        (bdma_arlen),
        .m_dma_arsize       (bdma_arsize),
        .m_dma_arburst      (bdma_arburst),
        .m_dma_arvalid      (bdma_arvalid),
        .m_dma_arready      (bdma_arready),
        .m_dma_rdata        (bdma_rdata),
        .m_dma_rresp        (bdma_rresp),
        .m_dma_rlast        (bdma_rlast),
        .m_dma_rvalid       (bdma_rvalid),
        .m_dma_rready       (bdma_rready),
        .m_dma_awaddr       (bdma_awaddr),
        .m_dma_awlen        (bdma_awlen),
        .m_dma_awsize       (bdma_awsize),
        .m_dma_awburst      (bdma_awburst),
        .m_dma_awvalid      (bdma_awvalid),
        .m_dma_awready      (bdma_awready),
        .m_dma_wdata        (bdma_wdata),
        .m_dma_wstrb        (bdma_wstrb),
        .m_dma_wlast        (bdma_wlast),
        .m_dma_wvalid       (bdma_wvalid),
        .m_dma_wready       (bdma_wready),
        .m_dma_bresp        (bdma_bresp),
        .m_dma_bvalid       (bdma_bvalid),
        .m_dma_bready       (bdma_bready)
    );

    // =========================================================================
    // Engine Top
    // =========================================================================
    wire intr_req_raw;

    // Vector I/O buses (tie off; extend to use-case logic as needed)
    wire [511:0] vec_pairs_i  = 512'h0;
    wire [511:0] vec_pairs_o;
    wire [511:0] vec_bytes_i  = 512'h0;
    wire [511:0] vec_bytes_o;

    tb3d_engine_top u_engine (
        .clk              (clk),
        .rst_n            (sys_rst_n),

        .s_axi_awaddr     (pcie_csr_awaddr),
        .s_axi_awvalid    (pcie_csr_awvalid),
        .s_axi_awready    (pcie_csr_awready),
        .s_axi_wdata      (pcie_csr_wdata),
        .s_axi_wstrb      (pcie_csr_wstrb),
        .s_axi_wvalid     (pcie_csr_wvalid),
        .s_axi_wready     (pcie_csr_wready),
        .s_axi_bresp      (pcie_csr_bresp),
        .s_axi_bvalid     (pcie_csr_bvalid),
        .s_axi_bready     (pcie_csr_bready),
        .s_axi_araddr     (pcie_csr_araddr),
        .s_axi_arvalid    (pcie_csr_arvalid),
        .s_axi_arready    (pcie_csr_arready),
        .s_axi_rdata      (pcie_csr_rdata),
        .s_axi_rresp      (pcie_csr_rresp),
        .s_axi_rvalid     (pcie_csr_rvalid),
        .s_axi_rready     (pcie_csr_rready),

        .m_axi_araddr     (pcie_dma_araddr),
        .m_axi_arlen      (pcie_dma_arlen),
        .m_axi_arsize     (pcie_dma_arsize),
        .m_axi_arburst    (pcie_dma_arburst),
        .m_axi_arid       (/* unused by bridge */),
        .m_axi_arvalid    (pcie_dma_arvalid),
        .m_axi_arready    (pcie_dma_arready),
        .m_axi_rdata      (pcie_dma_rdata),
        .m_axi_rresp      (pcie_dma_rresp),
        .m_axi_rlast      (pcie_dma_rlast),
        .m_axi_rid        (4'h0),
        .m_axi_rvalid     (pcie_dma_rvalid),
        .m_axi_rready     (pcie_dma_rready),
        .m_axi_awaddr     (pcie_dma_awaddr),
        .m_axi_awlen      (pcie_dma_awlen),
        .m_axi_awsize     (pcie_dma_awsize),
        .m_axi_awburst    (pcie_dma_awburst),
        .m_axi_awid       (/* unused by bridge */),
        .m_axi_awvalid    (pcie_dma_awvalid),
        .m_axi_awready    (pcie_dma_awready),
        .m_axi_wdata      (pcie_dma_wdata),
        .m_axi_wstrb      (pcie_dma_wstrb),
        .m_axi_wlast      (pcie_dma_wlast),
        .m_axi_wvalid     (pcie_dma_wvalid),
        .m_axi_wready     (pcie_dma_wready),
        .m_axi_bresp      (pcie_dma_bresp),
        .m_axi_bid        (4'h0),
        .m_axi_bvalid     (pcie_dma_bvalid),
        .m_axi_bready     (pcie_dma_bready),

        .intr_req         (intr_req_raw),

        .vec_nibble_pairs_i (vec_pairs_i),
        .vec_nibble_pairs_o (vec_pairs_o),
        .vec_tb3d_bytes_i   (vec_bytes_i),
        .vec_tb3d_bytes_o   (vec_bytes_o)
    );

    // =========================================================================
    // MSI Interrupt generation
    // Assert cfg_interrupt on rising edge of intr_req.
    // The Xilinx PCIe IP sends a single MSI message when cfg_interrupt is
    // asserted for one cycle and cfg_interrupt_rdy is high.
    //
    // Implementation note:
    //   intr_pending is set on a rising edge of intr_req_raw.
    //   It is only cleared after the IP acknowledges (cfg_interrupt_rdy).
    //   If a new edge arrives in the same cycle as an acknowledgment,
    //   intr_pending stays asserted so the new request is sent next cycle.
    // =========================================================================
    reg intr_req_prev;
    reg intr_pending;
    always @(posedge clk) begin
        if (!sys_rst_n) begin
            intr_req_prev <= 1'b0;
            intr_pending  <= 1'b0;
        end else begin
            intr_req_prev <= intr_req_raw;
            // Rising edge detection has priority over acknowledgement;
            // if both occur in the same cycle the new interrupt is latched.
            if (intr_req_raw && !intr_req_prev) begin
                intr_pending <= 1'b1;         // new interrupt edge — always latch
            end else if (cfg_interrupt_rdy && intr_pending) begin
                intr_pending <= 1'b0;         // IP acknowledged, no new edge
            end
        end
    end
    assign cfg_interrupt_req = intr_pending && cfg_interrupt_msienable;

    // =========================================================================
    // Status LED logic
    // =========================================================================
    reg [24:0] heartbeat_ctr;
    always @(posedge clk) begin
        if (!sys_rst_n) begin
            heartbeat_ctr <= 25'h0;
            led           <= 4'b0000;
        end else begin
            heartbeat_ctr <= heartbeat_ctr + 25'd1;
            led[0]        <= pcie_link_up;
            led[1]        <= intr_req_raw;       // Interrupt / DMA active
            led[2]        <= 1'b0;               // Error (see CSR STATUS[2])
            led[3]        <= heartbeat_ctr[24];  // ~0.067 Hz blink = alive
        end
    end

endmodule
