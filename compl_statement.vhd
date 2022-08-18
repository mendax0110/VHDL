-------------------------------------------------------------------
----------------------COMPL-STATEMENT IN VHDL----------------------
-------------------------------------------------------------------
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--package bit 4--
package count_type is
    subtype bit4 is std_logic_vector(3 downto 0);
end package count_type;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.count_type.all;

--entity declaration--
entity count is
    port(   --Inputs--
            clock       : in std_logic;
            load        : in std_logic;
            clear       : in std_logic;
            din         : in bit4;
            --Outputs--
            dout        : inout bit4);
end entity count;

--architecture declaration--
architecture count_arch of count is

    --signal declaration--
    signal count_val : bit4;
    
        begin
            --process declaration--
            process(load, clear, din, dout)
                begin
                    if(load = '1') then
                        count_val <= din;
                    elsif(clear = '1') then
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

end architecture count_arch;