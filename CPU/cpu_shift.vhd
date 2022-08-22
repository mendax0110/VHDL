-----------------------------------------------------
------------------CPU-SHIFT IN VHDL------------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.cpu_lib.all;

--entity declarations--
entity cpu_shift is
    port(   --Inputs--
            a   : in bit16;
            sel : in t_cpu_shift;
            --Outputs--
            y   : out bit16);
end entity cpu_shift;

--architecture definitions--
architecture cpu_shift_arch of cpu_shift is

    begin
        shftproc : process(a, sel)
        begin
            case sel is
                when shftpass =>
                    y <= a after 1 ns;
                when shl =>
                    y <= a(14 downto 0) & '0' after 1 ns;
                when shr =>
                    y <= '0' & a(15 downto 1) after 1 ns;
                when rotl =>
                    y <= a(14 downto 0) & a(15) after 1 ns;
                when rotr =>
                    y <= a(0) & a(15 downto 1) after 1 ns;
            end case;
        end process shftproc;
    
end architecture cpu_shift_arch;
