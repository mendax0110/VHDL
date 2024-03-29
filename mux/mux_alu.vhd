---------------------------------------------------------------------------
---------------MULTIPLEXER-ARITHMETIC-LOGIC-UNIT-IN VHDL-------------------
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity MUX_2_1 is
    port(   --Inputs--
            Ry      : in std_logic_vector(7 downto 0) := (others => '0');
            IM      : in std_logic_vector(7 downto 0) := (others => '0');
            SEL     : in std_logic := '0';
            --Outputs--
            To_ALU  : out std_logic_vector(7 downto 0) := (others => '0'));
end entity MUX_2_1;

--architecture declaration--
architecture MUX_2_1_arch of MUX_2_1 is

    begin
        --process declaration--
        proc_mux : process(Ry, IM, SEL)
            begin
                if(SEL = '0') then
                    To_ALU <= Ry;
                elsif(SEL = '1') then
                    To_ALU <= IM;
                end if;
        end process proc_mux;

end architecture mux_2_1_arch;