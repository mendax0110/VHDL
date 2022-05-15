library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
    port(clock, din : in std_logic;
         dout       : out std_logic);
end dff;

architecture synth of dff is
    begin
        process
            begin
                wait until ((clock'EVENT) and (clock = '1'));
                dout <= din;
        end process;
end synth;
