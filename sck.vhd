------------------------------------------------------------------------------
----------------------Serial Clock--------------------------------------------
------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity sck is
    port(   --Inputs--
            reset       : in std_logic;
            clk_in      : in std_logic;
            dat_in      : in std_logic;
            --Outputs--
            dat_out     : out std_logic);
end entity sck;

--architecture definitions--
architecture sck_arch of sck is

    signal clk  : std_logic;

    component BUFG
        port(   --Inputs--
                I   : in std_logic;
                --Outputs--
                O   : out std_logic);
    end component BUFG;

    begin
        ----------------------Design Implementation-------------------------

        --serial clock buffer instantiation--
        clock_buf : BUFG
            port map(   
                        I   => clk_in,
                        O   => clk);

        Reg_Proc: process(clk)
        begin
            if(reset = '1') then
                dat_out <= '0';
            elsif rising_edge(clk) then
                dat_out <= dat_in;
            end if;
        end process;

end architecture sck_arch;
