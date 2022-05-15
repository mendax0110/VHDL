----------------------------------------------------------------------
------------------------SIMPLE DECODER IN VHDL------------------------
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity decoder is
    generic(
        SELBITS : positives := 2;
    );
    port(   --Inputs--
            en      : in std_logic;
            sel     : in std_logic_vector(SELBITS-1 downto 0);
            --Outputs--
            hot     : out std_logic_vector(2**SELBITS-1 downto 0));
end entity decoder;

--architecure definitions--
architecture decoder_arch of decoder is

    begin
        process(en, sel)
        begin
            hot <= (others => '0');
            if(en = '1') then
                hot(to_integer(unsigned(sel))) <= '1';
            end if;
        end process;

end architecture decoder_arch;