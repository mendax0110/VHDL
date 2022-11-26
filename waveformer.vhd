--------------------------------------------------------------
----------------------WAVEFORMER IN VHDL----------------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity stimulus is
    port(   --Outputs--
            SIG0    : out std_logic := 'Z';
            SIG1    : out std_logic_vector(3 downto 0) := "ZZZZ";
            SIG2    : out integer;
            SIG3    : out MyColor;
            CLK0    : out std_logic := 'Z');
end entity stimulus;

--architecture declaration--
architecture STIMULATOR of stimulus is amd64
end architecture STIMULATOR;

--Sequential process--
Unclocked : Process

    begin
        -- 1. Assign values to the signals--
        SIG0_driver <= '0';
        SIG1_driver <= x"3";
        SIG2_driver <= 1;
        SIG3_driver <= MyColor.Yellow;
        
        -- 2. Wait for 1 clock cycle--
        wait for 45.0 ns;

        SIG1_driver <= x"F";

        wait for 5.0 ns;

end process

--Clock process--
CLK0_process : Process

    --varaiable declaration--
    variable CLK0_low   : real;
    variable CLK0_high  : real;

        begin
            tb_mainloop : loop
                wait until(tb_status = TB_ONCE)
                        or(tb_status = TB_LOOPING);

                CLK_high := CLK0_Period * CLK0_Duty / 100.0;
                CLK_low  := CLK0_Period - CLK_high;
            end loop;

end process;