library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity up_counter is
    port(   clk     : in std_logic;
            reset   : in std_logic;
            counter : out std_logic_vector(3 downto 0));
end up_counter;

architecture Behavioral of up_counter is 
    
    signal counter_up : std_logic_vector(3 downto 0);

        begin
            process(clk)
                begin
                    if(rising_edge(clk)) then
                        if(reset = '1') then
                            counter_up <= x "0";
                        else
                            counter_up <= counter_up + X "1";
                        end if;
                    end if;
            end process;
            
            counter <= counter_up;
end behavioral;

