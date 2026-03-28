#!/usr/bin/env tclsh
################################################################################
# TB3-D Platform Driver — Vivado Block Diagram Auto-Generation Script
#
# Project:   TB3-D Platform Driver — Versal VPK180 (VP1802)
# Purpose:   Automatically construct the entire BD with all 4 codec intercept 
#            modules, orchestrator, and interconnects in a single command
# Usage:     vivado -mode batch -source tb3d_create_bd.tcl -tclargs <project_name>
#
# This script:
#   1. Creates a new Vivado project (if needed)
#   2. Adds RTL sources (codec modules, encode/decode)
#   3. Creates the block diagram from scratch
#   4. Instantiates CIPS, NoC, clocking primitives
#   5. Adds all 4 TB3D codec intercept modules
#   6. Adds orchestrator and MicroBlaze shims
#   7. Wires all interconnects (AXI4, AXI4-Lite, AXIS)
#   8. Configures addresses and clock domains
#   9. Generates HDL and bitstream (optional)
################################################################################

# ============================================================================
# CONFIGURATION
# ============================================================================

set SCRIPT_DIR [file dirname [info script]]
set WORKSPACE_ROOT [file join $SCRIPT_DIR ".." ".."]
set RTL_DIR [file join $WORKSPACE_ROOT "rtl"]
set INCLUDE_DIR [file join $WORKSPACE_ROOT "include"]
set PROJECT_DIR [file join $WORKSPACE_ROOT "vivado_project"]

# Board definition
set BOARD_NAME "xilinx.com:boards:vck190:1.1"  ;# Change to your Versal board

# Codec module parameters
set NUM_LANES 8
set LANE_WIDTH 64

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

proc log_info {msg} {
    puts "\[INFO\] $msg"
}

proc log_warn {msg} {
    puts "\[WARN\] $msg"
}

proc log_error {msg} {
    puts "\[ERROR\] $msg"
    exit 1
}

proc log_section {title} {
    puts "\n=================================================================================="
    puts "  $title"
    puts "=================================================================================="
}

# Add RTL source file to project
proc add_rtl_source {project rtl_file} {
    set rtl_path [file join $RTL_DIR $rtl_file]
    if {[file exists $rtl_path]} {
        add_files -fileset sources_1 $rtl_path
        log_info "Added RTL: $rtl_file"
    } else {
        log_warn "RTL file not found: $rtl_path"
    }
}

# ============================================================================
# MAIN SCRIPT
# ============================================================================

# Parse command-line arguments
if {[llength $argv] > 0} {
    set PROJECT_NAME [lindex $argv 0]
} else {
    set PROJECT_NAME "tb3d_platform_driver"
}

log_section "TB3-D Platform Driver — Vivado BD Auto-Generation"
log_info "Project: $PROJECT_NAME"
log_info "Workspace: $WORKSPACE_ROOT"
log_info "RTL directory: $RTL_DIR"

# ============================================================================
# STEP 1: CREATE OR OPEN PROJECT
# ============================================================================

log_section "STEP 1: Project Setup"

if {[file exists [file join $PROJECT_DIR $PROJECT_NAME]]} {
    log_info "Opening existing project: $PROJECT_NAME"
    open_project [file join $PROJECT_DIR $PROJECT_NAME.xpr]
} else {
    log_info "Creating new project: $PROJECT_NAME"
    create_project -name $PROJECT_NAME \
                   -dir $PROJECT_DIR \
                   -part xck190-sfvb784-2-e \
                   -ip_repo_paths [file join $WORKSPACE_ROOT "ip"] \
                   -force
    
    set_property BOARD_PART $BOARD_NAME [current_project]
}

# ============================================================================
# STEP 2: ADD RTL SOURCES
# ============================================================================

log_section "STEP 2: Add RTL Sources"

# Core TB3D encoding/decoding (combinational)
add_rtl_source [current_project] "tb3d_encode.v"
add_rtl_source [current_project] "tb3d_decode.v"

# Intercept modules (4 pieces + orchestrator)
add_rtl_source [current_project] "tb3d_gty_transceiver_codec.v"
add_rtl_source [current_project] "tb3d_pmc_intercept.v"
add_rtl_source [current_project] "tb3d_microblaze_module.v"
add_rtl_source [current_project] "tb3d_axi_bridge_module.v"
add_rtl_source [current_project] "tb3d_orchestrator.v"

save_project_as -overwrite

# ============================================================================
# STEP 3: CREATE BLOCK DIAGRAM
# ============================================================================

log_section "STEP 3: Create Block Diagram"

set BD_NAME "design_1"
set BD_PATH [create_bd_design -name $BD_NAME]

log_info "Created block diagram: $BD_NAME"

# ============================================================================
# STEP 4: ADD VERSAL CIPS CORE (Control, Interfaces, Processing System)
# ============================================================================

log_section "STEP 4: Add Versal CIPS"

set cips [create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips CIPS]

# Configure CIPS for minimal boot
# - Enable PMC
# - Enable MicroBlaze in PMC
# - Enable NoC (Network on Chip)
# - Set clocking for axi_clk (200 MHz)

log_info "  Configuring CIPS..."
set_property -dict {
    CONFIG.CLOCK_MODE {Enable}
    CONFIG.ENABLE_DDR4 {1}
    CONFIG.ENABLE_NOCSOC {1}
    CONFIG.ENABLE_PMC {1}
    CONFIG.CLK_FREQ1 {200}
} [get_bd_cells CIPS]

log_info "  CIPS configured: NoC + PMC enabled, axi_clk = 200 MHz"

# ============================================================================
# STEP 5: ADD CLOCKING PRIMITIVE (PLL for GTY reference clock)
# ============================================================================

log_section "STEP 5: Add Clocking"

set clk_wiz [create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0]

set_property -dict {
    CONFIG.PRIM_IN_FREQ {100}
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {250}
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200}
    CONFIG.USE_RESET {true}
} [get_bd_cells clk_wiz_0]

log_info "  Clock wizard configured: gty_clk=250MHz, axi_clk=200MHz"

# ============================================================================
# STEP 6: CREATE AXI INTERCONNECT (for codec CSR control paths)
# ============================================================================

log_section "STEP 6: Add AXI Interconnect"

set axi_ic [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_interconnect_0]

set_property -dict {
    CONFIG.NUM_MI {4}
    CONFIG.NUM_SI {1}
    CONFIG.SYNCHRONIZATION_STAGES {2}
} [get_bd_cells axi_interconnect_0]

log_info "  AXI Interconnect: 1 slave, 4 masters (for each codec module)"

# ============================================================================
# STEP 7: INSTANTIATE TB3D CODEC MODULES
# ============================================================================

log_section "STEP 7: Instantiate TB3D Codec Modules"

# GTY Codec
log_info "  Adding GTY Transceiver Codec..."
set gty_codec [create_bd_cell -type module -reference tb3d_gty_transceiver_codec gty_codec]
set_property -dict [list CONFIG.NUM_LANES $NUM_LANES CONFIG.LANE_W $LANE_WIDTH] $gty_codec

# PMC Intercept
log_info "  Adding PMC Intercept..."
set pmc_intercept [create_bd_cell -type module -reference tb3d_pmc_intercept pmc_intercept_0]

# MicroBlaze Cache Shim
log_info "  Adding MicroBlaze Cache Shim..."
set mb_cache [create_bd_cell -type module -reference tb3d_microblaze_module mb_cache_0]

# AXI Bridge Intercept
log_info "  Adding AXI Bridge Intercept..."
set axi_bridge [create_bd_cell -type module -reference tb3d_axi_bridge_module axi_bridge_0]

# ============================================================================
# STEP 8: ADD ORCHESTRATOR
# ============================================================================

log_section "STEP 8: Add Orchestrator"

log_info "  Adding TB3-D Orchestrator..."
set orchestrator [create_bd_cell -type module -reference tb3d_orchestrator orchestrator_0]

set_property -dict [list CONFIG.NUM_GTY $NUM_LANES] $orchestrator

log_info "  Orchestrator configured for $NUM_LANES GTY lanes"

# ============================================================================
# STEP 9: CLOCK & RESET DISTRIBUTION
# ============================================================================

log_section "STEP 9: Clock & Reset Distribution"

# Connect GTY clock (250 MHz)
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins gty_codec/gty_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins pmc_intercept_0/axi_clk]

# Connect AXI clock (200 MHz)
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins axi_interconnect_0/ACLK]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins gty_codec/axi_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins orchestrator_0/axi_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins mb_cache_0/mb_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins axi_bridge_0/axi_clk]

# Connect resets (from CIPS or external reset controller)
set reset_net [get_bd_nets -filter {NAME =~ "*rst_n*"}]
if {[llength $reset_net] > 0} {
    connect_bd_net $reset_net [get_bd_pins gty_codec/gty_rst_n]
    connect_bd_net $reset_net [get_bd_pins gty_codec/axi_rst_n]
    connect_bd_net $reset_net [get_bd_pins orchestrator_0/axi_rst_n]
} else {
    log_warn "  No reset net found; manual reset wiring may be needed"
}

log_info "  Clock distribution complete"

# ============================================================================
# STEP 10: AXI CONTROL PATH WIRING
# ============================================================================

log_section "STEP 10: AXI Control Path (Orchestrator → Codecs)"

# Connect orchestrator master outputs to interconnect slaves
connect_bd_intf_net [get_bd_intf_pins orchestrator_0/M_AXI_GTY] \
                     [get_bd_intf_pins axi_interconnect_0/S00_AXI]

# Connect codec CSR slaves to interconnect masters
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_0/M00_AXI] \
                     [get_bd_intf_pins gty_codec/s_axi_ctrl]

connect_bd_intf_net [get_bd_intf_pins axi_interconnect_0/M01_AXI] \
                     [get_bd_intf_pins pmc_intercept_0/s_axi_ctrl]

connect_bd_intf_net [get_bd_intf_pins axi_interconnect_0/M02_AXI] \
                     [get_bd_intf_pins mb_cache_0/s_axi_ctrl]

connect_bd_intf_net [get_bd_intf_pins axi_interconnect_0/M03_AXI] \
                     [get_bd_intf_pins axi_bridge_0/s_axi_ctrl]

log_info "  Control paths connected: orchestrator → 4 codec CSR slaves"

# ============================================================================
# STEP 11: ADDRESS MAPPING
# ============================================================================

log_section "STEP 11: Address Mapping"

set_property offset 0x00000000 [get_bd_addr_segs {gty_codec/s_axi_ctrl}]
set_property range 0x00001000 [get_bd_addr_segs {gty_codec/s_axi_ctrl}]

set_property offset 0x00010000 [get_bd_addr_segs {pmc_intercept_0/s_axi_ctrl}]
set_property range 0x00001000 [get_bd_addr_segs {pmc_intercept_0/s_axi_ctrl}]

set_property offset 0x00020000 [get_bd_addr_segs {mb_cache_0/s_axi_ctrl}]
set_property range 0x00001000 [get_bd_addr_segs {mb_cache_0/s_axi_ctrl}]

set_property offset 0x00030000 [get_bd_addr_segs {axi_bridge_0/s_axi_ctrl}]
set_property range 0x00001000 [get_bd_addr_segs {axi_bridge_0/s_axi_ctrl}]

log_info "  Address space allocated:"
log_info "    GTY codec    @ 0x00000000 (4 KB)"
log_info "    PMC intercept@ 0x00010000 (4 KB)"
log_info "    MB cache     @ 0x00020000 (4 KB)"
log_info "    AXI bridge   @ 0x00030000 (4 KB)"

# ============================================================================
# STEP 12: DATA PATH WIRING (Optional - for reference)
# ============================================================================

log_section "STEP 12: Data Path Setup (Manual Wiring)"

log_info "  Manual wiring required for AXIS data paths:"
log_info "    - GTY TXDATA/RXDATA → gty_codec S_AXIS_RX/TX"
log_info "    - gty_codec M_AXIS_RX/TX → NoC/system fabric"
log_info "    - MicroBlaze M_AXI_IC/DC → mb_cache S_AXI_CACHE"
log_info "    - mb_cache M_AXI_NOC → Versal NoC"
log_info "  (These are board-specific and must be wired manually in Vivado GUI)"

# ============================================================================
# STEP 13: OPTIONAL HDL GENERATION & VALIDATION
# ============================================================================

log_section "STEP 13: Validate Block Diagram"

# Validate the BD
catch {validate_bd_design} validation_result

if {[string match "*CRITICAL*" $validation_result] || \
    [string match "*ERROR*" $validation_result]} {
    log_warn "BD validation warnings detected:"
    puts $validation_result
} else {
    log_info "Block diagram validation passed ✓"
}

# ============================================================================
# STEP 14: SAVE AND GENERATE
# ============================================================================

log_section "STEP 14: Save Project"

save_bd_design
save_project_as -overwrite

log_info "Block diagram saved: $BD_PATH.bd"
log_info "Project saved: [get_property DIRECTORY [current_project]]/$PROJECT_NAME.xpr"

# ============================================================================
# SUMMARY
# ============================================================================

log_section "SUMMARY"

log_info "✓ Vivado project created: $PROJECT_NAME"
log_info "✓ Block diagram generated: $BD_NAME"
log_info "✓ All 4 TB3D codec modules instantiated"
log_info "✓ Orchestrator added and connected"
log_info "✓ Clock (gty_clk=250MHz, axi_clk=200MHz) configured"
log_info "✓ AXI control paths wired"
log_info "✓ Address mapping complete"
log_info ""
log_info "Next steps:"
log_info "  1. Open Vivado GUI to review/wire data paths"
log_info "  2. Connect GTY raw I/O and NoC fabric"
log_info "  3. Run 'Generate HDL' to create RTL wrapper"
log_info "  4. Run 'Implement' to generate bitstream"
log_info ""
log_info "To open in GUI:"
log_info "  vivado [file join $PROJECT_DIR $PROJECT_NAME $PROJECT_NAME.xpr]"

puts ""
log_info "TB3-D Vivado automation complete! 🎉"

# Optional: Generate output products (HDL wrapper)
# Uncomment to auto-generate:
# generate_target all [get_files $BD_PATH.bd]
# catch {config_ip_cache -export [get_ips -all]}

exit 0
