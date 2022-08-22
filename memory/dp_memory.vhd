------------------------------------------------------------------------
--------------------------dual port memory------------------------------
------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity dualport_mem is
    port(   --Inputs--
            rst         : in std_logic;
            clk         : in std_logic;
            ----------
            dat_in      : in std_logic_vector(15 downto 0);
            wr_adr      : in std_logic_vector(9 downto 0);
            wr_en       : in std_logic;
            --Outputs--
            dat_out     : out std_logic_vector(15 downto 0);
            --Input--
            rd_adr      : in std_logic_vector(9 downto 0));
end entity dualport_mem;

--architecutre definition--
architecture dualport_mem_arch of dualport_mem is

    --2D array type for RAM--
    type array_1kx16 is array(1023 downto 0) of 
                            std_logic_vector(15 downto 0);

    --decalre the RAM--
    signal ram : array_1kx16;

    begin
        process(clk)
        begin
            if rising_edge(clk) then

                if(wr_en = '1') then
                    ram(to_integer(unsigned(wr_adr))) <= dat_in;
                    --read during write returns NEW DATA--
                    dat_out <= ram(to_integer(unsigned(rd_adr)));
                else
                    --read only--
                    dat_out <= ram(to_integer(unsigned(rd_adr)));
                end if;

            end if;
        end process;

end architecture dualport_mem_arch;
