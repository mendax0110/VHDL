------------------------------------------------------
--Header information
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity full_dp_mem is
    port(   --Port A--
            clk_a       : in std_logic;
            wr_a        : in std_logic;
            address_a   : in std_logic_vector(9 downto 0);
            dat_in_a    : in std_logic_vector(15 downto 0);
            dat_out_a   : out std_logic_vector(15 downto 0);
            
            --Port B--
            clk_b       : in std_logic;
            wr_b        : in std_logic;
            address_b   : in std_logic_vector(9 downto 0);
            dat_in_b    : in std_logic_vector(15 downto 0);
            dat_out_b   : out std_logic_vector(15 downto 0));
end entity full_dp_mem;

--architecture declaration--
architecture full_dp_mem_arch of full_dp_mem is

    --2D array type for the RAM--
    type array_1kx16 is array(1023 downto 0) of 
                        std_logic_vector(15 downto 0);

    --declare the RAM--
    signal ram : array_1kx16;

    begin

        process(clk_a)
        begin
            if rising_edge(clk_a) then --Port A--
                if(wr_a = '1') then
                    ram(to_integer(unsigned(address_a))) <= dat_in_a,
                    --Read-during-write returns NEW Data--
                    dat_out_a <= dat_in_a;
                else
                    --Read only--
                    dat_out_a <= ram(to_integer(unsigned(address_a)));
                end if;
            end if;
        end process;

        process(clk_b)
        begin
            if rising_edge(clk_b) then --Port b--
                if(wr_b = '1') then
                    ram(to_integer(unsigned(address_b))) <= dat_in_b;
                    --Read-during-write return NEW data--
                    dat_out_b <= dat_in_b;
                else
                    --Read only--
                    dat_out_b <= ram(to_integer(unsigned(address_b)));
                end if;
            end if;
        end process;

end architecture full_dp_mem_arch;
