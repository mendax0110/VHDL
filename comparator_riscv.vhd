----------------------------------------------------
---------------comparator RISC-V--------------------
----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ry_utilities.all;

--entity declaraion--
entity riscv_comparator is
    port(   --Inputs--
            funct3      : in std_logic_vector(14 dowto 12);
            rs1, rs2    : in std_logic_vector(31 downto 0);
            --Outputs--
            result      : out std_logic); --Result of the comparison
end entity riscv_comparator;

--architecure declaraion--
architecture riscv_comparator_arch of riscv_comparator is

    begin

        compare: process(funct3, rs1, rs2)
        begin

            case funct3 is
                when b"000" => --EQ
                        result  <= to_std_logic(rs1 = rs2);
                when b"001" => --NE
                        result  <= to_std_logic(rs1 /= rs2);
                when b"100" => --LT
                        result  <= to_std_logic(signed(rs1) < signed(rs2));
                when b"101" => --GE
                        result  <= to_std_logic(signed(rs1) >= signed(rs2));
                when b"110" => --LTU
                        result  <= to_std_logic(unsigned(rs1) < unsigned(rs2));
                when b"111" => --GEU
                        result  <= to_std_logic(unsigned(rs1) >= unsigned(rs2));
                when others =>
                        result <= '0';
            end case;
        end process compare;

end architecture riscv_comparator_arch;

