--------------------------------------------------------
-------------STANDARD MULTIPLEXER 2 IN VHDL-------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity standard_mux_2 is
    port(   --Inputs--
            in_1    : in std_logic_vector(3 downto 0);
            in_2    : in std_logic_vector(3 downto 0);
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic_vector(3 downto 0));
end entity standard_mux_2;

--architecture definitions--
architecture standard_mux_2_arch of standard_mux_2 is

    begin
        -----------Design Implementation-----------
        out_1 <= in_1 when (in_3 = '0') else in_2;

end architecture standard_mux_2_arch;