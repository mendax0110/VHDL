library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

--entity declaration--
entity fetch is
    port(   clk         : in std_logic;
            rst         : in std_logic;
            ctrl        : in std_logic;
            pc_in       : in std_logic_vector(7 downto 0);
            pc_out      : out std_logic_vector(15 downto 0);
            instruction : out std_logic_vector(15 downto 0);
            clk_out     : out std_logic);
end fetch;

--architecture body declaration--
architecture arch_fetch of fetch is

    signal pcout : std_logic_vector(7 downto 0);

    --compnent declaration--
        component program_counter is
            port(   clk     : in std_logic;
                    pc_in   : in std_logic_vector(7 downto 0);
                    rst_bar : in std_logic; --active low reset signal
                    pc_ctr1 : in std_logic;
                    pc_out  : out std_logic_vector(7 downto 0);
                    clk_out : out std_logic);
        end component program_counter;

        component instruction_memory is
            port( pc    : in std_logic_vector(7 downto 0);
            instruction : out std_logic_vector(15 downto 0));
        end component instruction_memory;

    begin --architecture starts here
    p_c : program_counter port map(clk, pc_in, rst, ctrl, pcout, clk_out);
    i_m : instruction_memory port map(pcout, instruction);
    pc_out <= pcout;
end architecture arch_fetch; --architecture ends here
