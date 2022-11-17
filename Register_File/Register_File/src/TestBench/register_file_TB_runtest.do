SetActiveLib -work
comp -include "$dsn\src\structural.vhd" 
comp -include "$dsn\src\TestBench\register_file_TB.vhd" 
asim +access +r TESTBENCH_FOR_register_file 
wave 
wave -noreg Reg1
wave -noreg Reg2
wave -noreg WrReg
wave -noreg WriteData
wave -noreg RegWrite
wave -noreg ReadData1
wave -noreg ReadData2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\register_file_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_register_file 
