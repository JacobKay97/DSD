transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/Year_3/DSD/system_template_de0/ip {H:/Year_3/DSD/system_template_de0/ip/task7Timer.v}
vlog -vlog01compat -work work +incdir+H:/Year_3/DSD/system_template_de0/db {H:/Year_3/DSD/system_template_de0/db/altpll0_altpll.v}
vlib altera_reserved_qsys_first_nios2_system
vmap altera_reserved_qsys_first_nios2_system altera_reserved_qsys_first_nios2_system
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/first_nios2_system.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/FloatAddSub.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/FloatMult.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/Task7.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_customins_master_translator.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_reset_controller.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altfp_add_sub0.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altfp_convert0.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altfp_mult0.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/cordicWrap.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/cordic_dsd.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/divByn.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_jtag_uart.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_led_pio.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_sdram.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_sys_clk_timer.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_sysid.v}
vlog -vlog01compat -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/floor.v}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_customins_slave_translator.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_master_agent.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_master_translator.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_traffic_limiter.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_addr_router.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_addr_router_001.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_cmd_xbar_demux.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_cmd_xbar_demux_001.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_cmd_xbar_mux.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_cpu_custom_instruction_master_multi_xconnect.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_id_router.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_id_router_001.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_id_router_002.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_irq_mapper.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_rsp_xbar_demux.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_rsp_xbar_demux_002.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_rsp_xbar_mux.sv}
vlog -sv -work altera_reserved_qsys_first_nios2_system +incdir+H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules {H:/Year_3/DSD/system_template_de0/db/ip/first_nios2_system/submodules/first_nios2_system_rsp_xbar_mux_001.sv}
vcom -93 -work work {H:/Year_3/DSD/system_template_de0/altpll0.vhd}

