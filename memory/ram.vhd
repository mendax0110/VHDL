--------------------------------------------------------------
------------------SIMPLE RAM IN VHDL--------------------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity ram is
    port(   --Inputs--
            data_in     : in std_logic_vector(7 downto 0);
            rw          : in std_logic;
            clk         : in std_logic;
            address     : in std_logic_vector(9 downto 0);
            --Outputs--
            data_out    : out std_logic_vector(7 downto 0));
end entity ram;

--architecure definitions--
architecture ram_arch of ram is

    --type declarations--
    type ramtype is array(0 to 123) of std_logic_vector(7 downto 0);

    --signal definitions--
    signal memory_ram : ramtype;

    begin
        process(clk)
        begin
            if(rising_edge(clk)) then
                if rw = '1' then
                    memory_ram(to_integer(unsigned(address))) <= data_in;
                end if;
                    data_out <= memory_ram(to_integer(unsigned(address)));
            end if;
        end process;

end architecture ram_arch;