-----------------------------------------------------
---------------GLOBAL-SIGNAL IN VHDL-----------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity definitions--
entity global_sig is
    port(   --Inputs--
            a   : in std_logic;
            b   : in std_logic;
            c   : in std_logic;
            d   : in std_logic;
            e   : in std_logic;
            --Outputs--
            q   : out std_logic);
end entity global_sig;

--architecture definitions--
architecture global_sig_arch of global_sig is

    begin
        --process--
        process(a, b, c, d, e)
            --variables--
            variable state : std_logic;
            variable delay : time;
            
            --statements--
            begin
                state <= a and b and c and d and e;
                --delay--
                if state = '1' then
                    delay <= 4,5 ns;
                elsif state = '0' then
                    delay <= 3 ns;
                else
                    delay <= 4 ns;
                end if;

                q <= state after delay;
        end process;

end architecture global_sig_arch;

