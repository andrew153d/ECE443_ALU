SetActiveLib -work
comp -include "$dsn\src\multiplexer.vhd" 
comp -include "$dsn\src\TestBench\multiplexer_TB.vhd" 
asim +access +r TESTBENCH_FOR_multiplexer 
wave 
wave -noreg s2
wave -noreg s1
wave -noreg s0
wave -noreg in1
wave -noreg in2
wave -noreg in3
wave -noreg in4
wave -noreg in5
wave -noreg in6
wave -noreg in7
wave -noreg in8
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\multiplexer_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_multiplexer 
