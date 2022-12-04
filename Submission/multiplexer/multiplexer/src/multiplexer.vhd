library adder;		
use adder.all;		 
library IEEE;
Use IEEE.STD_LOGIC_1164.all;

entity multiplexer is
port (s2,s1,s0 :in STD_LOGIC;
in1, in2, in3, in4, in5, in6, in7, in8 :in STD_LOGIC_VECTOR(15 downto 0);
output :out STD_LOGIC_VECTOR(15 downto 0));

end multiplexer;

architecture structural of multiplexer is

type matrix is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal c_twoD : matrix;
signal c :STD_LOGIC_VECTOR(7 downto 0);
begin	  
	--first make an array of bits, only one of these will be equal to one for every input of the select lines 
   c(0) <= (not s0) and (not s1) and (not s2) ;
   c(1) <= (    s0) and (not s1) and (not s2) ;
   c(2) <= (not s0) and (    s1) and (not s2) ;
   c(3) <= (    s0) and (    s1) and (not s2) ;
   c(4) <= (not s0) and (not s1) and (    s2) ;
   c(5) <= (    s0) and (not s1) and (    s2) ;
   c(6) <= (not s0) and (    s1) and (    s2) ;
   c(7) <= (    s0) and (    s1) and (    s2) ;
   
   -- make an array of bits from each of the previous select bits
   gen: for i in 0 to 7 generate
		c_twoD(i) <= (others => c(i));   
   end generate gen;
   
   
   
   
   -- then and those with the inputs to produce the output. 
   output <= (c_twoD(0) and in1) or
   		     (c_twoD(1) and in2) or
   		     (c_twoD(2) and in3) or
   		     (c_twoD(3) and in4) or
   		     (c_twoD(4) and in5) or
   		     (c_twoD(5) and in6) or
   		     (c_twoD(6) and in7) or
   		     (c_twoD(7) and in8);
 
end structural;
