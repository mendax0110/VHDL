-------------------------------------------------------------------
---------------------MULTIPLEXER 4 x 1 IN VHDL---------------------
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaraions--
entity mux4x1 is
    port(   --Inputs--
            a   : in std_logic;
            b   : in std_logic;
            c   : in std_logic;
            sel : in std_logic_vector(1 downto 0);
            --Outputs--
            o   : out std_logic);
end entity mux4x1;

--architecture definitions--
architecture mux4x1_arch of mux4x1 is

    begin
        with sel select o <=
            s when "00",
            b when "01",
            c when "11",
            'X' when others;

end architecture mux4x1_arch;