---------------------------------------------------
------------------------MUL------------------------
---------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity MUL is
    generic(N: integer := 8); --default value for N is 8--
    port(   --Inputs--
            A       : in signed(N-1 downto 0);
            B       : in signed(N-1 downto 0);
            --Outputs--
            result  : out signed(2 * N-1 downto 0));
end entity MUL;

--architecture definition--
architecture MUL_arch of MUL is

    begin
        -------------------------------
        MUL_proc : process(A,B)
        variable tmp : signed (2 * N-1 downto 0);
        begin
            tmp := A * B;
            result <= tmp;
        end process;
        -------------------------------
    
end architecture MUL_arch;
