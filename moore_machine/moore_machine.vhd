---------------------------------------------------------
------------------MOORE-MACHINE IN VHDL------------------
---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity MOORE is     --Moore machine
    port(X, CLOCK : in STD_LOGIC;
         Z,       : out STD_LOGIC);
end entity MOORE;

--architecture declaration--
architecture BEHAVIOUR of MOORE is
    type STATE_TYPE is (S0, S1, S2, S3);
    signal CURRENT_STATE, NEXT_STATE : STATE_TYPE;
    begin

        --Process to hold combinational logic
        COMBIN : process(CURRENT_STATE, X)
        begin
            case CURRENT_STATE is
                when S0 =>
                    Z <= '0';
                    if X = '0' then
                        NEXT_STATE <= S0;
                    else
                        NEXT_STATE <= S2;
                    end if;
                
                when S1 =>
                    Z <= '1';
                    if X = '0' then
                        NEXT_STATE <= S0;
                    else
                        NEXT_STATE <= S2;
                    end if;

                when S2 =>
                    Z <= '1';
                    if X = '0' then
                        NEXT_STATE <= S2;
                    else
                        NEXT_STATE <= S3;
                    end if;
                
                when S3 =>
                    Z <= '0';
                    if X = '0' then
                        NEXT_STATE <= S3;
                    else 
                        NEXT_STATE <= S1;
                    end if;
            end case;
        end process;
        
        --Process to hold synchronous elements(flip-flops)
        SYNCH : process
            begin
            wait until CLOCK'event and CLOCK = '1';
            CURRENT_STATE <= NEXT_STATE;
        end process;
end BEHAVIOUR;

