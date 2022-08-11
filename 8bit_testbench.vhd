-----------------------------------------------------------------------------------
------------------------------8-BIT-TESTBENCH IN VHDL------------------------------
-----------------------------------------------------------------------------------
package count_type is
    subtype bit8 is integer range 0 to 255;
end package count_type;

library IEEE;
use IEEE.std_logic_1164.all;
use work.count_types.all;

--entity declaration--
entity count is
    port(   --Inputs--
            clk     : in std_logic;
            ld      : in std_logic;
            up_dwn  : in std_logic;
            clk_en  : in std_logic;
            din     : in bit8;
            --Outputs--
            qout    : inout bit8);
end entity count;

--architecture declaration--
architecture count_arch of count is

    --signals declaration--
    signal count_val : bit8;

        begin
            --process declaration--
            process(ld, up_dwn, din, qout)
                begin
                    if ld = '1' then
                        count_val <= din;
                    elsif up_dwn = '1' then
                        if (qout >= 255) then
                            count_val <= 0;
                        else
                            count_val <= qout + 1;
                        end if;
                    else
                        if(qout <= 0) then
                            count_val <= 255;
                        else
                            count_val <= qout - 1;
                        end if;
                    end if;
            end process;

            process(clk_en)
                begin
                    wait until clk'event and clk = '1';

                    if clk_en = '1' then
                        qout <= count_val;
                    end if;
            end process;

end architecture count_arch;
