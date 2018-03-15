# TCL File Generated by Component Editor 13.0sp1
# Thu Mar 15 22:02:10 GMT 2018
# DO NOT MODIFY


# 
# FpTask8v4 "FpTask8v4" v0.1
#  2018.03.15.22:02:10
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module FpTask8v4
# 
set_module_property DESCRIPTION ""
set_module_property NAME FpTask8v4
set_module_property VERSION 0.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME FpTask8v4
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL task8v4
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file task8v4.v VERILOG PATH ip/task8v4.v TOP_LEVEL_FILE
add_fileset_file altfp_add_sub0.v VERILOG PATH ip/altfp_add_sub0.v
add_fileset_file altfp_add_sub1.v VERILOG PATH ip/altfp_add_sub1.v
add_fileset_file altfp_mult0.v VERILOG PATH ip/altfp_mult0.v
add_fileset_file cordic_dsd_multirate.v VERILOG PATH ip/cordic_dsd_multirate.v
add_fileset_file cordicWrap.v VERILOG PATH ip/cordicWrap.v
add_fileset_file divByn.v VERILOG PATH ip/divByn.v
add_fileset_file fixedtofloat.v VERILOG PATH ip/fixedtofloat.v
add_fileset_file floor.v VERILOG PATH ip/floor.v
add_fileset_file Mux2to1.v VERILOG PATH ip/Mux2to1.v
add_fileset_file Task_8_timerv4.v VERILOG PATH ip/Task_8_timerv4.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point nios_custom_instruction_slave
# 
add_interface nios_custom_instruction_slave nios_custom_instruction end
set_interface_property nios_custom_instruction_slave clockCycle 0
set_interface_property nios_custom_instruction_slave operands 2
set_interface_property nios_custom_instruction_slave ENABLED true
set_interface_property nios_custom_instruction_slave EXPORT_OF ""
set_interface_property nios_custom_instruction_slave PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave clk clk Input 1
add_interface_port nios_custom_instruction_slave clk_en clk_en Input 1
add_interface_port nios_custom_instruction_slave dataa dataa Input 32
add_interface_port nios_custom_instruction_slave datab datab Input 32
add_interface_port nios_custom_instruction_slave n n Input 8
add_interface_port nios_custom_instruction_slave dataout result Output 32
add_interface_port nios_custom_instruction_slave done done Output 1
