------------------------------------------------------------------------------------
--------------------SIMPLE-CLK-SYNCHRONIZATION-AND-DELAY IN VHDL--------------------
------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.util.all;

--entity declaration--
entity simple_clk_synth_delay is

    --PLL VCO frequency range is 400 to 1080 MHz
    --Maximum frequency for BUFG is 400 MHz

    generic(    --Inputs--
                clk_freq:    positive    := 100000000; --Hz--
                gate_delay:  time        := 1 ns;
                clk_mult:    positive    := 1; --Range 1 to 64--
                clk_div:     positive    := 1; --Range 1 to 52--
                clk_div0:    positive    := 1; --Range 1 to 128--
                clk_div1:    positive    := 1; --Range 1 to 128--
                clk_div2:    positive    := 1; --Range 1 to 128--
                clk_div3:    positive    := 1; --Range 1 to 128--
                clk_div4:    positive    := 1; --Range 1 to 128--
                clk_div5:    positive    := 1; --Range 1 to 128--
            );

    port(   --Inputs--
            clkin:      in std_logic     := 'X'; --clocks in--
            --pragma synthesis_of
            end_flag:   in std_logic     := 'X'; --stop clocks--
            --pragma synthesis_on
            
            --Outputs--
            clk0:       out std_logic    := '0'; --clock 0 out--
            clk1:       out std_logic    := '0'; --clock 1 out--
            clk2:       out std_logic    := '0'; --clock 2 out--
            clk3:       out std_logic    := '0'; --clock 3 out--
            clk4:       out std_logic    := '0'; --clock 4 out--
            clk5:       out std_logic    := '0'; --clock 5 out--
            strobe      out std_logic    := '0'  --strobe--
        );

end entity simple_clk_synth_delay;

--architecuture declaration--
architecture simple_clk_synth_delay_arch of simple_clk_synth_delay is

    --Design implementation--
    begin
        --Design implementation--

end architecture simple_clk_synth_delay_arch;
