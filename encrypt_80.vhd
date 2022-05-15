-------------------------------------------------------------
---------------Encrypt 80 in vhdl----------------------------
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--entity declarations--
entity encrypt_80 is
    port(   --Inputs--
            clk                     : in std_logic;
            --Outputs--
            HEX3, HEX2, HEX1, HEX0  : out std_logic_vector(7 downto 0));
end entity encrypt_80;

--architecure definitions--
architecture encrypt_80_arch of encrypt_80 is

    --signal definitions--
    signal plaintxt:   std_logic_vector(63 downto 0) := (others=> '0');
    signal key:         std_logic_vector(79 downto 0) := (others=> '0');
    signal crypt:       std_logic_vector(63 downto 0);
    type temp_pt is array(0 to 31) of std_logic_vector(63 downto 0); --temp plaintext txt--
    type temp_ky is array(0 to 31) of std_logic_vector(70 downto 0); --temp encrypt key--
    signal pt: temp_pt;
    signal ky: temp_ky;

    component round_process is
        port(   --Inputs--
                ipt     : in std_logic_vector(63 downto 0);
                iky     : in std_logic_vector(79 downto 0);
                i       : in integer range 1 to 31;
                --Outputs--
                opt     : out std_logic_vector(63 downto 0);
                oky     : out std_logic_vector(79 downto 0));
    end component;

    component show_16digit is
        port(   --Inputs--
                clk             : in std_logic;
                crypt           : in std_logic_vector(63 downto 0);
                --Outputs--
                D3,D2,D1,D0     : out std_logic_vector(7 downto 0));
    end component;

    begin

        pt(0) <= plaintxt;
        ky(0) <= key;
        calcCrypt: for i in 1 to 31 generate
            U1 : round_proces
            port map(
                pt(i-1),ky(i-1),pt(i),ky(i),(i)
            );
        end generate;

        crypt<=pt(31) xor ky(31)(79 downto 16);
            U : show_16digits
            port map(
                clk, crypt,HEX3,HEX2,HEX1,HEX0
            );

end architecture encrypt_80_arch;