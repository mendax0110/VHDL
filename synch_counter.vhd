--------------------------------------------
-----------synchronous Counter--------------
--------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declarartion--
entity Synch_counter is
    port(   --Inputs--
            clk         : in std_logic;
            reset       : in std_logic;
            --Outputs--
            count       : out std_logic_vector(3 downto 0));
end entity Synch_counter;

--architecure declaration--
architecture Synch_counter_arch of Synch_counter is

    begin
        process(clk, reset)
        variable temp : std_logic_vector(3 downto 0);

        begin
            if(reset = '1') then
                temp := "0000"
            else if(clk'event and clk = '1') then
                temp := temp + 1;
            end if;
            count <= temp;
        end process;

end architecture Synch_counter_arch;

