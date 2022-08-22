---------------------------------------------------
----------------d latch vhdl-----------------------
---------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity dlatch is
    port(   --Inputs--
            d       : in std_logic;
            en      : in std_logic;
            --Outputs--
            q1, q2  : out std_logic);
end entity dlatch;

--architecure definitions--
architecture dlatch_arch of dlatch is

    --signal definitions--
    signal d_next : std_logic := '0';

    begin
        --1st way with / select method--
        when en select
        d_next <=
            d when '1',
            d_next when others;

        --assign the output--
        q1 <= d_next;

        --2nd way: if method--
        process(en, d) is
        begin
            if en = '1' then
                q2 <= d;
            end if;
        end process;

end architecture dlatch_arch;
