-------------------------------------------------------
--------------BIT MULTIPLIER IN VHDL-------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity multi_bit is
    port(   --Inputs--
            x_in, y_in, p_in, c_in      : in std_logic;
            --Outputs--
            x_out, y_out, p_out, c_out  : out std_logic);
end entity multi_bit;

--architecture definitions--
architecture multi_bit_arch of mulit_bit is

    --signal definitions--
    signal xy : std_logic;

    begin
        xy <= x_in and y_in;
        c_out <= (p_in and xy) or (p_in and c_in) or (xy and c_in);
        p_out <= p_in xor xy xor c_in;
        --wire inputs bits right to output bits for chaining--
        x_out <= x_in;
        y_out <= y_in;
    
end architecture multi_bit_arch;