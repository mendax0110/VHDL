---------------------------------------------------------------------------------
--------------------SEQUENCE-STATEMENT-KERNEL IN VHDL----------------------------
---------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity dff is
    port(   --Inputs--
            clock   : in std_logic;
            din     : in std_logic;
            --Outputs--
            dout    : out std_logic);
end entity dff;

--architecture declarations--
architecture dff_arch of dff is

    begin
        process(clock)
            begin
                wait until ((clock'EVENT) and (clock = '1'));
                dout <= din;
        end process;

end architecture dff_arch;