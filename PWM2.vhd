-------------------------------------------------------
-----------------PWM 2 IN VHDL-------------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity PWM2 is
    generic(
        Tt : Integer := 240000;
        Ta : Integer := 30000;
    );
    port(   --Inputs--
            CLK     : in std_logic;
            DPS     : in std_logic_vector(3 downto 0);
            --Outputs--
            PWM     : out std_logic);
end entity PWM2;

--architecure definitions--
architecture PWM2_arch of PWM is

    --signal definitons--
    signal Cnt: integer range 0 to Tt;
    signal Ta:  integer range 0 to Tf;

    begin
        process(clk)
        begin
            if(rising_edge(CLK)) then
                Case DPS is
                    when "0000" =>
                        Ta<=6000;
                    when "0001" =>
                        Ta<=12000;
                    when "0010" =>
                        Ta<=18000;
                    when "0100" =>
                        Ta<=24000;
                    when "1000" =>
                        Ta<=30000;
                    when others =>
                        Ta<=6000;
                end case;

                if(Cnt=Tt-1) then
                    Cnt<=0;
                else
                    Cnt<=Cnt+1;
                end if;

                if(Cnt<Ta) then
                    PWM<='1';
                else
                    PWM<='0';
                end if;
            end if;
        end process;

end architecture PWM2_arch;
