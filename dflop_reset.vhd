library IEEE;
use IEEE.std_logic_1164.all;

--entitiy declaration--
entity dflop_n_reset is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            in_1    : in std_logic;
            --Outputs--
            out_1   : out std_logic);
end entity dflop_n_reset;

--architecture declatation--
architecture dflop_n_reset_arch of dflop_n_reset is
    begin
        Reg_Proc : process (clk, reset)
        begin
            if (reset = '1') then
                out_1 <= '0';
            elsif rising_edge (clk) then
                out_1 <= in_1;
            end if;
    end process;
end architecture dflop_n_reset_arch;