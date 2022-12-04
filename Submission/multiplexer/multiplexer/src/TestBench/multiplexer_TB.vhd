library ieee;
use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
	-- Add your library and packages declaration here ...

entity multiplexer_tb is
end multiplexer_tb;

architecture TB_ARCHITECTURE of multiplexer_tb is
	-- Component declaration of the tested unit
	component multiplexer
	port(
		s2 : in STD_LOGIC;
		s1 : in STD_LOGIC;
		s0 : in STD_LOGIC;
		in1 : in STD_LOGIC_VECTOR(15 downto 0);
		in2 : in STD_LOGIC_VECTOR(15 downto 0);
		in3 : in STD_LOGIC_VECTOR(15 downto 0);
		in4 : in STD_LOGIC_VECTOR(15 downto 0);
		in5 : in STD_LOGIC_VECTOR(15 downto 0);
		in6 : in STD_LOGIC_VECTOR(15 downto 0);
		in7 : in STD_LOGIC_VECTOR(15 downto 0);
		in8 : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal s2 : STD_LOGIC;
	signal s1 : STD_LOGIC;
	signal s0 : STD_LOGIC;
	signal in1 : STD_LOGIC_VECTOR(15 downto 0);
	signal in2 : STD_LOGIC_VECTOR(15 downto 0);
	signal in3 : STD_LOGIC_VECTOR(15 downto 0);
	signal in4 : STD_LOGIC_VECTOR(15 downto 0);
	signal in5 : STD_LOGIC_VECTOR(15 downto 0);
	signal in6 : STD_LOGIC_VECTOR(15 downto 0);
	signal in7 : STD_LOGIC_VECTOR(15 downto 0);
	signal in8 : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...
	signal counter : STD_LOGIC_VECTOR(2 downto 0);
begin

	-- Unit Under Test port map
	UUT : multiplexer
		port map (
			s2 => s2,
			s1 => s1,
			s0 => s0,
			in1 => in1,
			in2 => in2,
			in3 => in3,
			in4 => in4,
			in5 => in5,
			in6 => in6,
			in7 => in7,
			in8 => in8,
			output => output
		);

process 
begin
	


	in1 <= STD_LOGIC_VECTOR(to_unsigned(4369, 16));
	in2 <= STD_LOGIC_VECTOR(to_unsigned(8738, 16));
	in3 <= STD_LOGIC_VECTOR(to_unsigned(13107, 16));
	in4 <= STD_LOGIC_VECTOR(to_unsigned(17476, 16));
	in5 <= STD_LOGIC_VECTOR(to_unsigned(21845, 16));
	in6 <= STD_LOGIC_VECTOR(to_unsigned(26214, 16));
	in7 <= STD_LOGIC_VECTOR(to_unsigned(30583, 16));
	in8 <= STD_LOGIC_VECTOR(to_unsigned(34952, 16));
	
	counter_loop: for i in 0 to 7 loop
		counter <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
	    S0 <= counter(0); 
		S1 <= counter(1);
		S2 <= counter(2);
		wait for 10ns;
	end loop counter_loop;
	
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplexer of multiplexer_tb is
	for TB_ARCHITECTURE
		for UUT : multiplexer
			use entity work.multiplexer(structural);
		end for;
	end for;
end TESTBENCH_FOR_multiplexer;

