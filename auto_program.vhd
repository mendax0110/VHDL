use library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
    port(   d, clk : in std_logic;
                 q : out std_logic);

    function rising_edge(signal s : std_logic)  -- line 1
        return boolean is
        begin
            -- this function makes use of attributes
            --'event and 'last_value discussed
            if (s'event) and (s = '1') and
               (s'last_value = '0') then
                return true;
            else
                return false;
            end if;
    end rising_edge;
end dff;

architecture behave of dff is
    begin
        process(clk)
            begin
                if rising_edge(clk) then
                    q <= d;
                end if;
        end process;
end behave;
