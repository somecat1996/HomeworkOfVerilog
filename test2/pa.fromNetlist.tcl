
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name test2 -dir "E:/study/FPGA/test2/planAhead_run_1" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/study/FPGA/test2/test2.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/study/FPGA/test2} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "test2.ucf" [current_fileset -constrset]
add_files [list {test2.ucf}] -fileset [get_property constrset [current_run]]
link_design
