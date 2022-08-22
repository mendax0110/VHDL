-------------------------------------------------------------
---------------------4:2 Encoder in VHDL---------------------
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declaration--
entity four_two_encoder is
    port(   --Inputs--
            a   : in std_logic_vector(3 downto 0);
            --Outputs--
            y   : out std_logic);
end entity four_two_encoder;

--architecture declaration--
architecture four_two_encoder_arch of four_two_encoder is

    begin
        y <= "00" when a = "0001" else
             "01" when a = "0010" else
             "10" when a = "0100" else
             "11" when a = "1000" 

end architecture four_two_encoder_arch;