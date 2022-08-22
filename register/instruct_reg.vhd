----------------------------------------------------------------
------------------INSTRUCTION REGISTER IN VHDL------------------
----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity instruct_reg is
    port(   --Inputs--
            clk         : in std_logic;
            data_in     : in std_logic_vector(7 downto 0);
            load        : in std_logic;
            --Outputs--
            data_out    : out std_logic_vector(7 downto 0));
end entity instruct_reg;

--architecure definitions--
architecture instruct_reg_arch of instruct_reg is

    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if load = '1' then
                    data_out <= data_in;
                end if;
            end if;
        end process;

end architecture instruct_reg_arch;