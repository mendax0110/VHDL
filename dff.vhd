--------------------------------------------
-----------------DFF IN VHDL-----------------
--------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic.arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity DFF is
    port(   --Inputs--
            D   : in  std_logic;
            CLK : in  std_logic;
            --Outputs--
            Q   : out std_logic;
            Qb  : out std_logic);
end entity DFF;

--architecture declaration--
architecture DFF_arch of DFF is

    --signal declaration--
    signal Q : std_logic;

    begin
        --process declaration--
        process(CLK)
        begin
            if (CLK'event and CLK = '1') then
                Q <= D;
            end if;
        end process;

end architecture DFF_arch;
