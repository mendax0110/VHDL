-------------------------------------------------------------------------------
-------------------------SIMPLE ROM FOR TESTBENCH IN VHDL----------------------
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity rom is
    port(   --Inputs--
            clk         : in std_logic;
            address     : in std_logic_vector(3 downto 0);
            --Outputs--
            data_out    : out std_logic_vector(7 downto 0));
end entity rom;

--architecture definitions--
architecture rom_arch of rom is

    type romtype is array(0 to 15) of std_logic_vector(7 downto 0);

    --signal definitions--
    signal memory_ram : romtype := (
        X"00", X"01", X"02", X"03", X"04", X"05", X"06", X"07",
        X"08", X"09", X"0A", X"0B", X"0C", X"0D", X"0E", X"0F"
    );

    begin
        --process definitions--
        process(clk)
        begin
            if(rising_edge(clk)) then
                data_out <= memory_ram(to_integer(unsigend(address)));
            end if;
        end process;

end architecture rom_type;
