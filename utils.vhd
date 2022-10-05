----------------------------------------------------------------------
-----------------------------UTILS IN VHDL----------------------------
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--package declaration--
package utils is

    --type declaration--
    type array_Nbit is array (natural range <>, natural range <>) of std_logic;
    --function declaration--
    function to std_logic(L : BOOLEAN) return std_ulogic;

end package utils;

--package body declaration--
package body utils is

    --function body declaration--
    function to_std_logic(L : BOOLEAN) return std_ulogic is
        begin
            if L then
                return '1';
            else
                return '0';
            end if;
    end function to_std_logic;

end package body utils;
