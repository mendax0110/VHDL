-----------------------------------------------------------
---------------SHIFT REGISTER IN VHDL----------------------
-----------------------------------------------------------
library IEEE;
use library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity shift_register is
    port(   --Inputs--
            d   : in std_logic;
            clk : in std_logic;
            --Outputs--
            q   : out std_logic);
end entity shift_register;

--architecture definitions--
architecture shift_register_arch of shift_register is

    --signal definitions--
    signal internal_state : std_logic_vector(4 downto 0);

    begin

        q <= internal_state(4);

        process(clk)
            begin
                if(rising_edge(clk)) then
                    internal_state <= internal_state(3 downto 0) & d;
                end if;
        end process;

end architecture shift_register_arch;
