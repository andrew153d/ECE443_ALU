						  											  				   library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity multiplexer is
port (in1, in2: in STD_LOGIC_VECTOR(15 downto 0);
	outputSelect: in STD_LOGIC;
	Output:out STD_LOGIC_VECTOR(15 downto 0));
end multiplexer;


architecture structural of multiplexer is		
	  signal selectArray: STD_LOGIC_VECTOR(15 downto 0);
begin
	  selectArray <= (others => outputSelect);
	  Output <= (in2 and selectArray) or (in1 and (not selectArray));
	  
end structural;