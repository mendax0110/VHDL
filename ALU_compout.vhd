-----------------------------------------------------------
--------------------ALU-COMPOUT IN VHDL--------------------
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.cpu_lib.all;

--entity declarations--
entity alu_comp is
    port(   --Inputs--
            a       : in bit16;
            b       : in bit16;
            --Outputs--
            compout : out std_logic);
end entity alu_comp;

--architecture declarations--
architecture alu_comp_arch of alu_comp is

    begin
        --Processing--
        compproc : process(a, b, sel)
            begin
                case sel is
                    when eq =>
                        if a = b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                    when neq =>
                        if a /= b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                    when gt =>
                        if a > b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                    when gte =>
                        if a >= b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                    when lt =>
                        if a < b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                    when lte =>
                        if a <= b then
                            compout <= '1' after 1 ns;
                        else
                            compout <= '0' after 1 ns;
                        end if;
                end case;
        end process;
    
end architecture alu_comp_arch;
                            