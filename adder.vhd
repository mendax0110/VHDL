------------------------------------------------------
---------------SIMPLE ADDER IN VHDL-------------------
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity adder is
    generic(
        WIDTH : positive := 8
    );
    port(   --Inputs--
            input1  : in std_logic_vector(WIDTH-1 downto 0);
            input2  : in std_logic_vector(WIDTH-1 downto 0);
            c_in    : in std_logic;
            --Outputs--
            output  : out std_logic_vector(WIDTH-1 downto 0);
            c_out   : out std_logic);
end entity adder;

--architecure definitons--
architecture adder_arch of adder is
    
    --signal definitons--
    signal full_sum : std_logic_vector(WIDTH downto 0);
    signal c_in_vec : std_logic_vector(0 downto 0);

    begin
        c_in_vec(0) <= c_in;
        full_sum <= std_logic_vector(resize(unsigned(input1), WIDTH+1) + resize(unsigned(input2), WIDTH+1) + resize(unsigned(c_in_vec), WIDTH+1));
        output <= full_sum(WIDTH-1 downto 0);
        c_out <= full_sum(WIDTH);
    
end architecture adder_arch;