---------------------------------------------------------------------------------------------
-----------------------------Simple Simualtion Design Testbench------------------------------
---------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity SSD is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            --------
            dat_in      : in std_logic_vector(7 downto 0);
            enable      : in std_logic;
            --Outputs--
            comp_out    : out std_logic_vector(9 downto 0));
end entity SSD;

--architecture definitions--
architecture SSD_arch of SSD is

    signal dat_in_dl        : std_logic_vector(7 downto 0);
    signal comp_out_lcl     : unsinged(9 downto 0);

    begin

        SSD_Proc : process(clk, rst)
        begin
            if(rst = '1') then
                dat_in_dl       <= X"00";
                comp_cnt_lcl    <= "00" & X"00";
            elsif rising_edge(clk) then
                if(enable = '1') then
                    dat_in_dl   <= dat_in;
                    if(dat_in_dl = dat_in) then
                        comp_cnt_lcl <= comp_cnt_lcl + 1;
                    end if;
                end if;
            end if;
        end process;

        comp_cnt <= std_logic_vector(comp_cnt_lcl);

end architecture SSD_arch;