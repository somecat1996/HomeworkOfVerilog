
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Counter_V -dir "E:/study/FPGA/Counter_V/planAhead_run_1" -part xc3s100ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Counter_V.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Counter_V.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Counter_V $srcset
add_files [list {Counter_V.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-5
