library IEEE;
use IEEE.std_logic_1164.all;

entity TB_MOORE is
    end;

    architecture TESTBENCH of TB_MOORE is

        signal CLK  : std_logic;
        signal X    : std_logic;
        signal Z    : std_logic;

        component MOORE
            Port(X, CLOCK   : in STD_LOGIC;
                 Z,         : out STD_LOGIC);
        end component;

    procedure check(signal Z : in std_logic;
           constant Expected : in std_logic;
           constant timepoint : in time)is
            begin
                assert(Z/= Expected OR timepoint/= now)
                report"Value on Z is OK"
                severity NOTE;
            end;
        
        begin
            UUT : MOORE
              Port Map(X, CLK, Z);

        --CLOCK STIMULI OF 100 NS TIME PERIOD
        
            CLOCK : process
            begin
                CLK <= '0', '1' after 50 ns;
                wait for 100 ns;
            end process;

        -- X input STIMULI
                
            X_Stimuli : process
            begin
                X <= '1', '0' after 1000 ns;
                wait for 2000 ns;
            end process;

        -- Assert Process
            
            check(Z,'1', 50ns);
            check(Z,'0', 150ns);
            check(Z,'1', 250ns);
            check(Z,'0', 450ns);

    end TESTBENCH;

    configuration CFG_TB_MOORE of TB_MOORE is
        for TESTBENCH
            for UUT : MOORE
            end for;
        end for;
    end;
    