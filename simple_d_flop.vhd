---------------------------------------------------------------------------
---------------------------SIMPLE D-FLOP IN VHDL---------------------------
---------------------------------------------------------------------------
library library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity simple_dflop is
    port(   --Inputs--
            clk     : in std_logic;
            in_1    : in std_logic;
            --Outputs--
            out_1   : out std_logic);
end entity simple_dflop;

--architecture definitions--
architecture simple_dflop_arch of simple_dflop is

    begin
        ---------------Design Implementation---------------

        Reg_Proc: process(clk)
        begin
            if rising_edge(clk) then
                out_1 <= in_1;
            end if;
        end process;

end architecture simple_dflop_arch;