# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/Documents/FPGA/Example 2.2_D-FlipFlop/Example 2.2_D-FlipFlop.cache/wt} [current_project]
set_property parent.project_path {E:/Documents/FPGA/Example 2.2_D-FlipFlop/Example 2.2_D-FlipFlop.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_output_repo {e:/Documents/FPGA/Example 2.2_D-FlipFlop/Example 2.2_D-FlipFlop.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {{E:/Documents/FPGA/Example 2.2_D-FlipFlop/Example 2.2_D-FlipFlop.srcs/sources_1/new/d-flipflop.vhd}}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

synth_design -top d_flipflop -part xc7z020clg484-1


write_checkpoint -force -noxdef d_flipflop.dcp

catch { report_utilization -file d_flipflop_utilization_synth.rpt -pb d_flipflop_utilization_synth.pb }
