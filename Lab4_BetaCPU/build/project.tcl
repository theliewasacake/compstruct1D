set projDir "./vivado"
set projName "Lab4_BetaCPU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "./source/alchitry_top.sv" "./source/reset_conditioner.sv" "./source/alu.sv" "./source/beta_cpu.sv" "./source/beta_manual_tester.sv" "./source/bit_reverse.sv" "./source/boolean.sv" "./source/compare.sv" "./source/control_unit.sv" "./source/instruction_rom.sv" "./source/memory_unit.sv" "./source/motherboard.sv" "./source/multi_seven_seg.sv" "./source/multiplier.sv" "./source/mux_2.sv" "./source/mux_4.sv" "./source/pc_unit.sv" "./source/regfile_memory.sv" "./source/regfile_unit.sv" "./source/seven_seg.sv" "./source/shifter.sv" "./source/pipeline.sv" "./source/button_conditioner.sv" "./source/counter.sv" "./source/decoder.sv" "./source/edge_detector.sv" "./source/simple_ram.v" "./source/simple_dual_port_ram.v" "./source/adder_32b.sv" "./source/cl_4b_adder.sv" "./source/partial_cl_adder.sv" "./source/lcd_spi_driver.sv" "./source/asset_rom.sv" "./source/accel_spi_driver.sv" "./source/divider.sv" "./source/pn_gen.sv" "./source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "./constraint/alchitry.xdc" "./constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
