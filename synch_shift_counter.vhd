----------------------------------------------------------
------------------Synchronous shift Couter----------------
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity SSC is
    port(   --Inputs--
            CLK     : in std_logic;
            Reset   : in std_logic;
            --Outputs--
            Count   : out std_logic_vector(3 downto 0));
end entity SSC;

--architecture definition--
architecture SSC_arch of SSC is

    begin
        process(CLK, Reset)
        variable temp : std_logic_vector(3 downto 0);
            begin
                if(Reset = '1') then
                    temp := "0000"
                elsif(CLK'event and CLK = '1') then
                    temp := temp + '1';
                end if;
                count <= temp;
        end process;

end architecture SSC_arch;