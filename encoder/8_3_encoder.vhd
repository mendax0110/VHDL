-----------------------------------------
-----------------8-3 Encoder-------------
-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity eightthree is
    port(   --Inputs--
            x : in std_logic_vector(7 downto 0);
            --Outputs--
            y : out std_logic_vector(2 downto 0));
end entity eightthree;

--architecture declaration--
architecture eightthree_arch of eightthree is

    begin
        with x SELECT
         
        y <= "000" when "00000001",
             "001" when "00000010",
             "010" when "00000100",
             "011" when "00001000",
             "100" when "00010000",
             "101" when "00100000",
             "110" when "01000000",
             "111" when "10000000",
             "ZZZ" when OTHERS;

end architecture eightthree_arch;

