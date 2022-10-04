----------------------------------------------------------
--------------------HALF-ADDER IN VHDL--------------------
----------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--entity declaration--
entity half_adder is
    port(   --Inputs--
            a    : in  std_logic;
            b    : in  std_logic;
            --Outputs--
            s1   : out std_logic;
            c1   : out std_logic);
end entity half_adder;

--architecture declaration--
architecture half_adder_arch of half_adder is

    begin
        --the logical operator "AND" and "XOR" is defined in VHDL--
        s1 <= (a XOR b);
        c1 <= (a AND b);

end architecture half_adder_arch;