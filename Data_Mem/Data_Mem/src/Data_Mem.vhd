							   				   library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Data_Mem is
port (Address :in STD_LOGIC_VECTOR(2 downto 0);
	  WriteData: in STD_LOGIC_VECTOR(15 downto 0);
	  MemWrite, MemRead: in STD_LOGIC;
	  ReadData:out STD_LOGIC_VECTOR(15 downto 0));	

end Data_Mem;


architecture structural of Data_Mem is
type regArray is array (255 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal Registers: regArray;
begin
	process(all)
	begin
	if(MemWrite = '1') then
		Registers(to_integer(unsigned(Address))) <= WriteData after 100ns;
	end if;
	if(MemRead = '1') then
		ReadData <=  Registers(to_integer(unsigned(Address))) after 100ns;
	end if;
	end process;	
	
end structural;
