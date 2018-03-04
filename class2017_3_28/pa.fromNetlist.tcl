
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name class2017_3_28 -dir "E:/study/FPGA/class2017_3_28/planAhead_run_2" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/study/FPGA/class2017_3_28/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/study/FPGA/class2017_3_28} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
