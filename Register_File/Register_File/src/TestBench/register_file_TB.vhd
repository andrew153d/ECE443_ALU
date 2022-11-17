library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity register_file_tb is
end register_file_tb;

architecture TB_ARCHITECTURE of register_file_tb is
	-- Component declaration of the tested unit
	component register_file
	port(
		Reg1 : in STD_LOGIC_VECTOR(2 downto 0);
		Reg2 : in STD_LOGIC_VECTOR(2 downto 0);
		WrReg : in STD_LOGIC_VECTOR(2 downto 0);
		WriteData : in STD_LOGIC_VECTOR(15 downto 0);
		RegWrite : in STD_LOGIC;
		ReadData1 : out STD_LOGIC_VECTOR(15 downto 0);
		ReadData2 : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Reg1 : STD_LOGIC_VECTOR(2 downto 0);
	signal Reg2 : STD_LOGIC_VECTOR(2 downto 0);
	signal WrReg : STD_LOGIC_VECTOR(2 downto 0);
	signal WriteData : STD_LOGIC_VECTOR(15 downto 0);
	signal RegWrite : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ReadData1 : STD_LOGIC_VECTOR(15 downto 0);
	signal ReadData2 : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : register_file
		port map (
			Reg1 => Reg1,
			Reg2 => Reg2,
			WrReg => WrReg,
			WriteData => WriteData,
			RegWrite => RegWrite,
			ReadData1 => ReadData1,
			ReadData2 => ReadData2
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_register_file of register_file_tb is
	for TB_ARCHITECTURE
		for UUT : register_file
			use entity work.register_file(structural);
		end for;
	end for;
end TESTBENCH_FOR_register_file;

