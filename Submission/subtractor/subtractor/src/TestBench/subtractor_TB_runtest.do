SetActiveLib -work
comp -include "$dsn\src\subtractor.vhd" 
comp -include "$dsn\src\TestBench\subtractor_TB.vhd" 
asim +access +r TESTBENCH_FOR_subtractor 
wave 
wave -noreg a
wave -noreg b
wave -noreg cin
wave -noreg sum
wave -noreg cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\subtractor_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_subtractor 
