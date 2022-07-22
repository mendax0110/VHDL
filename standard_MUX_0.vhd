----------------------------------------------------------
---------------STANDARD-MULTIPLEXER IN VHDL---------------
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity standard_mux_0 is
    port(   --Inputs-
            in_1    : in std_logic_vector(3 downto 0);
            in_2    : in std_logic_vector(3 downto 0);
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic_vector(3 downto 0));
end entity standard_mux_0;

--architecture declarations--
architecture standard_mux_0_arch of standard_mux_0 is

    begin
        --Processing--
        with(in_3) select
            out_1   <=  in_1 when '0',
                        in_2 when '1',
                        "0000" when others;

end architecture standard_mux_0_arch;