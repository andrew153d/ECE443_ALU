library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
library Data_Mem;
use Data_Mem.all; 
library multiplexer;
use multiplexer.all;
library register_file;
use register_file.all; 
library alu;
use alu.all;



entity processor is
port (  instr_addr :in STD_LOGIC_VECTOR(7 downto 0);
		instr	   :in STD_LOGIC_VECTOR(15 downto 0);
		load_instr: in STD_LOGIC;
		Debug1, Debug2, Debug3, Debug4: out STD_LOGIC_VECTOR(15 downto 0));
end processor;


architecture structural of processor is 




component multiplexer is
port (in1, in2: in STD_LOGIC_VECTOR(15 downto 0);
	outputSelect: in STD_LOGIC;
	Output:out STD_LOGIC_VECTOR(15 downto 0));
end component;

component register_file is
	port (Reg1, Reg2, WrReg :in STD_LOGIC_VECTOR(2 downto 0);
		  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
		  RegWrite: in STD_LOGIC;
		  ReadData1, ReadData2 :out STD_LOGIC_VECTOR(15 downto 0));	
end component; 

component alu is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
		S2, S1, S0: in STD_LOGIC;
		result :out STD_LOGIC_VECTOR(15 downto 0);
		status: out STD_LOGIC_VECTOR(2 downto 0));
end component; 

component Data_Mem is
port (Address :in STD_LOGIC_VECTOR(7 downto 0);
	  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
	  MemWrite, MemRead: in STD_LOGIC;
	  ReadData:out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal instruction, A, B, C, D, E, F, G: STD_LOGIC_VECTOR(15 downto 0); 
signal RdSrc, WrtSrc, RegWrite, ALUop0, ALUop1, ALUop2, Mem_Read, Mem_Write, MemToReg: STD_LOGIC;
signal testAddr: STD_LOGIC_VECTOR(7 downto 0);
signal ALU_status: STD_LOGIC_VECTOR(2 downto 0);

begin
	
	--Control Logic
	
	ALUop0 <= 		instruction(12); 
	ALUop1 <= 		instruction(13);
	ALUop2 <= 		instruction(14);
	RdSrc <= 		instruction(14) and instruction(13);
	WrtSrc <= 		not instruction(13);
	RegWrite <= 	not(instruction(14) and instruction(13) and instruction(12));
	Mem_Read <= 	instruction(12);
	Mem_Write <= 	instruction(14) and instruction(13) and not instruction(12);
	MemToReg <= 	(not instruction(14)) or (not instruction(13));
	
	--outputs for debugging and showing results
		Debug1 <= "000000000000"&instruction( 11 downto 8);
		Debug2 <= B;
		Debug3 <= "000000000000000"&RegWrite;
		Debug4 <= C;
	
	IM: Data_Mem port map (instr_addr, instr,load_instr , '1', instruction);
	
	Addr1Mux: multiplexer port map ("000000000000"&instruction(7 downto 4),"000000000000"&instruction(11 downto 8), RdSrc, A);
	RegWrMux: multiplexer port map(G, "00000000"&instruction(7 downto 0), WrtSrc, B); 
	
	RegisterFile: register_file port map(A(2 downto 0), B(2 downto 0),instruction(10 downto 8), B, RegWrite, C, D);
	
	ArithLU: alu port map(C, D, AlUop2, ALUop1, ALUop0, E, ALU_status);
	
	DM:Data_Mem port map(instruction(7 downto 0), C, Mem_Write, Mem_Read, F);
	
	DataMux: multiplexer port map(F, E, MemToReg, G);
	
end structural;
