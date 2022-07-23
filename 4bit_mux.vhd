--------------------------------------------------------
----------------4-BIT-MULTIPLEXER IN VHDL---------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity fourbit_mux is
    port(   --Inputs--
            Ry      : in std_logic_vector(7 downto 0) := (others => '0');
            IM      : in std_logic_vector(7 downto 0) := (others => '0');
            SEL     : in std_logic := '0';
            --Outputs--
            To_ALU  : out std_logic_vector(7 downto 0) := (others => '0'));
end entity fourbit_mux;

--architecture declarations--
architecture fourbit_mux_arch of fourbit_mux is

    begin
        --process declarations--
        proc_fourbit_mux : process(Ry, IM, SEL)
            begin
                if(SEL = '0') then
                    To_ALU <= Ry;
                elsif(SEL = '1') then
                    To_ALU <= IM;
                end if;
        end process proc_fourbit_mux;

end architecture fourbit_mux_arch;