package mux_type is
    subtype eightval is integer range 0 to 7; -- line 1
end mux_type;

use work.mux_type.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux8 is
    port(I0, I1, I2, I3, I4, I5, I6, I7 : in std_logic;
                                    sel : in eightval; --line 2
                                    q   : out std_logic);
end mux8;

architecture mux8 of mux8 is
    begin
        with sel select     -- line 3
            Q <= I0 after 10 ns when 0,  --line 4
                 I1 after 10 ns when 1,  --line 5
                 I2 after 10 ns when 2,  --line 6
                 I3 after 10 ns when 3,  --line 7
                 I4 after 10 ns when 4,  --line 8
                 I5 after 10 ns when 5,  --line 9
                 I6 after 10 ns when 6,  --line 10
                 I7 after 10 ns when 7,  --line 11
end mux8;
