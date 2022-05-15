----------------------------------------------------------------
---------------VGA TEXT WRAPPER---------------------------------
----------------------------------------------------------------
library IEEE;
library work;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.commonPak.all;

--entity declarations--
entity wrapper is
    port(   --Inputs--
            clk     : in std_logic;
            xCoord  : in std_logic_vector(11 downto 0);
            yCoord  : in std_logic_vector(11 downto 0);
            --Outputs--
            pixOn   : out std_logic);
end entity wrapper;

--architecure definitions--
architecture wrapper_arch of wrapper is

    --signal definitions--
    signal h : integer := to_integer(signed(xCoord));
    signal v : integer := to_integer(signed(yCoord));

    --there are our results--
    signal d1 : std_logic := '0';
    signal d2 : std_logic := '0';
    signal d3 : std_logic := '0';

    begin
        
        textElement1: entity work.Pixel_On_Text
        generic map(
            textLength => 38
        )
        port map(
            clk => clk,
            displayText => "Pixel_On_Text -- test 1!@#$ at (50,50)",
            position => (50,50),
            horzCoord => h,
            vertCoord => v,
            pixel => d1
        );
        
        textElement2: entity work.Pixel_On_Text
        generic map(
            textLength => 39
        )
        port map(
            clk => clk,
            displayText => "Pixel_On_Text -- test 2%^&* at (500,50)",
            position => (500,50),
            horzCoord => h,
            vertCoord => v,
            pixel => d2
        );

        textElement3: entity work.Pixel_On_Text
        generic map(
            textLength => 41
        )
        port map(
            clk => clk,
            displayText => "Pixel_On_Text -- test 3()_+= at (500,130)",
            position => (500,130),
            horzCoord => h,
            vertCoord => v,
            pixel => d3
        );

        pixelInTextGroup: process(clk)
        begin
            if rising_edge(clk) then
                --the pixel is on when one of the text matched--
                pixOn <= d1 or d2 or d3;
            end if;
        end process;

end architecture wrapper_arch;