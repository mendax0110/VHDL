-------------------------------------
--------------3bit - PISO------------
-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity PISO is
    port(   --Inputs--
            CLK     : in std_logic;
            RESET   : in std_logic;
            D       : in std_logic_vector(2 downto 0);
            --Outputs--
            Q       : out std_logic);
end entity PISO;

--architecture declaration--
architecture PISO_arch of PISO is

    begin
        process(CLK, RESET)
        begin
            if (RESET = '1') then
                Q <= '0';
            else if (CLK'event and CLK = '1') then
                Q(0) <= D(0);
                Q(1) <= D(1);
                Q(2) <= D(2);
            end if;
        end process;

end architecture PISO_arch of PISO;
