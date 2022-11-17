library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		a : in STD_LOGIC_VECTOR(15 downto 0);
		b : in STD_LOGIC_VECTOR(15 downto 0);
		S2 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		S0 : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(15 downto 0);
		status : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(15 downto 0);
	signal b : STD_LOGIC_VECTOR(15 downto 0);
	signal S2 : STD_LOGIC;
	signal S1 : STD_LOGIC;
	signal S0 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal result : STD_LOGIC_VECTOR(15 downto 0);
	signal status : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ...
	signal title : string(1 to 15);
begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			a => a,
			b => b,
			S2 => S2,
			S1 => S1,
			S0 => S0,
			result => result,
			status => status
		);

	-- Add your stimulus here ...
	
process 
begin
	--ADDING--
	S2 <= '0'; S1 <= '0'; S0 <= '0';
	
	title <= "2,2            ";
	a <= STD_LOGIC_VECTOR(to_signed(2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(2, 16)); 
	S2 <= '0'; S1 <= '0'; S0 <= '0'; --Add
	wait for 400 ns; 	 
	S2 <= '1'; S1 <= '0'; S0 <= '0'; --Subtract
	wait for 400 ns; 
	S2 <= '0'; S1 <= '0'; S0 <= '1'; --multiply
	wait for 1000 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '0'; --Apass
	wait for 400 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '1'; --Bpass
	wait for 400 ns; 
	S2 <= '1'; S1 <= '0'; S0 <= '1'; --unDef
	wait for 400 ns;
	
	title <= "2,-2           ";
	a <= STD_LOGIC_VECTOR(to_signed(2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-2, 16)); 
	S2 <= '0'; S1 <= '0'; S0 <= '0'; --Add
	wait for 400 ns; 	 
	S2 <= '1'; S1 <= '0'; S0 <= '0'; --Subtract
	wait for 400 ns; 
	S2 <= '0'; S1 <= '0'; S0 <= '1'; --multiply
	wait for 1000 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '0'; --Apass
	wait for 400 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '1'; --Bpass
	wait for 400 ns; 
	S2 <= '1'; S1 <= '0'; S0 <= '1'; --unDef
	wait for 400 ns;
	
	
	title <= "-2,-2          ";
	a <= STD_LOGIC_VECTOR(to_signed(-2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-2, 16)); 
	S2 <= '0'; S1 <= '0'; S0 <= '0'; --Add
	wait for 400 ns; 	 
	S2 <= '1'; S1 <= '0'; S0 <= '0'; --Subtract
	wait for 400 ns; 
	S2 <= '0'; S1 <= '0'; S0 <= '1'; --multiply
	wait for 1000 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '0'; --Apass
	wait for 400 ns; 
	S2 <= '0'; S1 <= '1'; S0 <= '1'; --Bpass
	wait for 400 ns; 
	S2 <= '1'; S1 <= '0'; S0 <= '1'; --unDef
	wait for 400 ns;
	
	
	
	
	
	
	a <= (others => 'U'); 
	b <= (others => 'U');
	wait for 10 sec;
	
	
	
	
	
end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_alu;

