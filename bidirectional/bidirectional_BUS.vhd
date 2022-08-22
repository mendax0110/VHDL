---------------------------------------------------------------------------------
----------------------------BIDIRECTIONAL-BUS IN VHDL----------------------------
---------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity bidir is
    port(   --Inputs--
            bidir   : in std_logic_vector(7 downto 0);
            oe      : in std_logic;
            clk     : in std_logic;
            inp     : in std_logic_vector(7 downto 0);
            --Outputs--
            out     : out std_logic_vector(7 downto 0));
end entity bidir;

--architecture declaration--
architecture maxpld of bidir is

    --Signals declaration--
    signal a : std_logic_vector(7 downto 0);
    signal b : std_logic_vector(7 downto 0);

        begin
            --process declaration--
            process(clk)
                begin
                    if clk = '1' and clk'EVENT then
                        a <= inp;
                        coutp <= b;
                    end if;
            end process;

            process(oe, bidir)
                begin
                    if(oe = '1') then
                        bdir <= "ZZZZZZZZ"
                        b <= bdir;
                    else
                        bdir <= a;
                        b <= bdir;
                    end if;
            end process;

end architecture maxpld;