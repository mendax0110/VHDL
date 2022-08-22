library IEEE;                   --declare which vhdl library
use IEEE.std_logic_1164.all;    --and packages to use
use IEEE.std_logic_unsigned.all;--for +, - operators

--entity declaration
entity alu is
    port(
            a,b     : in std_logic_vector(7 downto 0);
            cin     : in std_logic;
            opcode  : in std_logic_vector(3 downto 0);
            y       : out std_logic_vector(7 downto 0));
end alu;

--architecture body
architecture alu_arch of alu is
    signal y_logical : std_logic_vector(7 downto 0);
    signal x_arith   : std_logic_vector(7 downto 0);

        begin
        with opcode(2 downto 0) select
            y_logical <= not a when "000",
                         not b when "001",
                            a and b when "010",
                            a or b when "011",
                            a nand b when "100",
                            a xor b when "101",
                            a xnor b when others;

        with opcode(2 downto 0) select
            y_arith  <=  a when "000",
                            b when "001",
                            a + 1 when "010",
                            b + 1 when "011",
                            a - 1 when "100",
                            a + b when "110",
                            a + b + cin when others;

        with opcode(3)              select
            y       <=  y_logical when '0',
                        y_arith   when others;
end alu;
