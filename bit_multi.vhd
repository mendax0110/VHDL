-------------------------------------------------------------------------
--------------------SIMPLE BIT MULTIPLIER IN VHDL------------------------
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity bit_multi is
    port(   --Inputs--
            x_in    : in std_logic;
            y_in    : in std_logic;
            p_in    : in std_logic;
            c_in    : in std_logic;
            --Outputs--
            x_out   : out std_logic;
            y_out   : out std_logic;
            p_out   : out std_logic;
            c_out   : out std_logic);
end entity bit_multi;

--architecure definitions--
architecture bit_multi_arch of bit_multi is

    --signal definitions--
    signal xy : std_logic;

    begin
        xy <= x_in and y_in;
        c_out <= (p_in and xy) or (p_in and c_in) or (xy and c_in);
        p_out <= p_in xor xy xor c_in;
        --Wire inputs bits right to output bits for chaining--
        x_out <= x_in;
        y_out <= y_in;
    
end architecture bit_multi_arch;