--------------------------------------------------------
-------------SIMPLE D FLIP FLOP IN VHDL-----------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity delarartions--
entity d_flip_flop is
    port(   --Inputs--
            clk             : in std_logic;
            rst_n, preset   : in std_logic;
            D_in            : in std_logic;
            --Outputs--
            Q_out           : out std_logic);
end entity d_flip_flop;

--architecture definitions--
architecture d_flip_flop_arch of d_flip_flop is

    begin
        DUT : process(clk, rst_n, preset)
        begin
            if(rst_n = '0') then
                Q_out <= '0';
            elsif(preset = '0') then
                Q_out <= '1';
            elsif(clk'event and clk = '1') then
                Q_out <= D_in;
            end if;
        end process;
    

end architecture d_flip_flop_arch;