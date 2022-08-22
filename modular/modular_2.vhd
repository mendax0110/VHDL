library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity modular_2 is
    port(   --Inputs--
            clk         : in std_logic;
            reset       : in std_logic;
            
            kill_clr    : in std_logic;
            
            go_1        : in std_logic;
            kill_1      : in std_logic;
            go_2        : in std_logic;
            kill_2      : in std_logic;
            go_3        : in std_logic;
            kill_3      : in std_logic;
            
            --Outputs--
            kill_ltchd  : out std_logic;
            done_3      : out std_logic);
end entity modular_2;

--architecture declaration--
architecture modular_2_arch of modular_2 is

    component state_machine
        port(   --Inputs
                clk     : in std_logic;
                reset   : in std_logic;
                
                go      : in std_logic;
                kill    : in std_logic;
                
                --Outputs--
                done    : out std_logic);
    end component;

    signal done_1   : std_logic;
    signal g2       : std_logic;
    signal done_2   : std_logic;
    signal g3       : std_logic;

    begin
        ----------design implementation----------
        Go_Delay_1: state_machine;
        port map(   --Inputs--
                    clk     => clk,
                    reset   => reset,
                    
                    go      => go_1,
                    kill    => kill_1,
                    --Outputs--
                    done    => done_1
                );

        g2 <= (done_1 or go_2);

        Go_Delay_2: state_machine
        port map(   --Inputs--
                    clk     => clk,
                    reset   => reset,
                    
                    go      => g2,
                    kill    => kill_2,
                    --Outputs--
                    done    => done_2
                );

        g3 <= (done_1 or done_2 or go_3);

        Go_Delay_3: state_machine
        port map(   --Inputs--
                    clk     => clk,
                    reset   => reset,
                    
                    go      => g3,
                    kill    => kill_3,
                    --Outputs-
                    done    => done_3
                );

        Reg_Proc: process(clk, reset)
        begin
            if (reset = '1') then
                kill_ltchd <= '0';
            elsif rising_edge(clk) then

                if (    kill_1 = '1'
                     or kill_2 = '1'
                     or kill_3 = '1'
                   ) then
                   kill_ltchd <= '1';
                elsif (kill_clr = '1') then
                   kill_ltchd <= '0';
                end if;
            end if;
        end process;
end architecture module_2_arch;
