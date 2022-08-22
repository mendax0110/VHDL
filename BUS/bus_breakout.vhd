--------------------------------------------------------------
---------------------BUS BREAKOUT IN VHDL---------------------
--------------------------------------------------------------
library library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity bus_breakout is
    port(   --Inputs--
            in_1    : in std_logic_vector(3 downto 0);
            in_2    : in std_logic_vector(3 downto 0);
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic_vector(3 downto 0));
end entity bus_breakout;

--architecture definitions--
architecture bus_breakout_arch of bus_breakout is

    begin
        ------------Design Implementation------------
        out_1   <=  (   in_3(3 downto 2)
                            &(in_1(3) AND in_2(1))
                            &(in_1(2) AND in_2(0))
                            &in_1(1 downto 0)
                    );

end architecture bus_breakout_arch;
