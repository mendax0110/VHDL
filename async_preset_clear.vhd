library IEEE;
use IEEE.std_logic_1164.all;

entity dff_pc is
    port( preset, clear, clock, din : in std_logic;
          dout                      : out std_logic);
end dff_pc;

architecture synth of dff_pc is
    begin
        process(preset, clear, clock)
            begin
                if(preset =  '1') then
                    dout <= '1';
                elsif(clear = '1') then
                    dout <= '0';
                elsif(clock'EVENT) and (clock = '1') then
                    dout <= din;
                end if;
        end process;
end synth;
