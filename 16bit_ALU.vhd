library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(   inputs:
            R, S            : in unsigned(15 downto 0);         --operands
            I               : in std_logic_vector(5 downto 3);  --operations
            cin, clk, ce    : in std_logic; 	                --carry in, clock, CE-input
            
            outputs:
            cout, sign, zero: out std_logic;                    --carry in, sign, zero flag
            F               : out unsigned(15 downto 0)         --result
        );
end entity;

architecture calculation of alu is

    signal F_i : unsigned(16 downto 0) := "00000000000000000";
    --internal signal for calculation
    --is assigned to F-Output and carry-flag with concurrent statement

    begin
    --concurrent statements

    sign <= F_i(15);
    --sign-flag is determined by bit 15 of the result -> sign bit

    zero <= '1' when F_i(15 downto 0) = "00000000000000000" else '0';
    --only setting zero flag if result is zero, so all bits of F have to be 0

    F    <= F_i(15 downto 0);
    --bits 15 downto 0 will be the result

    cout <= F_i(16);
    --bit 16 of F_i is the carry-flag

    --processes
    process(clk) is
        begin
            if rising_edge(clk) and ce = '1' then
            --clk is the clock, ce determines if the alu should be active
                case I is
                        --determining operation
                        --concatenating first when using arimethic calculations
                        --when using logical operations, the carr-flag is always 0

                        when "000" =>                                   --ADD
                            if cin = '1' then F_i <= ('0' & R) + ('0' & S) + 1;
                            else              F_i <= ('0' & R) + ('0' & S);
                            end if;
                        
                        when "001" =>                                   --SUBR
                            if cin = '1' then F_i <= ('0' & S) - ('0' & R);
                            else              F_i <= ('0' & S) - ('0' & R) - 1;
                            end if;
                        
                        when "010" =>                                   --SUBS
                            if cin = '1' then F_i <= ('0' & R) - ('0' & S);
                            else              F_i <= ('0' & R) - ('0' & S) - 1;
                            end if;

                        --concatention happening after caluculation because carry flag is impossible to reach
                        when "011" => F_i <= '0' & (R or S);        --OR
                        when "100" => F_i <= '0' & (R and S);       --and
                        when "101" => F_i <= '0' & (not R and S);   --NOTRS
                        when "110" => F_i <= '0' & (R xor S);       --XOR
                        when "111" => F_i <= '0' & (R xnor S);      --XNOR
                        when others =>
                end case;
            end if;
    end process;
end architecture;
                        
