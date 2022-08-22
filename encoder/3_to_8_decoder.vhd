-----------------------------------------------------------
---------------3 to 8 Decoder in VHDL----------------------
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity decoder_3_to_8 is
    port(   --Inputs--
            A   : in std_logic_vector(2 downto 0);
            --Outputs--
            Y   : out std_logic_vector(7 downto 0));
end entity decoder_3_to_8;

--architecture definitions--
architecture decoder_3_to_8_arch of decoder_3_to_8 is
    
    begin
        process(A)
            begin
                case A is
                    when "000" => Y <= "00000001";
                    when "001" => Y <= "00000010";
                    when "010" => Y <= "00000100";
                    when "011" => Y <= "00001000";
                    when "100" => Y <= "00010000";
                    when "101" => Y <= "00100000";
                    when "110" => Y <= "01000000";
                    when "111" => Y <= "10000000";
                    when others => Y <= "00000000";
                end case;
        end process;

end architecture decoder_3_to_8_arch;

