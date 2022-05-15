-------------------------------------------------
-----------T FLIP FLOP in VHDL-------------------
-------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity TFF is
    port(   --Inputs--
            T       : in std_logic;
            CLK     : in std_logic;
            --Outputs--
            Q       : out std_logic;
            Qb      : out std_logic);
end entity TFF;

--architecure definitions--
architecture TFF_arch of TFF is

    begin
        variable tmp: std_logic
        process(CLK)
            begin
                if(CLK'event and CLK='1') then
                    if(T='0') then
                        tmp := tmp;
                    elsif(T='1') then
                        tmp := not tmp;
                    end if;
                end if;
        end process;
        
        Q  <= tmp;
        Qb <= not tmp;
        
end architecture TFF_arch;