---------------------------------------------
------------------dp ram---------------------
---------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity dpram is
    port(   --Inputs--
            data_in_a   : in std_logic_vector(7 downto 0);
            data_in_b   : in std_logic_vector(7 downto 0);
            rw_a        : in std_logic;
            rw_b        : in std_logic;
            clk         : in std_logic;
            address_a   : in std_logic_vector(9 downto 0);
            address_b   : in std_logic_vector(9 downto 0);
            data_out_a  : out std_logic_vector(7 downto 0);
            data_out_b  : out std_logic_vector(7 downto 0));
end entity dpram;

--architecture declaraion--
architecture dpram_arch of dpram is

    type ramtype is array(0 to 1023) of std_logic_vector(7 downto 0);

    signal memory_ram : ramtype;

    begin

        input_a : process(clk)
        begin
            if rising_edge(clk) then
                    if rw_a = '1' then
                            memory_ram(to_integer(unsigned(address_a))) <= data_in_a;
            end if;
                    if rw_b = '1' then
                            memory_ram(to_integer(unsigned(address_b))) <= data_in_b;
                    end if;
                    data_out_b <= memory_ram(to_integer(unsigned(address_n)));
                    data_out_a <= memory_ram(to_integer(unsigned(address_b)));
            end if;
        end process;

end architecture dpram_arch;
