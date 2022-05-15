------------------------------------------------
---------------2 bit Comparator-----------------
------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic.unsigned.all;

--entity declararion--
entity two_bit_comp is
    port(   --Inputs--
            a       : in std_logic_vector(1 downto 0);
            b       : in std_logic_vector(1 downto 0);
            --Outputs--
            greater : out std_logic;
            lesser  : out std_logic;
            equal   : out std_logic);
end entity two_bit_comp;

--architecture declaration--
architecture two_bit_comp_arch of two_bit_comp is

    begin
        process(a,b)
        begin
            greater <= '0';
            lesser  <= '0';
            equal   <= '0';

            if a > b then
                greater <= '1';
            elsif b > a then
                lesser <= '1';
            else
                equal <= '1';
            end if;
        end process;
    
end architecture two_bit_comp_arch;
