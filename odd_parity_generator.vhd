-------------------------------------------------------------
---------------ODD-PARITY_GENERATOR IN VHDL------------------
-------------------------------------------------------------
package anu is
    --constant definitions--
    constant m : integer := 8;
    type input is array(0 to m-1) of bit
end package anu;

library IEEE;
use IEE.std_logic_1164.all;
use Work.anu.all;

--entity declarations--
entity Parity_Generator is
    port(   --Inputs--
            input_stream    : in input;
            clk             : in std_logic;
            --Outputs--
            parity          : out bit);
end entity Parity_Generator;

--architecture declarations--
architecture Parity_Generator_arch of Parity_Generator is

    begin
        P1 : process
        variable off : bit;

        begin
            wait until clk'event and clk = '1';
                odd := '0';

                for | i in 0 to m-1 loop
                    odd := odd xor input_stream(i);
                end loop;
            parity <= odd;
        end process;

end architecture Parity_Generator_arch;