--------------------------------------------------
-------------------------lfsr---------------------
--------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity lfsr is
    generic(
                lfsrLen  : Integer := <lfsrLen>;
                lfsrIter : Integer := <lfsrIter>); 

    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            en      : in std_logic;
            seedIn  : in std_logic_vector((lfsrLen - 1) downto 0);
            --Outputs--
            rndOut  : out std_logic_vector((lfsrIter - 1) downto 0));
end entity lfsr;

--architecture definition--
architecture lfsr_arch of lfsr is
    signal sr : std_logic_vector((lfsrLen - 1) downto 0) := (others => '0');
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if reset = '1' then
                    sr <= seedIn;
                else
                    if en = '1' then
                        <xorList>
                    end if;
                end if;
            end if;
        end process;

        rndOut <= sr((lfsrIter - 1) downto 0);
end architecture lfsr_arch;