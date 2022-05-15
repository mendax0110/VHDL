package count_type is
    subtype bit8 is integer range 0 to 255;
end count_type;

library IEEE;
use IEEE.std_logic_1164.all;
use work.count_types.all;

entity count is
    port(   clk     : in std_logic;
            ld      : in std_logic;
            up_dwn  : in std_logic;
            clk_en  : in std_logic;
            din     : in bit8;
            qout    : inout bit8);
end count;

architecture synthesis of count is
    signal count_val : bit8;
    begin
        process(ld, up_dwn, din, qout)
        begin
            if ld = '1' then
                count_val <= din;
            elsif up_dwn = '1' then
                if (qout >= 255) then
                    count_val <= 0;
                else
                    count_val <= count_val + 1;
                end if;
            else
                if (qout <= 0) then
                    count_val <= 255;
                else
                    count_val <= count_val - 1;
                end if;
            end if;
        end process;

        process
        begin
            wait until clk'event and clk = '1';

            if clk_en = '1' then
                qout <= count_val;
            end if;
        end process;
end synthesis;
