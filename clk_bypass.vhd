-------------------------------------------------------
---------------clock bypass in vhdl--------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity clock_generator is
    generic(
        CLK_INPUT_HZ    : positive := 50000000;
        CLK_OUTPUT_HZ   : positive := 50000000;
    );

    port(   --Inputs--
            ext_clk         : in std_logic;
            pll_rst_in      : in std_logic;
            --Outputs--
            pll_clk_out     : out std_logic;
            pll_locked_out  : out std_logic);
end entity clock_generator;

--architecture definitions--
architecture bypass of clock_generator is

    begin
        assert CLK_INPUT_HZ <= CLK_OUTPUT_HZ severity FAILURE;

        pll_locked_out <= pll_rst_in;
        pll_clk_out    <= ext_clk;

end architecture bypass;