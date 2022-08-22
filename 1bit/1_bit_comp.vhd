------------------------------------------
-----------------1_bit_comp---------------
------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity onebit_comp is
    port(   --Inputs--
            a, b                    : in std_logic;
            greater, lesser, equal  : out std_logic);
end entity onebit_comp;

--architecure declaration--
architecture onebit_comp_arch of onebit_comp is

    begin
        process(a,b)
        begin
            greater <= '0';
            lesser  <= '0';
            equal   <= '0';

            if a > b then
                greater <= '1';
            else if b > a then
                lesser  <= '1';
            else
                equal   <= '1';
            end if;
        end process;
            
end architecture onebit_comp_arch;



