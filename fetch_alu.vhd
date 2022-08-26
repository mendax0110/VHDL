-------------------------------------------------------------------------------------------
--------------------------FETCH-ARITHMETIC-LOGIC-UNIT IN VHDL------------------------------
-------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

--entity declaration--
entity fetch is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            ctrl        : in std_logic;
            pc_in       : in std_logic_vector(7 downto 0);
            --Outputs--
            pc_out      : out std_logic_vector(15 downto 0);
            instruction : out std_logic_vector(15 downto 0);
            clk_out     : out std_logic);
end entity fetch;

--architecture declaration--
architecture fetch_arch of fetch is

    --signals declaration--
    signal pcout : std_logic_vector(7 downto 0);

    --component declaration--
    component program_counter is
        port(   --Inputs--
                clk     : in std_logic;
                pc_in   : in std_logic_vector(7 downto 0);
                rst_bar : in std_logic;
                pc_ctr1 : in std_logic;
                --Outputs-- 
                pc_out  : out std_logic_vector(7 downto 0);
                clk_out : out std_logic);
    end component program_counter;

    --component declaration--
    component instruction_memory is
        port(   --Inputs--
                pc  : in std_logic_vector(7 downto 0);
                --Outputs--
                inst : out std_logic_vector(15 downto 0));
    end component instruction_memory;

    begin
        p_c : program_counter port map(clk, pc_in, rst, ctrl, pcout, clk_out);
        i_m : instruction_memory port map(pcout, inst);
        pc_out <= pcout;

end architecture fetch_arch;
