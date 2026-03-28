// =============================================================================
// Module  : tb3d_gty_transceiver_codec
// Project : TB3-D Platform Driver — Versal 1802
// File    : rtl/tb3d_gty_transceiver_codec.v
//
// Purpose : Wrapper for 512 GTYP transceiver lanes with embedded TB3-D
//           encoding/decoding logic. Each GTY lane is intercepted to perform:
//           - TX path: user binary → TB3D "folded binary" (encode + TX)
//           - RX path: TB3D "folded binary" → user binary (RX + decode)
//
// Architecture:
//   For each of 512 GTYP lanes:
//     User TX data (8-bit) ──→ [tb3d_encode] ──→ GTY TX serial
//     GTY RX serial ──→ [tb3d_decode] ──→ User RX data (8-bit)
//
//   Grouped into 16 sub-modules (32 lanes each) to manage timing and area
//   while maintaining per-lane independence.
//
// Clock Domains:
//   gty_clk : GTY reference clock (~250 MHz), data path
//   axi_clk : AXI4-Lite control clock (e.g. 100–200 MHz)
//
// Control Interface:
//   S_AXI_CTRL (AXI4-Lite slave, 32-bit data, 9-bit address)
//   CSR register map:
//     0x000        : csr_ctrl         — bit[0] = global codec enable
//     0x004        : csr_status       — read-only aggregate status
//     0x008-0x044  : csr_lane_en[0:15]   — 16×32b lane enable bank
//     0x048-0x084  : csr_lane_lock[0:15] — 16×32b lane lock  (RO)
//     0x088-0x0C4  : csr_lane_err[0:15]  — 16×32b lane error (RO)
//
// Latency:
//   TX (binary → TB3D): 0 cycles (combinational)
//   RX (TB3D → binary): 0 cycles (combinational)
//   GTY transceiver itself adds ~16-24 cycles (architectural, not codec latency)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_gty_transceiver_codec #(
    parameter NUM_LANES           = 512,           // Total GTYP lanes on board
    parameter LANES_PER_GROUP     = 32,            // Lanes per sub-module group
    parameter NUM_GROUPS          = NUM_LANES / LANES_PER_GROUP,
    parameter GTY_DATA_WIDTH      = 64,            // GTY data payload width
    parameter GTY_COMMA_WIDTH     = 8              // GTY comma/control width
) (
    // =========================================================================
    // Clock & Reset — GTY data-path domain
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS_USER_TX:M_AXIS_GTY_TX:S_AXIS_GTY_RX:M_AXIS_USER_RX, ASSOCIATED_RESET gty_rst_n" *)
    input  wire                     gty_clk,        // 250 MHz GTY reference / user clock
    input  wire                     gty_rst_n,      // Active-low asynchronous reset

    // =========================================================================
    // Clock & Reset — AXI control domain
    // =========================================================================
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI_CTRL, ASSOCIATED_RESET axi_rst_n" *)
    input  wire                     axi_clk,        // AXI4-Lite control clock
    input  wire                     axi_rst_n,      // Active-low reset for AXI domain

    // =========================================================================
    // Status Outputs (S_GTY_STATUS interface, gty_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:user:s_gty_status_rtl:1.0 S_GTY_STATUS LOCKED" *)
    output wire [NUM_LANES-1:0]     lane_locked,    // Per-lane transceiver lock status
    (* X_INTERFACE_INFO = "xilinx.com:user:s_gty_status_rtl:1.0 S_GTY_STATUS ERROR" *)
    output wire [NUM_LANES-1:0]     lane_error,     // Per-lane error flag

    // =========================================================================
    // User TX Interface — S_AXIS_USER_TX (gty_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_USER_TX TDATA" *)
    input  wire [NUM_LANES*8-1:0]   user_tx_data,   // [lane][7:0] - binary bytes
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_USER_TX TVALID" *)
    input  wire [NUM_LANES-1:0]     user_tx_valid,  // Per-lane valid flag
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_USER_TX TREADY" *)
    output wire [NUM_LANES-1:0]     user_tx_ready,  // Per-lane ready flag

    // =========================================================================
    // GTY TX Interface — M_AXIS_GTY_TX (gty_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_GTY_TX TVALID" *)
    output wire [NUM_LANES-1:0]     gty_tx_valid,   // Encoded data valid to GTY
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_GTY_TX TDATA" *)
    output wire [NUM_LANES*8-1:0]   gty_tx_data,    // Encoded TB3D bytes to GTY
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_GTY_TX TREADY" *)
    input  wire [NUM_LANES-1:0]     gty_tx_ready,   // Backpressure from GTY

    // =========================================================================
    // GTY RX Interface — S_AXIS_GTY_RX (gty_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_GTY_RX TVALID" *)
    input  wire [NUM_LANES-1:0]     gty_rx_valid,   // TB3D data valid from GTY
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_GTY_RX TDATA" *)
    input  wire [NUM_LANES*8-1:0]   gty_rx_data,    // TB3D encoded bytes from GTY
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 S_AXIS_GTY_RX TREADY" *)
    output wire [NUM_LANES-1:0]     gty_rx_ready,   // Ready to accept RX data

    // =========================================================================
    // User RX Interface — M_AXIS_USER_RX (gty_clk domain)
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_USER_RX TVALID" *)
    output wire [NUM_LANES-1:0]     user_rx_valid,  // Per-lane valid flag
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_USER_RX TDATA" *)
    output wire [NUM_LANES*8-1:0]   user_rx_data,   // [lane][7:0] - decoded binary
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis_rtl:1.0 M_AXIS_USER_RX TREADY" *)
    input  wire [NUM_LANES-1:0]     user_rx_ready,  // Per-lane ready flag

    // =========================================================================
    // S_AXI_CTRL — AXI4-Lite slave (axi_clk domain, 32-bit data, 9-bit address)
    // =========================================================================
    // Write address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWADDR" *)
    input  wire [8:0]               s_axi_ctrl_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWPROT" *)
    input  wire [2:0]               s_axi_ctrl_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWVALID" *)
    input  wire                     s_axi_ctrl_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL AWREADY" *)
    output wire                     s_axi_ctrl_awready,
    // Write data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WDATA" *)
    input  wire [31:0]              s_axi_ctrl_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WSTRB" *)
    input  wire [3:0]               s_axi_ctrl_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WVALID" *)
    input  wire                     s_axi_ctrl_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL WREADY" *)
    output wire                     s_axi_ctrl_wready,
    // Write response channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BRESP" *)
    output wire [1:0]               s_axi_ctrl_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BVALID" *)
    output wire                     s_axi_ctrl_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL BREADY" *)
    input  wire                     s_axi_ctrl_bready,
    // Read address channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARADDR" *)
    input  wire [8:0]               s_axi_ctrl_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARPROT" *)
    input  wire [2:0]               s_axi_ctrl_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARVALID" *)
    input  wire                     s_axi_ctrl_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ARREADY" *)
    output wire                     s_axi_ctrl_arready,
    // Read data channel
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RDATA" *)
    output wire [31:0]              s_axi_ctrl_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RRESP" *)
    output wire [1:0]               s_axi_ctrl_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RVALID" *)
    output wire                     s_axi_ctrl_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL RREADY" *)
    input  wire                     s_axi_ctrl_rready
);

    // =========================================================================
    // Sanity Check
    // =========================================================================
    initial begin
        if (NUM_LANES % LANES_PER_GROUP != 0) begin
            $error("NUM_LANES (%0d) must be divisible by LANES_PER_GROUP (%0d)",
                   NUM_LANES, LANES_PER_GROUP);
        end
    end

    // =========================================================================
    // AXI4-Lite Slave — CSR Register Bank (axi_clk domain)
    // =========================================================================

    // CSR registers
    reg  [31:0] csr_ctrl;                   // word 0  : 0x000 — bit[0] = global codec en
    reg  [31:0] csr_lane_en [0:15];         // words 2-17 : 0x008-0x044

    // AXI4-Lite handshake registers
    reg         aw_en;
    reg  [8:0]  aw_addr_lat;
    reg         axi_awready_r;
    reg         axi_wready_r;
    reg         axi_bvalid_r;
    reg  [1:0]  axi_bresp_r;
    reg         axi_arready_r;
    reg  [31:0] axi_rdata_r;
    reg  [1:0]  axi_rresp_r;
    reg         axi_rvalid_r;
    reg  [8:0]  ar_addr_lat;

    // Loop index for reset initialization
    integer i_init;

    assign s_axi_ctrl_awready = axi_awready_r;
    assign s_axi_ctrl_wready  = axi_wready_r;
    assign s_axi_ctrl_bresp   = axi_bresp_r;
    assign s_axi_ctrl_bvalid  = axi_bvalid_r;
    assign s_axi_ctrl_arready = axi_arready_r;
    assign s_axi_ctrl_rdata   = axi_rdata_r;
    assign s_axi_ctrl_rresp   = axi_rresp_r;
    assign s_axi_ctrl_rvalid  = axi_rvalid_r;

    // -------------------------------------------------------------------------
    // Write address channel
    // -------------------------------------------------------------------------
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axi_awready_r <= 1'b0;
            aw_en         <= 1'b1;
            aw_addr_lat   <= 9'd0;
        end else begin
            if (!axi_awready_r && s_axi_ctrl_awvalid && s_axi_ctrl_wvalid && aw_en) begin
                axi_awready_r <= 1'b1;
                aw_en         <= 1'b0;
                aw_addr_lat   <= s_axi_ctrl_awaddr;
            end else if (s_axi_ctrl_bready && axi_bvalid_r) begin
                axi_awready_r <= 1'b0;
                aw_en         <= 1'b1;
            end else begin
                axi_awready_r <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Write data channel
    // -------------------------------------------------------------------------
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axi_wready_r <= 1'b0;
        end else begin
            if (!axi_wready_r && s_axi_ctrl_wvalid && s_axi_ctrl_awvalid && aw_en)
                axi_wready_r <= 1'b1;
            else
                axi_wready_r <= 1'b0;
        end
    end

    // -------------------------------------------------------------------------
    // Register writes
    // -------------------------------------------------------------------------
    reg lane_en_upd_axi;  // toggle each time the lane_en bank is written (CDC flag)

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            csr_ctrl        <= 32'd0;
            lane_en_upd_axi <= 1'b0;
            for (i_init = 0; i_init < 16; i_init = i_init + 1)
                csr_lane_en[i_init] <= 32'd0;
        end else begin
            if (axi_wready_r && s_axi_ctrl_wvalid &&
                axi_awready_r && s_axi_ctrl_awvalid) begin
                case (aw_addr_lat[8:2])
                    7'd0: begin  // 0x000 — csr_ctrl
                        if (s_axi_ctrl_wstrb[0]) csr_ctrl[7:0]   <= s_axi_ctrl_wdata[7:0];
                        if (s_axi_ctrl_wstrb[1]) csr_ctrl[15:8]  <= s_axi_ctrl_wdata[15:8];
                        if (s_axi_ctrl_wstrb[2]) csr_ctrl[23:16] <= s_axi_ctrl_wdata[23:16];
                        if (s_axi_ctrl_wstrb[3]) csr_ctrl[31:24] <= s_axi_ctrl_wdata[31:24];
                    end
                    // words 2-17: csr_lane_en[0:15] (0x008-0x044)
                    // Toggle lane_en_upd_axi once per AXI write transaction to
                    // signal the gty_clk CDC stage to latch the updated bank.
                    7'd2,  7'd3,  7'd4,  7'd5,
                    7'd6,  7'd7,  7'd8,  7'd9,
                    7'd10, 7'd11, 7'd12, 7'd13,
                    7'd14, 7'd15, 7'd16, 7'd17: begin
                        if (s_axi_ctrl_wstrb[0]) csr_lane_en[aw_addr_lat[8:2] - 7'd2][7:0]   <= s_axi_ctrl_wdata[7:0];
                        if (s_axi_ctrl_wstrb[1]) csr_lane_en[aw_addr_lat[8:2] - 7'd2][15:8]  <= s_axi_ctrl_wdata[15:8];
                        if (s_axi_ctrl_wstrb[2]) csr_lane_en[aw_addr_lat[8:2] - 7'd2][23:16] <= s_axi_ctrl_wdata[23:16];
                        if (s_axi_ctrl_wstrb[3]) csr_lane_en[aw_addr_lat[8:2] - 7'd2][31:24] <= s_axi_ctrl_wdata[31:24];
                        lane_en_upd_axi <= ~lane_en_upd_axi;
                    end
                    default: ; // ignore writes to RO / unmapped addresses
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // Write response channel
    // -------------------------------------------------------------------------
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axi_bvalid_r <= 1'b0;
            axi_bresp_r  <= 2'b00;
        end else begin
            if (axi_awready_r && s_axi_ctrl_awvalid &&
                axi_wready_r  && s_axi_ctrl_wvalid  && !axi_bvalid_r) begin
                axi_bvalid_r <= 1'b1;
                axi_bresp_r  <= 2'b00; // OKAY
            end else if (axi_bvalid_r && s_axi_ctrl_bready) begin
                axi_bvalid_r <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Read address channel
    // -------------------------------------------------------------------------
    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axi_arready_r <= 1'b0;
            ar_addr_lat   <= 9'd0;
        end else begin
            if (!axi_arready_r && s_axi_ctrl_arvalid) begin
                axi_arready_r <= 1'b1;
                ar_addr_lat   <= s_axi_ctrl_araddr;
            end else begin
                axi_arready_r <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Read data channel — combinational mux of CSR bank
    // -------------------------------------------------------------------------
    wire [31:0] csr_status_rd = {30'd0, |lane_error, |lane_locked};

    always @(posedge axi_clk or negedge axi_rst_n) begin
        if (!axi_rst_n) begin
            axi_rvalid_r <= 1'b0;
            axi_rresp_r  <= 2'b00;
            axi_rdata_r  <= 32'd0;
        end else begin
            if (axi_arready_r && s_axi_ctrl_arvalid && !axi_rvalid_r) begin
                axi_rvalid_r <= 1'b1;
                axi_rresp_r  <= 2'b00;
                case (ar_addr_lat[8:2])
                    7'd0:  axi_rdata_r <= csr_ctrl;
                    7'd1:  axi_rdata_r <= csr_status_rd;
                    // csr_lane_en[0:15] — words 2-17
                    7'd2:  axi_rdata_r <= csr_lane_en[0];
                    7'd3:  axi_rdata_r <= csr_lane_en[1];
                    7'd4:  axi_rdata_r <= csr_lane_en[2];
                    7'd5:  axi_rdata_r <= csr_lane_en[3];
                    7'd6:  axi_rdata_r <= csr_lane_en[4];
                    7'd7:  axi_rdata_r <= csr_lane_en[5];
                    7'd8:  axi_rdata_r <= csr_lane_en[6];
                    7'd9:  axi_rdata_r <= csr_lane_en[7];
                    7'd10: axi_rdata_r <= csr_lane_en[8];
                    7'd11: axi_rdata_r <= csr_lane_en[9];
                    7'd12: axi_rdata_r <= csr_lane_en[10];
                    7'd13: axi_rdata_r <= csr_lane_en[11];
                    7'd14: axi_rdata_r <= csr_lane_en[12];
                    7'd15: axi_rdata_r <= csr_lane_en[13];
                    7'd16: axi_rdata_r <= csr_lane_en[14];
                    7'd17: axi_rdata_r <= csr_lane_en[15];
                    // csr_lane_lock[0:15] — words 18-33 (0x048-0x084)
                    7'd18: axi_rdata_r <= lane_locked[31:0];
                    7'd19: axi_rdata_r <= lane_locked[63:32];
                    7'd20: axi_rdata_r <= lane_locked[95:64];
                    7'd21: axi_rdata_r <= lane_locked[127:96];
                    7'd22: axi_rdata_r <= lane_locked[159:128];
                    7'd23: axi_rdata_r <= lane_locked[191:160];
                    7'd24: axi_rdata_r <= lane_locked[223:192];
                    7'd25: axi_rdata_r <= lane_locked[255:224];
                    7'd26: axi_rdata_r <= lane_locked[287:256];
                    7'd27: axi_rdata_r <= lane_locked[319:288];
                    7'd28: axi_rdata_r <= lane_locked[351:320];
                    7'd29: axi_rdata_r <= lane_locked[383:352];
                    7'd30: axi_rdata_r <= lane_locked[415:384];
                    7'd31: axi_rdata_r <= lane_locked[447:416];
                    7'd32: axi_rdata_r <= lane_locked[479:448];
                    7'd33: axi_rdata_r <= lane_locked[511:480];
                    // csr_lane_err[0:15] — words 34-49 (0x088-0x0C4)
                    7'd34: axi_rdata_r <= lane_error[31:0];
                    7'd35: axi_rdata_r <= lane_error[63:32];
                    7'd36: axi_rdata_r <= lane_error[95:64];
                    7'd37: axi_rdata_r <= lane_error[127:96];
                    7'd38: axi_rdata_r <= lane_error[159:128];
                    7'd39: axi_rdata_r <= lane_error[191:160];
                    7'd40: axi_rdata_r <= lane_error[223:192];
                    7'd41: axi_rdata_r <= lane_error[255:224];
                    7'd42: axi_rdata_r <= lane_error[287:256];
                    7'd43: axi_rdata_r <= lane_error[319:288];
                    7'd44: axi_rdata_r <= lane_error[351:320];
                    7'd45: axi_rdata_r <= lane_error[383:352];
                    7'd46: axi_rdata_r <= lane_error[415:384];
                    7'd47: axi_rdata_r <= lane_error[447:416];
                    7'd48: axi_rdata_r <= lane_error[479:448];
                    7'd49: axi_rdata_r <= lane_error[511:480];
                    default: axi_rdata_r <= 32'd0;
                endcase
            end else if (axi_rvalid_r && s_axi_ctrl_rready) begin
                axi_rvalid_r <= 1'b0;
            end
        end
    end

    // =========================================================================
    // CDC: axi_clk → gty_clk
    // =========================================================================

    // --- codec_enable bit: 2-FF synchronizer ---
    reg [1:0] codec_en_sync;
    wire      codec_en_synced = codec_en_sync[1];

    always @(posedge gty_clk or negedge gty_rst_n) begin
        if (!gty_rst_n)
            codec_en_sync <= 2'b00;
        else
            codec_en_sync <= {codec_en_sync[0], csr_ctrl[0]};
    end

    // --- lane_enable bank: toggle-based CDC ---
    // When any csr_lane_en word is written, lane_en_upd_axi toggles.
    // In gty_clk domain, a rising/falling edge on the synced toggle triggers
    // a latch of the full bank.  Safe for slow (software) config updates.
    reg [1:0]           lane_en_upd_sync;
    reg [NUM_LANES-1:0] csr_lane_en_gty;

    // Flatten the 16-element csr_lane_en array into a single wide wire
    wire [NUM_LANES-1:0] csr_lane_en_flat;
    genvar flat_i;
    generate
        for (flat_i = 0; flat_i < 16; flat_i = flat_i + 1) begin : lane_en_flat
            assign csr_lane_en_flat[32*(flat_i+1)-1:32*flat_i] = csr_lane_en[flat_i];
        end
    endgenerate

    always @(posedge gty_clk or negedge gty_rst_n) begin
        if (!gty_rst_n) begin
            lane_en_upd_sync <= 2'b00;
            csr_lane_en_gty  <= {NUM_LANES{1'b0}};
        end else begin
            lane_en_upd_sync <= {lane_en_upd_sync[0], lane_en_upd_axi};
            if (lane_en_upd_sync[1] ^ lane_en_upd_sync[0])
                csr_lane_en_gty <= csr_lane_en_flat;
        end
    end

    // =========================================================================
    // Internal Signals
    // =========================================================================
    wire [NUM_LANES*8-1:0] tx_encoded_data;
    wire [NUM_LANES*8-1:0] rx_decoded_data;

    // =========================================================================
    // Per-Lane Codec Instantiation
    // =========================================================================
    genvar g, lane_in_group;
    generate
        for (g = 0; g < NUM_GROUPS; g = g + 1) begin : codec_groups
            for (lane_in_group = 0; lane_in_group < LANES_PER_GROUP; lane_in_group = lane_in_group + 1) begin : codec_lanes

                localparam LANE_IDX = g * LANES_PER_GROUP + lane_in_group;

                // TX Path (Binary → TB3D)
                wire [7:0] lane_user_tx_data = user_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX];
                wire [3:0] lane_tx_physical   = lane_user_tx_data[3:0];
                wire [3:0] lane_tx_color      = lane_user_tx_data[7:4];

                tb3d_encode u_encode (
                    .physical (lane_tx_physical),
                    .color    (lane_tx_color),
                    .encoded  (tx_encoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX])
                );

                assign user_tx_ready[LANE_IDX] =
                    codec_en_synced && csr_lane_en_gty[LANE_IDX] && gty_tx_ready[LANE_IDX];

                assign gty_tx_valid[LANE_IDX] =
                    codec_en_synced && csr_lane_en_gty[LANE_IDX] && user_tx_valid[LANE_IDX];

                assign gty_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] =
                    codec_en_synced ? tx_encoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX]
                                    : lane_user_tx_data;

                // RX Path (TB3D → Binary)
                wire [7:0] lane_gty_rx_data = gty_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX];
                wire [3:0] lane_rx_physical;
                wire [3:0] lane_rx_color;

                tb3d_decode u_decode (
                    .encoded  (lane_gty_rx_data),
                    .physical (lane_rx_physical),
                    .color    (lane_rx_color)
                );

                assign rx_decoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX] =
                    {lane_rx_color, lane_rx_physical};

                assign gty_rx_ready[LANE_IDX] =
                    codec_en_synced && csr_lane_en_gty[LANE_IDX] && user_rx_ready[LANE_IDX];

                assign user_rx_valid[LANE_IDX] =
                    codec_en_synced && csr_lane_en_gty[LANE_IDX] && gty_rx_valid[LANE_IDX];

                assign user_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] =
                    codec_en_synced ? rx_decoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX]
                                    : lane_gty_rx_data;

                // Status — placeholder (always locked, no errors)
                assign lane_error[LANE_IDX]  = 1'b0;
                assign lane_locked[LANE_IDX] = 1'b1;

            end
        end
    endgenerate

endmodule
