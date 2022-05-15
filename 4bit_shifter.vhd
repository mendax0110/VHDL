library IEEE;
use IEEE.std_logic_1164.all;

package shift_type is
    subtype bit4 is std_logic_vector(3 downto 0);
end shift_type;

use work.shift_types.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity shifter is
    port(din                   : in bit4;
         clk, load, left_right : in std_logic;
         dout                  : inout bit4);
end shifter;

architecture synth of shifter is
    signal shift_val : bit4;
        begin
        nxt : process(load, left_right, din, dout)
            begin
                if(load = '1') then
                    shift_val <= din;
                elsif(left_right = '0') then
                    shift_val(2 downto 0) <= dout(3 downto 1);
                    shift_val(3) <= '0';
                else
                    shift_val(3 downto 1) <= dout(2 downto 0);
                    shift_val(0) <= '0';
                end if;
        end process;

        current : process
            begin
                wait until clk'EVENT and clk = '1';
                dout <= shift_val;
        end process;
end synth;
