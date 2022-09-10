---------------------------------------------------------------------
-------------------MOORE-MACHINE-TESTBENCH IN VHDL-------------------
---------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity Moore_Machine_Testbench is
end Moore_Machine_Testbench;

--architecture declaration--
architecture TESTBENCH of Moore_Machine_Testbench is

    --signal declaration--
    signal CLK : std_logic;
    signal X   : std_logic;
    signal z   : std_logic;

    --component declaration--
    component MORRE
        port(   --Inputs--
                CLK : in std_logic;
                X   : in std_logic;
                --Outputs--
                z   : out std_logic
            );
    end component;

    procedure check(signal Z    : in std_logic;
            constant Expected   : in std_logic;
            constant timepoint  : in time) is 

                begin
                    assert(Z/=Expected OR timepoint /= now)
                    report "Value on Z is OK"
                    severity NOTE;
                end;

                begin
                    UUT : MOORE
                        port map(X, CLK, Z);

                --Clock stimuli of 100 ns time period--

                    CLOCK : process
                    begin
                        CLK <= '0', '1' after 50 ns;
                        wait for 100 ns;
                    end process;

                --X input stimuli--
                    
                    X_Stimuli : process
                    begin
                        X <= '1', '0' after 1000 ns;
                        wait for 2000 ns;
                    end process;

                --assert process--
                
                    check(z, '1', 50 ns);
                    check(z, '0', 150 ns);
                    check(z, '1', 250 ns);
                    check(z, '0', 450 ns);

end architecture TESTBENCH;

--configuration declaration--
configuration CFG_TB_MOORE of TB_MOORE is
    for TESTBENCH
        for UUT : MOORE
            use entity work.MOORE;
        end for;
    end for;
end configuration;

