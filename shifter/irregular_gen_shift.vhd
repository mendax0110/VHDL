---------------------------------------------------------
---------------IRREGULAR-GEN-SHIFT IN VHDL---------------
---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity shift is
    generic(len : integer);
    port(   --Inputs--
            a   : in std_logic;
            clk : in std_logic;
            --Outputs--
            b   : out std_logic);
end entity shift;

--architecture definitions--
architecture if_shift_arch of if_shift is

    component dff
        port(   --Inputs--
                d   : in std_logic;
                clk : in std_logic;
                --Outputs--
                q   : out std_logic);
    end component dff;

    signal z : std_logic_vector(1 to (len-1));
        begin
            g1 : for 1 in 0 to (len -1) generate
                if i = 0 generate
                    dffx : dff port map(a, clk, z(i + 1));
                end generate;

                if i = (len -1) generate
                    dffx : port map(z(i), clk, b);
                end generate;

                if(i > 0) and i < (len -1) generate
                    dffx : port map(z(i), clk, z(i + 1));
                end generate;
            end generate;

end architecture if_shift_arch;