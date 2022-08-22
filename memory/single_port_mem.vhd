--------------------------------------------------------
---------------SINGLE-PORT-MEMORY IN VHDL---------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity single_port_mem is
    port(   --Inputs/Outputs--
            clk     : in std_logic;
            
            data_io : inout std_logic_vector(15 downto 0);
            address : in std_logic_vector(9 downto 0);
            wr_en   : in std_logic;
            rd      : in std_logic);
end entity single_port_mem;

--architecutre declaration--
architecture single_port_mem_arch of single_port_mem is

    --2D array type for the RAM--
    type array_1kx16 is array(1023 downto 0) of
                        std_logic_vector(15 downto 0);

    --declare the RAM--
    signal ram : array_1kx16;

    --intermediate RAM output--
    signal dat_out      : std_logic_vector(15 downto 0);
    signal rd_dl        : std_logic;

    begin

        process(clk)
        begin
            if rising_edge(clk) then

                --writes--
                if (wr_en = '1') then
                    ram(to_integer(unsigned(address))) <= data_io;
                end if;

                --reads--
                dat_out <= ram(to_integer(unsigned(address)));
                rd_dl <= rd;
            
            end if;
        end process;
        
        dat_io <= dat_out when rd_dl = '1'  "ZZZZZZZZZZZZZZZZ";

end architecture single_port_mem_arch;

