----------------------------------------------------------
---------------FPtestbench for DES Encrypt----------------
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity FPtest_bench is
end entity FPtest_bench;

--architecture definitions--
architecture FPtest_bench_arch of FPtest_bench is

    component FP
    port(   --Outputs--
            data_out        : out std_logic_vector(64 downto 1);
            --Inputs--
            permut_data_lh  : in std_logic_vector(64 downto 33);
            permut_data_rh  : in std_logic_vector(32 downto 1));
    end component FP;

    signal permut_data_lh : std_logic_vector(64 downto 33) := (others => '0');
    signal permut_data_rh : std_logic_vector(32 downto 1) := (others => '0');
    signal data_out : std_logic_vector(64 downto 1);

    begin
        uut : FP Port map(
            data_out => data_out,
            permut_data_lh => permut_data_lh,
            permut_data_rh => permut_data_rh
        );

    process
    begin
        permut_data_lh <= "01000011010000100011001000110100";
        permut_data_rh <= "00001010010011001101100110010101";
        wait;
    end process;

end architecture FP_DES_arch;