-----------------------------------------------------------------------------------
---------------------SIMPLE PARITY GENERATOR IN VHDL-------------------------------
-----------------------------------------------------------------------------------
library library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity parity_gen is
    generic(
        length_g : integer   := 8;
        parity_g : std_logic := '0';    -- '0' for even, '1' for odd parity--
    );
    port(   --Inputs--
            data_in     : in std_logic_vector(length_g-1 downto 0);
            --Outputs--
            parity_out  : out std_logic);
end entity parity_gen;

--architecture definitions--
architecture parity_gen_arch of parity_gen is

    begin
        DUT : process(data_in)
            variable result : std_logic;

        begin
            result := partiy_g;
            for i in data_in'range loop
                result := result xor data_in(i);
            end loop;
            parity_out <= result;
        end process;

end architecture parity_gen_arch;