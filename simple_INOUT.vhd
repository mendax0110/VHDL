--------------------------------------------------------------------------------
-------------------------SIMPLE IN AND OUT IN VHDL------------------------------
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity simple_in_and_out is
    port(   --Inputs--
            in_1    : in std_logic;
            in_2    : in std_logic;
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic;
            out_2   : out std_logic);
end entity simple_in_and_out;

--architecture definitions--
architecture simple_in_and_out_arch of simple_in_and_out is

    begin
        ---------------Design Implementation-----------------
        out_1 <= in_1   AND   in_2  AND in_3;
        out_2 <= in_1   OR    in_2  OR  in_3;
        
end architecture simple_in_and_out_arch;
