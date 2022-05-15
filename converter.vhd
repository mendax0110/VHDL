--------------------------------------------------------------------
-----------------a simple converter in vhdl-------------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity converter is
    port(   --Inputs--
            clk_in  : in std_logic;
            enable  : in std_logic;
            rst     : in std_logic;
            --Outputs--
            clk_out : out std_logic);
end entity converter;

--architecture definitions--
architecture converter_arch of converter is
    
    signal temporal : std_logic := '1';
    signal counter  : integer range o to 10000000 := 0;

        begin
            process(enable, rst, clk_in, temporal, counter)
            begin
                if(rst = '1') then
                    temporal <= '1';
                    counter  <= 0;
                elsif(enable = '0') then
                    temporal <= temporal;
                    counter  <= counter;
                elsif rising_edge(clk_in) then
                    if(counter = 10000000) then
                        temporal <= NOT(temporal);
                        counter  <= 0;
                    else
                        counter  <= counter + 1;
                    end if;
                end if;
            end process;
            
            clk_out <= temporal;
    
end architecture converter_arch;
