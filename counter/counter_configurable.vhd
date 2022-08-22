--Description:
--Up and Down Counter with configurable
-- width and overflow value(via generics)

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity count_updown is
    generic(n   :natural := 6;
        ov_value : unsigned := to_unsigned(59,6));

        port( clock     :   in std_logic;
              reset_n   :   in std_logic;
              cntup     :   in std_logic;
              count     :   out std_logic_vector(n-1 downto 0));
end count_updown;

architecture rtl of count_updown is

    --------------------------------
    --SIGNAL & CONSTANT DECLARATIONS
    --------------------------------
        signal next_count : unsigned(n-1 downto 0);
        signal i_count    : unsigned(n-1 downto 0);

begin

    ------------------
    --Register Process
    ------------------
    reg_count : process(reset_n, clock)
    begin
        if(reset_n = '0')then
                i_count <= (OTHERS => '0');
        elsif(clock'event and clock = '1')then
                i_count <= next_count;
        end if;
    end process reg_count;

    --------------
    --Comb Process
    --------------
    comb_count : process(i_count, cntup)
    begin
        --Default Statement
        next_count <= i_count;

        --count down & roll up at zero
        if cntup = '0' then
                    if(i_count = to_unsigned(0,n))then
                            next_count <= ov_value;
                    else
                            next_count <= i_count - 1;
                    end if;

        -- count up & roll down at overflow
        else
                    if(i_count = ov_value)then
                            next_count <= to_unsigned(0,n);
                    else
                            next_count <= i_count + 1;
                    end if;
        end if;
    end process comb_count;

    -------------------------
    --Concurrent assignements
    -------------------------
    count <= std_logic_vector(i_count);

end rtl;

