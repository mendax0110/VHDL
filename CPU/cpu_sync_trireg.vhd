----------------------------------------------
------------CPU-SYNC-TRIEG IN VHDL------------
----------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.cpu_lib.all;

--entity declaraions--
entity trireg is
    port(   --Inputs--
            a   : in bit16;
            en  : in std_logic;
            clk : in std_logic;
            --Outputs--
            q   : out bit16);
end entity trireg;

--architecture definitions--
architecture trireg_arch of trireg is

    signal val : bit16;

    begin
        triregdata : process
        begin
            wait until clk'event and clk = '1';
            val <= a;
        end process triregdata;

        trireg3st : process(en, val)
        begin
            if(en = '1') then
                q <= val after 1 ns;
            elsif(en = '0') then
                q <= "ZZZZZZZZZZZZZZZZ" after 1 ns;
            else
                q <= "XXXXXXXXXXXXXXXX" after 1 ns;
            end if;
        end process trireg3st;

end architecture trireg_arch;