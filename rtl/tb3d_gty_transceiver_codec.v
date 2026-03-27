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
// Clock Domain: GTY reference clock (~250 MHz, synchronous to transceiver)
// Combinational Path: 1-2 LUT delays per codec (encode/decode are pure logical)
//
// Control Interface (CDC'd from AXI clock domain via orchestrator):
//   - Per-lane enable/disable
//   - Per-lane error status (bit slip detection, CRC mismatch)
//   - Per-lane lock status (transceiver PLL locked)
//   - Global codec enable (gates all encoding/decoding)
//
// Latency:
//   TX (binary → TB3D): 0 cycles (combinational)
//   RX (TB3D → binary): 0 cycles (combinational)
//   GTY transceiver itself adds ~16-24 cycles (architectural, not codec latency)
//
// Timing Notes:
//   - Codec itself is 0 latency but GTY has significant internal latency
//   - Critical path: user_tx → encode → GTY TX (2-3 LUT delays acceptable)
//   - CDC enable/status signals can be pipelined (1-2 cycles latency acceptable)
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
    // Clock & Reset (gty_clk domain)
    // =========================================================================
    input  wire                     gty_clk,        // 250 MHz GTY reference / user clock
    input  wire                     gty_rst_n,      // Active-low asynchronous reset

    // =========================================================================
    // Control Signals (CDC'd from axi_clk via orchestrator)
    // =========================================================================
    input  wire                     codec_enable,   // Global codec on/off
    input  wire [NUM_LANES-1:0]     lane_enable,    // Per-lane enable
    output wire [NUM_LANES-1:0]     lane_locked,    // Per-lane transceiver lock status
    output wire [NUM_LANES-1:0]     lane_error,     // Per-lane error flag

    // =========================================================================
    // User TX Interface (pre-encoding) [NUM_LANES lanes]
    // Binary data from user logic or DMA
    // =========================================================================
    input  wire [NUM_LANES*8-1:0]   user_tx_data,   // [lane][7:0] - binary bytes
    input  wire [NUM_LANES-1:0]     user_tx_valid,  // Per-lane valid flag
    output wire [NUM_LANES-1:0]     user_tx_ready,  // Per-lane ready flag

    // =========================================================================
    // GTY TX Interface (post-encoding)
    // Connections to Versal GTY_PAM4 or GTY_STANDARD transceiver TX pins
    // =========================================================================
    // TX serialized output (actual serial I/O happens in GTY primitive)
    // For integration with Xilinx GT Wizard:
    //   - This module feeds into txoutclk and txout_* signals
    output wire [NUM_LANES-1:0]     gty_tx_valid,   // Encoded data valid to GTY
    output wire [NUM_LANES*8-1:0]   gty_tx_data,    // Encoded TB3D bytes to GTY
    input  wire [NUM_LANES-1:0]     gty_tx_ready,   // Backpressure from GTY (RDY, CDR)

    // =========================================================================
    // GTY RX Interface (pre-decoding)
    // Connections from Versal GTY_PAM4 or GTY_STANDARD transceiver RX pins
    // =========================================================================
    // RX deserialized input (GTY primitive outputs deserialized data)
    input  wire [NUM_LANES-1:0]     gty_rx_valid,   // TB3D data valid from GTY
    input  wire [NUM_LANES*8-1:0]   gty_rx_data,    // TB3D encoded bytes from GTY
    output wire [NUM_LANES-1:0]     gty_rx_ready,   // Ready to accept RX data

    // =========================================================================
    // User RX Interface (post-decoding)
    // Binary data to user logic or DMA
    // =========================================================================
    output wire [NUM_LANES-1:0]     user_rx_valid,  // Per-lane valid flag
    output wire [NUM_LANES*8-1:0]   user_rx_data,   // [lane][7:0] - decoded binary
    input  wire [NUM_LANES-1:0]     user_rx_ready   // Per-lane ready flag

    // =========================================================================
    // Optional: Performance Monitoring (can be expanded)
    // =========================================================================
    // output wire [31:0]  lane_tx_count[NUM_LANES-1:0],  // TX byte counters
    // output wire [31:0]  lane_rx_count[NUM_LANES-1:0],  // RX byte counters
    // output wire [7:0]   lane_crc_error[NUM_LANES-1:0]  // CRC errors per lane
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
    // Internal Signals
    // =========================================================================

    // Encoded/decoded data buses (internal)
    wire [NUM_LANES*8-1:0]  tx_encoded_data;    // Output of all encoders
    wire [NUM_LANES*8-1:0]  rx_decoded_data;    // Output of all decoders

    // Error status (aggregated from all lanes)
    wire [NUM_LANES-1:0]    lane_tx_error;      // TX-side errors (e.g., overflow)
    wire [NUM_LANES-1:0]    lane_rx_error;      // RX-side errors (e.g., underflow)

    // =========================================================================
    // Per-Lane Codec Instantiation
    // Organized in groups for timing/area management
    // =========================================================================

    genvar g, lane_in_group;

    // For each group...
    for (g = 0; g < NUM_GROUPS; g = g + 1) begin : codec_groups

        // For each lane within the group...
        for (lane_in_group = 0; lane_in_group < LANES_PER_GROUP; lane_in_group = lane_in_group + 1) begin : codec_lanes

            // Absolute lane index (0 to NUM_LANES-1)
            localparam LANE_IDX = g * LANES_PER_GROUP + lane_in_group;

            // ================================================================
            // TX Path (Binary → TB3D):
            //   user_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] (8-bit binary)
            //   →  tb3d_encode  (nibble interleave)
            //   →  gty_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] (8-bit TB3D)
            // ================================================================

            // Extract user TX byte for this lane
            wire [7:0] lane_user_tx_data = user_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX];

            // Codec uses lower nibble = physical, upper nibble = color
            wire [3:0] lane_tx_physical = lane_user_tx_data[3:0];
            wire [3:0] lane_tx_color    = lane_user_tx_data[7:4];

            // Instantiate encoder for this lane
            tb3d_encode u_encode (
                .physical (lane_tx_physical),
                .color    (lane_tx_color),
                .encoded  (tx_encoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX])
            );

            // TX handshake: gate user_tx_ready based on codec_enable and GTY readiness
            assign user_tx_ready[LANE_IDX] = codec_enable && lane_enable[LANE_IDX] && gty_tx_ready[LANE_IDX];

            // TX valid: pass through if codec enabled
            assign gty_tx_valid[LANE_IDX] = codec_enable && lane_enable[LANE_IDX] && user_tx_valid[LANE_IDX];

            // TX data: mux between encoded (if enabled) or pass-through
            // For now, always use encoded path; user_tx_data must be properly formatted
            assign gty_tx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] = 
                codec_enable ? tx_encoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX] :
                lane_user_tx_data;  // Bypass codec if disabled

            // ================================================================
            // RX Path (TB3D → Binary):
            //   gty_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] (8-bit TB3D)
            //   →  tb3d_decode  (nibble de-interleave)
            //   →  user_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] (8-bit binary)
            // ================================================================

            // Extract GTY RX byte (TB3D encoded) for this lane
            wire [7:0] lane_gty_rx_data = gty_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX];

            // Instantiate decoder for this lane
            wire [3:0] lane_rx_physical;
            wire [3:0] lane_rx_color;

            tb3d_decode u_decode (
                .encoded  (lane_gty_rx_data),
                .physical (lane_rx_physical),
                .color    (lane_rx_color)
            );

            // Reconstruct binary byte: {color, physical}
            assign rx_decoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX] = 
                {lane_rx_color, lane_rx_physical};

            // RX handshake: gate gty_rx_ready based on codec_enable and user readiness
            assign gty_rx_ready[LANE_IDX] = codec_enable && lane_enable[LANE_IDX] && user_rx_ready[LANE_IDX];

            // RX valid: pass through if codec enabled
            assign user_rx_valid[LANE_IDX] = codec_enable && lane_enable[LANE_IDX] && gty_rx_valid[LANE_IDX];

            // RX data: mux between decoded (if enabled) or pass-through
            assign user_rx_data[8*(LANE_IDX+1)-1:8*LANE_IDX] =
                codec_enable ? rx_decoded_data[8*(LANE_IDX+1)-1:8*LANE_IDX] :
                lane_gty_rx_data;  // Bypass codec if disabled

            // ================================================================
            // Status / Error Reporting
            // ================================================================

            // Placeholder: per-lane error detection can be enhanced with:
            //   - CRC mismatch detection
            //   - Comma/control symbol validation
            //   - Bit slip counters
            //   - Lane-specific timeout/stall detection
            //
            // For now, tie to zero (no errors)
            assign lane_error[LANE_IDX] = 1'b0;
            assign lane_locked[LANE_IDX] = 1'b1;  // Assume GTY is always locked

        end  // for lane_in_group

    end  // for g (codec_groups)

endmodule
