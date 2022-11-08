--------------------------------------------------------------------------------------
------------------------Numerically Controlled Oscillator-----------------------------
--------------------------------------------------------------------------------------
library IEEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity NCO is
    generic(
        clk_freq : integer := 100000000; --input frequency--
        freq     : integer := 100000;    --desired output frequency--
    );
 
    port(   --Inputs--
            reset   : in std_logic; --active low--
            clk_in  : in std_logic; --input clock of clk_freq--
            --Outputs--
            clk_out : out std_logic); --output square wave of req--
end entity NCO;

--architecure definitions--
architecture NCO_arch of NCO is

    --signal declarations--
    constant increment  : integer := (freq*2) - clk_freq;
    signal accumulator  : integer := range increment to (freq*2) := 0;
    signal phase_change : std_logic := '0';

    begin
        --processes--
        process(clk_in, reset)
        begin
            if(reset = '0') then
                accumulator <= 0;
                phase_change <= '0';
            elsif rising_edge(clk_in) then
                if(accumulator + increment >= 0) then
                    accumulator <= accumulator + increment;
                    phase_change <= not phase_change;
                    clk_out <= phase_change;
                else
                    accumulator <= accumulator + increment + clk_freq;
                end if;
            end if;
        end process;

end architecture NCO_arch;

