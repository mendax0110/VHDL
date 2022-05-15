library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity fourbit_mux is
    port(   Ry      : in std_logic_vector(7 downto 0) := (others => '0');
            IM      : in std_logic_vector(7 downto 0) := (others => '0');
            SEL     : in std_logic := '0';
            To_ALU  : out std_logic_vector(7 downto 0):= (others => '0'));
end fourbit_mux;

--architecture declaration--
architecture fourbit_mux_arch_behav of fourbit_mux is
    begin
        --process declaration--
        proc_fourbit_mux : process(Ry, IM, SEL)
            begin
                if(SEL = '0') then
                    To_ALU <= Ry;
                elsif(SEL = '1') then
                    To_ALU <= IM;
                end if;
        end process proc_fourbit_mux;
end fourbit_mux_arch_behav;
                                