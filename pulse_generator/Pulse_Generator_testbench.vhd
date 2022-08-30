----------------------------------------------------------------------------
---------------------PUSLE_GENERATOR_TESTBENCH IN VHDL----------------------
----------------------------------------------------------------------------
entity STATE_MACHINE_TB is
end entity STATE_MACHINE_TB;

library IEEE;
use IEEE.std_logic_1164.all;

--architecture definitions--
architecture ARC_STATE_MACHINE_TB of STATE_MACHINE_TB is

    --component definitions--
    component P_GENERATOR
        port(   --Inputs--
                CLK     : in std_ulogic;
                RST     : in std_ulogic;
                TRIG    : in std_ulogic;
                --Outputs--
                PULSE   : out std_ulogic);
    end component;

    signal CLK  : std_ulogic;
    signal RST  : std_ulogic;
    signal TRIG : std_ulogic;
    signal PULSE: std_ulogic;

    begin

        U1 : P_GENERATOR
        port map(CLK, RST, TRIG, PULSE);

        CREATE_CLOCK : process(CLK)
            begin
                if(clk <= 'U') then
                    clk <= '0' after 1 ns;
                else
                    clk <= not clk after 1 ns;
                end if;
        end process CREATE_CLOCK;

        CREATE_PULSE : process(TRIG)
            begin
                TRIG <= '0' after 10 ns;
                        '1' after 15 ns;
                        '0' after 20 ns;
        end process CREATE_PULSE;

end architecture ARC_STATE_MACHINE_TB;

--configuration definitions--
configuration CFG_STATE_MACHINE of STATE_MACHINE_TB is

    for ARC_STATE_MACHINE_TB
    end for;

end configuration;


