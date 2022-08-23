----------------------------------------------------------------------
------------------------SAMPLE-SIMULATION-DESIGN----------------------
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity sim_sample is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            --
            dat_in      : in std_logic_vector(7 downto 0);
            enable      : in std_logic;
            --Outputs--
            comp_cnt    : out std_logic_vector(9 downto 0));
end entity sim_sample;

--architecure declaration--
architecture sim_sample_arch of sim_sample is

    signal dat_in_d1    : std_logic_vector(7 downto 0);
    signal comp_cnt_1c1 : unsigned(9 downto 0);

    begin
        
        Sim_Sample_Proc : process(clk, rst)
        begin
            if (rst = '1') then
                dat_in_d1       <= X"00";
                comp_cnt_1c1    <="00" & X"00";
            elsif rising_edge(clk) then
                if (enable = '1') then

                    dat_in_d1 <= dat_in;

                    if (dat_in_d1 = dat_in) then
                        comp_cnt_1c1 <= comp_cnt_1c1 + 1;
                    end if;
                end if;
            end if;    
        end process;

        comp_cnt <= std_logic_vector(comp_cnt_1c1);
    
end architecture sim_sample_arch;
