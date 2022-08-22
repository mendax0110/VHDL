-------------------------------------------------------
-------------------------data array--------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity data_array is
    port(   --Inputs--
            clk, wren   : in std_logic;
            address     : in std_logic_vector(5 downto 0);
            wrdata      : in std_logic_vector(31 downto 0);
            --Outputs--
            data        : out std_logic_vector(31 downto 0));
end entity data_array;

--architecure definitions--
architecture data_array_arch of data_array is

    component data_array is
            port(   --Inputs--
                    clk, wren   : in std_logic;
                    address     : in std_logic_vector(5 downto 0);
                    wrdata      : in std_logic_vector(63 downto 0);
                    data        : in std_logic_vector(63 downto 0));
    end component data_array;
    
    type data_array_data is array(63 downto 0) of std_logic_vector(31 downto 0);
    signal data_array : data_array_data;

    begin
        data <= data_array(to_integer(unsigned(address)));
        process(clk)
        begin
            if(wren = '1') then
                data_array(to_integer(unsigned(address))) <= wrdata;
            end if;
        end process;

end architecture data_array_arch;