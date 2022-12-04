library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity processor_tb is
end processor_tb;

architecture TB_ARCHITECTURE of processor_tb is
	-- Component declaration of the tested unit
	component processor
	port(
		instr_addr : in STD_LOGIC_VECTOR(7 downto 0);
		instr : in STD_LOGIC_VECTOR(15 downto 0);
		load_instr : in STD_LOGIC;
		Debug1 : out STD_LOGIC_VECTOR(15 downto 0);
		Debug2 : out STD_LOGIC_VECTOR(15 downto 0);
		Debug3 : out STD_LOGIC_VECTOR(15 downto 0);
		Debug4 : out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal instr_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal instr : STD_LOGIC_VECTOR(15 downto 0);
	signal load_instr : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Debug1 : STD_LOGIC_VECTOR(15 downto 0);
	signal Debug2 : STD_LOGIC_VECTOR(15 downto 0);
	signal Debug3 : STD_LOGIC_VECTOR(15 downto 0);
	signal Debug4 : STD_LOGIC_VECTOR(15 downto 0);
	signal clk_enable: STD_LOGIC := '0';   
	signal CLK: STD_LOGIC := '0';
	-- Add your code here ...
begin

	-- Unit Under Test port map
	UUT : processor
		port map (
			instr_addr => instr_addr,
			instr => instr,
			load_instr => load_instr,
			Debug1 => Debug1,
			Debug2 => Debug2,
			Debug3 => Debug3,
			Debug4 => Debug4
		);

	-- Add your stimulus here ...
	
	process
	begin
		while(clk_enable) loop
			CLK <='0'; wait for 100 ns;
			CLK <='1'; wait for 100 ns;
		end loop;
		wait;
	end process;
	
   	process
	   begin
		--load instruction 0
		instr_addr <= STD_LOGIC_VECTOR(to_signed(0, 8));
		instr <= x"500A"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 1
		instr_addr <= STD_LOGIC_VECTOR(to_signed(1, 8));
		instr <= x"5105"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 2
		instr_addr <= STD_LOGIC_VECTOR(to_signed(2, 8));
		instr <= x"5200"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 3
		instr_addr <= STD_LOGIC_VECTOR(to_signed(3, 8));
		instr <= x"5300"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 4
		instr_addr <= STD_LOGIC_VECTOR(to_signed(4, 8));
		instr <= x"5400"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	 
		
		--load instruction 5
		instr_addr <= STD_LOGIC_VECTOR(to_signed(5, 8));
		instr <= x"5500"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	
		
		--load instruction 6
		instr_addr <= STD_LOGIC_VECTOR(to_signed(6, 8));
		instr <= x"5600"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	  
		
		--load instruction 7
		instr_addr <= STD_LOGIC_VECTOR(to_signed(7, 8));
		instr <= x"5700"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	   
		
		--load instruction 8
		instr_addr <= STD_LOGIC_VECTOR(to_signed(8, 8));
		instr <= x"0201"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 9
		instr_addr <= STD_LOGIC_VECTOR(to_signed(9, 8));
		instr <= x"1301"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	
		
		--load instruction 10
		instr_addr <= STD_LOGIC_VECTOR(to_signed(10, 8));
		instr <= x"4401"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 11
		instr_addr <= STD_LOGIC_VECTOR(to_signed(11, 8));
		instr <= x"630B"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 12
		instr_addr <= STD_LOGIC_VECTOR(to_signed(12, 8));
		instr <= x"640A"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;	
		
		--load instruction 13
		instr_addr <= STD_LOGIC_VECTOR(to_signed(13, 8));
		instr <= x"760A"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--load instruction 14
		instr_addr <= STD_LOGIC_VECTOR(to_signed(14, 8));
		instr <= x"770B"; 
		load_instr <= '1';
		wait for 100 ns;  
		load_instr <='0';
		wait for 100ns;
		
		--LOADING INSTRUCTION DONE
		
		for i in 0 to 14 loop
			instr_addr <= STD_LOGIC_VECTOR(to_signed(i, 8));
			wait for 2000 ns;
		end loop;
		
		instr_addr <= "00000000";
		
		wait for 1 sec;
		
		
		
		
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_processor of processor_tb is
	for TB_ARCHITECTURE
		for UUT : processor
			use entity work.processor(structural);
		end for;
	end for;
end TESTBENCH_FOR_processor;

