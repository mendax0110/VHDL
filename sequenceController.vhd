-----------------------------------------------------
----------------sequence Controller------------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity SequenceController is
    Generic(NumOfSequences      : integer := 8;
            DesireDisplaySpeed  : integer := 100000;
            InputClockSpeed     : integer := 100000000);
    Port(   --Inputs--
            ClockState : in std_logic;
            Enabler    : in std_logic;
            Reset      : in std_logic;
            Reverse    : in std_logic;
            --Output--
            MemAddress : out integer := 0);
end entity SequenceController;

--architecture declaration--
architecture SequenceConroller_arch of SequenceController is

    --signal declaration--
    signal  clkMax      : integer := InputClockSpeed / DesireDisplaySpeed;
    signal  clkCnt      : integer := 0;
    signal  displaycnt  : integer := 0;
    signal  StateEnable : std_logic;

    begin
        --process declaration--
        DisplaySpeed : process(ClockState)
        begin
            if rising_edge(ClockState) then
                if Reset <= '0' then
                    StateEnable <= '1';
                    clkCnt <= 0;
                else
                    clkCnt <= clkCnt + 1;
                    StateEnable <= '0';
                end if;
            else
                clkCnt <= 0;
            end if;
        end process DisplaySpeed;

        --process declaration--
        count : process(ClockState, StateEnable, Enabler, Reverse, Reset)
        begin
            if Reset = '1' then
                displayCnt <= 0;
            else
                if enabler = '1' then
                    if rising_edge(ClockState) and StateEnable = '1' then
                        if Reverse = '0' then
                            if displayCnt = NumOfSequences then
                                displayCnt <= 0;
                            else
                                displayCnt <= displayCnt + 1;
                            end if;
                        else
                            if displayCnt = 0 then
                                displayCnt <= NumOfSequences;
                            else
                                displayCnt <= displayCnt - 1;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
            MemAddress <= displayCnt;
        end process count;

end SequenceController_arch;

