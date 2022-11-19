--------------------------------------------------------------------------
-------------------------PRIORITY-ENCODER IN VHDL-------------------------
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity priority_encoder is
    port(   --Inputs--
            I   : in bit_vector(7 downto 0);  --inputs to be prioritized--
            --Outputs--
            A   : out bit_vector(2 downto 0);  --encoded output--
            GS  : out bit);                    --gate signal--
end entity priority_encoder;

--architecture declaration--
architecture priority_inputs_arch of priority_inputs is

    begin
        --process declaration--
        process(I)
            begin
                GS <= '1';  --set default outputs--
                A <= "000";
                --check for priority--
                if I(7) = '1' then
                    A <= "111";
                elsif I(6) = '1' then
                    A <= "110";
                elsif I(5) = '1' then
                    A <= "101";
                elsif I(4) = '1' then
                    A <= "100";
                elsif I(3) = '1' then
                    A <= "011";
                elsif I(2) = '1' then
                    A <= "010";
                elsif I(1) = '1' then
                    A <= "001";
                elsif I(0) = '1' then
                    A <= "000";
                else
                    GS <= '0';  --set gate signal to 0 if no input is high--
                end if;
        end process;

end architecture priority_inputs_arch;