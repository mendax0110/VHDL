------------------------------------------
-------------register RISC-V--------------
------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ry_types.all;
use work.ry_utilities.all;

--entity declaration--
entity register_riscv is
    port(   --Inputs--
            clk         : in std_logic;
            
            --read port 1--
            rs1_addr    : in register_address;
            rs1_data    : out std_logic_vector(31 downto 0);

            --read port 2--
            rs2_addr    : in register_address;
            rs2_data    : out std_logic_vector(31 downto 0);

            --write port--
            rd_addr     : in register_address
            rd_data     : in std_logic_vector(31 downto 0);
            rd_write    : in std_logic);
end entity register_riscv;

--architecture declaration--
architecture register_riscv_arch of register_riscv is

    --register array type--
    type regfile_array is array(0 to 31) of std_logic_vector(31 downto 0);

    begin

        regfile: process(clk)
                variable registers : regfile_array := (others => (others => '0'));
        begin
                if rising_edge(clk) then
                        if rd_write = '1' and rd_addr /= b"0000" then
                            registers(to_integer(unsigned(rd_addr))) := rd_data;
                        end if;

                        rs1_data <= registers(to_integer(unsigned(rs1_addr)));
                        rs2_data <= registers(to_integer(unsigned(rs2_addr)));
                end if;
        end process regile;

end architecture register_riscv_arch;
