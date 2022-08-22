library IEEE;
use IEEE.std_logic_1164.all;

entity TB_MEALY is
end;

architecture TESTBENCH of TB_MEALY is

        signal CLK  :std_logic;
        signal X    :std_logic;
        signal Z    :std_logic;

        component mealy
                port(X, CLOCK : int STD_LOGIC;
                     Z        : out STD_LOGIC);
        end component;

    begin
        UUT : mealy
                port map(X, CLK, Z);
    --CLOCK STIMULI OF 100 NS TIME PERIOD
        CLOCK : process
        begin
            CLK <= '0', '1' after 50 ns;
                        wait for 100 ns;
        end process;
    
    --X input STIMULI
        X_Stimuli : process
        begin
            x <= '0', '1' after 30 ns;
                      'U' after 60 ns;
                       wait for 90 ns;
        end process;
end TESTBENCH;

configuration CFG_TB_MEALY of TB_MEALY is
    for TESTBENCH
        for UUT : MEALY
        end for;
    end for;
end;


