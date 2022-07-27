-----------------------------------------------------------------
--------------------ASYNCRONOUS-RESET IN VHDL--------------------
-----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity dff_async is
    port(   --Inputs--
            clock   : in std_logic;
            reset   : in std_logic;
            din     : in std_logic;
            --Outputs--
            dout    : out std_logic);
end entity dff_async;

--architecture declarations--
architecture dff_async_arch of dff_async is

    begin
        --process declarations--
        process(reset, clock)
            begin
                if(reset = '1') then
                    dout <= '0';
                elsif(clock'EVENT) and (clock = '1') then
                    dout <= din;
                end if;
        end process;
    
end architecture dff_async_arch;