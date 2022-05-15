-------------------------------------
--------------SR - FF ---------------
-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity SRFF is
    port(   --Inputs--
            S       : in std_logic;
            R       : in std_logic;
            CLK     : in std_logic;
            --Outputs--
            Q       : out std_logic;
            Qb      : out std_logic);
end entity SRFF;

--architecture declaration--
architecture SRFF_arch of SRFF is

    begin
        variable tmp: std_logic;
        process(CLK)
        begin
            if (CLK'event and CLK = '1') then
                if (s = '0' and R = '0')
                    tmp := tmp;
                else if (S = '0') and R = '1') then
                    tmp := '0';
                else if (S = '1' and R = '1') then
                    tmp := 'Z';
                else
                    tmp := '1';
                end if;
            end if;
            Q <= tmp;
            Qb <= not tmp;
        end process;

end architecture SRFF_arch;
