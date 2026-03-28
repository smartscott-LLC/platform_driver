// =============================================================================
// Module  : tb3d_orchestrator
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_orchestrator.v
//
// Purpose : Hardware-Defined-OS boot master.  Loaded by the PMC before the
//           ARM cores wake up.  Controls four in-wire intercept modules via
//           AXI4-Lite master ports and receives a UART console for telemetry
//           and runtime command injection.
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXI         AXI4-Lite slave  — CSR entry-point from NoC / test bench
//   S_UART        UART slave        — 8 N 1 console (RxD in, TxD out)
//   M_AXI_GTY     AXI4-Lite master  — drives GTY transceiver intercept
//   M_AXI_MB      AXI4-Lite master  — drives MicroBlaze cache shim
//   M_AXI_AXB     AXI4-Lite master  — drives AXI / NoC bridge intercept
//   M_AXI_PMC     AXI4-Lite master  — drives PMC boot intercept
//
// All interfaces share axi_clk (200 MHz) and axi_rst_n (active-low).
//
// S_AXI CSR register map (byte address, 32-bit words)
//   0x00  CTRL        [0]=global_en [1]=gty_en [2]=mb_en [3]=axb_en [4]=pmc_en
//   0x04  STATUS      [7:0]=gty_locked  [15:8]=gty_error  (read-only)
//   0x08  UART_CTRL   [0]=tx_go  [7:1]=rsvd  [23:8]=baud_div (clk/baud-1)
//   0x0C  UART_TXD    [7:0]=byte to transmit (write triggers TX)
//   0x10  UART_RXD    [7:0]=last received byte (read-only)
//   0x14  UART_STAT   [0]=rx_valid  [1]=tx_busy  (read-only)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_orchestrator #(
    parameter integer AXI_ADDR_W  = 8,   // CSR byte-address bits
    parameter integer AXI_DATA_W  = 32,  // AXI4-Lite data width
    parameter integer NUM_GTY     = 8,   // GTYP lanes (status width)
    parameter integer BAUD_DIV    = 1735 // 200 MHz / 115200 - 1
) (
    // =========================================================================
    // Clock & Reset  (all interfaces associated to this clock)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:S_UART:M_AXI_GTY:M_AXI_MB:M_AXI_AXB:M_AXI_PMC, ASSOCIATED_RESET axi_rst_n, FREQ_HZ 200000000" *)
    input  wire                   axi_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire                   axi_rst_n,

    // =========================================================================
    // S_AXI — AXI4-Lite slave  (CSR configuration / status)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWADDR"  *) input  wire [AXI_ADDR_W-1:0] s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWPROT"  *) input  wire [2:0]            s_axi_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWVALID" *) input  wire                  s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI AWREADY" *) output wire                  s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WDATA"   *) input  wire [AXI_DATA_W-1:0] s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WSTRB"   *) input  wire [3:0]            s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WVALID"  *) input  wire                  s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI WREADY"  *) output wire                  s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BRESP"   *) output wire [1:0]            s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BVALID"  *) output wire                  s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI BREADY"  *) input  wire                  s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARADDR"  *) input  wire [AXI_ADDR_W-1:0] s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARPROT"  *) input  wire [2:0]            s_axi_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARVALID" *) input  wire                  s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI ARREADY" *) output wire                  s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RDATA"   *) output wire [AXI_DATA_W-1:0] s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RRESP"   *) output wire [1:0]            s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RVALID"  *) output wire                  s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI RREADY"  *) input  wire                  s_axi_rready,

    // =========================================================================
    // S_UART — UART slave  (8 N 1 boot console, active from Early-PL)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:uart_rtl:1.0 S_UART RxD" *) input  wire uart_rxd,
    (* X_INTERFACE_INFO = "xilinx.com:interface:uart_rtl:1.0 S_UART TxD" *) output wire uart_txd,

    // =========================================================================
    // M_AXI_GTY — AXI4-Lite master → GTY transceiver intercept S_AXI_CTRL
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY AWADDR"  *) output wire [7:0]            m_axi_gty_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY AWPROT"  *) output wire [2:0]            m_axi_gty_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY AWVALID" *) output wire                  m_axi_gty_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY AWREADY" *) input  wire                  m_axi_gty_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY WDATA"   *) output wire [31:0]           m_axi_gty_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY WSTRB"   *) output wire [3:0]            m_axi_gty_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY WVALID"  *) output wire                  m_axi_gty_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY WREADY"  *) input  wire                  m_axi_gty_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY BRESP"   *) input  wire [1:0]            m_axi_gty_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY BVALID"  *) input  wire                  m_axi_gty_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY BREADY"  *) output wire                  m_axi_gty_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY ARADDR"  *) output wire [7:0]            m_axi_gty_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY ARPROT"  *) output wire [2:0]            m_axi_gty_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY ARVALID" *) output wire                  m_axi_gty_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY ARREADY" *) input  wire                  m_axi_gty_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY RDATA"   *) input  wire [31:0]           m_axi_gty_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY RRESP"   *) input  wire [1:0]            m_axi_gty_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY RVALID"  *) input  wire                  m_axi_gty_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_GTY RREADY"  *) output wire                  m_axi_gty_rready,

    // =========================================================================
    // M_AXI_MB — AXI4-Lite master → MicroBlaze cache shim S_AXI_CTRL
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB AWADDR"  *) output wire [7:0]  m_axi_mb_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB AWPROT"  *) output wire [2:0]  m_axi_mb_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB AWVALID" *) output wire        m_axi_mb_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB AWREADY" *) input  wire        m_axi_mb_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB WDATA"   *) output wire [31:0] m_axi_mb_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB WSTRB"   *) output wire [3:0]  m_axi_mb_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB WVALID"  *) output wire        m_axi_mb_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB WREADY"  *) input  wire        m_axi_mb_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB BRESP"   *) input  wire [1:0]  m_axi_mb_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB BVALID"  *) input  wire        m_axi_mb_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB BREADY"  *) output wire        m_axi_mb_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB ARADDR"  *) output wire [7:0]  m_axi_mb_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB ARPROT"  *) output wire [2:0]  m_axi_mb_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB ARVALID" *) output wire        m_axi_mb_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB ARREADY" *) input  wire        m_axi_mb_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB RDATA"   *) input  wire [31:0] m_axi_mb_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB RRESP"   *) input  wire [1:0]  m_axi_mb_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB RVALID"  *) input  wire        m_axi_mb_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_MB RREADY"  *) output wire        m_axi_mb_rready,

    // =========================================================================
    // M_AXI_AXB — AXI4-Lite master → AXI/NoC bridge intercept S_AXI_CTRL
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB AWADDR"  *) output wire [7:0]  m_axi_axb_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB AWPROT"  *) output wire [2:0]  m_axi_axb_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB AWVALID" *) output wire        m_axi_axb_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB AWREADY" *) input  wire        m_axi_axb_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB WDATA"   *) output wire [31:0] m_axi_axb_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB WSTRB"   *) output wire [3:0]  m_axi_axb_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB WVALID"  *) output wire        m_axi_axb_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB WREADY"  *) input  wire        m_axi_axb_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB BRESP"   *) input  wire [1:0]  m_axi_axb_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB BVALID"  *) input  wire        m_axi_axb_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB BREADY"  *) output wire        m_axi_axb_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB ARADDR"  *) output wire [7:0]  m_axi_axb_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB ARPROT"  *) output wire [2:0]  m_axi_axb_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB ARVALID" *) output wire        m_axi_axb_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB ARREADY" *) input  wire        m_axi_axb_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB RDATA"   *) input  wire [31:0] m_axi_axb_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB RRESP"   *) input  wire [1:0]  m_axi_axb_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB RVALID"  *) input  wire        m_axi_axb_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_AXB RREADY"  *) output wire        m_axi_axb_rready,

    // =========================================================================
    // M_AXI_PMC — AXI4-Lite master → PMC boot intercept S_AXI_CTRL
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC AWADDR"  *) output wire [7:0]  m_axi_pmc_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC AWPROT"  *) output wire [2:0]  m_axi_pmc_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC AWVALID" *) output wire        m_axi_pmc_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC AWREADY" *) input  wire        m_axi_pmc_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC WDATA"   *) output wire [31:0] m_axi_pmc_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC WSTRB"   *) output wire [3:0]  m_axi_pmc_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC WVALID"  *) output wire        m_axi_pmc_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC WREADY"  *) input  wire        m_axi_pmc_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC BRESP"   *) input  wire [1:0]  m_axi_pmc_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC BVALID"  *) input  wire        m_axi_pmc_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC BREADY"  *) output wire        m_axi_pmc_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC ARADDR"  *) output wire [7:0]  m_axi_pmc_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC ARPROT"  *) output wire [2:0]  m_axi_pmc_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC ARVALID" *) output wire        m_axi_pmc_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC ARREADY" *) input  wire        m_axi_pmc_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC RDATA"   *) input  wire [31:0] m_axi_pmc_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC RRESP"   *) input  wire [1:0]  m_axi_pmc_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC RVALID"  *) input  wire        m_axi_pmc_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 M_AXI_PMC RREADY"  *) output wire        m_axi_pmc_rready,

    // =========================================================================
    // Raw GTY status (async, sampled into axi_clk domain via 2-FF sync)
    // =========================================================================
    input  wire [NUM_GTY-1:0]  gty_lane_locked,   // from GTY intercept
    input  wire [NUM_GTY-1:0]  gty_lane_error      // from GTY intercept
);

    // =========================================================================
    // CSR Register Bank  (axi_clk domain)
    // =========================================================================
    reg [31:0] csr_ctrl;        // 0x00
    reg [31:0] csr_uart_ctrl;   // 0x08  [23:8]=baud_div
    reg [31:0] csr_uart_txd;    // 0x0C  write triggers TX
    reg [31:0] csr_uart_rxd;    // 0x10  last received byte
    reg [31:0] csr_uart_stat;   // 0x14  [0]=rx_valid [1]=tx_busy

    // 2-FF synchronisers for raw GTY status into axi_clk
    reg [NUM_GTY-1:0] gty_lock_s1, gty_lock_s;
    reg [NUM_GTY-1:0] gty_err_s1,  gty_err_s;
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            gty_lock_s1 <= {NUM_GTY{1'b0}}; gty_lock_s <= {NUM_GTY{1'b0}};
            gty_err_s1  <= {NUM_GTY{1'b0}}; gty_err_s  <= {NUM_GTY{1'b0}};
        end else begin
            gty_lock_s1 <= gty_lane_locked; gty_lock_s <= gty_lock_s1;
            gty_err_s1  <= gty_lane_error;  gty_err_s  <= gty_err_s1;
        end
    end

    // =========================================================================
    // S_AXI — AXI4-Lite slave implementation
    // =========================================================================
    reg        aw_active;
    reg [7:0]  aw_addr_lat;
    reg        w_active;
    reg        b_pending;
    reg        ar_active;
    reg [7:0]  ar_addr_lat;
    reg        r_pending;
    reg [31:0] r_dat;
    reg        uart_tx_trigger; // pulse: new byte loaded for TX

    assign s_axi_awready = !aw_active && !b_pending;
    assign s_axi_wready  = !w_active  && !b_pending;
    assign s_axi_bresp   = 2'b00;
    assign s_axi_bvalid  = b_pending;
    assign s_axi_arready = !ar_active && !r_pending;
    assign s_axi_rdata   = r_dat;
    assign s_axi_rresp   = 2'b00;
    assign s_axi_rvalid  = r_pending;

    // --- Write path ---
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            aw_active <= 1'b0; w_active <= 1'b0; b_pending <= 1'b0;
            aw_addr_lat <= 8'h0;
            csr_ctrl      <= 32'h0;
            csr_uart_ctrl <= {8'h0, 16'd1735, 8'h0}; // default 115200 baud
            csr_uart_txd  <= 32'h0;
            uart_tx_trigger <= 1'b0;
        end else begin
            uart_tx_trigger <= 1'b0;
            // AW handshake
            if (s_axi_awvalid && s_axi_awready) begin
                aw_active   <= 1'b1;
                aw_addr_lat <= s_axi_awaddr[7:0];
            end
            // W handshake
            if (s_axi_wvalid && s_axi_wready) begin
                w_active <= 1'b1;
            end
            // Commit write when both AW and W have been accepted
            if (aw_active && w_active) begin
                aw_active <= 1'b0; w_active <= 1'b0; b_pending <= 1'b1;
                case (aw_addr_lat[5:2])
                    4'h0: csr_ctrl      <= s_axi_wdata;
                    4'h1: ;  // STATUS register is read-only; writes ignored
                    4'h2: csr_uart_ctrl <= s_axi_wdata;
                    4'h3: begin
                        csr_uart_txd  <= s_axi_wdata;
                        uart_tx_trigger <= 1'b1;
                    end
                    default: ;
                endcase
            end
            if (b_pending && s_axi_bready) b_pending <= 1'b0;
        end
    end

    // --- Read path ---
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            ar_active <= 1'b0; r_pending <= 1'b0;
            ar_addr_lat <= 8'h0; r_dat <= 32'h0;
        end else begin
            if (s_axi_arvalid && s_axi_arready) begin
                ar_active   <= 1'b1;
                ar_addr_lat <= s_axi_araddr[7:0];
            end
            if (ar_active && !r_pending) begin
                ar_active <= 1'b0; r_pending <= 1'b1;
                case (ar_addr_lat[5:2])
                    4'h0: r_dat <= csr_ctrl;
                    4'h1: r_dat <= {{(32-2*NUM_GTY){1'b0}}, gty_err_s, gty_lock_s};
                    4'h2: r_dat <= csr_uart_ctrl;
                    4'h3: r_dat <= csr_uart_txd;
                    4'h4: r_dat <= csr_uart_rxd;
                    4'h5: r_dat <= csr_uart_stat;
                    default: r_dat <= 32'hDEAD_BEEF;
                endcase
            end
            if (r_pending && s_axi_rready) r_pending <= 1'b0;
        end
    end

    // =========================================================================
    // UART 8N1 transmitter  (axi_clk domain, baud_div from csr_uart_ctrl[23:8])
    // =========================================================================
    wire [15:0] baud_div = csr_uart_ctrl[23:8];

    reg [15:0] tx_baud_cnt;
    reg [9:0]  tx_shift;    // {stop, data[7:0], start}
    reg [3:0]  tx_bit_cnt;
    reg        tx_busy;
    reg        tx_out;

    assign uart_txd          = tx_out;
    assign csr_uart_stat[1]  = tx_busy;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            tx_baud_cnt <= 16'h0; tx_shift <= 10'h3FF;
            tx_bit_cnt  <= 4'h0;  tx_busy  <= 1'b0; tx_out <= 1'b1;
        end else begin
            if (!tx_busy && uart_tx_trigger) begin
                // Load: start=0, data[7:0], stop=1
                tx_shift    <= {1'b1, csr_uart_txd[7:0], 1'b0};
                tx_bit_cnt  <= 4'd10;
                tx_baud_cnt <= baud_div;
                tx_busy     <= 1'b1;
                tx_out      <= 1'b0; // start bit
            end else if (tx_busy) begin
                if (tx_baud_cnt == 16'h0) begin
                    tx_baud_cnt <= baud_div;
                    tx_out      <= tx_shift[0];
                    tx_shift    <= {1'b1, tx_shift[9:1]};
                    tx_bit_cnt  <= tx_bit_cnt - 4'd1;
                    if (tx_bit_cnt == 4'd1) tx_busy <= 1'b0;
                end else begin
                    tx_baud_cnt <= tx_baud_cnt - 16'd1;
                end
            end
        end
    end

    // =========================================================================
    // UART 8N1 receiver  (axi_clk domain)
    // =========================================================================
    reg        rx_s1, rx_s;          // 2-FF metastability filter
    reg [15:0] rx_baud_cnt;
    reg [9:0]  rx_shift;
    reg [3:0]  rx_bit_cnt;
    reg        rx_active;
    reg        rx_valid;

    assign csr_uart_stat[0]  = rx_valid;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            rx_s1 <= 1'b1; rx_s <= 1'b1;
            rx_baud_cnt <= 16'h0; rx_shift <= 10'h0;
            rx_bit_cnt  <= 4'h0;  rx_active <= 1'b0; rx_valid <= 1'b0;
            csr_uart_rxd <= 32'h0;
        end else begin
            // 2-FF sync
            rx_s1 <= uart_rxd; rx_s <= rx_s1;
            // clear rx_valid on CSR read (read address 0x10)
            if (ar_active && ar_addr_lat[5:2] == 4'h4) rx_valid <= 1'b0;

            if (!rx_active) begin
                if (!rx_s) begin  // start bit detected
                    rx_active   <= 1'b1;
                    rx_baud_cnt <= {1'b0, baud_div[15:1]}; // half-bit to centre
                    rx_bit_cnt  <= 4'd9;  // 8 data + 1 stop
                    rx_shift    <= 10'h0;
                end
            end else begin
                if (rx_baud_cnt == 16'h0) begin
                    rx_baud_cnt <= baud_div;
                    rx_shift    <= {rx_s, rx_shift[9:1]};
                    rx_bit_cnt  <= rx_bit_cnt - 4'd1;
                    if (rx_bit_cnt == 4'd1) begin
                        rx_active       <= 1'b0;
                        // rx_shift[8:1] = data bits after stop sampled
                        csr_uart_rxd    <= {24'h0, rx_shift[8:1]};
                        rx_valid        <= 1'b1;
                    end
                end else begin
                    rx_baud_cnt <= rx_baud_cnt - 16'd1;
                end
            end
        end
    end

    // =========================================================================
    // Module enable outputs (from csr_ctrl bits → drive each master port)
    // Each master pushes the global enable to the module's CTRL register.
    // FSM: IDLE → AW_DATA → WAIT_B
    // =========================================================================

    // ---------- Generic AXI4-Lite write-only master macro ----------
    // Instantiated four times below (one per intercept module).
    //
    // Signal naming convention:  <pfx>_*
    //   Inputs  : <pfx>_trig (pulse), <pfx>_addr [7:0], <pfx>_wdata [31:0]
    //   Outputs : tied directly to the M_AXI_* ports
    //
    // All four masters share the same FSM template; they differ only in which
    // CSR bit triggers them and which M_AXI port they drive.

    // --- GTY master ---
    localparam M_IDLE=2'd0, M_AW=2'd1, M_W=2'd2, M_B=2'd3;
    reg [1:0]  gty_m_st; reg gty_aw_vld, gty_w_vld; reg [31:0] gty_wdat; reg gty_prev_en;
    reg [1:0]  mb_m_st;  reg mb_aw_vld,  mb_w_vld;  reg [31:0] mb_wdat;  reg mb_prev_en;
    reg [1:0]  axb_m_st; reg axb_aw_vld, axb_w_vld; reg [31:0] axb_wdat; reg axb_prev_en;
    reg [1:0]  pmc_m_st; reg pmc_aw_vld, pmc_w_vld; reg [31:0] pmc_wdat; reg pmc_prev_en;

    // GTY master FSM
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            gty_m_st<=M_IDLE; gty_aw_vld<=0; gty_w_vld<=0; gty_wdat<=0; gty_prev_en<=0;
        end else begin
            gty_prev_en <= csr_ctrl[1];
            case (gty_m_st)
                M_IDLE: if (csr_ctrl[1] != gty_prev_en) begin
                    gty_wdat <= {31'h0, csr_ctrl[1]};
                    gty_aw_vld <= 1'b1; gty_w_vld <= 1'b1; gty_m_st <= M_AW;
                end
                M_AW: begin
                    if (m_axi_gty_awready) gty_aw_vld <= 1'b0;
                    if (m_axi_gty_wready)  gty_w_vld  <= 1'b0;
                    if (!gty_aw_vld && !gty_w_vld) gty_m_st <= M_B;
                end
                M_B: if (m_axi_gty_bvalid) gty_m_st <= M_IDLE;
                default: gty_m_st <= M_IDLE;
            endcase
        end
    end
    assign m_axi_gty_awaddr  = 8'h00;
    assign m_axi_gty_awprot  = 3'b000;
    assign m_axi_gty_awvalid = gty_aw_vld;
    assign m_axi_gty_wdata   = gty_wdat;
    assign m_axi_gty_wstrb   = 4'hF;
    assign m_axi_gty_wvalid  = gty_w_vld;
    assign m_axi_gty_bready  = 1'b1;
    assign m_axi_gty_araddr  = 8'h00;
    assign m_axi_gty_arprot  = 3'b000;
    assign m_axi_gty_arvalid = 1'b0;
    assign m_axi_gty_rready  = 1'b0;

    // MB master FSM
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            mb_m_st<=M_IDLE; mb_aw_vld<=0; mb_w_vld<=0; mb_wdat<=0; mb_prev_en<=0;
        end else begin
            mb_prev_en <= csr_ctrl[2];
            case (mb_m_st)
                M_IDLE: if (csr_ctrl[2] != mb_prev_en) begin
                    mb_wdat <= {31'h0, csr_ctrl[2]};
                    mb_aw_vld <= 1'b1; mb_w_vld <= 1'b1; mb_m_st <= M_AW;
                end
                M_AW: begin
                    if (m_axi_mb_awready) mb_aw_vld <= 1'b0;
                    if (m_axi_mb_wready)  mb_w_vld  <= 1'b0;
                    if (!mb_aw_vld && !mb_w_vld) mb_m_st <= M_B;
                end
                M_B: if (m_axi_mb_bvalid) mb_m_st <= M_IDLE;
                default: mb_m_st <= M_IDLE;
            endcase
        end
    end
    assign m_axi_mb_awaddr  = 8'h00;
    assign m_axi_mb_awprot  = 3'b000;
    assign m_axi_mb_awvalid = mb_aw_vld;
    assign m_axi_mb_wdata   = mb_wdat;
    assign m_axi_mb_wstrb   = 4'hF;
    assign m_axi_mb_wvalid  = mb_w_vld;
    assign m_axi_mb_bready  = 1'b1;
    assign m_axi_mb_araddr  = 8'h00;
    assign m_axi_mb_arprot  = 3'b000;
    assign m_axi_mb_arvalid = 1'b0;
    assign m_axi_mb_rready  = 1'b0;

    // AXB master FSM
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axb_m_st<=M_IDLE; axb_aw_vld<=0; axb_w_vld<=0; axb_wdat<=0; axb_prev_en<=0;
        end else begin
            axb_prev_en <= csr_ctrl[3];
            case (axb_m_st)
                M_IDLE: if (csr_ctrl[3] != axb_prev_en) begin
                    axb_wdat <= {31'h0, csr_ctrl[3]};
                    axb_aw_vld <= 1'b1; axb_w_vld <= 1'b1; axb_m_st <= M_AW;
                end
                M_AW: begin
                    if (m_axi_axb_awready) axb_aw_vld <= 1'b0;
                    if (m_axi_axb_wready)  axb_w_vld  <= 1'b0;
                    if (!axb_aw_vld && !axb_w_vld) axb_m_st <= M_B;
                end
                M_B: if (m_axi_axb_bvalid) axb_m_st <= M_IDLE;
                default: axb_m_st <= M_IDLE;
            endcase
        end
    end
    assign m_axi_axb_awaddr  = 8'h00;
    assign m_axi_axb_awprot  = 3'b000;
    assign m_axi_axb_awvalid = axb_aw_vld;
    assign m_axi_axb_wdata   = axb_wdat;
    assign m_axi_axb_wstrb   = 4'hF;
    assign m_axi_axb_wvalid  = axb_w_vld;
    assign m_axi_axb_bready  = 1'b1;
    assign m_axi_axb_araddr  = 8'h00;
    assign m_axi_axb_arprot  = 3'b000;
    assign m_axi_axb_arvalid = 1'b0;
    assign m_axi_axb_rready  = 1'b0;

    // PMC master FSM
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            pmc_m_st<=M_IDLE; pmc_aw_vld<=0; pmc_w_vld<=0; pmc_wdat<=0; pmc_prev_en<=0;
        end else begin
            pmc_prev_en <= csr_ctrl[4];
            case (pmc_m_st)
                M_IDLE: if (csr_ctrl[4] != pmc_prev_en) begin
                    pmc_wdat <= {31'h0, csr_ctrl[4]};
                    pmc_aw_vld <= 1'b1; pmc_w_vld <= 1'b1; pmc_m_st <= M_AW;
                end
                M_AW: begin
                    if (m_axi_pmc_awready) pmc_aw_vld <= 1'b0;
                    if (m_axi_pmc_wready)  pmc_w_vld  <= 1'b0;
                    if (!pmc_aw_vld && !pmc_w_vld) pmc_m_st <= M_B;
                end
                M_B: if (m_axi_pmc_bvalid) pmc_m_st <= M_IDLE;
                default: pmc_m_st <= M_IDLE;
            endcase
        end
    end
    assign m_axi_pmc_awaddr  = 8'h00;
    assign m_axi_pmc_awprot  = 3'b000;
    assign m_axi_pmc_awvalid = pmc_aw_vld;
    assign m_axi_pmc_wdata   = pmc_wdat;
    assign m_axi_pmc_wstrb   = 4'hF;
    assign m_axi_pmc_wvalid  = pmc_w_vld;
    assign m_axi_pmc_bready  = 1'b1;
    assign m_axi_pmc_araddr  = 8'h00;
    assign m_axi_pmc_arprot  = 3'b000;
    assign m_axi_pmc_arvalid = 1'b0;
    assign m_axi_pmc_rready  = 1'b0;

endmodule
