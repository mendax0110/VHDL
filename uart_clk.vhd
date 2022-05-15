------------------------------------------------
--------------------UART CLOCK------------------
------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

--entity declaraion--
entity uart_clk is
    port(   --Inputs--
            clk         : in std_logic;
            reset       : in std_logic;
            --Outputs--
            uart_clk    : out std_logic);
end entity uart_clk;

architecture uart_clk_arch of uart_clk is

    constant NUMERATOR      : std_logic_vector(14 downto 0) := "000010010000000"; --1152;
    constant DENOMINATOR    : std_logic_vector(14 downto 0) := "011110100001001"; --15625;

    signal clk_out : std_logic;                     := '0';
    signal counter : std_logic_vector(14 downto 0)  := (others => '0');

    begin

        uart_clk <= clk_out;

        process(clk, reset)
        begin
            if (reset = '1') then
                clk_out <= '1';
                counter <= DENOMINATOR - NUMERATOR - 1;
            elsif (clk = '1' and clk'event) then
                if counter(14) = '1' then
                    clk_out <= not clk_out;
                    counter <= counter + DENOMINATOR - NUMERATOR;
                else
                    counter <= counter - NUMERATOR;
                end if;
            end if;
        end process;

end architecture uart_clk_arch;

