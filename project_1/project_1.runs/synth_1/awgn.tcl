# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Jiangnan Xia/project_1/project_1.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Jiangnan Xia/project_1/project_1.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/Jiangnan Xia/project_1/lzd2.v}
  {C:/Users/Jiangnan Xia/project_1/lzd4.v}
  {C:/Users/Jiangnan Xia/project_1/lzd8.v}
  {C:/Users/Jiangnan Xia/project_1/lzd16.v}
  {C:/Users/Jiangnan Xia/project_1/lzd32.v}
  {C:/Users/Jiangnan Xia/project_1/shiftery_f.v}
  {C:/Users/Jiangnan Xia/project_1/shifteru0.v}
  {C:/Users/Jiangnan Xia/project_1/shiftere.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c2e.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c1g.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c1f1.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c1f0.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c1e.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c0g.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c0f1.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c0f0.v}
  {C:/Users/Jiangnan Xia/project_1/rom_c0e.v}
  {C:/Users/Jiangnan Xia/project_1/lzd48.v}
  {C:/Users/Jiangnan Xia/project_1/unit_sqrt.v}
  {C:/Users/Jiangnan Xia/project_1/unit_log.v}
  {C:/Users/Jiangnan Xia/project_1/unit_cos.v}
  {C:/Users/Jiangnan Xia/project_1/urng.v}
  {C:/Users/Jiangnan Xia/project_1/awgn.v}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Jiangnan Xia/project_1/simple.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Jiangnan Xia/project_1/simple.xdc}}]


synth_design -top awgn -part xc7k70tfbv676-1


write_checkpoint -force -noxdef awgn.dcp

catch { report_utilization -file awgn_utilization_synth.rpt -pb awgn_utilization_synth.pb }
