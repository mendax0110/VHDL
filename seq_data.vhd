----------------------------------------------
--------------------seq - data----------------
----------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--Sequence detector for detecting the sequences "1011",--
--Non overlapping type--

--entity declaration--
entity seq_data is
    port(   --Inputs--
            clk        : in std_logic;
            reset      : in std_logic;
            intput     : in std_logic;  --input bit seq--
            --Outputs--
            output     : out std_logic); -- '1' indicates the pattern "1010" is detected int the sequence.--
end entity seq_data;

--architecure declaration--
architecture seq_data_arch of seq_data is
    type state_type is (s0,s1,s2,s3); --defines the type for states in the state machine--
    signal state : state_type := s0;  --declares the signal with the corresponding state type.

    begin
        process(clk, reset)
        begin
            if (reset = '1') then --restest state and output signal when reset is asserted--
                output <= '0';
                state  <= s0;
            elsif (clk'event and clk = '1') then --at rising edge of clock--
                case state is
                    when s0 => --when the current state is s0--
                         output <= '0';
                        if (input = '0') then
                            state <= s0;
                        else
                            state <= s1;
                        end if;
                    when s1 => --when the current state is s1--
                        if (input = '0') then
                            state <= s2;
                         output <= '0';
                        else
                            state <= s1;
                         output <= '0';
                        end if;
                    when s2 => --when the current state is s2--
                        if (input = '0') then
                            state <= s0;
                         outout <= '0';
                        else
                         output <= '0';
                            state <= s3;
                        end if;
                    when s3 => --when the current state is s3--
                         output <= '1';
                        if (input = '0') then
                            state <= s1;
                        else
                            state <= s2;
                         output <= '1'; --Output is 1 when the pattern "1010" is found in the seq.--
                        end if;
                    when others =>
                        NULL;
                end case;
            end if;
        end process;

end architecture seq_data_arch;
                            