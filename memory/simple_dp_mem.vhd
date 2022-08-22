library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity simple_dp_mem is
    port(   --Inputs--
            rst     : in std_logic;
            clk     : in std_logic;
            
            dat_in  : in std_logic_vector(15 downto 0);
            wr_adr  : in std_logic_vector(9 downto 0);
            wr_en   : in std_logic;
            
            --Outputs--
            dat_out : out std_logic_vector(15 downto 0);
            rd_adr  : in std_logic_vector(9 downto 0));
end entity simple_dp_mem;

--architecture declaration--
architecture simple_dp_mem_arch of simple_dp_mem is

    --2D array type for the RAM--
    type array_1kx16 is array(1023 downto 0) of 
                            std_logic_vector(15 downto o);
    --declare the RAM--
    signal ram : array_1kx16;
    
    begin
        process(clk)
        begin
            if rising_edge(clk) then

                if(wr_en = '1') then
                    ram(to_integer(unsigned(wr_adr))) <= dat_in;

                    --read-during-write return NEW data--
                    dat_out <= ram(to_integer(unsigned(rd_adr)));
                else
                    --read only--
                    dat_out <= ram(to_integer(unsigned(rd_adr)));

                end if;
            end if;
        end process;
                
end architecture simple_dp_mem_arch;