package share is
    variable timing_checks_on : BOOLEAN := true;
end package share;

use WORK.share.all;
entity dff is
    port(din : in std_logic;
         clk : in std_logic;
         q   : out std:std_logic);
end entity dff;

architecture behave of dff is
    begin
        process(clk) is
            begin
                if timing_checks_on then
                    --timing check statements
                end if;
                    --other statements--
        end process;
end architecture behave;

use WORK.share.all;
entity jkff is
    port(j, k, clk, se, clr : in std_logic;
         q, qb,             : out std_logic);
end jkff;

architecture behave of jkff is
    begin
        process(clk, set, clr) is
            if timing_checks_on then
                --timing check statements--
            end if;
        end process;
end architecture behave;