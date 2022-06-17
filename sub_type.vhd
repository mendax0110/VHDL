-----------------------------------------------------------
-----------------------SUB-TYPE IN VHDL--------------------
-----------------------------------------------------------
package mux_type is
    subtype eightval is integer range 0 to 7; -- 8-bit value
end package mux_type;

--include the libraries--
library IEEE;
use IEE.std_logic_1164.all;
use work.mux_type.all;

--entity declarations--
entity mux8 is
    port(   --Inputs--
            I0, I1, I2, I3, I4, I5, I6, I7  : in std_logic;
            sel                             : in eightval; --selector
            --Outputs--
            q                               : out std_logic);
end entity mux8;

--architecure definitions--
architecture mux8_arch of mux8 is

    begin
        with sel select 
            Q <=    I0 after 10 ns when 0,  --selector = 0
                    I1 after 10 ns when 1,  --selector = 1 
                    I2 after 10 ns when 2,  --selector = 2
                    I3 after 10 ns when 3,  --selector = 3
                    I4 after 10 ns when 4,  --selector = 4
                    I5 after 10 ns when 5,  --selector = 5
                    I6 after 10 ns when 6,  --selector = 6
                    I7 after 10 ns when 7;  --selector = 7

end architecture mux8_arch;