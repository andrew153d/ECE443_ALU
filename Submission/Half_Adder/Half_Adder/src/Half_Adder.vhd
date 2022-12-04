library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    port ( a,b : in std_logic;
           sum,Cout: out std_logic
           );
end half_adder;

architecture adder_arch of half_adder is
  begin
     sum <= a xor b after 10ns; -- evaluate sum operation
     Cout <= a and b after 10ns; --evaluate cout operation
end adder_arch;