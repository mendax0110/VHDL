library IEEE;
use IEEE.std_logic_1164.all;

entity shift is
    generic(len : integer);
    port(a, clk : in std_logic;
            b   : out std_logic);
end shift;

architecture if_shift of shift is
    component dff
        port(d, clk : in std_logic;
                q   : out std_logic);
    end component;

    signal z : std_logic_vector(1 to (len -1));
        begin
            g1 : for 1 in 0 to (len -1) generate
                if i = 0 generate
                    dffx : dff port map(a, clk, z(i + 1));
                end generate;

                if i = (len -1) generate
                    dffx : port map(z(i), clk, b);
                end generate;

                if ( i > 0) and i < (len -1) generate
                    dffx : port map (z(i), clk, z(i + 1));
                end generate;
        end generate;
end if_shift;

