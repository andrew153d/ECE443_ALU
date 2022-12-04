SetActiveLib -work
comp -include "$dsn\src\Half_Adder.vhd" 
comp -include "$dsn\src\TestBench\half_adder_TB.vhd" 
asim +access +r TESTBENCH_FOR_half_adder 
wave 
wave -noreg a
wave -noreg b
wave -noreg sum
wave -noreg Cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\half_adder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_half_adder 
