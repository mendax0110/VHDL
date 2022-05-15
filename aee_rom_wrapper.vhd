------------------------------------------------------
-------------------AEE_ROM_WRAPPER--------------------
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pp_utilities.all;

--entitiy definitions--
entity aee_rom_wrapper is
    generic(
        MEMORY_SIZE : natural := 4096 --memory size in bytes!
    );
    port(   --Inputs--
            clk         : in std_logic;
            reset       : in std_logic;
            
            wb_adr_in   : in std_logic_vector(log2(MEMORY_SIZE) -1 downto 0);
            wb_cyc_in   : in std_logic;
            wb_stb_in   : in std_logic;
            wb_sel_in   : in std_logic_vector(3 downto 0);
            --Outputs--
            wb_dat_out  : out std_logic_vector(31 downto 0);
            wb_ack_out  : out std_logic);
end entity aee_rom_wrapper;

--architecure definitions--
architecture aee_rom_wrapper_arch of aee_rom_wrapper is

    --signal definitions--
    signal read_data : std_logic_vector(31 downto 0);
    signal data_mask : std_logic_vector(31 downto 0);

    begin
        rom : entity work.aee_rom
        port map(
            clka => clk,
            addra => wb_adr_in(log2(MEMORY_SIZE) -1 downto 2),
            douta => read_data
        );

    data_mask <= (31 downto 24 => wb_sel_in(3), 23 downto 16 => wb_sel_in(2),
                15 downto 8 => wb_sel_in(1), 7 downto 0 => wb_sel_in(0));

    wb_dat_out <= read_data and data_mask;

    wb_ack_out <= ack and wb_cyc_in and wb_stb_in;

    wishbone : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                ack <= '0';
            else
                if wb_cyc_in = '1' and wb_stb_in = '1' then
                    ack <= '1';
                else
                    ack <= '0';
                end if;
            end if;
        end if;
    end process;

end architecture aee_rom_wrapper_arch;