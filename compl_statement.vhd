use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
package count_type is
    subtype bit4 is std_logic_vector(3 downto 0);
end count_type;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use WORK.count_type.all;

entity count is
    port(clock, load, clear : in std_logic;
         din                : in bit4;
         dout               : inout bit4);
end count;

architecture synth of count is 
    signal count_val : bit4;
        begin
        process(load, clear, din, dout)
            begin
                if (load = '1') then
                    count_val  <= din;
                elsif (clear = '1') then
                    count_val <= "0000";
                else
                    count_val <= dout + "0001";
                end if;
        end process;

            process
                begin
                    wait until clock'EVENT and clock = '1';
                    dout <= count_val;
            end process;
end synth;
