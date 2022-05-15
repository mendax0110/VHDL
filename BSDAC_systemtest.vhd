-----------------------------------------------------------------------------------
-------------bit stream digital-analog-comparator systemstest----------------------
-----------------------------------------------------------------------------------
library IEEE; 
library lpm;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use lpm.lpm_components.all;

--entity declarations--
entity BSDAC_systemtest is
    port(   --Inputs--
            clk     : in std_logic;
            --Outputs--
            bit_out : out std_logic);
end entity BSDAC_systemtest;

--architecure definitions--
architecture BSDAC_systemtest_arch of BSDAC_systemtest is

    --component definitions--
    component bitstreamdac is
        port(   --Inputs--
                clk     : in std_logic;
                data_in : in std_logic_vector(15 downto 0);
                --Outputs--
                bit_out : out std_logic);
    end component bitstreamdac;

    --signal definiions--
    signal ctr : std_logic_vector(15 downto 0);
    begin
        --all components of the circuit--
        accum1: bitstreamdac
            port map(
                clk => clk,
                data_in => ctr,
                bit_out => bit_out
            );

        clocked: process(clk)
        begin
            if rising_edge(clk) then
                ctr <= ctr + 1;
            end if;
        end process;

end architecture BSDAC_systemtest_arch;
