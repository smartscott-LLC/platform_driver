# file: design_1_mdm_1_0.xdc
set_clock_groups -quiet -asynchronous -group [get_clocks -quiet -of_objects [get_nets bscan_ext_update]]
set_clock_groups -quiet -asynchronous -group [get_clocks -quiet -of_objects [get_pins *.BUFG_DRCK*/*/O]]

create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/Debug_SYS_Rst_i_reg/C]

# Methodology waivers for external BSCAN
create_waiver -internal -scoped -user mdm -tags 12436 -type METHODOLOGY -id TIMING-54 \
  -object [get_clocks -quiet -of_objects [get_nets bscan_ext_update]] \
  -description "Avoid warning for valid UPDATE clock constraint"
create_waiver -internal -scoped -user mdm -tags 12436 -type METHODOLOGY -id TIMING-54 \
  -object [get_clocks -quiet -of_objects [get_pins *.BUFG_DRCK*/*/O]] \
  -description "Avoid warning for valid DRCK clock constraint"

# Waivers for serial debug interface
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/Use_Serial_Unified_Completion.*/C]

create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/Use_Serial_Unified_Completion.*/D]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/Use_Serial_Unified_Completion.*/D]

# Waivers for BSCAN
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/C]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/C*]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/O]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [list [get_pins -quiet {MDM_Core_I1/*/C MDM_Core_I1/JTAG_CONTROL_I/*/C}]]

create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/*/CE]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/CE]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/CE]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [list [get_pins -quiet {MDM_Core_I1/JTAG_CONTROL_I/*/D MDM_Core_I1/JTAG_CONTROL_I/*/R}]]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/PRE]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/CLR]
create_waiver -internal -scoped -user mdm -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [list [get_pins -quiet {MDM_Core_I1/JTAG_CONTROL_I/*/R MDM_Core_I1/JTAG_CONTROL_I/*/*/R}]]

