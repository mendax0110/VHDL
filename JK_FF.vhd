-----------------------------------
----------------JK-FF--------------
-----------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity JKFF is
    port(   --Inputs--
            J     : in std_logic;
            K     : in std_logic;
            CLK   : in std_logic;
            --Outputs--
            Q     : out std_logic;
            Qb    : out std_logic);
end entity JKFF;

--architecture declaration--
architecture JKFF_arch of JKFF is

    begin
        variable temp: std_logic;
        Process(CLK)
        begin
            if (CLK'event and CLK = '1') then
                if (J = '0' and k = '0') then
                    temp := temp;
                elsif (J = '0' and K = '1') then
                    temp := '0';
                elsif (J = '1' and K = '0') then
                    temp := '1';
                elsif (J = '1' and K = '1') then
                    temp := not temp;
                end if;
                Q <= temp;
                Qb <= not Q;
            end if;
        end process;

end architecture JKFF_arch;

