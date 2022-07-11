--------------------------------------------------------
----------------PARALLEL-SHIFTER IN VHDL----------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity parallel_shifter is
entity pipo is
    port(   --Inputs--
            clk     : in std_logic;
            D       : in std_logic_vector(3 downto 0);
            --Outputs--
            Q       : out std_logic_vector(3 downto 0));
end entity pipo;

--architecture rtl of parallel_shifter is
architecture pipo_arch of pipo is

    begin
        --process(clk)--
        process(clk)
            begin
                if(CLK'event and CLK = '1') then
                    Q <= D;
                end if;
        end process;

end architecture pipo_arch;