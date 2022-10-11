-----------------------------------------
---------------TFF IN VHDL---------------
-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity TFF is
    port(   --Inputs--
            T   : in  std_logic;
            CLK : in  std_logic;
            --Outputs--
            Q   : out std_logic;
            Qb  : out std_logic);
end entity TFF;

--architecture declaration--
architecture TFF_arch of TFF is

    begin
        --variable declaration--
        variable tmp : std_logic;
        --process declaration--
        process(CLK)
            begin
                if(CLK'event and CLK = '1') then
                    if(T = '0') then
                        tmp := tmp;
                    else if(T = '1') then
                        tmp := not tmp;
                    end if;
                end if;
            Q  <= tmp;
            Qb <= not tmp;
        end process;

end architecture TFF_arch;
