library half_adder;		
use half_adder.all;
library IEEE;
Use IEEE. STD_LOGIC_1164.all;

entity full_adder is
port (a,b,cin :in STD_LOGIC;
      sum,carry : out STD_LOGIC);
end full_adder;

architecture structural of full_adder is

component half_adder is
port ( a,b : in std_logic;
           sum,Cout: out std_logic
           );
end component;

signal s1,c1,c2 : STD_LOGIC;
begin
w1: half_adder port map (a,b,s1,c1); --first half adder block
w2: half_adder port map (s1,cin,sum,c2); -- second half adder block
carry <= c1 or c2 after 10ns;			 --perform carry operation
end structural;
