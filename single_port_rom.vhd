library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity single_port_rom is
    port(   addr : in natural range 0 to 255;
            clk  : in std_logic;
            q    : out std_logic_vector(7 downto 0));
end single_port_rom;

architecture rtl of single_port_rom is
    --build a 2-d array type for the ROM
    subtype word_t is std_logic_vector(7 downto 0);
    type memory_t is array(255 downto 0) of word_t;

    function init_rom
            return memory_t is
                variable tmp : memory_t := (others => (others => '0'));
                begin
                    for addr_pos in 0 to 255 loop 
                            --initalize each address with the address itself
                            tmp(addr_pos) := std_logic_vector(to_unsigned(addr_pos, 8));
                    end loop;
                return tmp;
    end init_rom;

    --declare the rom signal and specify a default value. Quartus II
    --will create a memory initialization file(.mif) based on the default value
    signal rom : memory_t := init_rom;

    begin
        process(clk)
        begin
            if (rising_edge(clk)) then
                q <= rom(addr);
            end if;
        end process;
end rtl;