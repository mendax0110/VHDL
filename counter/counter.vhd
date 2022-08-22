-----------------------------------------------------------------
-------------------------COUNTER IN VHDL-------------------------
-----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity counter is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            load    : in std_logic;
            enable  : in std_logic;
            data    : in std_logic_vector(3 downto 0);
            --Outputs--
            count   : out std_logic_vector(3 downto 0));
end entity counter;

--architecture declarations--
architecture counter_arch of counter is

    --signal declarations--
    signal count_reg : unsigned(3 downto 0);

    begin
        incrementer : process(clk, reset) 
            begin
                if(reset = '1') then
                    count_reg <= "0000";
                elsif(clk'EVENT and clk = '1') then
                    if(load = '1') then
                        count_reg <= to_unsigned(data);
                    elsif(enable = '1') then
                        count_reg <= count_reg + 1;
                    end if;
                end if;
        end process;

        count <= std_logic_vector(count_reg);

end architecture counter_arch;

