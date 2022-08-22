--------------------------------------------------------------
---------------4-BIT-ARITHMETIC-COUNTER IN VHDL---------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity four_bit_counter is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            --Outputs--
            counter : out std_logic_vector(3 downto 0));
end entity four_bit_counter;

--architecture declarations--
architecture four_bit_counter_arch of four_bit_counter is

    --signals declarations--
    signal q_int : unsinged(3 downto 0);
        begin
            counter <= std_logic_vector(q_int);
            process(clk, reset)
            begin
                if reset = '1' then                 --reset on high--
                    q_int <= (others => '0');       --counter reset--
                elsif clk'event and clk = '1' then  --clock rising edge--
                    q_int <= q_int + 1;             --counter increment--
                end if;
            end process;

end architecture four_bit_counter_arch;