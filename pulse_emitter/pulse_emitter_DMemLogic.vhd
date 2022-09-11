----------------------------------------------------------------------------
---------------------PULSE-EMITTER-DMEM-LOGIC IN VHDL-----------------------
----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.log2;
use IEEE.math_real.ceil;

--entity declaration--
entity pulse_emitter is
    generic(MAX : integer);
    port(   --Inputs--
            clk     : in  std_logic;
            rst     : in  std_logic;
            en      : in  std_logic;
            --Outputs--
            output  : out std_logic);
end entity pulse_emitter;

--architecture declaration--
architecture pulse_emitter_arch of pulse_emitter is

    --constants--
    constant WIDTH : integer := integer(ceil(log2(real(MAX))));

    --signals--
    signal count, next_count : unsigned(WIDTH -1 downto 0);
    signal reached_max       : std_logic;

    begin
        --break out the output signal--
        output <= reached_max;

        --comparator for max value--
        process(count)
        begin
            if(count = MAX) then
                reached_max <= '1';
            else
                reached_max <= '0';
            end if;
        end process;

        --addr for the next count value--
        next_count <= count + 1;

        --clocked process to increment the count register--
        process(rst, clk, count, next_count)
        begin
            if(rst = '1') then
                count <= (others => '0');
            elsif(rising_edge(clk)) then
                if(en = '1') then
                    if(reached_max = '1') then
                        count <= (others => '0');
                    else
                        count <= next_count;
                    end if;
                else
                    count <= count;
                end if;
            end if;
        end process;

end architecture pulse_emitter_arch;