---------------------------------------------------------------------------------------------------
----------------------------BCD-TO-7-SEGEMENT-DECODER-TESTBENCH IN VHDL----------------------------
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity DISPLAY_DECODER_TB is
end DISPLAY_DECODER_TB;

--architecture Behavioral of DISPLAY_DECODER_TB--
architecture DISPLAY_DECODER_TB_arch of DISPLAY_DECODER_TB is

    --signal declaration--
    signal VALUE            : bit_vector(3 downto 0);
    signal ZERO_BLANK       : bit;
    signal DISPLAY          : bit_vector(6 downto 0);
    signal ZERO_BLANK_OUT   : bit;

    --component declaration--
    component DISPLAY_DECODER
        port(   --Inputs--
                VALUE           : in bit_vector(3 downto 0);
                ZERO_BLANK      : in bit;
                --Outputs--
                DISPLAY         : out bit_vector(6 downto 0);
                ZERO_BLANK_OUT  : out bit);
    end component;

    begin
        INPUT_VALUES: process
            begin
                ZERO_BLANK      <= '1';
                VALUE           <= "0000";

                wait for 1 ns;
                ZERO_BLANK      <= '0';
                VALUE           <= "0000";

                wait for 7 ns;
                ZERO_BLANK      <= '1';
                VALUE           <= "0010";

                wait for 12 ns;
                ZERO_BLANK      <= '0';
                VALUE           <= "0100";

                wait for 12 ns;
                ZERO_BLANK      <= '0';
                VALUE           <= "0110";

                wait for 7 ns;
        end process;

        U1: DISPLAY_DECODER
        port map(VALUE, ZERO_BLANK, DISPLAY, ZERO_BLANK_OUT);

end architecture;

--configuration--
configuration CFG_DISPLAY_DECODER of DISPLAY_DECODER_TB is
    for ARC_DISPLAY_DECODER_TB
        for U1: DISPLAY_DECODER use entity
            work.DISPLAY(BEHAVIOUR);
        end for;
    end for;
end CFG_DISPLAY_DECODER;

