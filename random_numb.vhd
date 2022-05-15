--------------------------------------------------------------
--------------random number generator in VHDL-----------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity random_numb is
    port(   --Inputs--
            clk     : in std_ulogic;
            --Outputs--
            data    : out std_ulogic_vector(63 downto 0);
            raw     : out std_ulogic_vector(63 downto 0);
            err     : out std_ulogic);
end entity random_numb;

--architecure definitions--
architecture random_numb_arch of random_numb is

    begin
        err <= '0';

        process(clk)
            variable rand : std_ulogic_vector(63 downto 0);
            begin
                if rising_edge(clk) then
                    rand := pseudorand(64);
                    data <= rand;
                    raw  <= rand;
                end if;
        end process;

end architecture random_numb_arch;
