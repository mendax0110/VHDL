library IEEE;
use IEEE.std_logic_1164.all;

entity clock_divider is
    generic( T_FAKTOR : interger := 50 * 10 ** 6 / 5);
    port (  clk    : in std_logic;
            reset  : in std_logic;
            enable : out std_logic);
end clock_divider;

architecture behavioral of clock_divider is
    signal cnt : integer;
        begin
            ClockDiv : process(reset,clk)
                begin
                    if reset = '1' then
                        cnt <= T_FAKTOR -1;
                        enable <= '0';
                    elsif clk = '1' and clk'event then
                        if cnt = 0 then
                            enable <= '1';
                            cnt <= T_FAKTOR -1;
                        else
                            enable <= '0';
                            cnt <= cnt -1;
                        end if;
                    end if;
            end process ClockDiv;
end behavioral;
