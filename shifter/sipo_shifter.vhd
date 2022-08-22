-------------------------------------------------------------
--------------------SIPO-SHIFTER IN VHDL---------------------
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity sipo_shifter is
    port(   --Inputs--
            clk, clear  : in std_logic;
            Input_Data  : in std_logic;
            --Outputs--
            Q           : out std_logic_vector(3 downto 0));
end entity sipo_shifter;

--architecure definitions--
architecture sipo_shifter_arch of sipo_shifter is
    begin
        process(clk)
            begin
                if clear = '1' then
                    Q <= "0000";
                elsif(CLK'event and CLK = '1') then
                    Q(3 downto 1) <= Q(2 downto 0);
                    Q(0) <= Input_Data;
                end if;
        end process;
end architecture sipo_shifter_arch;