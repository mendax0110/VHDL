library IEEE;
use IEEE.std_logic_1164.all;

entity bidir is
    port(   bidir   : inout std_logic_vector(7 downto 0);
            oe, clk : in std_logic;
            inp     : in std_logic_vector(7 downto 0);
            outp    : out std_logic_vector(7 downto 0));
end bidir;

architecture maxpld of bidir is

    signal a : std_logic_vector(7 downto 0);
    signal b : std_logic_vector(7 downto 0);

        begin
            process(clk)
                begin
                    if clk = '1' and clk'EVENT then
                        a <= inp;
                        coutp <= b;
                    end if;
            end process;

            process(oe, bidir)
                begin
                    if (oe = '0') then
                        bidir <= "ZZZZZZZZ"
                        b <= bidir;
                    else
                        bidir <= a;
                        b <= bidir;
                    end if;
            end process;
end maxpld;
