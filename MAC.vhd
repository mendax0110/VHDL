---------------------------------------------------------------------
------------------------------MAC------------------------------------
---------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity MAC is
    port(   --Input--
            mac_rst     : in std_logic;
            clk         : in std_logic;
            enable      : in std_logic;
            LO_bits     : in signed(N-1 downto 0);
            HI_bits     : in signed(N-1 downto 0);
            --Outputs--
            MAC_result  : out signed(2 * N-1 downto 0));
end entity MAC;

--architecure definition--
architecture MAC_arch of MAC is
    
    component N_dff
        --default value for N is 8--
        generic(N: integer := 8); 
        port(   --Input--
                clk     : in std_logic;
                enable  : in std_logic;
                rst     : in std_logic;
                D       : in signed(N-1 downto 0);
                --Output--
                Q       : out signed(N-1 downto 0));
    end component N_dff;

    begin
    -------------------------------------------------------------------------------------------------------
    LO_dff  : N_dff generic map(N) port map(clk, enable, mac_rst, LO_bits, MAC_result(N-1 downto 0));
    HI_dff  : N_dff generic map(N) port map(clk, enable, mac_rst, HI_bits, MAC_result(2 * N-1 downto 0));
    -------------------------------------------------------------------------------------------------------

end architecture MAC;