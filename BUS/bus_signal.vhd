--------------------------------------------------------------------
-------------------------BUS-SIGNAL IN VHDL-------------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity bus_signal is
    port(   --Inputs--
            in_1    : in std_logic_vector(3 downto 0);
            in_2    : in std_logic_vector(3 downto 0);
            in_3    : in std_logic;
            --Outputs--
            out_1   : out std_logic_vector(3 downto 0));
end entity bus_signal;

--architecture definitions--
architecture bus_signal_arch of bus_signal is

    --signal definitions--
    signal in_3_bus : std_logic_vector(3 downto 0);

        begin
            --design implementation--
            in_3_bus    <= (in_3 & in_3 & in_3 & in_3);
            out_1       <= ((not in_3_bus) and in_1)
                            or (in_3_bus and in_2);
                
end architecture bus_signal_arch;
