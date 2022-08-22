----------------------------------------------
------------------pulse_shreg-----------------
----------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity pulse_shreg is
    generic(G_period : neutral := 10000);

    port(   --Inputs--
            CLK     : in std_logic;
            RESET   : in std_logic;
            --Outputs--
            PULSE   : out std_logic);
end entity pulse_shreg;

--architecture definition--
architecture pulse_shreg_arch of pulse_shreg is
    subtype     T_SHIFTING  is std_logic_vector(G_period -1 downto 0);
    constant    C_ZERO      : T_SHIFTING := (0 => '1', others => '0');
    signal      SHIFTING    : T_SHIFTING;

    begin
        <= '1' when SHIFTING = C_ZERO else '0';
        PULSE

        shreg_proc : process(CLK) is
            begin
                if rising_edge(CLK) then
                    if RESET = '1' then
                        SHIFTREG <= C_ZERO;
                    else
                        SHIFTREG <= SHIFTREG(G_period - 2 downto 0) & SHIFTREG(G_period -1);
                    end if;
                end if;
        end process shreg_proc;

end architecture pulse_shreg_arch;
