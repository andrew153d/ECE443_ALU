				   library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity register_file is
port (Reg1, Reg2, WrReg :in STD_LOGIC_VECTOR(2 downto 0);
	  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
	  RegWrite: in STD_LOGIC;
	  ReadData1, ReadData2 :out STD_LOGIC_VECTOR(15 downto 0));	

end register_file;


architecture structural of register_file is		

type regArray is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal Registers: regArray;	  

begin
	process(all)
	begin
	if(RegWrite = '1') then
		Registers(to_integer(unsigned(WrReg))) <= WriteData after 100ns;
	end if;	 
	end process;
	
	ReadData1 <= Registers(to_integer(unsigned(Reg1))) after 100ns;	   
	ReadData2 <= Registers(to_integer(unsigned(Reg2))) after 100ns;
	
	
end structural;
