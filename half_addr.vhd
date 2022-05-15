----------------------------------------------------------------------------------------------
------------------SIMPLE HALF ADDER IN VHDL---------------------------------------------------
----------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declarations--
entity half_adder is
    port(   --Inputs--
            a   : in std_logic;
            b   : in std_logic;
            --Outputs--
            s1  : out std_logic;
            c1  : out std_logic);
end entity half_adder;

--architecture definitions--
architecture half_adder_arch of half_adder is

    begin

        s1  <= (a XOR b);
        c1  <= (a AND b);   --the logical operator "AND" and "XOR" is defined in VDHL--
    
end architecture half_adder_arch;