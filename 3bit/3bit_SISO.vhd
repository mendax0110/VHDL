---------------------------------------------
--------------------3bit SISO----------------
---------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity SISO is
    port(   --Inputs--
            Din     : in std_logic;
            CLK     : in std_logic;
            RESET   : in std_logic;
            --Outputs--
            Dout    : out std_logic);
end entity SISO;

--architecture declaration--
architecture SISO_arch of SISO is 

    begin
        process(CLK,RESET)
        variable t1, t2 : std_logic;
        begin
            if (reset = '1') then
                t1 := '0';
                t2 := '0';
                Dout <= '0';
            elsif (CLK'event and CLK = '1') then
                Dout <= t2;
                t2 := t1;
                t1 := Din;
            end if;
        end process;

end architecture SISO_arch;