-------------------------------------
-------------ringcounter-------------
-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity ringcounter is
    port(   --Inputs--
            CLK     : in std_logic;
            RESET   : in std_logic;
            --Outputs--
            Q       : inout std_logic_vector(3 downto 0));
end entity ringcounter;

--architecture declaration--
architecture ringcounter_arch of ringcounter is

    begin
        process(CLK, RESET)
        begin
            if (RESET = '1') then
                Q <= "0001";
            elsif (CLK'event and CLK = '1') then
                Q(3) <= Q(2);
                Q(2) <= Q(1);
                Q(1) <= Q(0);
                Q(0) <= Q(3);
            end if;
        end process;

end architecture ringcounter_arch;

