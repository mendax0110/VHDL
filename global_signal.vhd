library IEEE;
use IEEE.std_logic_1164.all;

entity and5 is
    port(   a, b, c, d, e : in std_logic;
                        q : out std_logic);
end and5;

architecture and5 of and5 is
    begin
        process(a, b, c, d, e)
            variable state : std_logic;
            variable delay : time;
            begin
                state := a and b and c and d and e;
                if state = '1' then
                    delay := 4,5 ns;
                elsif state = '0' then
                    delay := 3 ns;
                else
                    delay := 4 ns;
                end if;

                q <= state after delay
        end process;
end and5;
