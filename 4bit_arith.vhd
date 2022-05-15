library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity four_bit_counter is
    port(   clk     : in std_logic;
            reset   : in std_logic;
            counter : out std_logic_vector(3 downto 0));
end four_bit_counter;

--architecture of entitiy--
architecture structural of four_bit_counter is

    --signal declaration--
    signal q_int : unsinged(3 downto 0);
        begin
            counter <= std_logic_vector(q_int);
            process(clk, reset)
                    begin
                        if reset = '1' then --reset auf high
                            q_int <= (others => '0'); --zählerstand zurücksetzen
                        elsif rising_edge(clk) then -- steigende flanke an clk
                            q_int <= q_int + 1; --zählerstand um 1 erhöhen
                        end if;
            end process;
end structural;
