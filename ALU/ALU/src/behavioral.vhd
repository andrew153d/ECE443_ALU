							 library adder;		
use adder.all;
library subtractor;
use subtractor.all;
library multiplier;		
use multiplier.all;		
library multiplexer;		
use multiplexer.all;

library IEEE;
Use IEEE.STD_LOGIC_1164.all;

entity alu is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
		S2, S1, S0: in STD_LOGIC;
		result :out STD_LOGIC_VECTOR(15 downto 0);
		status: out STD_LOGIC_vector(2 downto 0));	

end alu;


architecture structural of alu is
begin
			  
	
	
end structural;
