---------------------------------------------------------------
---------------CLOCKDIVIDER-4BIT-NIBBLER IN VHDL---------------
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity clockdivider is
    port(   --Inputs--
            clk_in      : in std_logic;
            clk_ena     : in std_logic := '1';
            --Outputs--
            clk_out     : out std_logic);
end entity clockdivider;

--architecture declaration--
architecture clockdivider_arch of clockdivider is

    begin
        --process declaration--
        process(clk_in)

            --variable declaration--
            variable divider    : std_logic_vector(23 downto 0) := (others => '0');
            variable state      : std_logic := '0';
            
                begin
                    --clock divider--
                    if rising_edge(clk_in) then
                        divider := std_logic_vector(unsigned(divider) + 1);

                        if unsigned(divider) = 50000 then
                            divider := (others => '0');
                            state   := not state;
                        
                            if clk_ena = '1' then
                                clk_out <= state;
                            end if;
                        end if;
                    end if;
        end process;

end architecture clockdivider_arch;

