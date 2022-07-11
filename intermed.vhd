--------------------------------------------------------
--------------------INTERMED IN VHDL--------------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity intermed_signal is
    port(   --Inputs--
            in_1    : in std_logic;
            in_2    : in std_logic;
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic;
            out_2   : out std_logic);
end entity intermed_signal;

--architecure definitions--
architecture intermed_signal_arch of intermed_signal is

    signal intermediate_sig : std_logic;
            begin
                     --design implementation--
                     intermediate_sig <= in_1 and in_2; --intermediate signal--

                     out_1 <= intermediate_sig and  in_3; --output signal--
                     out_2 <= intermediate_sig or   in_3; --output signal--
                     
end architecture intermed_signal_arch;
