library IEEE;
use IEEE.std_logic_1164.all;
package memory is 
    constant width   : integer := 3;
    constant memsize : integer := 7;

    type data_out is array(0 to width) of std_logic;
    type mem_data is array(0 to memsize) of data_out;
end memory;

library IEEE;
use IEEE.std_logic_1164.all;
use work.memory.all;

entity rom is
    port(   addr : in integer;
            data : out data_out;
            cs   : in std_logic);
end rom;

architecture basic of rom is
    constant z_state : data_out := ('Z', 'Z', 'Z', 'Z');
    constant x_state : data_out := ('X', 'X', 'X', 'X');
    constant rom_data : mem_data :=
         (  ('0', '0', '0', '0'),
            ('0', '0', '0', '1'),
            ('0', '0', '1', '0'),
            ('0', '0', '1', '1'),
            ('0', '1', '0', '0'),
            ('0', '1', '0', '1'),
            ('0', '1', '1', '0'),
            ('0', '1', '1', '1')  );
    begin
        assert addr <= memsize;
        report "addr out of range"
        severity error;

        data <= rom_data(addr) after 10 ns  when cs = '1' else
                z_state after 20 ns when cs = '0' else
                x_state after 10 ns;
end basic;
