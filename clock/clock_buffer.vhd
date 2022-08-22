-----------------------------------------------------
--Header information
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entitiy declaration--
entity clock_buffer is
    port(   --Inputs--
            reset   : in std_logic;
            clk_in  : in std_logic;
            dat_in  : in std_logic;
            --Outputs--
            dat_out : out std_logic);
end entity clock_buffer;

--architecture declaration--
architecture clock_buffer_arch of clock_buffer is

    signal clk : std_logic;

    component BUFG
        port(
                I  : in std_logic;
                O  : out std_logic;
            );
    end component;

    begin
        ----------Design implementation----------

        --clock buffer instantiation--
        clock_buf : BUFG
        port map
            (
                I => clk_in,
                O => clk
            );
        
        Reg_Proc: process(clk)
        begin
            if(reset = '1') then
                dat_out <= '0';
            elsif rising_edge(clk) then
                dat_out <= dat_in;
            end if;
        end process;

end architecture clock_buffer_arch;
