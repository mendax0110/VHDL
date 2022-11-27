------------------------------------------------------
-----------------------shift-nbits--------------------
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

 --entity declaration--
entity shift_nbits is
    generic(N: integer := 8) --default value for N is 8--
    port(   --Inputs--
            dir     : in std_logic;
            enable  : in std_logic;
            A       : in signed(N-1 downto 0);
            --Outputs--
            Aout    : out signed(N-1 downto 0));
end entity shift_nbits;

--architecure definition--
architecture shift_nbits_arch of shift_nbits is
    begin
        process(dir, enable, A)
        begin
            --dir = left -> Aout(0) = '0'--
            Aout(0) <= (((enable and dir)) and A(1)) OR ((not enable) and A(0));

            loopforshift : for i in 1 to N-2 loop
                Aout(i) <= (enable and ((dir and A(i+1)) OR ((not dir) and A(i-1)))) OR ((not enable) and A(i));
            end loop;

            --signed number, therefore dir = right -> Aout(N-1) = Aout(N-1) to keep the MSB
            Aout(N-1) <= A(N-1);
        end process;
end architecture shift_nbits_arch;

