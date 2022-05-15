package anu is
    constant m : integer := 8;
    type input is array(0 to m-1) of bit
end anu;

library IEEE;
use IEEE.std_logic_1164.all;
use Work.anu.all;

entity Parity_Generator1 is
    port(   input_stream : in input;
            clk          : in std_logic;
            parity       : out bit);
end Parity_Generator1;

architecture odd if Parity_Generator is

    begin
        P1 : process
        variable off : bit;

            begin
            wait until clk'event and clk = '1';
                odd := '0';

                for | in 0 to m-1 loop
                    odd := odd xor input_stream (I);
                end loop;
            parity <= odd;
        end process;
    end odd;


