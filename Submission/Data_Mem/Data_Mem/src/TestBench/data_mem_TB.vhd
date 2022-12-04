library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity data_mem_tb is
end data_mem_tb;

architecture TB_ARCHITECTURE of data_mem_tb is
	-- Component declaration of the tested unit
	component data_mem
	port(
		Address : in STD_LOGIC_VECTOR(7 downto 0);
		WriteData : in STD_LOGIC_VECTOR(15 downto 0);
		MemWrite : in STD_LOGIC;
		MemRead : in STD_LOGIC;
		ReadData : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Address : STD_LOGIC_VECTOR(7 downto 0);
	signal WriteData : STD_LOGIC_VECTOR(15 downto 0);
	signal MemWrite : STD_LOGIC;
	signal MemRead : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ReadData : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : data_mem
		port map (
			Address => Address,
			WriteData => WriteData,
			MemWrite => MemWrite,
			MemRead => MemRead,
			ReadData => ReadData
		);

	-- Add your stimulus here ...
	
	process 
	begin				
		
		
		for i in 0 to 255 loop
			
		MemRead <= '0';
		MemWrite <= '1';
		Address <= STD_LOGIC_VECTOR(to_signed(i, 8));
		WriteData <= STD_LOGIC_VECTOR(to_signed(i, 16));
		wait for 30ns;
		  
		MemWrite <= '0';
		MemRead <= '1';	
		
		wait for 10 ns;
		Address <= STD_LOGIC_VECTOR(to_signed(i, 8));
		wait for 40ns;
		end loop;
		
		wait for 300ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_data_mem of data_mem_tb is
	for TB_ARCHITECTURE
		for UUT : data_mem
			use entity work.data_mem(structural);
		end for;
	end for;
end TESTBENCH_FOR_data_mem;

