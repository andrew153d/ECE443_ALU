library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	-- Add your library and packages declaration here ...

entity adder_tb is
end adder_tb;

architecture TB_ARCHITECTURE of adder_tb is
	-- Component declaration of the tested unit
	component adder
	port(
		a : in STD_LOGIC_VECTOR(15 downto 0);
		b : in STD_LOGIC_VECTOR(15 downto 0);
		cin : in STD_LOGIC;
		sum : out STD_LOGIC_VECTOR(15 downto 0);
		cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sum : STD_LOGIC_VECTOR(15 downto 0);
	signal cout : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : adder
		port map (
			a => a,
			b => b,
			cin => cin,
			sum => sum,
			cout => cout
		);

process
begin
	
	a<=std_logic_vector(to_signed(-2, 16)); 
	b<=std_logic_vector(to_signed(-2, 16)); 
	cin <= '0';
	wait for 400 ns;
	
	a<=std_logic_vector(to_signed(39278, 16)); 
	b<=std_logic_vector(to_signed(10, 16)); 
	cin <= '0';
	wait for 200 ns;
	
	a<=std_logic_vector(to_signed(314, 16)); 
	b<=std_logic_vector(to_signed(10348, 16)); 
	cin <= '0';
	wait for 200 ns;
	
	a<=std_logic_vector(to_signed(65535, 16)); 
	b<=std_logic_vector(to_signed(0, 16)); 
	cin <= '0';
	wait for 400 ns;
	
	a<=(others => 'U'); 
	b<=(others => 'U'); 
	cin <= 'U';
	wait for 200 sec;
	
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder of adder_tb is
	for TB_ARCHITECTURE
		for UUT : adder
			use entity work.adder(structural);
		end for;
	end for;
end TESTBENCH_FOR_adder;

