library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ensc350_package.all;

--entity declaration--
entity DMemLogic is
    port(   in1, in2                : in std_logic_vector(data_size - 1 downto 0);
            immed                   : in std_logic_vector(data_size - 1 downto 0);
            mem_op                  : in mem_commands;
            ddata_in                : in std_logic_vector(data_size - 1 downto 0);
            dmem_read, dmem_write   : out std_logic;
            dmem_out                : out std_logic_vector(data_size - 1 downto 0);
            ddata_out               : out std_logic_vector(data_size - 1 downto 0);
            daddr_out               : out std_logic_vector(data_size - 1 downto 0));
end entity DMemLogic;

--architecture declaration--
architecture behav of DMemLogic is

    --signal resizeImmed : std_logic_vector(daddr_size - 1 downto 0);
    begin
        Dmem : process(in1, in2, mem_op, immed, ddata_in)
                begin
                    if mem_op = mem_lw then
                        dmem_read  <= '1';
                        dmem_write <= '0';
                        daddr_out  <= std_logic_vector(resize(unsigned(signed(in1) + signed(immed)), daddr_size));
                        ddata_out  <= (others => '0');
                    else if mem_op = mem_sw then
                        dmem_write <= '1';
                        dmem_read  <= '0';
                        daddr_out  <= std_logic_vector(resize(unsigned(signed(in2) + signed(immed)), daddr_size));
                        ddata_out  <= in1;
                    else
                        dmem_read  <= '0';
                        dmem_write <= '0';
                        ddata_out  <= (others => '0');
                        daddr_out  <= (others => '0');
                    end if;

                    dmem_out <= ddata_in;
        end process;
end behav;


