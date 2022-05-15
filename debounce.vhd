------------------------------------------------
-------------------debounce---------------------
------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity debounce is
    generic(WAIT_CYCLES : integer := 5);
    port(   --Inputs--
            signal_in   : in std_logic;
            clk         : in std_logic;
            --Outputs--
            signal_out  : out std_logic);
end entity debounce;

--architecture declaration--
architecture debounce_arch of debounce is

    --Singals--
    type state_t is (idle, check_input_stable);
    signal state_reg        : state_t       := idle;
    signal out_reg          : std_logic     := signal_in
    signal signal_in_reg    : std_logic;
    signal counter          : integer range 0 to WAIT_CYCLES - 1 := 0;

    begin

        process(clk) is
            begin
                if rising_edge(clk) then
                    case state_reg is
                        when idle =>
                            if out_reg /= signal_in then
                                signal_in_reg <= signal_in;
                                state_reg     <= check_input_stable;
                                counter       <= WAIT_CYCLES - 1;
                            end if;

                        when check_input_stable =>
                            if counter  = 0 then
                                if signal_in = signal_in_reg then
                                    out_reg   <= signal_in;
                                end if;
                                state_reg     <= idle;
                            else
                                if signal_in /= signal_in_reg then
                                    state_reg <= idle;
                                end if;
                                counter <= counter - 1;
                            end if;
                    end case;
                end if;
        end process;

        --Ouputs--
        signal_out <= out_reg;
    
end architecture debounce_arch;
