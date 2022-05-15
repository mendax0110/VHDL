--------------------------------------------------------
--------------SIMPLE MEMORY IN VHDL---------------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity MEMORY is
    port(   --Inputs--
            clk     : in std_logic;
            rst     : in std_logic;
            --Outputs--
            en      : out std_logic_vector(2 downto 0);
            display : out std_logic_vector(7 downto 0));
end entity MEMORY;

--architecture defintion--
architecture MEMORY_arch of MEMORY is

    --signal declarations--
    signal i: integer range 0 to 3;

    type byte is array(7 downto 0) of std_logic;
    type MEMORY is array(0 to 15) of byte;

    signal data: MEMORY;

    begin
        en <= "110";
        process(clk,rst)
        begin
            if rst = '0' then
                for i in 0 to 3 loop
                    MEM(i) <= "00000000";
                end loop;
            elsif(rising_edge(clk)) then
                MEM(3) <= "00000001";
                for i in 0 to 2 loop
                    MEM(i) <= MEM(i+1);
                end loop;
                display <= std_logic_vector(MEM(0));
            end if;
        end process;

end architecture MEMROY_arch;
