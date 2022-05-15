----------------------------------------------------------------
------------------subbyte for the HDL---------------------------
----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.aes_contants.all;

--entity declarations--
entity subbyte is
    port(   --Inputs--
            subbyte_in      : in std_logic_vector(127 downto 0);
            sys_clk, rst    : in std_logic;
            --Outputs--
            subbyte_out     : out std_logic_vector(127 downto 0));
end entity subbyte;

--architecure definitions--
architecture subbyte_arch of subbyte is

    --singal definitions--
    signal sub_bytes_buf : std_logic_vector(127 downto 0) := (others => '0');

    begin
        sbox_byte_substitution : process(sys_clk)
        begin
            if(sys_clk'event and sys_clk = '1') then
                if rst = '1' then
                    subbyte_out <= (others => '0');
                else
                    subbyte_out <= sub_bytes_buf;
                end if;
            end if;
        end process;

        SUB_ARRAY : for i in 0 to 15 generate
        begin
            sub_bytes_buf((((i+1)*8)-1) downto(i*8)) <= sbox(conv_integer(subbytes_in((((i+1)*8)-1) downto(i*8))));
        end generate;

end architecture subbyte_arch;