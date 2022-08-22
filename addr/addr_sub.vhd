---------------------------------------------------------------
------------------ADDER SUBSTRACTOR IN VHDL--------------------
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity adder_sub is
    port(   --Inputs--
            a,b     : in std_logic_vector(7 downto 0);
            cin     : in std_logic_vector(0 downto 0);
            add     : in std_logic;
            --Outputs--
            o       : out std_logic_vector(7 downto 0);
            cout    : out std_logic_vector(0 downto 0));
end entity adder_sub;

--architecure definitons--
architecture adder_sub_arch of adder_sub is

    --signal definitions--
    signal internal_sum : unsigned(8 downto 0);

    begin
        internal_sum <= resize(unsigned(a), 9) + resize(unsigned(b), 9) + resize(unsigned(cin), 9) when add = '1' else
                        resize(unsigned(a), 9) - resize(unsigned(b), 9) - resize(unsigned(cin), 9);
                   o <= std_logic_vector(internal_sum(7 downto 0));
                cout <= std_logic_vector(internal_sum(8 downto 0));
                
end architecture adder_sub_arch;