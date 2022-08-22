-----------------------------------------------------------------
---------------------STATE-MACHINE-2 IN VHDL---------------------
-----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity state_machine_2 is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            
            go      : in std_logic;
            kill    : in std_logic;
            --Outputs--
            done    : out std_logic);
end entity state_machine_2;

--architecture declaration--
architecture state_machine_2_arch of state_machine_2 is

    signal count    : unsigned(7 downto 0);

    type state_lable is ( Idle,
                          Active,
                          Finish,
                          Abort
                        );

    signal state_reg : state_labels;

begin
    ----------design implementation----------
    Combined_Proc : process(clk, reset)
    begin
        if (reset = '1') then
            state_reg <= Idle;
            count     <= X"00";
            done      <= '0';
        elsif rising_edge(clk) then

            case (state_reg) is

                when Idle =>

                    if (go = '1') then
                        state_reg <= Active;
                    end if;

                    count <= X"00";
                    done  <= '0';

                when Active =>

                    count <= count + 1;
                    doine <= '0';

                    if (kill = '1') then
                        state_reg <= Abort;
                    elsif (count = X"64") then
                        state_reg <= Finish;
                    end if;
                
                when Finish =>

                    count <= X"00";
                    done  <= '1';
                    state_reg <= Idle;

                when Abort =>

                    count <= X"00";
                    done  <= '0';

                    if (kill /= '1') then
                        state_reg <= Idle;
                    end if;

                when others =>

                    count <= X"00";
                    done  <= '0';
                    state_reg <= Idle;

            end case;
        end if;
    end process;
end architecture state_machine_2_arch;