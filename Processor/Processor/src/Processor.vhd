library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
library Data_Mem;
use Data_Mem.all; 
library multiplexer;
use multiplexer.all;


entity processor is
port (  instr_addr :in STD_LOGIC_VECTOR(7 downto 0);
		instr	   :in STD_LOGIC_VECTOR(15 downto 0);
		load_instr: in STD_LOGIC;
		ReadReg1, ReadReg2: out STD_LOGIC_VECTOR(25 downto 0));
end processor;


architecture structural of processor is 

component alu is
	port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
			S2, S1, S0: in STD_LOGIC;
			result :out STD_LOGIC_VECTOR(15 downto 0);
			status: out STD_LOGIC_VECTOR(2 downto 0));
end component;

component register_file is
	port (Reg1, Reg2, WrReg :in STD_LOGIC_VECTOR(2 downto 0);
		  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
		  RegWrite: in STD_LOGIC;
		  ReadData1, ReadData2 :out STD_LOGIC_VECTOR(15 downto 0));	
end component; 

component Data_Mem is
port (Address :in STD_LOGIC_VECTOR(7 downto 0);
	  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
	  MemWrite, MemRead: in STD_LOGIC;
	  ReadData:out STD_LOGIC_VECTOR(15 downto 0));
end component;

component multiplexer is
port (in1, in2: in STD_LOGIC_VECTOR(15 downto 0);
	outputSelect: in STD_LOGIC;
	Output:out STD_LOGIC_VECTOR(15 downto 0));
end component;


signal instruction, A, C, D, E, F, G: STD_LOGIC_VECTOR(15 downto 0); 
signal RdSrc: STD_LOGIC;
signal testAddr: STD_LOGIC_VECTOR(7 downto 0);

begin
			  
	IM: Data_Mem port map (instr_addr, instr,load_instr , '1', instruction);
	Addr1Mux: multiplexer port map ("000000000000"&instruction(7 downto 4),"000000000000"&instruction(11 downto 8),RdSrc, C);
	
	
end structural;
