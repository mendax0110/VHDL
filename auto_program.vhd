--------------------------------------------------------------------
------------------------AUTO-PROGRAM IN VHDL------------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity auto_p is
    port(   --Inputs--
            d   : in std_logic;
            clk : in std_logic;
            --Outputs--
            q   : out std_logic);

    --function declarations--
    function rising_edge(signal s : std_logic)
        return boolean is
        begin
            --this function make use of attributes--
            --'event and 'last_value discussed--
            if(s'event) and (s = '1') and
                (s'last_value = '0') then
                return 'true';
            else
                return 'false';
            end if;
        end rising_edge;
end entity auto_p;

--architecuture declarations--
architecture auto_p_arch of auto_p is

    begin
        process(clk)
            begin
                if rising_edge(clk) then
                    q <= d;
                end if;
        end process;

end architecture auto_p_arch;
