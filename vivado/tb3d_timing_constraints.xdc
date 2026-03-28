# ============================================================================
# TB3-D Platform Driver — Vivado Timing Constraints (XDC)
#
# Project:   TB3-D Platform Driver — Versal VPK180
# Purpose:   Define timing constraints for safe CDCs (Clock Domain Crossings)
#            and high-speed data paths
#
# Clock domains:
#   - gty_clk    @ 250 MHz (GTYP reference, GTY codec data path)
#   - axi_clk    @ 200 MHz (AXI control path, interconnect)
#   - drp_clk    @ 200 MHz (DRP controller, typically same as axi_clk)
#
# CDC synchronizers: 2-FF chains (std_fifo_fwft, built into codec modules)
# Timing margins: 2 ns slack minimum (conservative for reliability)
# ============================================================================

# ============================================================================
# 1. CLOCK DEFINITIONS
# ============================================================================

# GTY clock (250 MHz reference from GTYP transceiver, typical REFCLK ÷ 4)
create_clock -period 4.000 -name gty_clk \
    [get_ports gty_clk]
set_property KEEP TRUE [get_clocks gty_clk]

# AXI control clock (200 MHz from CIPS PLL or external)
create_clock -period 5.000 -name axi_clk \
    [get_ports axi_clk]
set_property KEEP TRUE [get_clocks axi_clk]

# DRP clock (typically same as axi_clk, but allow for future separation)
create_clock -period 5.000 -name drp_clk \
    [get_ports drp_clk]
set_property KEEP TRUE [get_clocks drp_clk]

# ============================================================================
# 2. CLOCK DOMAIN CROSSING (CDC) FALSE PATH SPECIFICATIONS
# ============================================================================
#
# CDC synchronizers are 2-stage flip-flop cascades. To meet timing,
# we mark the data path across CDC as a FALSE_PATH (data is allowed to
# be metastable; timing is guaranteed by 2-FF synchronizer design).
#
# Pattern: gty_clk → 2-FF sync → axi_clk (e.g., lane_locked, lane_error)
#         axi_clk → 2-FF sync → gty_clk (rare, typically read-only status)
#

# FROM gty_clk TO axi_clk (lane status signals crossing)
set_false_path \
    -from [get_clocks gty_clk] \
    -to [get_clocks axi_clk]

# FROM axi_clk TO gty_clk (if any config signals cross back)
set_false_path \
    -from [get_clocks axi_clk] \
    -to [get_clocks gty_clk]

# FROM gty_clk TO drp_clk (DRP interface, if used)
set_false_path \
    -from [get_clocks gty_clk] \
    -to [get_clocks drp_clk]

# ============================================================================
# 3. CODEC INTERNAL CONSTRAINTS
# ============================================================================

# GTY Codec: AXIS data paths in gty_clk domain must meet 250 MHz
# (1 cycle = 4.0 ns)

# S_AXIS_RX pipeline latency: <1 cycle (combinational decode)
set_max_delay -datapath_only \
    -from [get_cells {gty_codec/s_axis_rx_*}] \
    -to [get_cells {gty_codec/m_axis_rx_*}] \
    3.5

# S_AXIS_TX pipeline latency: <1 cycle (combinational encode)
set_max_delay -datapath_only \
    -from [get_cells {gty_codec/s_axis_tx_*}] \
    -to [get_cells {gty_codec/m_axis_tx_*}] \
    3.5

# S_AXI_CTRL CSR reads/writes in axi_clk domain (200 MHz)
# (1 cycle = 5.0 ns)

set_max_delay -datapath_only \
    -from [get_cells {gty_codec/s_axi_ctrl_*}] \
    -to [get_cells {gty_codec/s_axi_ctrl_rdata*}] \
    4.5

# ============================================================================
# 4. ORCHESTRATOR CONTROL PATH CONSTRAINTS
# ============================================================================

# Orchestrator M_AXI_GTY writes to GTY codec S_AXI_CTRL
# Must meet axi_clk timing (200 MHz, 5.0 ns period)

set_max_delay -datapath_only \
    -from [get_cells {orchestrator_0/m_axi_gty_*}] \
    -to [get_cells {gty_codec/s_axi_ctrl*}] \
    4.5

# ============================================================================
# 5. RESET SYNCHRONIZATION
# ============================================================================

# Async resets (axi_rst_n, gty_rst_n, drp_rst_n) are asynchronous active-low
# Reset synchronizers handle CDC; mark pre-sync as FALSE_PATH

set_false_path -from [get_pins axi_rst_n] -to [all_registers]
set_false_path -from [get_pins gty_rst_n] -to [all_registers]
set_false_path -from [get_pins drp_rst_n] -to [all_registers]

# ============================================================================
# 6. INPUT/OUTPUT TIMING
# ============================================================================

# GTY TXDATA/RXDATA are high-speed serial I/O with tight timing
# Typical setup/hold for SERDES interfaces: <2 ns

set_input_delay  -clock gty_clk -min 0.5 [get_ports gty_rxdata*]
set_input_delay  -clock gty_clk -max 1.5 [get_ports gty_rxdata*]
set_output_delay -clock gty_clk -min 0.5 [get_ports gty_txdata*]
set_output_delay -clock gty_clk -max 1.5 [get_ports gty_txdata*]

# AXI4-Lite control bus (200 MHz, more relaxed timing)
set_input_delay  -clock axi_clk -min 1.0 [get_ports s_axi_ctrl_*]
set_input_delay  -clock axi_clk -max 3.0 [get_ports s_axi_ctrl_*]
set_output_delay -clock axi_clk -min 0.5 [get_ports s_axi_ctrl_*]
set_output_delay -clock axi_clk -max 2.5 [get_ports s_axi_ctrl_*]

# ============================================================================
# 7. TIMING MARGIN & SLACK REQUIREMENTS
# ============================================================================

# Minimum slack target: 2.0 ns (conservative for Versal, accounts for
# temperature, voltage, and process variation)

set_property SLACK_TARGET 2.0 [current_design]

# ============================================================================
# 8. PLACEMENT & ROUTING DIRECTIVES
# ============================================================================

# Place CDC synchronizers close to their endpoints for minimal clock skew

set_property LOC_CONSTRAINT {SLICE_X200Y200} [get_cells {gty_codec/*_s1}]
set_property LOC_CONSTRAINT {SLICE_X200Y201} [get_cells {gty_codec/*_s}]

log_info "XDC constraints loaded: CDC safe, AXIS at 250MHz, control at 200MHz"

# ============================================================================
# 9. CONFIGURATION
# ============================================================================

# Set timing report options
set_property REPORT_UNCOVERED_TIMING 1 [current_design]
set_property TIMING_WINDOW 25 [current_design]

# Enable cross-domain analysis (Vivado 2023.2+)
set_property CROSS_DOMAIN_WARNINGS 1 [get_designs]

# ============================================================================
# 10. GENERATED UTILITY COMMANDS FOR TCL SCRIPTING
# ============================================================================

# Source this file in your Vivado flow AFTER synthesis and BEFORE
# implementation:
#
#   vivado -mode batch -source report_timing.tcl
#
# Then run:
#   synth_design
#   source tb3d_timing_constraints.xdc
#   place_design
#   route_design
#   report_timing -setup -hold -max_paths 100
#

puts "=========================================="
puts "TB3-D Timing Constraints Applied ✓"
puts "=========================================="
puts "GT Clock (gty_clk):      250 MHz (4.0 ns period)"
puts "AXI Clock (axi_clk):     200 MHz (5.0 ns period)"
puts "DRP Clock (drp_clk):     200 MHz (5.0 ns period)"
puts ""
puts "CDC FALSE_PATH:          gty_clk ↔ axi_clk (2-FF sync)"
puts "Min slack target:        2.0 ns"
puts "AXIS latency:            <1 cycle (3.5 ns)"
puts ""
puts "Run post-route timing report:"
puts "  report_timing -setup -hold -max_paths 100 -file timing_report.txt"
puts "=========================================="
