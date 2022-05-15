---------------------------------------------------------------
--------------------SIMPLE SR-LATCH IN VHDL--------------------
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity sr_latch is
    port(   --Inputs--
            s_in, r_in          : in std_logic;
            --Outputs--
            q_out, q_out_not    : inout std_logic);
end entity sr_latch;

--architecture definitions--
architecture sr_latch_arch of sr_latch is

    begin
        DUT : process(s_in, r_in, q_out, q_out_not)
        begin
            q_out       <= q_not_our nor r_in;
            q_not_out   <= q_out nor s_in;
        end process;

end architecture sr_latch_arch;