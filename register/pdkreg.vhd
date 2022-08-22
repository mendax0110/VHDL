library IEEE;
library work;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.txt_util.all;
use work.pdkpkg.all;

--entity declaration--
entity pdkreg is
    generic(
        RESET : wordtype := (others => '0');
        NAME  : string;
        DEBUG_ENABLED : boolean := false
    );
    port(   --Inputs--
            clk_i   : in std_ulogic;
            rst_i   : in std_ulogic;
            dat_i   : in wordtype;
            mask_i  : in wordtype;
            wen_i   : in std_logic;
            dat_o   : out wordtype);
end entity pdkreg;

--architecture definition--
architecture pdkreg_arch of pdkreg is

    --signal definition--
    signal r : wordtype;

    begin
        process(clk_i, rst_i)
        begin
            if rst_i = '1' then
                r <= RESET;
            elsif rising_edge(clk_i) then
                if wen_i = '1' then
                    if DEBUG_ENABLED then
                        report "SFR " & " write, data " & hstr(std_logic_vector(dat_i)) & " mask " & hstr(std_logic_vector(mask_i));
                    end if;
                    r <= (r and not mask_i) or (dat_i AND mask_i);
                end if;
            end if;
        end process;

        dat_o <= r;

end architecture pdkreg_arch;