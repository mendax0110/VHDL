------------------------------------------------------------------------
-----------------------ASYNC-PRESET-CLEAR IN VHDL-----------------------
------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity dff_pc is
    port(   --Inputs--
            preset  : in std_logic;
            clear   : in std_logic;
            clock   : in std_logic;
            din     : in std_logic;
            --Outputs--
            dout    : out std_logic);
end entity dff_pc;

--architecture declarations--
architecture dff_pc_arch of dff_pc is

    begin
        --process declarations--
        process(preset, clear, clock)
            begin
                if(preset = '1') then
                    dout <= '1';
                elsif(clear = '1') then
                    dout <= '0';
                elsif(clock'EVENT) and (clock = '1') then
                    dout <= din;
                end if;
        end process;

end architecture dff_pc_arch;