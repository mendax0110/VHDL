library IEEE;
use IEEE.std_logic_1164.all;

entity dff_asynch is
    port(clock, reset, din : in std_logic;
         dout              : out std_logic);
end dff_asynch;

architecture synth of dff_asynch is
    begin
        process(reset, clock)
            begin
                if(reset = '1') then
                    dout <= '0';
                elsif(clock'EVENT) and (clock = '1') then
                    dout <= din;
                end if;
        end process;
end synth;
