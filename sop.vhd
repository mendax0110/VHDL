------------------------------------------------------------------------
--------------------------SOP-Circuit-----------------------------------
------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity SOP is
    port(   --Inputs--
            ADC_in  : in std_logic_vector(2 downto 0);
            --Outputs--
            F_out   : out std_logic);
end entity SOP;

--architecure definition--
architecture SOP_arch of SOP is

    begin
        DUT : process(ADC_in)
        begin
            case ADC_in is
                when "000" | "010" | "110" => F_out <= '1';
                when others                => F_out <= '0';
            end case;
        end process;

end architecture SOP_arch;
