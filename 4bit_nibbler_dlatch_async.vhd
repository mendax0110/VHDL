----------------------------------------------------------------
---------------4-Bit-NIBBLER-DLATCH-ASYNC IN VHDL---------------
----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity risingedge_DFlipFlop_SyncReset is
    port(   --Inputs--
            D           : in std_logic;
            clk         : in std_logic;
            sync_reset  : in std_logic;
            --Outputs--
            Q           : out std_logic);
end entity risingedge_DFlipFlop_SyncReset;

--architecture declarations--
architecture risingedge_DFlipFlop_SyncReset_arch of risingedge_DFlipFlop_SyncReset is

    begin
        --process declarations--
        process(clk)
            begin
                if(rising_edge(clk)) then
                    if(sync_reset = '1') then
                        Q <= '0';
                    else
                        Q <= D;
                    end if;
                end if;
        end process;
    
end architecture risingedge_DFlipFlop_SyncReset_arch;

