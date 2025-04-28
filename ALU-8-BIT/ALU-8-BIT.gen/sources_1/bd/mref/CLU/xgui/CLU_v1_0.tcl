# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOAD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTPUT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RSHIFT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUBSTRACT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WAIT_AFTER_LOAD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WAIT_AFTER_OP" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADD { PARAM_VALUE.ADD } {
	# Procedure called to update ADD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADD { PARAM_VALUE.ADD } {
	# Procedure called to validate ADD
	return true
}

proc update_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to update INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to validate INIT
	return true
}

proc update_PARAM_VALUE.LOAD { PARAM_VALUE.LOAD } {
	# Procedure called to update LOAD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOAD { PARAM_VALUE.LOAD } {
	# Procedure called to validate LOAD
	return true
}

proc update_PARAM_VALUE.OUTPUT { PARAM_VALUE.OUTPUT } {
	# Procedure called to update OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTPUT { PARAM_VALUE.OUTPUT } {
	# Procedure called to validate OUTPUT
	return true
}

proc update_PARAM_VALUE.RSHIFT { PARAM_VALUE.RSHIFT } {
	# Procedure called to update RSHIFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RSHIFT { PARAM_VALUE.RSHIFT } {
	# Procedure called to validate RSHIFT
	return true
}

proc update_PARAM_VALUE.SUBSTRACT { PARAM_VALUE.SUBSTRACT } {
	# Procedure called to update SUBSTRACT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUBSTRACT { PARAM_VALUE.SUBSTRACT } {
	# Procedure called to validate SUBSTRACT
	return true
}

proc update_PARAM_VALUE.WAIT_AFTER_LOAD { PARAM_VALUE.WAIT_AFTER_LOAD } {
	# Procedure called to update WAIT_AFTER_LOAD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WAIT_AFTER_LOAD { PARAM_VALUE.WAIT_AFTER_LOAD } {
	# Procedure called to validate WAIT_AFTER_LOAD
	return true
}

proc update_PARAM_VALUE.WAIT_AFTER_OP { PARAM_VALUE.WAIT_AFTER_OP } {
	# Procedure called to update WAIT_AFTER_OP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WAIT_AFTER_OP { PARAM_VALUE.WAIT_AFTER_OP } {
	# Procedure called to validate WAIT_AFTER_OP
	return true
}


proc update_MODELPARAM_VALUE.INIT { MODELPARAM_VALUE.INIT PARAM_VALUE.INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT}] ${MODELPARAM_VALUE.INIT}
}

proc update_MODELPARAM_VALUE.LOAD { MODELPARAM_VALUE.LOAD PARAM_VALUE.LOAD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOAD}] ${MODELPARAM_VALUE.LOAD}
}

proc update_MODELPARAM_VALUE.ADD { MODELPARAM_VALUE.ADD PARAM_VALUE.ADD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADD}] ${MODELPARAM_VALUE.ADD}
}

proc update_MODELPARAM_VALUE.SUBSTRACT { MODELPARAM_VALUE.SUBSTRACT PARAM_VALUE.SUBSTRACT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUBSTRACT}] ${MODELPARAM_VALUE.SUBSTRACT}
}

proc update_MODELPARAM_VALUE.RSHIFT { MODELPARAM_VALUE.RSHIFT PARAM_VALUE.RSHIFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RSHIFT}] ${MODELPARAM_VALUE.RSHIFT}
}

proc update_MODELPARAM_VALUE.OUTPUT { MODELPARAM_VALUE.OUTPUT PARAM_VALUE.OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTPUT}] ${MODELPARAM_VALUE.OUTPUT}
}

proc update_MODELPARAM_VALUE.WAIT_AFTER_LOAD { MODELPARAM_VALUE.WAIT_AFTER_LOAD PARAM_VALUE.WAIT_AFTER_LOAD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WAIT_AFTER_LOAD}] ${MODELPARAM_VALUE.WAIT_AFTER_LOAD}
}

proc update_MODELPARAM_VALUE.WAIT_AFTER_OP { MODELPARAM_VALUE.WAIT_AFTER_OP PARAM_VALUE.WAIT_AFTER_OP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WAIT_AFTER_OP}] ${MODELPARAM_VALUE.WAIT_AFTER_OP}
}

