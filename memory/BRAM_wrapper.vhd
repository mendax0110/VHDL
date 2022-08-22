------------------------------------------------------
---------------BRAM - WRAPPER-------------------------
------------------------------------------------------
library IEEE;
library UNISIM;
use IEEE.std_logic_1164.all;
use UNISIM.vcomponents.all;

--entity declaration--
entity BRAM_WRAPPER is
    port(   --Inputs--
            BRAM_PORTA_addr  : in std_logic_vector(31 downto 0);
            BRAM_PORTA_clk   : in std_logic;
            BRAM_PORTA_din   : in std_logic_vector(31 downto 0);
            BRAM_PORTA_en    : in std_logic;
            BRAM_PORTA_rst   : in std_logic;
            BRAM_PORTA_we    : in std_logic_vector(3 downto 0);
            --Outputs--
            BRAM_PORTA_dout  : out std_logic_vector(31 downto 0));
end entity BRAM_WRAPPER;

--architecture definitions--
architecture BRAM_WRAPPER_arch of BRAM_WRAPPER is

    component BRAM is
        port(   --Inputs--
        BRAM_PORTA_addr  : in std_logic_vector(31 downto 0);
        BRAM_PORTA_clk   : in std_logic;
        BRAM_PORTA_din   : in std_logic_vector(31 downto 0);
        BRAM_PORTA_en    : in std_logic;
        BRAM_PORTA_rst   : in std_logic;
        BRAM_PORTA_we    : in std_logic_vector(3 downto 0);
        --Outputs--
        BRAM_PORTA_dout  : out std_logic_vector(31 downto 0));
    end component BRAM;

    begin
        BRAM_i : component BRAM
            port map(
                BRAM_PORTA_addr(31 downto 0) => BRAM_PORTA_addr(31 downto 0),
                BRAM_PORTA_clk => BRAM_PORTA_clk,
                BRAM_PORTA_din(31 downto 0) => BRAM_PORTA_din(31 downto 0);
                BRAM_PORTA_dout(31 downto 0) => BRAM_PORTA_dout(31 downto 0);
                BRAM_PORTA_en => BRAM_PORTA_en,
                BRAM_PORTA_rst => BRAM_PORTA_rst,
                BRAM_PORTA_we(3 downto 0) => BRAM_PORTA_we(3 downto 0)
            );

end architecture BRAM_WRAPPER_arch;

