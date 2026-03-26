// =============================================================================
// Module  : tb3d_versal_dma_bridge
// Project : TB3-D  Ternary Binary 3-Dimensional Logic Engine
// File    : rtl/tb3d_pcie_bridge.v
//
// Purpose : Versal AXI4-Stream DMA width converter.
//
//           Bridges the CIPS AXI DMA subsystem (configurable narrow width,
//           typically 128 bits on VPK180) to the 512-bit AXI4-Stream ports
//           of tb3d_engine_top.
//
//           Two fully independent paths operate concurrently:
//
//   Upsizer path  (CIPS DMA MM2S → engine S_AXIS):
//     Accumulates (512/NARROW_W) consecutive narrow beats into one 512-bit
//     word using a right-fill shift register.  The first narrow beat lands at
//     tdata[NARROW_W-1:0] (LSB) in the assembled wide word, preserving AXI4
//     byte-lane ordering.  TLAST from the last narrow beat is forwarded.
//
//   Downsizer path  (engine M_AXIS → CIPS DMA S2MM):
//     Splits one 512-bit beat into (512/NARROW_W) narrow beats by iterating
//     through successive NARROW_W-bit slices starting from the LSB.  TLAST
//     is asserted only on the last narrow beat when the wide beat had TLAST.
//
// Parameter:
//   NARROW_W — data width of the CIPS DMA AXI4-Stream in bits.
//              Must divide 512 evenly.  Default 128 (VPK180 typical).
//              Set to 512 if the DMA is already 512-bit wide; this module
//              then reduces to a registered passthrough (0 combinational depth,
//              1 cycle extra latency per direction).
//
// Usage in block design:
//   CIPS DMA MM2S → s_narrow / m_wide → tb3d_engine_top S_AXIS
//   tb3d_engine_top M_AXIS → s_wide / m_narrow → CIPS DMA S2MM
//
//   If the CIPS DMA is already configured at 512-bit width, skip this module
//   and connect tb3d_engine_top S_AXIS / M_AXIS directly to the DMA.
// =============================================================================

`timescale 1ns / 1ps

module tb3d_versal_dma_bridge #(
    parameter NARROW_W = 128    // CIPS DMA AXI4-Stream data width (bits)
) (
    input  wire                  clk,
    input  wire                  rst_n,      // active-low synchronous reset

    // =========================================================================
    // Upsizer input — narrow AXI4-Stream from CIPS DMA MM2S
    // =========================================================================
    input  wire [NARROW_W-1:0]   s_narrow_tdata,
    input  wire                  s_narrow_tvalid,
    output wire                  s_narrow_tready,
    input  wire                  s_narrow_tlast,

    // =========================================================================
    // Upsizer output — 512-bit AXI4-Stream to tb3d_engine_top S_AXIS
    // =========================================================================
    output wire [511:0]          m_wide_tdata,
    output wire                  m_wide_tvalid,
    input  wire                  m_wide_tready,
    output wire                  m_wide_tlast,

    // =========================================================================
    // Downsizer input — 512-bit AXI4-Stream from tb3d_engine_top M_AXIS
    // =========================================================================
    input  wire [511:0]          s_wide_tdata,
    input  wire                  s_wide_tvalid,
    output wire                  s_wide_tready,
    input  wire                  s_wide_tlast,

    // =========================================================================
    // Downsizer output — narrow AXI4-Stream to CIPS DMA S2MM
    // =========================================================================
    output wire [NARROW_W-1:0]   m_narrow_tdata,
    output wire                  m_narrow_tvalid,
    input  wire                  m_narrow_tready,
    output wire                  m_narrow_tlast
);

    // Number of narrow beats per 512-bit wide transfer
    localparam integer N     = 512 / NARROW_W;
    // Counter width: enough bits to count 0 .. N-1
    localparam integer CNT_W = (N > 1) ? $clog2(N) : 1;

    // =========================================================================
    // Upsizer — accumulate N narrow beats → one 512-bit beat
    //
    // Shift register approach (right-fill, synthesises to flops in Vivado):
    //   On each accepted narrow beat, the accumulation register is right-
    //   shifted by NARROW_W and the new beat is inserted at the MSB:
    //     up_acc = {new_beat, up_acc[511:NARROW_W]}
    //
    //   After N beats the slots are filled from MSB (newest) to LSB (oldest):
    //     up_acc[511:512-NARROW_W]        = beat N-1  (last)
    //     up_acc[NARROW_W-1:0]            = beat 0    (first → LSB = byte 0)
    //
    //   This matches AXI4 byte-lane convention: byte 0 at tdata[7:0].
    // =========================================================================
    reg [511:0]       up_acc;
    reg [CNT_W-1:0]   up_cnt;
    reg               up_valid;
    reg               up_last;

    // Back-pressure: accept narrow beats whenever the output slot is free
    // or is being consumed this cycle.
    assign s_narrow_tready = !up_valid || m_wide_tready;

    always @(posedge clk) begin
        if (!rst_n) begin
            up_acc   <= 512'b0;
            up_cnt   <= {CNT_W{1'b0}};
            up_valid <= 1'b0;
            up_last  <= 1'b0;
        end else begin
            // Deassert valid when the wide consumer accepts the output.
            if (up_valid && m_wide_tready)
                up_valid <= 1'b0;

            // Accept a narrow beat whenever s_narrow_tready is asserted.
            if (s_narrow_tvalid && s_narrow_tready) begin
                // Right-fill: newest beat at MSB, first beat ends at LSB.
                up_acc <= {s_narrow_tdata, up_acc[511:NARROW_W]};

                if (up_cnt == N - 1 || s_narrow_tlast) begin
                    // Completed one wide word (full count or early TLAST).
                    up_cnt   <= {CNT_W{1'b0}};
                    up_valid <= 1'b1;
                    up_last  <= s_narrow_tlast;
                end else begin
                    up_cnt <= up_cnt + {{(CNT_W-1){1'b0}}, 1'b1};
                end
            end
        end
    end

    assign m_wide_tdata  = up_acc;
    assign m_wide_tvalid = up_valid;
    assign m_wide_tlast  = up_last;

    // =========================================================================
    // Downsizer — split one 512-bit beat → N narrow beats
    //
    // On accepting a wide beat the 512-bit word is latched.  On each narrow
    // transfer the shift register advances right by NARROW_W, exposing the
    // next byte-lane slice at the LSB output tap.
    //
    //   dn_shift[NARROW_W-1:0] = current narrow beat (byte 0 first)
    //   After outputting beat k: dn_shift >>= NARROW_W
    // =========================================================================
    reg [511:0]       dn_shift;
    reg [CNT_W-1:0]   dn_cnt;
    reg               dn_valid;
    reg               dn_last_word;   // TLAST flag from the captured wide beat

    // Accept a new wide beat only when the downsizer is idle (no pending
    // narrow beats in flight).
    assign s_wide_tready = !dn_valid;

    always @(posedge clk) begin
        if (!rst_n) begin
            dn_shift     <= 512'b0;
            dn_cnt       <= {CNT_W{1'b0}};
            dn_valid     <= 1'b0;
            dn_last_word <= 1'b0;
        end else begin
            if (s_wide_tvalid && s_wide_tready) begin
                // Latch the wide beat; start outputting from the LSB.
                dn_shift     <= s_wide_tdata;
                dn_cnt       <= {CNT_W{1'b0}};
                dn_valid     <= 1'b1;
                dn_last_word <= s_wide_tlast;
            end else if (dn_valid && m_narrow_tready) begin
                // Shift right by NARROW_W to expose the next slice.
                dn_shift <= {{NARROW_W{1'b0}}, dn_shift[511:NARROW_W]};
                if (dn_cnt == N - 1) begin
                    // All narrow beats output; return to idle.
                    dn_valid <= 1'b0;
                    dn_cnt   <= {CNT_W{1'b0}};
                end else begin
                    dn_cnt <= dn_cnt + {{(CNT_W-1){1'b0}}, 1'b1};
                end
            end
        end
    end

    // Current narrow slice is always at the LSB of the shift register.
    assign m_narrow_tdata  = dn_shift[NARROW_W-1:0];
    assign m_narrow_tvalid = dn_valid;
    // Assert TLAST only on the last narrow beat of a wide beat that had TLAST.
    assign m_narrow_tlast  = dn_valid && (dn_cnt == N - 1) && dn_last_word;

endmodule
