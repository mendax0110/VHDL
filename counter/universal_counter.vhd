----------------------------------------------------
------------Universal Counter-----------------------
----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity universal_counter is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            up_down     : in std_logic_vector(3 downto 0);
            --Outputs--
            enable_out  : out std_logic;
            result      : out std_logic_vector(3 downto 0));
end entity universal_counter;

--architecure definitions--
architecture universal_counter_arch of universal_counter is

    --signal definition--
    signal count    : unsigned(3 downto 0) := "0000";
    signal lmt      : unsigned(3 downto 0);
    begin
        lmt <= unsigned(upperlimit);
        process(clk,rst,enable, up_down, upperlimit, count, lmt)
        begin
            if(rst = '1' and up_down = '1') then
                count <= "0000";
            else if(rst = '1' and up_down = '0') then
                count <= lmt;
            end if;
        
            if(clk = '1' and clk'event) then
                if(enable = '1') then
                    if(up_down = '1') then
                        if(count = lmt) then 
                            count <= "0000";
                        else 
                            count <= count + 1;
                        end if;
                    elsif(up_down = '0') then
                        if(count = "0000") then
                            count <= lmt;
                        else
                            count <= count -1;
                        end if;
                    end if;
                else
                    count <= count;
                end if;
            end if;

            if(count = lmt) then
                if(up_down = '1' and enable = '1') then
                    enable_out <= '1';
                else
                    enable_pit <= '0';
                end if;
            else
                if(up_down = '1') then
                    enable_out <= '0';
                elsif(count = "0000" and up_down = '0' and enable = '1') then
                    enable_out <= '1';
                else
                    enable_out <= '0';
                end if;
            end if;
        end process;

        result <= std_logic_vector(count);
end architecture universal_counter_arch;

            
                        