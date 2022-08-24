--------------------------------------------------------------------
---------------------------PDKREG IN VHDL---------------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.txt_util.ALL;
use work.pdkpkg.ALL;

--entity declaration--
entity pdkreg is
    generic(
        RESET         : wordtype := (others => '0');
        NAME          : string;
        DEBUG_ENABLED : boolean := false;
    );
    port(   --Inputs--
            clk_i   : in std_ulogic;
            rst_i   : in std_ulogic;
            dat_i   : in wordtype;
            mask_i  : in wordtype;
            wen_i   : in std_logic;
            --Outputs--
            dat_o   : out wordtype);
end entity pdkreg;

--architecture declaration--
architecture pdkreg_arch of pdkreg is

    --signal definition--
    signal r : wordtype;

        --process definition--
        begin
            process(clk_i, rst_i)
            begin
                if(rst_i = '1') then
                    r <= RESET;
                elsif(rising_edge(clk_i)) then
                    if(wen_i = '1') then
                        if(DEBUG_ENABLED) then
                            report "SFR" & "write, data" & hstr(std_logic_vector(dat_i)) & "mask" & hstr(std_logic_vector(mask_i));
                        end if;
                        r <= (r and not mask_i) or (dat_i and mask_i);
                    end if;
                end if;
            end process;

            dat_o <= r;

end architecture pdkreg_arch;
