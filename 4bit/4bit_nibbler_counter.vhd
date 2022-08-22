-----------------------------------------------------------------------------------
---------------------------4-BIT-NIBBLER-COUNTER IN VHDL---------------------------
-----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity up_counter is
    port(   --Inputs-- 
            clk     : in std_logic;
            rst     : in std_logic;
            --Outputs--
            counter : out std_logic_vector(3 downto 0));
end entity up_counter;

--architecture definition--
architecture up_counter_arch of up_counter is

    --signal declaration--
    signal counter_up : std_logic_vector(3 downto 0);

        begin
            --process declaration--
            process(clk)
                begin
                    if(rising_edge(clk)) then
                        if(rst = '1') then
                            counter_up <= (others => '0');
                        else
                            counter_up <= counter_up + 1;
                        end if;
                    end if;
            end process;

            --output assignment--
            counter <= counter_up;

end architecture up_counter_arch;