------------------------------------------------
-------------------IR IN VHDL-------------------
------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declarations--
entity IR is
    port(   --Inputs--
            clk4    : in std_logic;
            reset   : in std_logic;
            load    : in std_logic;
            INPUT   : in std_logic_vector(15 downto 0);
            --Outputs--
            OUTPUT  : out std_logic_vector(15 downto 0));
end entity IR;

--architecture definitions--
architecture IR_arch of IR is

    begin
        process(INPUT, load, reset)
        begin
            if(reset = '1') then
                OUTPUT <= "0000000000000000";
            elsif(load = '1') then
                OUTPUT <= INPUT;
            end if;
        end process;

end architecture IR_arch;
