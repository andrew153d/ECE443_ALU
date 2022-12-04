library full_adder;		
use full_adder.all;		 
library IEEE;
Use IEEE.STD_LOGIC_1164.all;

entity adder is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);	

end adder;

architecture structural of adder is

component full_adder is
port (a,b,cin :in STD_LOGIC;
      sum,carry : out STD_LOGIC);
end component;

--signal s1,c1,c2 : STD_LOGIC;

signal c: STD_LOGIC_VECTOR(15 downto 0);

begin

b0: full_adder port map (a(0),b(0), cin, sum(0), c(0));  --feed cin to the first adder

gen_adder: for i in 1 to 15 generate   
	
b1: full_adder port map (a(i),b(i), c(i-1), sum(i), c(i)); 	  --chain the rest fo the adders, carry comes from the carry out of the previous adder

end generate gen_adder;

cout <= c(15);





--carry <= c1 or c2 after 10ns;
end structural;
