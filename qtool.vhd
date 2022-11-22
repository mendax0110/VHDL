--------------------------------------------------------
---------------------Q-TOOL IN VHDL---------------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--define the package--
package q_tool is

    --calculate the width(amount of bits) needed to store x--
    function f_log2(x: positive) return natural;

end package q_tool;

--architecure definitions--
architecture q_tool_arch of q_tool is

    --f_log2 calculates the width(amount of bits) needed to store x--    
    function f_log2(x: positive) return natural is
        variable i: natural := 0;
        begin
            i := 0;
            while(2**i < x) and i < 127 loop
                i := i + 1;
            end loop;
    end function f_log2;

end architecture q_tool_arch;
