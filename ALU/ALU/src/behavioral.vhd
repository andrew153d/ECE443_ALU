library IEEE;
Use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity alu is
port (a,b :in STD_LOGIC_VECTOR(15 downto 0);
		S2, S1, S0: in STD_LOGIC;
		result :out STD_LOGIC_VECTOR(15 downto 0);
		status: out STD_LOGIC_VECTOR(2 downto 0));	

end alu;


architecture behavioral of alu is  
signal mode: STD_LOGIC_VECTOR(2 downto 0) := "000";
signal temp: STD_LOGIC_VECTOR(31 downto 0);
begin 
	
	process(all)
	begin
 	mode <= S2&S1&S0;
	status <= "000"; 
	case mode is
		when "000" => --addition
			result <= std_logic_vector(signed(a)+signed(b));
		when "001" => --multiplication
			temp <= std_logic_vector(signed(a)*signed(b)); 
			result <= temp(15 downto 0);
			if(to_integer(signed(temp)) > 32767) then
				status(2) <= '1';
			end if;	
			if(to_integer(signed(temp)) < -32768) then
				status(2) <= '1';
			end if;
		when "010" =>  --pass A	 
			result <= a;
		when "011" =>  --pass B	 
			result <= b;
		when "100" =>  -- subtraction
			result <= std_logic_vector(signed(a)-signed(b));
		when others =>  --undef
			result <= "UUUUUUUUUUUUUUUU";
	end case;
		
	if(result = "0000000000000000") then 	 --check zero
		status(1) <= '1';
	else
		status(1) <= '0';
	end if;
	
	if(to_integer(signed(result))<0) then 	 --check negative
		status(0) <= '1';
	else
		status(0) <= '0';
	end if;
	
	
	
	end process;
	
	
end behavioral;
