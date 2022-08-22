---------------------------------------------------------------
-----------------public encryption in vhdl---------------------
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;

--entity definitions--
entity public_encryption is
    port(   --Inputs--
            original    : in std_logic_vector(7 downto 0);
            i           : in integer;
            public_key  : in std_logic_vector(7 downto 0) := "00000000";
            mode        : in std_logic_vector(1 downto 0);
            --Outputs--
            encrypted   : in std_logic_vector(7 downto 0));
end entity public_encryption;

--architecture definitions--
architecture public_encryption_arch of public_encryption is

    --signal definitions--
    signal a: integer;
    signal b: integer;
    signal cantor : integer;
    signal key    : std_logic_vector(7 downto 0) := "00000000";

    begin
        a <= conv_integer(unsigned(public_key(3 downto 0)));
        b <= conv_integer(unsigned(public_key(7 downto 4) xor "1010"));

        --cantor pairing functions--
        cantor <= 5*(a+b)*(a+b+1)+b;
        key    <= conv_std_logic_vector((5*(cantor+i)*(cantor+i+1))+i,8) when mode = "11" 
            else "10010011" when mode ="00"
            else "00000000";

        encrypted <= original xor key;

end architecture public_encryption_arch;