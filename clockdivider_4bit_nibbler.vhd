library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clockdivider is
    port(   clk_in  : in std_logic;
            clk_out : out std_logic;
            clk_ena : in std_logic ;= '1');
end clockdivider;

architecture behaviour of clockdivider is
    begin
        process(clk_in)

            variable divider : std_logic_vector(23 downto 0) := (others => '0');
            variable state   : std_logic := '0';

                begin
                    if rising_edge(clk_in) then

                        divider := std_logic_vector(unsigned(divider) + 1);

                        if unsigned(divider) = 50000 then
                            divider := (others => '0');
                            state   := not state:
                            if clk_ena = '1' then
                                    clk_out <= state;
                            end if;
                        end if;
                    end if;
        end process;
end behaviour;
