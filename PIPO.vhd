-----------------------------------------------------
-------------------PIPO------------------------------
-----------------------------------------------------
library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity PIPO is
    port(   --Inputs--
            CLK     : in std_logic;
            RESET   : in std_logic;
            D       : in std_logic_vector(2 downto 0);
            --Outputs--
            Q       : out std_logic_vector(2 downto 0));
end entity PIPO;

--architecture definitions--
architecture PIPO_arch of PIPO is
    begin
        process(CLK, Reset);
        begin
            if(Reset = '1') then
                Q <= "000";
            elsif(CLK'event and CLK = '1') then
                Q(0) <= D(0);
                Q(1) <= D(1);
                Q(2) <= D(2);
            end if;
        end process;
end architecture PIPO_arch;