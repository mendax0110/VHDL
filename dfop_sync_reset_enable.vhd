library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity dflop_sync_enable is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            clear_n : in std_logic;
            enable  : in std_logic;
            in_1    : in std_logic;
            --Outputs--
            out_1 : out std_logic);
end entity dflop_sync_enable;

--architecture declaration--
architecture dflop_sync_enable_arch of dflop_sync_enable is
    begin
        ----------design implementation----------
        Reg_Proc : process(clk, reset)
        begin
            if (reset = '1') then
                out_1 <= '0';
            elsif rising_edge(clk) then

                if (enable = '1') then

                    if (clear_n = '0') then
                        out_1 <= '0';
                    else
                        out_1 <= in_1;
                    end if;
                
                end if;

            end if;
        end process;
end architecture dflop_sync_enable_arch;