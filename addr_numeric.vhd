library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity addr_numeric is
    generic(WIDTH     : positive := 8);
        port(   a     : in std_logic_vector(WIDTH -1 downto 0);
                b     : in std_logic_vector(WIDTH -1 downto 0);
                c_in  : in std_logic;
                sum   : out std_logic_vector(WIDTH -1 downto 0);
                c_out : out std_logic);
end entity addr_numeric;

--architecture declaration--
architecture behavioural of addr_numeric is
    signal full_sum : std_logic_vector(WIDTH downto 0);
    signal c_in_vec : std_logic_vector(0 downto 0);
                    begin
                        c_in_vec(0) <= c_in;
                        full_sum    <= std_logic_vector(resize(unsigned(a), WIDTH +1) + resize(unsigned(b), WIDTH +1) + resize(unsigned(c_in_vec), WIDTH +1));
                        sum         <= full_sum(WIDTH -1 downto 0);
                        c_out       <= full_sum(WIDTH);
end behavioural;
