------------------------------------------------------------
----------------SIMPLE M DECODER IN VHDL--------------------
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.utils.all;

--entity declarations--
entity Mdecoder_Nbit is
    --n determines number of input bits to decoder--
    --(address size); output will be 2 ^ A--
    generic(N : integer := 2);
    port(   --Inputs--
            i_A     : in std_logic_vector(N - 1 downto 0);
            --Outputs--
            o_D     : out std_logic_vector((2 ** N) - 1 downto 0));
end entity Mdecoder_Nbit;

--architecture definitions--
architecture Mdecoder_Nbits_arch of Mdecoder_Nbits is

    begin
        --checks for equality between output port number--
        --and integer of input address--
        g_outputs : for I in 0 to (2 ** N) - 1 generate
            o_D(I) <= to_std_logic(I = to_integer(unsigned(i_A)));
        end generate g_outputs;

end architecture Mdecoder_Nbits_arch;

