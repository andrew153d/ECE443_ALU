SetActiveLib -work
comp -include "$dsn\src\Processor.vhd" 
comp -include "$dsn\src\TestBench\processor_TB.vhd" 
asim +access +r TESTBENCH_FOR_processor 
wave 
wave -noreg instr_addr
wave -noreg instr
wave -noreg load_instr
wave -noreg ReadReg1
wave -noreg ReadReg2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\processor_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_processor 
