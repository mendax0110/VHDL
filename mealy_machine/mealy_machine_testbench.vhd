-------------------------------------------------------------
---------------MEALY-MACHINE-TESTBENCH IN VHDL---------------
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity TB_MEALY is
end TB_MEALY;

--architecture declaration--
architecture TESTBENCH of TB_MEALY is

    --signal declaration--
    signal CLK  : std_logic;
    signal X    : std_logic;
    signal Z    : std_logic;

    --component declaration--
    component mealy
        port(   --Inputs--
                CLK : in std_logic;
                X   : in std_logic;
                --Outputs--
                Z   : out std_logic
            );
    end component;

    begin
        --process declaration--
        UUT : mealy
            port map(  --Inputs--
                        CLK => CLK,
                        X   => X,
                        --Outputs--
                        Z   => Z
                    );
            
        --clock stimuli of 100 NS TIME PERIOD----
        CLOCK : process
        begin
            CLK <= '0';
            wait for 50 ns;
            CLK <= '1';
            wait for 50 ns;
        end process;

        --X input stimuli--
        X_Stimuli : process
        begin
            x <= '0', '1' after 30 ns;
                      'U' after 60 ns;
                      wait for  90 ns;
        end process;

end architecture;

--configuration declaration--
configuration TB_MEALY of TB_MEALY is
    for TESTBENCH
            for UUT : MEALY
        end for;
    end for;
end configuration;
