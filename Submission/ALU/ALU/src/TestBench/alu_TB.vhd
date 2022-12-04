library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

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
	
	title <= "2+2            ";
	a <= STD_LOGIC_VECTOR(to_signed(-2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-3, 16)); 
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
	
	title <= "2+(-2)         ";	
	a <= STD_LOGIC_VECTOR(to_signed(2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-2, 16));
	wait for 400 ns; 
		
	title <= "(-2)+(-2)      ";
	a <= STD_LOGIC_VECTOR(to_signed(-2, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-2, 16));
	wait for 400 ns;
	
	title <= "(10)+(-1354)   ";
	a <= STD_LOGIC_VECTOR(to_signed(10, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-1354, 16));
	wait for 400 ns;
	
	title <= "(-10)+(-1354)  ";
	a <= STD_LOGIC_VECTOR(to_signed(-10, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-1354, 16));
	wait for 400 ns;
	
	title <= "(-10)+(1354)   ";
	a <= STD_LOGIC_VECTOR(to_signed(-10, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(1354, 16));
	wait for 400 ns;   
	
	title <= "1000+2000      ";
	a <= STD_LOGIC_VECTOR(to_signed(1000, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(2000, 16));
	wait for 400 ns;
	
	--SUBTRACTING--
	S2 <= '1'; S1 <= '0'; S0 <= '0';
	
	title <= "(-10)-(1354)   ";
	a <= STD_LOGIC_VECTOR(to_signed(-10, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(1354, 16));
	wait for 400 ns;
	
	title <= "(-10)-(-41)    ";
	a <= STD_LOGIC_VECTOR(to_signed(-10, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-41, 16));
	wait for 300 ns;
	
	title <= "(314)-(76)     ";
	a <= STD_LOGIC_VECTOR(to_signed(314, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(76, 16));
	wait for 400 ns;
	
	title <= "(314)-(2376)   ";
	a <= STD_LOGIC_VECTOR(to_signed(314, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(2376, 16));
	wait for 400 ns; 
	
	title <= "(-314)-(2376)  ";
	a <= STD_LOGIC_VECTOR(to_signed(-314, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(2376, 16));
	wait for 400 ns;
	
	--Multiplication--
	S2 <= '0'; S1 <= '0'; S0 <= '1';
	
	title <= "(128)*(128)    ";
	a <= STD_LOGIC_VECTOR(to_signed(128, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(128, 16));
	wait for 1000 ns;
	
	title <= "(123)*(2)      ";
	a <= STD_LOGIC_VECTOR(to_signed(123, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(2, 16));
	wait for 1000 ns;
	
	title <= "(-56)*(78)     ";
	a <= STD_LOGIC_VECTOR(to_signed(-56, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(78, 16));
	wait for 1000 ns; 
	
	title <= "(-56)*(0)      ";
	a <= STD_LOGIC_VECTOR(to_signed(-56, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(0, 16));
	wait for 1000 ns; 
	
	title <= "(-34)*(-768)   ";
	a <= STD_LOGIC_VECTOR(to_signed( 34, 16));  
	b <= STD_LOGIC_VECTOR(to_signed( 768, 16));
	wait for 1000 ns;  
	
	--A passthrough
	S2 <= '0'; S1 <= '1'; S0 <= '0';
	
	title <= "Apass 341      ";
	a <= STD_LOGIC_VECTOR(to_signed(341, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(325, 16));
	wait for 400 ns; 
	
	title <= "Apass -357     ";
	a <= STD_LOGIC_VECTOR(to_signed(-357, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(325, 16));
	wait for 400 ns;
	
	--B passthrough--
	S2 <= '0'; S1 <= '1'; S0 <= '1';
	
	title <= "Bpass 75       ";
	a <= '1' & STD_LOGIC_VECTOR(to_signed( 357, 15));  
	b <= STD_LOGIC_VECTOR(to_signed(75, 16));
	wait for 400 ns; 
	
	title <= "Bpass -93      ";
	a <= '1' & STD_LOGIC_VECTOR(to_signed( 357, 15));  
	b <= '1' & STD_LOGIC_VECTOR(to_signed( 93, 15));
	wait for 400 ns;
	
	--test undefined--
	S2 <= '1'; S1 <= '1'; S0 <= '1';
	
	title <= "undefined      ";
	a <= STD_LOGIC_VECTOR(to_signed(-357, 16));  
	b <= STD_LOGIC_VECTOR(to_signed(-93, 16));
	wait for 400 ns;
	
	a <= (others => 'U'); 
	b <= (others => 'U');
	wait for 10 sec;
	
	
	
	
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(structural);
		end for;
	end for;
end TESTBENCH_FOR_alu;

