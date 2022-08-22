-------------------------------------------------------------------------
-----------------------------Pulse width modulation----------------------
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity PWM is
    port(   --Inputs--
            C   : in std_logic;
            D   : in std_logic;
            --Outputs--
            Q   : out std_logic);
end entity PWM;

--architecure definitions--
architecture PWM_arch of PWM is

    --signal configuration--
    signal count : integer := 0;
    signal alpha : integer := 0; --counts number of clocks--
    signal beta  : integer := 0; --counts number of times 'D' is low wrt clock signal(C)--
    signal tmp   : integer := 0; --stores the value of beta for which Q will be set HIGH--

    begin
        process(C,D)
            if(C = '1' and C'event) then
                alpha <= alpha + 1; --counts number of rising edges--
                if(count = 0) then --initial pulse--
                    Q <= '1';
                end if;
                if(D = '0') then --if D is low, increase beta by 1--
                    beta <= beta + 1;
                end if;
                if(alpha = 8) then --when alpha = 0, increment beta by 1 and store it in tmp--
                    tmp <= beta + 1; --increase beta and store in tmp--
                    alpha <= 0; --reset alpha--
                    beta <= 0;  --reset beta--
                    count <= 0; --reset count--
                end if;
                if(tmp = alpha) then --the moment when number of clocks(alpha) equals previous number of times Q was high(tmp)
                    Q <= '0';
                    tmp <= 0;
                end if;
            end if;
        end process;

end architecture PWM_arch;