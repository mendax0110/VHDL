----------------------------------------------------------------------------
--------------------BCD-TO-SEVEN-SEGMENT-DECODER IN VHDL--------------------
----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity DISPLAY_DECODER is
    port(   --Inputs--
            VALUE           : in bit_vector(3 downto 0); --bit 3 is MSB--
            ZERO_BLANK      : in bit;
            --Outputs--
            DISPLAY         : out bit_vector(6 downto 0); --7 bit is signal--
            ZERO_BLANK_OUT  : out bit);
end entity DISPLAY_DECODER;

--architecture declaration--
architecture BEHAVIOR of DISPLAY_DECODER is

    begin
        --process declaration--
        process(VALUE, ZERO_BLANK) --sensitivity list--

            begin
                case VALUE is       --case-when statement described how decode is--

                    when "0000" => if ZERO_BLANK = '1' then
                                        DISPLAY <= "0000000";
                                        ZERO_BLANK_OUT <= '1';
                                    else
                                        DISPLAY <= "1111110";
                                    end if;

                    when "0001" =>      DISPLAY <= "0110000";
                    when "0010" =>      DISPLAY <= "1101101";
                    when "0011" =>      DISPLAY <= "1111001";
                    when "0100" =>      DISPLAY <= "0110011";
                    when "0101" =>      DISPLAY <= "1011011";
                    when "0110" =>      DISPLAY <= "1011111";
                    when "0111" =>      DISPLAY <= "1110000";
                    when "1000" =>      DISPLAY <= "1001111";   --when others, an error--
                                                                --is specified--
                end case;
        end process;

end architecture BEHAVIOR;