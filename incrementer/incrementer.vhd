-------------------------------------------------------
------------------INCREMENTER IN VHDL------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declarations--
entity incrementer is
    --generic declarations--
    generic(width : integer := 8);
    --port declarations--
    port(   --Inputs--
            datain      : in std_logic_vector(width-1 downto 0);
            control     : in std_logic;
            --Outputs--
            dataout     : out std_logic_vector(width-1 downto 0)
            flag        : out std_logic);
end entity incrementer;

--architecture definitions--
architecture increment_arch of incrementer is

    begin
        --prossessing--
        process(datain, control)
        begin
            if(control = '1') then --increment--
                dataout_int <= datain + '1';
            else --feedthrough--
                dataout_int <= datain;
            end if;
        end process;

        --output assignments--
        dataout <= dataout_int;
        flag <= '1' when (control = '1' and datain = To_std_logic_vector(X"FF")) else '0';

end increment_arch;