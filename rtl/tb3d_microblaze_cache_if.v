// =============================================================================
// Module  : tb3d_microblaze_cache_if
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_microblaze_cache_if.v
//
// Purpose : MicroBlaze cache and instruction interface / watchdog.
//
//           Provides three integrated subsystems:
//
//   1. AXI4-Lite slave (S_AXI — 32-bit, 16-bit address):
//      MicroBlaze data-master → AXI SmartConnect / NoC NSU → this port.
//      Exposes control and status registers (CSRs) so MicroBlaze firmware
//      can read engine status and arm the watchdog / cache-preload engine.
//
//   2. AXI4 master (M_AXI — 64-bit):
//      Issues AXI4 INCR read bursts to warm the NoC / MicroBlaze I-cache.
//      Initiated by writing the PREFETCH_* CSRs and asserting CTRL[1].
//      The fetched data is discarded; the intent is cache-line pre-population
//      so the binary is "cached and ready before it is needed."
//
//   3. Watchdog timer:
//      Counts cycles while engine_busy is asserted.  If busy persists beyond
//      WDT_THRESH cycles, wdt_irq is raised.  MicroBlaze firmware handles the
//      interrupt (retry / reset / diagnostic dump).  The IRQ self-clears when
//      engine_busy deasserts.
//
// Role in the platform:
//   The TB3-D engine is the primary "logic puller" operating autonomously on
//   the data path.  MicroBlaze is the "watchdog" — it observes the engine and
//   intervenes only when needed, with critical logic pre-loaded and ready.
//
// CSR Map (32-bit AXI4-Lite, word-addressed by bits [5:2] of the byte address):
//   Offset  Name            R/W   Description
//   0x00    STATUS          R     [0]=engine_busy  [1]=engine_done  [2]=engine_error
//   0x04    CTRL            R/W   [0]=wdt_enable   [1]=cache_preload_start (auto-clears)
//   0x08    WDT_THRESH      R/W   Watchdog timeout in clock cycles (default 2^20)
//   0x0C    PREFETCH_ADDR_LO R/W  Lower 32 bits of cache-preload start address
//   0x10    PREFETCH_ADDR_HI R/W  Upper 32 bits of cache-preload start address
//   0x14    PREFETCH_LEN    R/W   Preload length in 8-byte AXI beats (0 = disabled)
//
// Target  : Versal Premium VP1802 (VPK180)
// =============================================================================

`timescale 1ns / 1ps

module tb3d_microblaze_cache_if (
    input  wire         clk,
    input  wire         rst_n,

    // =========================================================================
    // AXI4-Lite Slave — MicroBlaze data-master (32-bit data, 16-bit address)
    // MicroBlaze AXI Data Master → AXI SmartConnect → this port
    // =========================================================================
    input  wire [15:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,

    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,

    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,

    input  wire [15:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,

    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    // =========================================================================
    // AXI4 Master — cache pre-load (64-bit data, to NoC NMU → LPDDR4/DDR4)
    // This port → NoC NMU → LPDDR4 memory controller
    // =========================================================================
    output wire [63:0]  m_axi_araddr,
    output wire [7:0]   m_axi_arlen,
    output wire [2:0]   m_axi_arsize,
    output wire [1:0]   m_axi_arburst,
    output wire [3:0]   m_axi_arid,
    output wire         m_axi_arvalid,
    input  wire         m_axi_arready,

    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire [3:0]   m_axi_rid,
    input  wire         m_axi_rvalid,
    output wire         m_axi_rready,

    // =========================================================================
    // TB3-D Engine status inputs (connect to tb3d_engine_top / platform_top)
    // =========================================================================
    input  wire         engine_busy,
    input  wire         engine_done,
    input  wire         engine_error,

    // =========================================================================
    // Watchdog interrupt to MicroBlaze (level, active high)
    // Connect to CIPS pl_ps_irq1 or MicroBlaze interrupt input
    // =========================================================================
    output wire         wdt_irq
);

    // =========================================================================
    // CSR Registers
    // =========================================================================
    reg         wdt_enable_r;
    reg         cache_preload_start_r;   // one-shot pulse
    reg [31:0]  wdt_thresh_r;
    reg [31:0]  prefetch_addr_lo_r;
    reg [31:0]  prefetch_addr_hi_r;
    reg [31:0]  prefetch_len_r;

    // =========================================================================
    // AXI4-Lite Write Path
    // Simple handshake: accept AW and W independently, latch both, then commit.
    // =========================================================================
    reg        aw_active;
    reg [15:0] aw_addr;
    reg        w_active;
    reg [31:0] w_data;
    reg        b_active;

    assign s_axi_awready = !aw_active && !b_active;
    assign s_axi_wready  = !w_active  && !b_active;
    assign s_axi_bvalid  = b_active;
    assign s_axi_bresp   = 2'b00;  // OKAY

    always @(posedge clk) begin
        if (!rst_n) begin
            aw_active            <= 1'b0;
            w_active             <= 1'b0;
            b_active             <= 1'b0;
            aw_addr              <= 16'h0;
            w_data               <= 32'h0;
            wdt_enable_r         <= 1'b1;       // watchdog on by default
            cache_preload_start_r<= 1'b0;
            wdt_thresh_r         <= 32'h00100000; // ~1 M cycles @ 300 MHz ≈ 3.4 ms
            prefetch_addr_lo_r   <= 32'h0;
            prefetch_addr_hi_r   <= 32'h0;
            prefetch_len_r       <= 32'h0;
        end else begin
            // One-shot auto-clear for the preload start bit
            cache_preload_start_r <= 1'b0;

            // Capture write address
            if (s_axi_awvalid && s_axi_awready) begin
                aw_active <= 1'b1;
                aw_addr   <= s_axi_awaddr;
            end

            // Capture write data
            if (s_axi_wvalid && s_axi_wready) begin
                w_active <= 1'b1;
                w_data   <= s_axi_wdata;
            end

            // Execute write when both address and data are captured
            if (aw_active && w_active && !b_active) begin
                aw_active <= 1'b0;
                w_active  <= 1'b0;
                b_active  <= 1'b1;
                case (aw_addr[5:2])
                    4'h1: begin  // 0x04 CTRL
                        wdt_enable_r          <= w_data[0];
                        cache_preload_start_r <= w_data[1];
                    end
                    4'h2: wdt_thresh_r       <= w_data;  // 0x08
                    4'h3: prefetch_addr_lo_r <= w_data;  // 0x0C
                    4'h4: prefetch_addr_hi_r <= w_data;  // 0x10
                    4'h5: prefetch_len_r     <= w_data;  // 0x14
                    default: ;  // STATUS (0x00) is read-only
                endcase
            end

            // Clear write response after handshake
            if (b_active && s_axi_bready)
                b_active <= 1'b0;
        end
    end

    // =========================================================================
    // AXI4-Lite Read Path
    // =========================================================================
    reg        ar_active;
    reg [15:0] ar_addr;
    reg        r_active;
    reg [31:0] r_data;

    assign s_axi_arready = !ar_active && !r_active;
    assign s_axi_rvalid  = r_active;
    assign s_axi_rdata   = r_data;
    assign s_axi_rresp   = 2'b00;  // OKAY

    always @(posedge clk) begin
        if (!rst_n) begin
            ar_active <= 1'b0;
            r_active  <= 1'b0;
            ar_addr   <= 16'h0;
            r_data    <= 32'h0;
        end else begin
            if (s_axi_arvalid && s_axi_arready) begin
                ar_active <= 1'b1;
                ar_addr   <= s_axi_araddr;
            end

            if (ar_active && !r_active) begin
                ar_active <= 1'b0;
                r_active  <= 1'b1;
                case (ar_addr[5:2])
                    4'h0: r_data <= {29'h0, engine_error, engine_done, engine_busy};
                    4'h1: r_data <= {30'h0, cache_preload_start_r, wdt_enable_r};
                    4'h2: r_data <= wdt_thresh_r;
                    4'h3: r_data <= prefetch_addr_lo_r;
                    4'h4: r_data <= prefetch_addr_hi_r;
                    4'h5: r_data <= prefetch_len_r;
                    default: r_data <= 32'hDEAD_BEEF;
                endcase
            end

            if (r_active && s_axi_rready)
                r_active <= 1'b0;
        end
    end

    // =========================================================================
    // Watchdog Timer
    //
    // Counts clock cycles while engine_busy is asserted.  If the count exceeds
    // wdt_thresh_r, wdt_irq is asserted (level).  The IRQ holds until
    // engine_busy deasserts, giving MicroBlaze time to respond.
    // =========================================================================
    reg [31:0] wdt_counter;
    reg        wdt_irq_r;

    always @(posedge clk) begin
        if (!rst_n) begin
            wdt_counter <= 32'h0;
            wdt_irq_r   <= 1'b0;
        end else begin
            if (!wdt_enable_r || !engine_busy) begin
                // Watchdog disabled or engine idle — reset counter and IRQ
                wdt_counter <= 32'h0;
                wdt_irq_r   <= 1'b0;
            end else if (wdt_counter < wdt_thresh_r) begin
                wdt_counter <= wdt_counter + 32'd1;
                wdt_irq_r   <= 1'b0;
            end else begin
                // Threshold exceeded — hold IRQ asserted
                wdt_irq_r <= 1'b1;
            end
        end
    end

    assign wdt_irq = wdt_irq_r;

    // =========================================================================
    // AXI4 Master — Cache Pre-load State Machine
    //
    // On rising edge of cache_preload_start_r, issues INCR read bursts to
    // {prefetch_addr_hi_r, prefetch_addr_lo_r} for prefetch_len_r 8-byte beats.
    // Received read data is discarded — the purpose is to warm the NoC data
    // path and MicroBlaze I-cache so the binary is resident before it is needed.
    //
    // Burst size is capped at 16 beats (128 bytes) for NoC timing safety.
    // =========================================================================
    localparam PF_IDLE    = 2'd0;
    localparam PF_RDADDR  = 2'd1;
    localparam PF_RDDATA  = 2'd2;
    localparam PF_DONE    = 2'd3;

    localparam [7:0] MAX_BURST_LEN = 8'd15;  // arlen=15 → 16 beats per burst

    reg [1:0]  pf_state;
    reg [63:0] pf_addr;
    reg [31:0] pf_remaining;

    reg [63:0] m_axi_araddr_r;
    reg [7:0]  m_axi_arlen_r;
    reg        m_axi_arvalid_r;
    reg        m_axi_rready_r;

    always @(posedge clk) begin
        if (!rst_n) begin
            pf_state        <= PF_IDLE;
            pf_addr         <= 64'h0;
            pf_remaining    <= 32'h0;
            m_axi_araddr_r  <= 64'h0;
            m_axi_arlen_r   <= 8'h0;
            m_axi_arvalid_r <= 1'b0;
            m_axi_rready_r  <= 1'b0;
        end else begin
            case (pf_state)
                PF_IDLE: begin
                    m_axi_arvalid_r <= 1'b0;
                    m_axi_rready_r  <= 1'b0;
                    if (cache_preload_start_r && (prefetch_len_r != 32'h0)) begin
                        pf_addr      <= {prefetch_addr_hi_r, prefetch_addr_lo_r};
                        pf_remaining <= prefetch_len_r;
                        pf_state     <= PF_RDADDR;
                    end
                end

                PF_RDADDR: begin
                    // Issue one read-address beat.
                    // arlen is 0-based (0 = 1 beat), so subtract 1 from
                    // the beat count.  Beat count = min(pf_remaining, 16).
                    m_axi_araddr_r  <= pf_addr;
                    m_axi_arlen_r   <= (pf_remaining > 32'd16) ?
                                           MAX_BURST_LEN :
                                           (pf_remaining[7:0] - 8'd1);
                    m_axi_arvalid_r <= 1'b1;
                    m_axi_rready_r  <= 1'b1;
                    // Use the wire output (m_axi_arvalid) for protocol handshake
                    if (m_axi_arready && m_axi_arvalid) begin
                        m_axi_arvalid_r <= 1'b0;
                        pf_state        <= PF_RDDATA;
                    end
                end

                PF_RDDATA: begin
                    m_axi_rready_r <= 1'b1;
                    if (m_axi_rvalid && m_axi_rlast) begin
                        // Advance address by actual beats issued × 8 bytes.
                        // (arlen+1) beats × 8 bytes/beat = shift left by 3.
                        // pf_remaining comparison uses the pre-update value so
                        // both the state transition and decrement see the same cycle.
                        pf_addr      <= pf_addr +
                                        ({56'd0, m_axi_arlen_r + 8'd1} << 3);
                        pf_remaining <= (pf_remaining > 32'd16) ?
                                            (pf_remaining - 32'd16) : 32'h0;
                        if (pf_remaining <= 32'd16)
                            pf_state <= PF_DONE;
                        else
                            pf_state <= PF_RDADDR;
                    end
                end

                PF_DONE: begin
                    m_axi_rready_r <= 1'b0;
                    pf_state       <= PF_IDLE;
                end

                default: pf_state <= PF_IDLE;
            endcase
        end
    end

    assign m_axi_araddr  = m_axi_araddr_r;
    assign m_axi_arlen   = m_axi_arlen_r;
    assign m_axi_arsize  = 3'b011;   // 8 bytes per beat
    assign m_axi_arburst = 2'b01;    // INCR
    assign m_axi_arid    = 4'h2;     // ID 2 (distinct from engine DMA ID 0)
    assign m_axi_arvalid = m_axi_arvalid_r;
    assign m_axi_rready  = m_axi_rready_r;

endmodule
