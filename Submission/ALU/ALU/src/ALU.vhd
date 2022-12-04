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

component adder is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);
end component;

component subtractor is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
cout: out STD_LOGIC);	
end component;

component multiplier is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
cin :in STD_LOGIC;
sum :out STD_LOGIC_VECTOR(15 downto 0);	  
overflow: out STD_LOGIC);
end component;

component multiplexer is 
port (s2,s1,s0 :in STD_LOGIC;
in1, in2, in3, in4, in5, in6, in7, in8 :in STD_LOGIC_VECTOR(15 downto 0);
output :out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal Asign, Bsign, Ccarry, Dcarry, Ecarry ,Gcarry, Hcarry, Icarry, Jcarry, Kcarry, Lcarry, Mcarry, Jsign, Isign, Moverflow : STD_LOGIC;
signal C, D, E, Enot, F, Fnot, G, H, I, Inot, J, Jnot, K, L, M, CCout, DDout, EEout, FFout, LLout, MMout, NNout, NNsigned, output : STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"; 
signal undefined: STD_LOGIC_VECTOR(15 downto 0) := "UUUUUUUUUUUUUUUU";
signal zero: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";	
signal test: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000100";
begin
			  
	
	AA: adder port map (A, B, '0', C, Ccarry);
	BB: multiplier port map (A, B, '0', D, Dcarry);
	HH: subtractor port map (A, B,'0', E, Ecarry); 
	
	NN: multiplexer port map (S2, S1, S0, C, D, A, B, E, undefined, undefined, undefined, output); 
	
	status(0) <= output(15); 
	status(1) <= not output(0) and not output(1) and
	not output(2) and not output(3) and
	not output(4) and not output(5) and
	not output(6) and not output(7) and
	not output(8) and not output(9) and
	not output(10) and not output(11) and  
	not output(12) and not output(13) and  
	not output(14);		 
	result <= output;
	status(2) <= Dcarry;
	
end structural;
