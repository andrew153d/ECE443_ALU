library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

	-- Add your library and packages declaration here ...

entity subtractor_tb is
end subtractor_tb;

architecture TB_ARCHITECTURE of subtractor_tb is
	-- Component declaration of the tested unit
	component subtractor
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
	UUT : subtractor
		port map (
			a => a,
			b => b,
			cin => cin,
			sum => sum,
			cout => cout
		);

process
begin
	
	
	a <= std_logic_vector(to_signed(-2, 16)); 
	b <= std_logic_vector(to_signed(2, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(1000, 16)); 
	b <= std_logic_vector(to_signed(2000, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(10984, 16)); 
	b <= std_logic_vector(to_signed(324, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(3156, 16)); 
	b <= std_logic_vector(to_signed(214, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(3198, 16)); 
	b <= std_logic_vector(to_signed(3198, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(2334, 16)); 
	b <= std_logic_vector(to_signed(22, 16));
	cin <= '0';
	wait for 350ns;	
	
	a <= std_logic_vector(to_signed(23, 16)); 
	b <= std_logic_vector(to_signed(28, 16));
	cin <= '0';
	wait for 350ns;
	
	
	a <= (others=>'U'); 
	b <= (others=>'U');
	cin <= '0';
	wait for 200 sec;
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_subtractor of subtractor_tb is
	for TB_ARCHITECTURE
		for UUT : subtractor
			use entity work.subtractor(structural);
		end for;
	end for;
end TESTBENCH_FOR_subtractor;

