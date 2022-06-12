-----------------------------------------------------------------------
-----------------------------UTILS IN VHDL-----------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
package utils is

    type array_Nbit is array(natural range <>, natural range <>) of std_logic;
    function to std_logic(L : BOOLEAN) return std_ulogic;

end package utils;

--package body declarations--
package body utils is

    function to_std_logic(L : BOOLEAN) return std_ulogic is
        begin
            if L then
                return('1');
            else
                return('0');
            end if;
    end function to_std_logic;

end package body utils;
    