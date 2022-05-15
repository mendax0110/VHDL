library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity DISPLAY_DECODER_TB is
    end DISPLAY_DECODER_TB;

architecture ARC_DISPLAY_DECODER_TB of DISPLAY_DECODER_TB is
    signal      VALUE           : bit_vector(3 downto 0);
    signal      ZERO_BLANK      : bit;
    signal      DISPLAY         : bit_vector(6 downto 0);
    signal      ZERO_BLANK_OUT  : bit;

    component DISPLAY_DECODER
        port(   VALUE           : in bit_vector(3 downto 0);
                ZERO_BLANK      : in bit;
                DISPLAY         : out bit_vector(6 downto 0);
                ZERO_BLANK_OUT  : out bit);
    end component;

    begin
    INPUT_VALUES: process
    begin
        ZERO_BLANK      <='1';
        VALUE           <="0000";

        wait for 5 ns;
        ZERO_BLANK      <='0';
        VALUE           <="0000";

        wait for 7 ns;
        ZERO_BLANK      <='1';
        VALUE           <="0010";

        wait for 12 ns;
        ZERO_BLANK      <='0';
        VALUE           <="0100";

        wait for 12 ns;
        ZERO_BLANK      <='0';
        VALUE           <="0110";

        wait for 7 ns;
    end process;

    U1: DISPLAY_DECODER
    port map(VALUE, ZERO_BLANK, DISPLAY, ZERO_BLANK_OUT);
end ARC_DISPLAY_DECODER_TB;

configuration CFG_DISPLAY_DECODER of DISPLAY_DECODER_TB is
    for ARC_DISPLAY_DECODER_TB
        for U1: DISPLAY_DECODER use entity
            work.DISPLAY_DECODER(BEHAVIOUR);
        end for;
    end for;
end CFG_DISPLAY_DECODER;
