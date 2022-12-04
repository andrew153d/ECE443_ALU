SetActiveLib -work
comp -include "$dsn\src\adder.vhd" 
comp -include "$dsn\src\TestBench\adder_TB.vhd" 
asim +access +r TESTBENCH_FOR_adder 
wave 
wave -noreg a
wave -noreg b
wave -noreg cin
wave -noreg sum
wave -noreg cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\adder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_adder 
