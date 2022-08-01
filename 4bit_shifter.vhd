-------------------------------------------------------------------
-----------------------4-BIT-SHIFTER IN VHDL-----------------------
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--package declaration--
package shifter_type is
    subtype bit4 is std_logic_vector(3 downto 0);
end package shifter_type;

library IEEE;
use work.shifter_types.all;
use IEEE.std_logic_1164.all;

--entity declaration--
entity shifter is
    port(   --Inputs--
            din         : in bit4;
            clk         : in std_logic;
            load        : in std_logic;
            left_right  : in std_logic;
            --Outputs--
            dout        : out bit4);
end entity shifter;

--architecture declaration--
architecture shifter_type_arch of shifter_type is

    --signal declaration--
    signal shift_val : bit4;
        begin
            --process declaration--
            nxt : process(load, left_right, din, dout)
                begin
                    if(load = '1') then
                        shift_val <= din;
                    elsif(left_right = '0') then
                        shift_val(3 downto 0) <= dout(3 downto 1);
                        shift_val(3) <= '0';
                    else
                        shift_val(3 downto 1) <= dout(2 downto 0);
                        shift_val(0) <= '0';
                    end if;
            end process;

            --process declaration--
            current : process
                begin
                    wait until clk'EVENT and clk = '1';
                    dout <= shift_val;
            end process;

end architecture shifter_type_arch;