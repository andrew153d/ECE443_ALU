library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	-- Add your library and packages declaration here ...

entity multiplier_tb is
end multiplier_tb;

architecture TB_ARCHITECTURE of multiplier_tb is
	-- Component declaration of the tested unit
	component multiplier
	port(
		a : in STD_LOGIC_VECTOR(15 downto 0);
		b : in STD_LOGIC_VECTOR(15 downto 0);
		cin : in STD_LOGIC;
		sum : out STD_LOGIC_VECTOR(15 downto 0);
		overflow : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sum : STD_LOGIC_VECTOR(15 downto 0);
	signal overflow : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : multiplier
		port map (
			a => a,
			b => b,
			cin => cin,
			sum => sum,
			overflow => overflow
		);

process 
begin  
	
	a <= std_logic_vector(to_signed(-10, 16));
	b <= std_logic_vector(to_signed(5, 16));
	cin <= '0';
	wait for 1000 ns;  
	
	a <= std_logic_vector(to_signed(1000, 16));
	b <= std_logic_vector(to_signed(2000, 16));
	cin <= '0';
	wait for 700 ns;  
	
	a <= std_logic_vector(to_signed(-8, 16));
	b <= std_logic_vector(to_signed(-8, 16));
	cin <= '0';
	wait for 700 ns; 
	
	a <= std_logic_vector(to_signed(128, 16));
	b <= std_logic_vector(to_signed(128, 16));
	cin <= '0';
	wait for 700 ns;  
	
	a <= std_logic_vector(to_signed(314, 16));
	b <= std_logic_vector(to_signed(0, 16));
	cin <= '0';
	wait for 700 ns;
	
	
	a <= (others => 'U');
	b <= (others => 'U');
	cin <= 'U';
	wait for 1 sec;
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplier of multiplier_tb is
	for TB_ARCHITECTURE
		for UUT : multiplier
			use entity work.multiplier(structural);
		end for;
	end for;
end TESTBENCH_FOR_multiplier;

