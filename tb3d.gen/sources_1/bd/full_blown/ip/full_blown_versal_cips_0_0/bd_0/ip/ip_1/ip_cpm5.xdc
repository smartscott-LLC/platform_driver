# GT Reference clock 0
create_clock -period 10.0 -name GT_REFCLK0 [get_pins IBUFDS_GTE5_PCIeA0_inst/I]

# PCIE 0 GT Locations
set_property LOC GTYP_QUAD_X0Y2 [get_cells gt_quad_inst0/inst/quad_inst]
set_property LOC GTYP_QUAD_X0Y3 [get_cells gt_quad_inst1/inst/quad_inst]

# GT Reference clock 0 Location
set_property LOC GTYP_REFCLK_X0Y4 [get_cells IBUFDS_GTE5_PCIeA0_inst]


set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XPD[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XUSRCLK]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XLATCLK]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XRATE[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XPOLARITY]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_?XPRBSSEL[*]]

set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/APB3*]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/AXISCLK]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/*_AXIS_*]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/RXMARGIN*]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/PCIELTSSM[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/DEBUGTRACECLK]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/DEBUGTRACEREADY]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/REFCLK?_CLKTESTSIG]

set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_RXSLIDE]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXCOMSAS]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_DMONITORCLK]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_EYESCANTRIGGER]

set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXCOMINIT]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXCOMWAKE]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXINHIBIT]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXPIPPMEN]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXDATA[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXDETECTRX]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXELECIDLE]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXCTRL*[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXHEADER[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXONESZEROS]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXSEQUENCE[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXPRBSFORCEERR]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_TXPIPPMSTEPSIZE[*]]

set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_RXCHBONDI[*]]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_RXEQTRAINING]
set_case_analysis 0 [get_pins gt_quad_inst?/inst/quad_inst/CH?_RXGEARBOXSLIP]

set_property HD.TANDEM 1 [get_cells CPM_INST]
set_property HD.TANDEM 1 [get_cells IBUFDS_GTE5_PCIeA?_inst]
set_property HD.TANDEM 1 [get_cells gt_quad_inst?/inst/quad_inst]

set_property HD.TANDEM_BITSTREAMS SEPARATE [current_design]

create_waiver -type Methodology -id TIMING-3 -tags 1118802 -scoped -internal -description "Waive off Clock generation" -objects [get_clocks GT_REFCLK*]
create_waiver -type Methodology -id TIMING-4 -tags 1118802 -scoped -internal -description "Waive off Downstream Clock re-declaration" -objects [get_clocks dpll?_dco_clk]
