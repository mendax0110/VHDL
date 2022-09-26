--------------------------------------------------------------------------
--------------------------SINGLE-PORT-ROM IN VHDL-------------------------
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity single_port_rom is
    port(   --Inputs--
            addr    : in natural range 0 to 255;
            clk     : in std_logic;
            --Outputs--
            q       : out std_logic_vector(7 downto 0));
end entity single_port_rom;

--architecture declaration--
architecture single_port_rom_arch of single_port_rom is

    --build a 2-d array type for the ROM--
    subtype word_t is std_logic_vector(7 downto 0);
    type memory_t is array(0 to 255) of word_t;

    --function to initialize the ROM--
    function init_rom
        return memory_t is
            --variable declaration--
            variable tmp : memory_t := (others => (others => '0'));
                begin
                    for addr_pos in 0 to 255 loop
                        --initialize each address with the address itself--
                        tmp(addr_pos) := std_logic_vector(to_unsigned(addr_pos, 8));
                    end loop;
            return tmp;
    end init_rom;

    --declare the rom signal and specify a default value. Quartus II--
    --will create a memory initialization file (.mif) based on the default value--
    signal rom : memory_t := init_rom();

    begin
        --process declaration--
        process(clk)
        begin
            if rising_edge(clk) then
                --output the value at the address specified by addr--
                q <= rom(addr);
            end if;
        end process;

end architecture single_port_rom_arch;

