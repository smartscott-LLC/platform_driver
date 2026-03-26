# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CACHE_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CACHE_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SBUF_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SBUF_DEPTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.CACHE_ADDR_W { PARAM_VALUE.CACHE_ADDR_W } {
	# Procedure called to update CACHE_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CACHE_ADDR_W { PARAM_VALUE.CACHE_ADDR_W } {
	# Procedure called to validate CACHE_ADDR_W
	return true
}

proc update_PARAM_VALUE.CACHE_DEPTH { PARAM_VALUE.CACHE_DEPTH } {
	# Procedure called to update CACHE_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CACHE_DEPTH { PARAM_VALUE.CACHE_DEPTH } {
	# Procedure called to validate CACHE_DEPTH
	return true
}

proc update_PARAM_VALUE.SBUF_ADDR_W { PARAM_VALUE.SBUF_ADDR_W } {
	# Procedure called to update SBUF_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SBUF_ADDR_W { PARAM_VALUE.SBUF_ADDR_W } {
	# Procedure called to validate SBUF_ADDR_W
	return true
}

proc update_PARAM_VALUE.SBUF_DEPTH { PARAM_VALUE.SBUF_DEPTH } {
	# Procedure called to update SBUF_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SBUF_DEPTH { PARAM_VALUE.SBUF_DEPTH } {
	# Procedure called to validate SBUF_DEPTH
	return true
}


proc update_MODELPARAM_VALUE.CACHE_DEPTH { MODELPARAM_VALUE.CACHE_DEPTH PARAM_VALUE.CACHE_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CACHE_DEPTH}] ${MODELPARAM_VALUE.CACHE_DEPTH}
}

proc update_MODELPARAM_VALUE.CACHE_ADDR_W { MODELPARAM_VALUE.CACHE_ADDR_W PARAM_VALUE.CACHE_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CACHE_ADDR_W}] ${MODELPARAM_VALUE.CACHE_ADDR_W}
}

proc update_MODELPARAM_VALUE.SBUF_DEPTH { MODELPARAM_VALUE.SBUF_DEPTH PARAM_VALUE.SBUF_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SBUF_DEPTH}] ${MODELPARAM_VALUE.SBUF_DEPTH}
}

proc update_MODELPARAM_VALUE.SBUF_ADDR_W { MODELPARAM_VALUE.SBUF_ADDR_W PARAM_VALUE.SBUF_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SBUF_ADDR_W}] ${MODELPARAM_VALUE.SBUF_ADDR_W}
}

