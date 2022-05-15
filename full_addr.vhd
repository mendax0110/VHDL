-----------------------------------------------------------
------------------FULL ADDER IN VHDL-----------------------
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity delcarations--
entity FULL_ADDER is
    port(   --Inputs--
            A, B, CIN   : in bit;
            --Outputs--
            SUM, COUT   : out bit);
end entity FULL_ADDER;

--architecure definitions--
architecture FULL_ADDER_ARCH of FULL_ADDER is

    --define components--
    component HALF_ADDER
        port(   --Inputs--
                A, B        : in bit;
                --Outputs--
                SUM, CARRY  : out bit);
    end component;

    --signal definitions--
    signal U0_CARRY, U0_SUM, U1_CARRY : bit;

    begin
        U0: HALF_ADDER port map(A => A,         B => B,     SUM => U0_SUM,  CARRY => U0_CARRY);
        U1: HALF_ADDER port map(A => U0_SUM,    B => CIN,   SUM => SUM,     CARRY => U1_CARRY);

        COUT <= U0_CARRY or U1_CARRY;

end architecture FULL_ADDER_ARCH;