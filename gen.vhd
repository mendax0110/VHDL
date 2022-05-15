----------------------------------------------------
-------------------gen in vhdl----------------------
----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity gen is
    port(   --Inputs--
            clk     : in std_logic;
            rst     : in std_logic;
            a_i     : in std_ulogic_vector(3 downto 0);
            b_i     : in std_ulogic_vector(3 downto 0);
            --Outputs--
            c_o     : out std_ulogic_vector(4 downto 0));
end entity gen;

--architecure definitions--
architecture gen_arch of gen is

    begin
        name: process(clk, rst) is
            begin
                if rst = '1' then
                    c_o <= (others => '0');
                elsif rising_edge(clk) then
                    c_o <= std_ulogic_vector(unsigned('0' & a_i) + unsigned('0' & b_i));
                end if;
        end process;

end architecture gen_arch;
