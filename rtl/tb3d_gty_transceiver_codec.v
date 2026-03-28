\
// =============================================================================
// Module  : tb3d_gty_transceiver_codec
// Project : TB3-D Platform Driver — Versal VPK180 (VP1802)
// File    : rtl/tb3d_gty_transceiver_codec.v
//
// Purpose : In-wire intercept for the GTYP transceiver data paths.
//           Placed between the raw GTYP TXDATA/RXDATA ports and the NoC so
//           that every bit leaving or entering the chip passes through TB3-D
//           encode/decode before it touches any processor or memory.
//
// Bus Interfaces exposed to Vivado IP-Integrator
// -----------------------------------------------
//   S_AXIS_RX   AXI4-Stream slave  — raw bits FROM the GTYP RX (Slave 1 / in-wire)
//   M_AXIS_RX   AXI4-Stream master — TB3D-decoded data TO system / NoC
//   S_AXIS_TX   AXI4-Stream slave  — raw data FROM system for encoding (Slave 1 / TX)
//   M_AXIS_TX   AXI4-Stream master — TB3D-encoded bits TO GTYP TX
//   S_AXI_CTRL  AXI4-Lite slave    — runtime control FROM orchestrator M_AXI_GTY (Slave 2)
//   DRP         DRP slave           — transceiver dynamic reconfiguration
//               (line-rate / PLL changes from MicroBlaze via orchestrator)
//
// Rule satisfied: >= 2 slaves + >= 1 master  (S_AXIS_RX, S_AXIS_TX, S_AXI_CTRL
//                                             + DRP = 4 slaves; M_AXIS_RX, M_AXIS_TX = 2 masters)
//
// Data widths:
//   AXIS: NUM_LANES x LANE_W bits  (default 8 x 64 = 512 bits)
//   S_AXI_CTRL: 32-bit, 8-bit byte address
//   DRP: 16-bit data, 10-bit address  (GTYP spec)
//
// Clock domains:
//   gty_clk  250 MHz — GTYP reference, drives both AXIS interfaces
//   axi_clk  200 MHz — drives S_AXI_CTRL (separate clock annotation)
//   drp_clk         — drives DRP interface (may equal axi_clk or gty_clk)
//
// S_AXI_CTRL CSR map (32-bit, byte address)
//   0x00  CTRL      [0]=codec_en  [NUM_LANES:1]=per_lane_en
//   0x04  STATUS    [NUM_LANES-1:0]=lane_locked  [2*NUM_LANES-1:NUM_LANES]=lane_err  (RO)
//   0x08  LANE_EN   [NUM_LANES-1:0]=per-lane enable mirror  (RW)
//   0x0C  DRP_ADDR  [9:0]=DRP address for debug readback  (RW)
//   0x10  DRP_RDATA [15:0]=last DRP read data  (RO)
// =============================================================================
`timescale 1ns / 1ps

module tb3d_gty_transceiver_codec #(
    parameter integer NUM_LANES = 8,
    parameter integer LANE_W    = 64,
    parameter integer TOTAL_W   = NUM_LANES * LANE_W   // 512
) (
    // =========================================================================
    // Clock & Reset — GTY data-path domain (AXIS interfaces)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS_RX:M_AXIS_RX:S_AXIS_TX:M_AXIS_TX, ASSOCIATED_RESET gty_rst_n, FREQ_HZ 250000000" *)
    input  wire gty_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire gty_rst_n,

    // =========================================================================
    // Clock & Reset — AXI control domain (S_AXI_CTRL)
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_CTRL, ASSOCIATED_RESET axi_rst_n, FREQ_HZ 200000000" *)
    input  wire axi_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire axi_rst_n,

    // =========================================================================
    // Clock — DRP domain
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF DRP, ASSOCIATED_RESET drp_rst_n, FREQ_HZ 200000000" *)
    input  wire drp_clk,
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire drp_rst_n,

    // =========================================================================
    // S_AXIS_RX — AXI4-Stream slave  (raw GTYP RX bits in → TB3D decode)
    //             Slave 1 / in-wire RX
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_RX TDATA"  *) input  wire [TOTAL_W-1:0] s_axis_rx_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_RX TVALID" *) input  wire               s_axis_rx_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_RX TREADY" *) output wire               s_axis_rx_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_RX TKEEP"  *) input  wire [TOTAL_W/8-1:0] s_axis_rx_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_RX TLAST"  *) input  wire               s_axis_rx_tlast,

    // =========================================================================
    // M_AXIS_RX — AXI4-Stream master (decoded data → system / NoC)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_RX TDATA"  *) output wire [TOTAL_W-1:0] m_axis_rx_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_RX TVALID" *) output wire               m_axis_rx_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_RX TREADY" *) input  wire               m_axis_rx_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_RX TKEEP"  *) output wire [TOTAL_W/8-1:0] m_axis_rx_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_RX TLAST"  *) output wire               m_axis_rx_tlast,

    // =========================================================================
    // S_AXIS_TX — AXI4-Stream slave  (system data in → TB3D encode)
    //             Slave 1 / in-wire TX
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_TX TDATA"  *) input  wire [TOTAL_W-1:0] s_axis_tx_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_TX TVALID" *) input  wire               s_axis_tx_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_TX TREADY" *) output wire               s_axis_tx_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_TX TKEEP"  *) input  wire [TOTAL_W/8-1:0] s_axis_tx_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_TX TLAST"  *) input  wire               s_axis_tx_tlast,

    // =========================================================================
    // M_AXIS_TX — AXI4-Stream master (TB3D-encoded bits → GTYP TX)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_TX TDATA"  *) output wire [TOTAL_W-1:0] m_axis_tx_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_TX TVALID" *) output wire               m_axis_tx_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_TX TREADY" *) input  wire               m_axis_tx_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_TX TKEEP"  *) output wire [TOTAL_W/8-1:0] m_axis_tx_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_TX TLAST"  *) output wire               m_axis_tx_tlast,

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite slave  (FROM orchestrator M_AXI_GTY — Slave 2)
    //              Runtime configuration and per-lane status readback.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWADDR"  *) input  wire [7:0]  s_axi_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWPROT"  *) input  wire [2:0]  s_axi_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWVALID" *) input  wire        s_axi_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWREADY" *) output wire        s_axi_ctrl_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WDATA"   *) input  wire [31:0] s_axi_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WSTRB"   *) input  wire [3:0]  s_axi_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WVALID"  *) input  wire        s_axi_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WREADY"  *) output wire        s_axi_ctrl_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BRESP"   *) output wire [1:0]  s_axi_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BVALID"  *) output wire        s_axi_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BREADY"  *) input  wire        s_axi_ctrl_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARADDR"  *) input  wire [7:0]  s_axi_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARPROT"  *) input  wire [2:0]  s_axi_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARVALID" *) input  wire        s_axi_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARREADY" *) output wire        s_axi_ctrl_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RDATA"   *) output wire [31:0] s_axi_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RRESP"   *) output wire [1:0]  s_axi_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RVALID"  *) output wire        s_axi_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RREADY"  *) input  wire        s_axi_ctrl_rready,

    // =========================================================================
    // DRP — Dynamic Reconfiguration Port slave
    //        The MicroBlaze (via orchestrator) drives this to change GTYP
    //        line rate, PLL multiplier, or encoding mode at runtime without
    //        a system reboot.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP EN"   *) input  wire        drp_en,
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP WE"   *) input  wire        drp_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP ADDR" *) input  wire [9:0]  drp_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP DI"   *) input  wire [15:0] drp_di,
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP DO"   *) output wire [15:0] drp_do,
    (* X_INTERFACE_INFO = "xilinx.com:interface:drp_rtl:1.0 DRP RDY"  *) output wire        drp_rdy,

    // Per-lane lock / error — raw status for orchestrator monitoring
    output wire [NUM_LANES-1:0] lane_locked,
    output wire [NUM_LANES-1:0] lane_error
);

    // =========================================================================
    // S_AXI_CTRL  —  AXI4-Lite slave register bank  (axi_clk domain)
    // =========================================================================
    reg [31:0] csr_ctrl;     // 0x00
    reg [31:0] csr_lane_en;  // 0x08
    reg [31:0] csr_drp_addr; // 0x0C
    reg [15:0] csr_drp_rdat; // 0x10 RO — updated by DRP read FSM

    reg  aw_act; reg [7:0] aw_lat;
    reg  w_act;
    reg  b_pend;
    reg  ar_act; reg [7:0] ar_lat;
    reg  r_pend; reg [31:0] r_dat;

    // 2-FF sync: lane_locked / lane_error from gty_clk → axi_clk
    reg [NUM_LANES-1:0] lk_s1, lk_s, er_s1, er_s;
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            lk_s1<=0; lk_s<=0; er_s1<=0; er_s<=0;
        end else begin
            lk_s1 <= lane_locked; lk_s <= lk_s1;
            er_s1 <= lane_error;  er_s <= er_s1;
        end
    end

    assign s_axi_ctrl_awready = !aw_act && !b_pend;
    assign s_axi_ctrl_wready  = !w_act  && !b_pend;
    assign s_axi_ctrl_bresp   = 2'b00;
    assign s_axi_ctrl_bvalid  = b_pend;
    assign s_axi_ctrl_arready = !ar_act && !r_pend;
    assign s_axi_ctrl_rdata   = r_dat;
    assign s_axi_ctrl_rresp   = 2'b00;
    assign s_axi_ctrl_rvalid  = r_pend;

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            aw_act<=0; w_act<=0; b_pend<=0; aw_lat<=0;
            csr_ctrl<=0; csr_lane_en<=0; csr_drp_addr<=0;
        end else begin
            if (s_axi_ctrl_awvalid && s_axi_ctrl_awready) begin aw_act<=1; aw_lat<=s_axi_ctrl_awaddr; end
            if (s_axi_ctrl_wvalid  && s_axi_ctrl_wready)  w_act<=1;
            if (aw_act && w_act) begin
                aw_act<=0; w_act<=0; b_pend<=1;
                case (aw_lat[5:2])
                    4'd0: csr_ctrl     <= s_axi_ctrl_wdata;
                    4'd2: csr_lane_en  <= s_axi_ctrl_wdata;
                    4'd3: csr_drp_addr <= s_axi_ctrl_wdata;
                    default: ;
                endcase
            end
            if (b_pend && s_axi_ctrl_bready) b_pend<=0;
        end
    end

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin ar_act<=0; r_pend<=0; ar_lat<=0; r_dat<=0; end
        else begin
            if (s_axi_ctrl_arvalid && s_axi_ctrl_arready) begin ar_act<=1; ar_lat<=s_axi_ctrl_araddr; end
            if (ar_act && !r_pend) begin
                ar_act<=0; r_pend<=1;
                case (ar_lat[5:2])
                    4'd0: r_dat <= csr_ctrl;
                    4'd1: r_dat <= {{(32-2*NUM_LANES){1'b0}}, er_s, lk_s};
                    4'd2: r_dat <= csr_lane_en;
                    4'd3: r_dat <= csr_drp_addr;
                    4'd4: r_dat <= {16'h0, csr_drp_rdat};
                    default: r_dat <= 32'hDEAD_BEEF;
                endcase
            end
            if (r_pend && s_axi_ctrl_rready) r_pend<=0;
        end
    end

    // =========================================================================
    // DRP Register Bank  (drp_clk domain)
    //
    // Models the GTYP DRP address space.  Key registers:
    //   0x028  RXOUT_DIV  — RX output clock divider
    //   0x057  TXOUT_DIV  — TX output clock divider
    //   0x011  PLL_FBDIV  — PLL feedback divider
    // In a real implementation these wires connect directly to the GT_QUAD_BASE
    // DRP ports.  Here we implement a 32-entry shadow RAM for simulation.
    // =========================================================================
    reg [15:0] drp_ram [0:31];
    reg        drp_rdy_r;
    reg [15:0] drp_do_r;

    assign drp_do  = drp_do_r;
    assign drp_rdy = drp_rdy_r;

    integer i;
    always @(posedge drp_clk or negedge drp_rst_n) begin
        if (!drp_rst_n) begin
            drp_rdy_r <= 1'b0; drp_do_r <= 16'h0;
            for (i=0; i<32; i=i+1) drp_ram[i] <= 16'h0;
        end else begin
            drp_rdy_r <= 1'b0;
            if (drp_en) begin
                if (drp_we) drp_ram[drp_addr[4:0]] <= drp_di;
                drp_do_r  <= drp_ram[drp_addr[4:0]];
                drp_rdy_r <= 1'b1;
            end
        end
    end

    // Capture last DRP read into axi_clk domain for CSR readback
    // (simple registered transfer — acceptable because DRP ops are infrequent)
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) csr_drp_rdat <= 16'h0;
        else if (drp_rdy) csr_drp_rdat <= drp_do;
    end

    // =========================================================================
    // TB3D Data Path  (gty_clk domain, combinational)
    //
    // TX path: S_AXIS_TX → byte-wise tb3d_encode → M_AXIS_TX
    // RX path: S_AXIS_RX → byte-wise tb3d_decode → M_AXIS_RX
    //
    // When codec_en = 0 (CSR CTRL[0]=0) data passes through unmodified.
    // Per-lane enable (CSR CTRL[NUM_LANES:1] / LANE_EN) gates encoding
    // lane-by-lane so individual lanes can be brought up without re-encoding.
    // =========================================================================

    // 2-FF sync for codec_en and per-lane enables into gty_clk
    wire codec_en_axi = csr_ctrl[0];
    wire [NUM_LANES-1:0] lane_en_axi = csr_lane_en[NUM_LANES-1:0];

    reg  codec_en_s1, codec_en_gty;
    reg  [NUM_LANES-1:0] lane_en_s1, lane_en_gty;

    always @(posedge gty_clk or negedge gty_rst_n) begin
        if (!gty_rst_n) begin
            codec_en_s1<=0; codec_en_gty<=0;
            lane_en_s1<={NUM_LANES{1'b0}}; lane_en_gty<={NUM_LANES{1'b0}};
        end else begin
            codec_en_s1 <= codec_en_axi; codec_en_gty <= codec_en_s1;
            lane_en_s1  <= lane_en_axi;  lane_en_gty  <= lane_en_s1;
        end
    end

    // Encoded / decoded busses (combinational)
    wire [TOTAL_W-1:0] tx_encoded;
    wire [TOTAL_W-1:0] rx_decoded;

    genvar ln, by;
    generate
        for (ln = 0; ln < NUM_LANES; ln = ln + 1) begin : g_lane
            for (by = 0; by < LANE_W/8; by = by + 1) begin : g_byte
                localparam B = ln * LANE_W + by * 8;
                // TX encode
                tb3d_encode u_enc (
                    .physical (s_axis_tx_tdata[B+3:B  ]),
                    .color    (s_axis_tx_tdata[B+7:B+4]),
                    .encoded  (tx_encoded[B+7:B])
                );
                // RX decode
                wire [3:0] rx_phys, rx_col;
                tb3d_decode u_dec (
                    .encoded  (s_axis_rx_tdata[B+7:B]),
                    .physical (rx_phys),
                    .color    (rx_col)
                );
                assign rx_decoded[B+7:B] = {rx_col, rx_phys};
            end
        end
    endgenerate

    // Per-lane TX mux (encode or bypass)
    wire [TOTAL_W-1:0] tx_mux;
    genvar ml;
    generate
        for (ml = 0; ml < NUM_LANES; ml = ml + 1) begin : g_tx_mux
            localparam L = ml * LANE_W;
            assign tx_mux[L+LANE_W-1:L] = (codec_en_gty && lane_en_gty[ml])
                ? tx_encoded[L+LANE_W-1:L] : s_axis_tx_tdata[L+LANE_W-1:L];
        end
    endgenerate

    // Per-lane RX mux (decode or bypass)
    wire [TOTAL_W-1:0] rx_mux;
    genvar mr;
    generate
        for (mr = 0; mr < NUM_LANES; mr = mr + 1) begin : g_rx_mux
            localparam R = mr * LANE_W;
            assign rx_mux[R+LANE_W-1:R] = (codec_en_gty && lane_en_gty[mr])
                ? rx_decoded[R+LANE_W-1:R] : s_axis_rx_tdata[R+LANE_W-1:R];
        end
    endgenerate

    // TX outputs
    assign m_axis_tx_tdata  = tx_mux;
    assign m_axis_tx_tvalid = s_axis_tx_tvalid;
    assign s_axis_tx_tready = m_axis_tx_tready;
    assign m_axis_tx_tkeep  = s_axis_tx_tkeep;
    assign m_axis_tx_tlast  = s_axis_tx_tlast;

    // RX outputs
    assign m_axis_rx_tdata  = rx_mux;
    assign m_axis_rx_tvalid = s_axis_rx_tvalid;
    assign s_axis_rx_tready = m_axis_rx_tready;
    assign m_axis_rx_tkeep  = s_axis_rx_tkeep;
    assign m_axis_rx_tlast  = s_axis_rx_tlast;

    // Lane status placeholders — connect to GT_QUAD_BASE status ports in BD
    assign lane_locked = {NUM_LANES{1'b1}};
    assign lane_error  = {NUM_LANES{1'b0}};

endmodule
