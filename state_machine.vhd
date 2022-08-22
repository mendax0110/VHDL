-----------------------------------------------------------------------
-------------------------STATE-MACHINE IN VHDL-------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity state_machine is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            
            go      : in std_logic;
            kill    : in std_logic;
            --Outputs--
            done    : out std_logic);
end entity state_machine;

--architecture declaration--
architecture state_machine_arch of state_machine is

    signal count : unsigned(7 downto 0);

    type state_lable is (   Idle,
                            Active,
                            Finish,
                            Abort
                        );

    signal state_reg : state_labels;

    begin
        ----------design implementation----------
        State_Proc : process(clk, reset)
        begin
            if (reset = '1') then
                state_reg <= Idle;
            elsif rising_edge(clk) then
                
                case (state_reg) is
                
                    when Idle => 

                        if (go = '1') then          state_reg <= Active;
                        end if;

                    when Active =>

                        if (kill = '1') then        state_reg <= Abort;
                        elsif (count = X"64") then  state_reg <= Finish;
                        end if;

                    when Finish =>                  state_reg <= Idle;

                    when Abort  =>
                        
                        if (kill /= '1') then       state_reg <= Idle;
                        end if;
                    
                    when others =>                  state_reg <= Idle;

                end case;
            
            end if;
        end process;

        Reg_Proc : process (clk, reset)
        begin
            if (reset = '1') then
                count <= X"00";
                dome  <= '0';
            elsif rising_edge(clk) then

                --duration counter--
                if (    state_reg = Finish
                    or  state_reg = Abort
                   ) then
                    count <= X"00";
                elsif (state_reg = Active) then
                    count <= count + 1;
                end if;

                --output register--
                if (state_reg = Finish) then
                    done <= '1';
                else
                    done <= '0';
                end if;
            
            end if;
        end process;
end architecture state_machine_arch;
