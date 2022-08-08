---------------------------------------------------------------------------
-----------------------4-BIT-NIBBLER-DIVIDER IN VHDL-----------------------
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity clock_divider is
    --generic declarations--
    generic(T_FAKTOR : integer := 50 * 10 ** 6 / 5);
    --port declarations--
    port(   --inputs--
            clk_in  : in std_logic;
            reset   : in std_logic;
            --outputs--
            enable  : out std_logic);
end entity clock_divider;

--architecture declarations--
architecture clock_divider_arch of clock_divider is

    --signal declarations--
    signal cnt : integer;

        begin
            ClockDiv : process(reset, clk)
                begin
                    if reset = '1' then
                        cnt <= T_FAKTOR -1;
                        enable <= '0';
                    elsif clk = '1' and clk'event then
                        if cnt = 0 then
                            cnt <= T_FAKTOR -1;
                            enable <= '1';
                        else
                            cnt <= cnt - 1;
                            enable <= '0';
                        end if;
                    end if;
            end process ClockDiv;
        
end architecture clock_divider_arch;
