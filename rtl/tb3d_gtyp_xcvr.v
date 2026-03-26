// =============================================================================
// Module  : tb3d_gtyp_xcvr
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_gtyp_xcvr.v
//
// Purpose : GTYP Transceiver TB3-D Encode/Decode bridge — production release.
//           Sits between the Versal GTYP transceiver user interface and the
//           512-bit AXI4-Stream fabric data path.  Transparently applies TB3-D
//           encoding to every byte of outbound TX data and TB3-D decoding to
//           every byte of inbound RX data.
//
// Target  : Versal Premium VP1802 (VPK180) — GTYP SerDes (64-bit user bus)
//
// Data width mapping:
//   Engine / fabric AXIS : 512-bit (64 bytes per beat)
//   GTYP parallel bus    :  64-bit (8 bytes per GT clock)
//   Serialisation ratio  :    8  GT clocks per 512-bit fabric beat
//
// TX path  (pl_clk → gt_txusrclk2 → GT serialiser):
//   Step 1: 64 × tb3d_encode (combinational, pl_clk domain)
//           Each input byte [7:4]=color nibble, [3:0]=physical nibble
//           Output: TB3-D interleaved byte (physical@0x55, color@0xAA)
//   Step 2: CDC — toggle handshake pl_clk → gt_txusrclk2
//   Step 3: 8-beat serialiser in gt_txusrclk2 domain
//           Beat 0 = encoded[63:0], beat 7 = encoded[511:448]
//           gt_txcharisk[7:0] = 8'hFF on beat 7 when TLAST is set
//   Back-pressure: s_axis_tready deasserted while serialiser is active
//
// RX path  (GT deserialiser → gt_rxusrclk2 → pl_clk):
//   Step 1: 8-beat accumulator in gt_rxusrclk2 domain
//           Beat 0 → rx_buf[63:0], beat 7 → rx_buf[511:448]
//           TLAST derived from gt_rxcharisk[0] on beat 7
//   Step 2: CDC — toggle handshake gt_rxusrclk2 → pl_clk
//   Step 3: 64 × tb3d_decode (combinational, pl_clk domain)
//           Outputs {color[3:0], physical[3:0]} per byte
//   m_axis_tvalid pulses for one pl_clk after each assembled 512-bit beat
//
// Bypass mode (bypass=1):
//   TX: s_axis_tdata passes to gt_txdata unencoded (serialiser still runs)
//   RX: gt_rxdata accumulates unmodified, m_axis_tdata passes raw
//
// Clock domains:
//   pl_clk       — AXI4-Stream S_AXIS / M_AXIS (fabric clock, ≥300 MHz)
//   gt_txusrclk2 — GTYP TX user clock  (line_rate / 66 or / 40)
//   gt_rxusrclk2 — GTYP RX user clock  (line_rate / 66 or / 40)
//
// CDC technique: toggle synchroniser with ASYNC_REG-qualified 2-FF stages.
//   Wide data (512-bit) is held stable before toggling the flag; it is read
//   at the destination only after the flag edge is detected.  A set_false_path
//   constraint on the data bus in the XDC file is required for formal timing
//   sign-off; no false path is needed on the single-bit toggle.
//
// Reset:
//   rst_n (synchronous to pl_clk) is re-synchronised to gt_txusrclk2 and
//   gt_rxusrclk2 via asynchronous-assert / synchronous-release 2-FF cells
//   marked with (* ASYNC_REG = "TRUE" *).  Drive rst_n from the AND of
//   gt_tx_reset_done, gt_rx_reset_done, and proc_sys_reset aresetn.
//
// Block-design connections:
//   pl_clk         ← CIPS pl_clk0 or NoC Clock Generator output
//   gt_txusrclk2   ← GT Wizard gt_txusrclk2 (TX user clock)
//   gt_rxusrclk2   ← GT Wizard gt_rxusrclk2 (RX user clock)
//   rst_n          ← AND(gt_tx_reset_done, gt_rx_reset_done, pl_resetn)
//   S_AXIS[511:0]  ← tb3d_engine_top M_AXIS (512-bit encoded output)
//   M_AXIS[511:0]  → AXI DMA S2MM or tb3d_engine_top S_AXIS (decoded RX)
//   gt_txdata      → GTYP GT_TX0_TXDATA[63:0]
//   gt_rxdata      ← GTYP GT_RX0_RXDATA[63:0]
//   gt_txcharisk   → GTYP GT_TX0_TXCHARISK[7:0]
//   gt_rxcharisk   ← GTYP GT_RX0_RXCHARISK[7:0]
//   bypass         ← 1'b0 for normal operation, 1'b1 for loopback/test
// =============================================================================

`timescale 1ns / 1ps

module tb3d_gtyp_xcvr (
    // =========================================================================
    // Clocks
    //   pl_clk       : AXI4-Stream fabric clock (300 MHz typical)
    //   gt_txusrclk2 : GTYP TX user clock (line_rate / 66)
    //   gt_rxusrclk2 : GTYP RX user clock (line_rate / 66)
    // =========================================================================
    input  wire          pl_clk,
    input  wire          gt_txusrclk2,
    input  wire          gt_rxusrclk2,

    // =========================================================================
    // Reset
    //   rst_n : active-low, synchronous to pl_clk.
    //           Resynchronised internally to gt_txusrclk2 and gt_rxusrclk2.
    //           Drive from: AND(gt_tx_reset_done, gt_rx_reset_done, aresetn)
    // =========================================================================
    input  wire          rst_n,

    // =========================================================================
    // AXI4-Stream Slave — 512-bit fabric TX data (pl_clk domain)
    //   Connect: tb3d_engine_top M_AXIS → this port
    //   s_axis_tready is deasserted while the 8-beat TX serialiser is busy.
    //   Byte convention: [7:4] = color nibble, [3:0] = physical nibble.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 64, \
HAS_TREADY 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, \
CLK_DOMAIN pl_clk, INSERT_VIP 0" *)
    input  wire [511:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
    input  wire          s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
    output wire          s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
    input  wire          s_axis_tlast,

    // =========================================================================
    // AXI4-Stream Master — 512-bit fabric RX data (pl_clk domain)
    //   Connect: this port → AXI DMA S2MM or tb3d_engine_top S_AXIS
    //   m_axis_tvalid pulses for one pl_clk cycle per assembled 512-bit word.
    // =========================================================================
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 64, \
HAS_TREADY 1, HAS_TLAST 1, FREQ_HZ 300000000, PHASE 0.0, \
CLK_DOMAIN pl_clk, INSERT_VIP 0" *)
    output wire [511:0]  m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
    output wire          m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
    input  wire          m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
    output wire          m_axis_tlast,

    // =========================================================================
    // GTYP Parallel Data Interface (64-bit)
    //   gt_txdata    : 64-bit TX parallel data → GTYP serialiser
    //   gt_rxdata    : 64-bit RX parallel data ← GTYP deserialiser
    //   gt_txcharisk : K-char enable per byte — set 8'hFF on last beat of TLAST
    //   gt_rxcharisk : K-char flags from deserialiser — [0] used for TLAST detect
    // =========================================================================
    output wire [63:0]   gt_txdata,
    input  wire [63:0]   gt_rxdata,
    output wire [7:0]    gt_txcharisk,
    input  wire [7:0]    gt_rxcharisk,

    // =========================================================================
    // Bypass mode
    //   0 : TB3-D encode TX, decode RX  (normal operation)
    //   1 : raw data passthrough         (loopback / board bring-up)
    // =========================================================================
    input  wire          bypass
);

    // =========================================================================
    // Reset synchronisation — asynchronous assert, synchronous release
    //
    // rst_n is in the pl_clk domain.  We re-synchronise it to gt_txusrclk2
    // and gt_rxusrclk2 so that reset is cleanly applied in each domain.
    // The (* ASYNC_REG = "TRUE" *) attribute instructs Vivado to keep the two
    // flip-flops in the same slice for optimal metastability performance.
    // =========================================================================

    // TX domain reset
    (* ASYNC_REG = "TRUE" *) reg [1:0] tx_rstn_sync;
    wire tx_rst_n;
    always @(posedge gt_txusrclk2 or negedge rst_n) begin
        if (!rst_n) tx_rstn_sync <= 2'b00;
        else        tx_rstn_sync <= {tx_rstn_sync[0], 1'b1};
    end
    assign tx_rst_n = tx_rstn_sync[1];

    // RX domain reset
    (* ASYNC_REG = "TRUE" *) reg [1:0] rx_rstn_sync;
    wire rx_rst_n;
    always @(posedge gt_rxusrclk2 or negedge rst_n) begin
        if (!rst_n) rx_rstn_sync <= 2'b00;
        else        rx_rstn_sync <= {rx_rstn_sync[0], 1'b1};
    end
    assign rx_rst_n = rx_rstn_sync[1];

    // =========================================================================
    //
    //                         TX PATH
    //
    // pl_clk domain:
    //   1. 64 × tb3d_encode (combinational) on all 512 bits of s_axis_tdata
    //   2. Latch encoded word when S_AXIS fires; toggle tx_req_tog
    //   3. Wait for tx_ack_tog to come back (serialiser done) before accepting
    //      the next S_AXIS beat
    //
    // gt_txusrclk2 domain:
    //   4. Sync tx_req_tog → detect edge → load 8-beat shift register
    //   5. Shift out 64-bit beats on successive GT clocks (beat 0 first)
    //   6. Toggle tx_ack_tog after beat 7 is output
    //
    // =========================================================================

    // -------------------------------------------------------------------------
    // Step 1: 64 × tb3d_encode — combinational, pl_clk domain
    //   Input byte i layout:  [7:4] = color nibble,  [3:0] = physical nibble
    //   Output byte i layout: TB3-D interleaved (physical@0x55, color@0xAA)
    // -------------------------------------------------------------------------
    wire [511:0] tx_encoded;

    genvar tx_i;
    generate
        for (tx_i = 0; tx_i < 64; tx_i = tx_i + 1) begin : GEN_TX_ENC
            tb3d_encode u_tx_enc (
                .physical (s_axis_tdata[tx_i*8     +: 4]),  // lower nibble → P
                .color    (s_axis_tdata[tx_i*8 + 4 +: 4]),  // upper nibble → C
                .encoded  (tx_encoded   [tx_i*8     +: 8])   // TB3-D byte
            );
        end
    endgenerate

    // Mux: bypass passes raw data, normal uses TB3-D encoded
    wire [511:0] tx_data_mux = bypass ? s_axis_tdata : tx_encoded;

    // -------------------------------------------------------------------------
    // Steps 2-3: Handshake and CDC buffer (pl_clk domain)
    // -------------------------------------------------------------------------
    reg [511:0] tx_buf;          // stable 512-bit word for CDC transfer
    reg         tx_last_buf;     // TLAST associated with this word
    reg         tx_req_tog;      // toggle each time a new word is latched
    reg         tx_busy;         // high while serialiser has word in flight

    // Ack toggle comes back from gt_txusrclk2 domain (defined below)
    wire        tx_ack_tog_ff;   // originates in gt_txusrclk2 (declared later)

    // 3-FF synchroniser for ack: gt_txusrclk2 → pl_clk
    (* ASYNC_REG = "TRUE" *) reg tx_ack_s1, tx_ack_s2;
    reg tx_ack_s3;

    assign s_axis_tready = !tx_busy;

    always @(posedge pl_clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_buf     <= 512'b0;
            tx_last_buf <= 1'b0;
            tx_req_tog  <= 1'b0;
            tx_busy     <= 1'b0;
            tx_ack_s1   <= 1'b0;
            tx_ack_s2   <= 1'b0;
            tx_ack_s3   <= 1'b0;
        end else begin
            // Synchronise ack toggle into pl_clk
            tx_ack_s1 <= tx_ack_tog_ff;
            tx_ack_s2 <= tx_ack_s1;
            tx_ack_s3 <= tx_ack_s2;

            // Ack edge: serialiser completed → clear busy
            if (tx_busy && (tx_ack_s2 != tx_ack_s3))
                tx_busy <= 1'b0;

            // Accept new S_AXIS beat: latch encoded word, mark busy, toggle req
            if (s_axis_tvalid && !tx_busy) begin
                tx_buf      <= tx_data_mux;
                tx_last_buf <= s_axis_tlast;
                tx_req_tog  <= !tx_req_tog;
                tx_busy     <= 1'b1;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Steps 4-6: 8-beat TX serialiser (gt_txusrclk2 domain)
    //
    // On detecting the edge of tx_req_tog (after 3-FF sync):
    //   - Pre-load output register (tx_out_r) with beat 0 = tx_buf[63:0]
    //   - Load shift register with remaining beats [511:64]
    //   - Count 8 GT clocks, advancing tx_out_r each cycle
    //   - Toggle tx_ack_tog_ff after beat 7 is presented
    //
    // Output: gt_txdata = tx_out_r when tx_active, else 0
    // TLAST:  gt_txcharisk = 8'hFF on beat 7 when tx_last_r is set
    // -------------------------------------------------------------------------

    // 3-FF synchroniser for req: pl_clk → gt_txusrclk2
    (* ASYNC_REG = "TRUE" *) reg tx_req_s1, tx_req_s2;
    reg tx_req_s3;

    reg [63:0]  tx_out_r;     // current 64-bit output word
    reg [447:0] tx_shift_r;   // remaining 7 beats [511:64] after beat 0 is loaded
    reg [2:0]   tx_cnt_r;     // beat counter 0-7
    reg         tx_active_r;  // serialiser is outputting
    reg         tx_last_r;    // TLAST flag for current word
    reg         tx_ack_tog_r; // ack toggle (read as tx_ack_tog_ff in pl_clk domain)

    assign tx_ack_tog_ff = tx_ack_tog_r;  // cross-domain wire (read by pl_clk sync chain)

    // Edge detect on synchronised req toggle
    wire tx_req_edge = (tx_req_s2 != tx_req_s3) && !tx_active_r;

    always @(posedge gt_txusrclk2 or negedge tx_rst_n) begin
        if (!tx_rst_n) begin
            tx_req_s1   <= 1'b0;
            tx_req_s2   <= 1'b0;
            tx_req_s3   <= 1'b0;
            tx_out_r    <= 64'b0;
            tx_shift_r  <= 448'b0;
            tx_cnt_r    <= 3'd0;
            tx_active_r <= 1'b0;
            tx_last_r   <= 1'b0;
            tx_ack_tog_r<= 1'b0;
        end else begin
            // Synchronise req toggle into gt_txusrclk2
            tx_req_s1 <= tx_req_tog;
            tx_req_s2 <= tx_req_s1;
            tx_req_s3 <= tx_req_s2;

            if (tx_req_edge) begin
                // Load: beat 0 pre-loaded into output register for next cycle;
                // beats 1-7 packed into shift register for successive cycles.
                // (tx_buf written in pl_clk domain ≥2 tx_usrclk2 cycles ago —
                //  safe to read; add set_false_path in XDC on tx_buf[511:0])
                tx_out_r    <= tx_buf[63:0];      // beat 0  → output on next cycle
                tx_shift_r  <= tx_buf[511:64];    // beats 1-7 in shift register
                tx_last_r   <= tx_last_buf;
                tx_active_r <= 1'b1;
                tx_cnt_r    <= 3'd0;
            end else if (tx_active_r) begin
                if (tx_cnt_r == 3'd7) begin
                    // Beat 7 has been output this cycle; serialiser done.
                    tx_active_r  <= 1'b0;
                    tx_cnt_r     <= 3'd0;
                    tx_ack_tog_r <= !tx_ack_tog_r;  // signal pl_clk domain
                end else begin
                    // Advance to next beat: shift register → output register
                    tx_out_r   <= tx_shift_r[63:0];
                    tx_shift_r <= {64'b0, tx_shift_r[447:64]};
                    tx_cnt_r   <= tx_cnt_r + 3'd1;
                end
            end
        end
    end

    // GT TX parallel outputs
    assign gt_txdata    = tx_active_r ? tx_out_r : 64'b0;
    // Assert K-char on all byte lanes of beat 7 when TLAST is set.
    // Receiver uses charisk[0] on beat 7 as TLAST indicator.
    assign gt_txcharisk = (tx_active_r && (tx_cnt_r == 3'd7) && tx_last_r) ?
                           8'hFF : 8'h00;

    // =========================================================================
    //
    //                         RX PATH
    //
    // gt_rxusrclk2 domain:
    //   1. 8-beat accumulator: store each 64-bit GT word into rx_acc_r
    //   2. On beat 7: copy completed 512-bit word to rx_buf_r, capture TLAST
    //      from gt_rxcharisk[0], toggle rx_done_tog_r
    //
    // pl_clk domain:
    //   3. Sync rx_done_tog_r → detect edge → latch rx_buf_r into rx_latch_r
    //   4. One cycle later: 64 × tb3d_decode (combinational) on rx_latch_r
    //   5. Register result into M_AXIS output; assert TVALID for one cycle
    //
    // =========================================================================

    // -------------------------------------------------------------------------
    // Steps 1-2: 8-beat accumulator (gt_rxusrclk2 domain)
    //
    // We store each 64-bit GT word at its natural offset in rx_acc_r:
    //   Beat 0 → rx_acc_r[63:0], beat 6 → rx_acc_r[447:384]
    //   Beat 7 is captured separately (gt_rxdata at the case-7 branch) and
    //   assembled with rx_acc_r[447:0] into rx_buf_r via non-blocking assign.
    //
    // TLAST: gt_rxcharisk[0] on beat 7 signals end-of-packet.
    // -------------------------------------------------------------------------
    reg [447:0] rx_acc_r;         // accumulates beats 0-6
    reg [2:0]   rx_cnt_r;         // beat counter 0-7
    reg [511:0] rx_buf_r;         // assembled 512-bit word (stable for CDC)
    reg         rx_last_r;        // TLAST flag
    reg         rx_done_tog_r;    // toggled when rx_buf_r is complete

    always @(posedge gt_rxusrclk2 or negedge rx_rst_n) begin
        if (!rx_rst_n) begin
            rx_acc_r      <= 448'b0;
            rx_cnt_r      <= 3'd0;
            rx_buf_r      <= 512'b0;
            rx_last_r     <= 1'b0;
            rx_done_tog_r <= 1'b0;
        end else begin
            // Store each beat at its 64-bit offset in the accumulator
            case (rx_cnt_r)
                3'd0: rx_acc_r[63:0]    <= gt_rxdata;
                3'd1: rx_acc_r[127:64]  <= gt_rxdata;
                3'd2: rx_acc_r[191:128] <= gt_rxdata;
                3'd3: rx_acc_r[255:192] <= gt_rxdata;
                3'd4: rx_acc_r[319:256] <= gt_rxdata;
                3'd5: rx_acc_r[383:320] <= gt_rxdata;
                3'd6: rx_acc_r[447:384] <= gt_rxdata;
                default: ; // beat 7 handled below
            endcase

            if (rx_cnt_r == 3'd7) begin
                // Assemble the complete 512-bit word.
                // rx_acc_r[447:0] holds beats 0-6 (written in prior cycles).
                // gt_rxdata is beat 7 (read directly — non-blocking safe).
                // XDC: set_false_path from rx_buf_r to pl_clk capture FF.
                rx_buf_r      <= {gt_rxdata, rx_acc_r[447:0]};
                rx_last_r     <= gt_rxcharisk[0];   // K-char on byte 0 = TLAST
                rx_done_tog_r <= !rx_done_tog_r;    // notify pl_clk domain
                rx_cnt_r      <= 3'd0;
            end else begin
                rx_cnt_r <= rx_cnt_r + 3'd1;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Steps 3-5: CDC, decode, and M_AXIS output (pl_clk domain)
    //
    // 3-FF synchroniser for rx_done: gt_rxusrclk2 → pl_clk
    // -------------------------------------------------------------------------
    (* ASYNC_REG = "TRUE" *) reg rx_done_s1, rx_done_s2;
    reg rx_done_s3;

    // Edge-detected toggle: fires for one pl_clk when a new 512-bit word is ready
    wire rx_done_edge = (rx_done_s2 != rx_done_s3);

    // rx_latch_r: pl_clk-domain copy of the assembled 512-bit RX word
    // rx_latch_valid_r: set one cycle after latching so rx_decoded is settled
    reg [511:0] rx_latch_r;
    reg         rx_last_latch_r;
    reg         rx_latch_valid_r;

    always @(posedge pl_clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_done_s1      <= 1'b0;
            rx_done_s2      <= 1'b0;
            rx_done_s3      <= 1'b0;
            rx_latch_r      <= 512'b0;
            rx_last_latch_r <= 1'b0;
            rx_latch_valid_r<= 1'b0;
        end else begin
            // Synchronise done toggle from gt_rxusrclk2
            rx_done_s1 <= rx_done_tog_r;
            rx_done_s2 <= rx_done_s1;
            rx_done_s3 <= rx_done_s2;

            // On done edge: latch rx_buf_r (stable; see XDC note) and pulse valid
            rx_latch_valid_r <= rx_done_edge;
            if (rx_done_edge) begin
                rx_latch_r      <= rx_buf_r;
                rx_last_latch_r <= rx_last_r;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Step 4: 64 × tb3d_decode — combinational on rx_latch_r (pl_clk domain)
    //   Input byte i:  TB3-D interleaved byte
    //   Output byte i: [7:4] = recovered color nibble, [3:0] = physical nibble
    // -------------------------------------------------------------------------
    wire [511:0] rx_decoded;

    genvar rx_i;
    generate
        for (rx_i = 0; rx_i < 64; rx_i = rx_i + 1) begin : GEN_RX_DEC
            wire [3:0] rx_phy;
            wire [3:0] rx_col;

            tb3d_decode u_rx_dec (
                .encoded  (rx_latch_r[rx_i*8 +: 8]),
                .physical (rx_phy),
                .color    (rx_col)
            );

            // Repack: {color[3:0], physical[3:0]}
            assign rx_decoded[rx_i*8 +: 8] = {rx_col, rx_phy};
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Step 5: M_AXIS output register (pl_clk domain)
    //
    // rx_latch_valid_r fires one cycle AFTER rx_latch_r is updated, so
    // rx_decoded is already stable when we capture it here.
    // Back-pressure: if m_axis_tready is low, TVALID is held; if a new word
    // arrives before the previous is consumed it overwrites (the GT RX stream
    // is continuous; add a FIFO on the M_AXIS output if back-pressure is needed).
    // -------------------------------------------------------------------------
    reg [511:0] m_axis_tdata_r;
    reg         m_axis_tvalid_r;
    reg         m_axis_tlast_r;

    always @(posedge pl_clk or negedge rst_n) begin
        if (!rst_n) begin
            m_axis_tdata_r  <= 512'b0;
            m_axis_tvalid_r <= 1'b0;
            m_axis_tlast_r  <= 1'b0;
        end else begin
            if (rx_latch_valid_r) begin
                // rx_decoded (bypass: rx_latch_r) is combinationally valid now
                m_axis_tdata_r  <= bypass ? rx_latch_r : rx_decoded;
                m_axis_tvalid_r <= 1'b1;
                m_axis_tlast_r  <= rx_last_latch_r;
            end else if (m_axis_tvalid_r && m_axis_tready) begin
                m_axis_tvalid_r <= 1'b0;
                m_axis_tlast_r  <= 1'b0;
            end
        end
    end

    assign m_axis_tdata  = m_axis_tdata_r;
    assign m_axis_tvalid = m_axis_tvalid_r;
    assign m_axis_tlast  = m_axis_tlast_r;

endmodule
