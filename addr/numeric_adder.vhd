----------------------------------------------------------------------------
-------------------A SIMPLE NUMERIC ADDER IN VHDL---------------------------
----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity adder_num is
    generic(
        WIDTH : positive := 8
    );
    port(   --Inputs--
        a       : in std_logic_vector(WIDTH-1 downto 0);
        b       : in std_logic_vector(WIDTH-1 downto 0);
        c_in    : in std_logic;
            --Outputs--
        sum     : out std_logic_vector(WIDTH-1 downto 0);
        c_out   : out std_logic);
end entity adder_num;

--architecture definitions--
architecture adder_num_arch of adder_num is
    
    --signal definitions--
    signal full_sum : std_logic_vector(WIDTH downto 0);
    signal c_in_vec : std_logic_vector(0 downto 0);

    begin
        c_in_vec(0) <= c_in;
        full_sum <= std_logic_vector(resize(unsigned(a), WIDTH+1) + resize(unsigned(b), WIDTH+1) + resize(unsigned(c_in_vec), WIDTH+1));
        sum <= full_sum(WIDTH-1 downto 0);
        c_out <= full_sum(WIDTH);

 end architecture adder_num_arch;