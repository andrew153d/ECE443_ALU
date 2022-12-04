SetActiveLib -work
comp -include "$dsn\src\Data_Mem.vhd" 
comp -include "$dsn\src\TestBench\data_mem_TB.vhd" 
asim +access +r TESTBENCH_FOR_data_mem 
wave 
wave -noreg Address
wave -noreg WriteData
wave -noreg MemWrite
wave -noreg MemRead
wave -noreg ReadData
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\data_mem_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_data_mem 
