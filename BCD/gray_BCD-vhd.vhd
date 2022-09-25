--------------------------------------------------
-----------------GRAY-BCD IN VHDL-----------------
--------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity BCD_gray is 
    port(   --Inputs--
            B   : in  std_logic_vector(3 downto 0);
            --Outputs--
            G   : out std_logic_vector(3 downto 0));
end entity BCD_gray;

--architecture declaration--
architecture BCD_gray_arch of BCD_gray is

    --XOR1 declaration--
    component XOR1 is
        port(   --Inputs--
                A   : in  std_logic;
                B   : in  std_logic;
                --Outputs--
                C   : out std_logic);
    end component XOR1;

    --buffer declaration--
    component Buffer is
        port(   --Inputs--
                A   : in  std_logic;
                --Outputs--
                B   : out std_logic);
    end component Buffer;

    begin
        --port mapping--
        B1 : Buffer port map(B(3), G(3));
        X1 : XOR1 port map(B(3), B(2), G(2));
        X2 : XOR1 port map(B(2), B(1), G(1));
        X3 : XOR1 port map(B(1), B(0), G(0));

end architecture BCD_gray_arch;

