-----------------------------------------------------
-----------rom for waveform generator----------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations for rom--
entity rom is
    port(      --Inputs--
                address         : in std_logic_vector(6 downto 0);
                CS              : in std_logic; --clear the memory--
                EN              : in std_logic; --enable memory--
                wave_type       : in std_logic_vector(1 downto 0);
                wave_period     : in std_logic_vector(1 downto 0);
                wave_datapoints : in std_logic_vector(1 downto 0);
                --Outputs--
                values          : out real);
end entity rom;

--architecure definitions--
architecture rom_arch of rom is

    --signal definitions--
    signal F1, F2, F3, F4 : real;

    component sin_entity
        port(
            --Inputs--
            address : in std_logic_vector(6 downto 0);
            --Outputs--
            data    : out real;
        );
    end component sin_entity;
    
    component square_entity
        port(
            --Inputs--
            address : in std_logic_vector(6 downto 0);
            --Outputs--
            data    : out real;
        );
    end component square_entity;

    component triangle_entity
        port(
            --Inputs--
            address : in std_logic_vector(6 downto 0);
            --Outputs--
            data    : out real;
        );
    end component triangle_entity;
    
    component cos
        port(
            --Inputs--
            address : in std_logic_vector(6 downto 0);
            --Outputs--
            data    : out real;
        );
    end component cos;

    begin
        R1 : sin_entity port map(address, F1);
        R2 : square_entity port map(address, F2);
        R2 : triangle_entity port map(address, F3);
        R4 : cos port map(address, F4);
        
        value <= F1 when wave_type = "00" else --sine wave--
                 F2 when wave_type = "01" else --square wave--
                 F3 when wave_type = "10" else --triangle wave--
                 F4 when wave_type = "11" else --custom wave(cosine)--
                 5.0;

end architecture rom_arch;
