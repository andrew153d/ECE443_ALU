library adder;		
use adder.all;		 
library IEEE;
Use IEEE.STD_LOGIC_1164.all;

entity multiplier is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
overflow: out STD_LOGIC);	

end multiplier;

architecture structural of multiplier is

component adder is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);
end component;

signal c, a_oneD, b3, sum1, lowerCarry, upperCarry  : STD_LOGIC_VECTOR(15 downto 0);

type matrix is array (15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal p, a_twoD, s : matrix;

type LGmatrix is array (15 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal p2, upperSum, lowerSum, LongSum: LGmatrix := (others =>(others=>'0'));

signal sign : STD_LOGIC;
begin

gen: for i in 0 to 15 generate
a_twoD(i) <= (others => a(i)); --creates an array where the rows are the bits in a. There is more information about this in the report
p(i) <= a_twoD(i) and b after 10 ns; --perform and operation between the a matrix and b
p2(i)(15+i downto i) <= p(i);			 --perform the shift operation
p2(i)(31 downto 15+i) <= (others => p(i)(15));
end generate gen;

--add the first and second lines in p2, using the cin
upper:adder port map (p2(0)(31 downto 16), p2(1)(31 downto 16), lowerCarry(0), LongSum(1)(31 downto 16), upperCarry(0));  lower: adder port map (p2(0)(15 downto 0), p2(1)(15 downto 0), cin, LongSum(1)(15 downto 0), lowerCarry(0)); 
gen2: for i in 1 to 14 generate
--continue to add the rows of p2 to the sim
upper: adder port map (LongSum(i)(31 downto 16), p2(i+1)(31 downto 16), lowerCarry(i), LongSum(i+1)(31 downto 16), upperCarry(i)); Lower: adder port map (LongSum(i)(15 downto 0), p2(i+1)(15 downto 0) , upperCarry(i-1), LongSum(i+1)(15 downto 0), lowerCarry(i));
end generate gen2;	
sum <= LongSum(15)(15 downto 0);	  
--calculate the overflow by searching any of the remaining bits for 1. 
sign <= A(15) xor B(15); --LongSum(15)(31);
overflow <= sign xor sum(15); --LongSum(15)(16) xor upperCarry(14);
		 	

end structural;
 





























