library adder;		
use adder.all;		 
library IEEE;
Use IEEE.STD_LOGIC_1164.all;

entity subtractor is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);	

end subtractor;

architecture structural of subtractor is

component adder is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);
end component;

signal c, b2, b3, sum1: STD_LOGIC_VECTOR(15 downto 0);

begin

b2 <= not b after 10ns;						-- this simply feeds the twos complement of b into the adder by inverting b and adding one
b0: adder port map (a, b2, '1', sum, cout); 

end structural;
