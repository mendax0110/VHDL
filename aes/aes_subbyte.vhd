------------------------------------------------------------
-----------------AES Subbyte Encryption---------------------
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity for the subbyte*/
entity subbytes is
    port(   --Inputs
            p_in    : in std_logic_vector(127 downto 0);
            --Outputs--
            s_out   : out std_logic_vector(127 downto 0));
end entity subbyte;

--architecure build for the behavioral*/
architecture subbyte_arch of subbyte is

    --define the components*/
    component sbox is
        port(   --Inputs--
                a   : in std_logic_vector(7 downto 0);
                --Outputs--
                y   : out std_logic_vector(7 downto 0));
    end component sbox;

    begin

        q1  : sbox port map (p_in(127 downto 120), s_out(127 downto 120));
        q2  : sbox port map (p_in(119 downto 112), s_out(119 downto 112));
        q3  : sbox port map (p_in(111 downto 104), s_out(111 downto 104));
        q4  : sbox port map (p_in(103 downto 96), s_out(103 downto 96));
        q5  : sbox port map (p_in(95 downto 88), s_out(95 downto 88));
        q6  : sbox port map (p_in(87 downto 80), s_out(87 downto 80));
        q7  : sbox port map (p_in(79 downto 72), s_out(79 downto 72));
        q8  : sbox port map (p_in(71 downto 64), s_out(71 downto 64));
        q9  : sbox port map (p_in(63 downto 56), s_out(63 downto 56));
        q10 : sbox port map (p_in(55 downto 48), s_out(55 downto 48));
        q11 : sbox port map (p_in(47 downto 40), s_out(47 downto 40));
        q12 : sbox port map (p_in(39 downto 32), s_out(39 downto 32));
        q13 : sbox port map (p_in(31 downto 24), s_out(31 downto 24));
        q14 : sbox port map (p_in(23 downto 16), s_out(23 downto 16));
        q15 : sbox port map (p_in(15 downto 8), s_out(15 downto 8));
        q16 : sbox port map (p_in(7 downto 0), s_out(7 downto 0));

    end architecture subbyte_arch;
    