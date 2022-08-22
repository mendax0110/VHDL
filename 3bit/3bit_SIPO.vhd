-------------------------------------------
----------------3but_SIPO------------------
-------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--enitity declaration--
entity bit_SIPO is
    port(   --Inputs--
            Din     : in std_logic;
            CLK     : in std_logic;
            Reset   : in std_logic;
            --Outputs--
            Q       : inout std_logic_vector(2 downto 0));
end entity bit_SIPO;

--architecture declaration--
architecture bit_SIPO_arch of bit_SIPO is

    signal Q : std_logic_vector(1 downto 0);
    begin
        process(CLK, Reset);
        begin
            if (Reset = '1') then
                Q <= "000";
            else if (CLK'event and CLK = '1') then
                Q(0) <= Din;
                Q(1) <= Q(0);
                Q(2) <= Q(1);
            end if;
        end process;

end architecture bit_SIPO_arch;

