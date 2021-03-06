-------------------------------------------------
-------------SIMPLE-REGISTER IN VHDL-------------
-------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity simple_reg is
    generic(
        WIDTH : positive := 1
    );
    port(   --Inputs--
            clk     : in std_logic;
            rst     : in std_logic;
            d       : in std_logic_vector(WIDTH-1 downto 0);
            --Outputs--
            q       : out std_logic_vector(WIDTH-1 downto 0));
end entity simple_reg;

--architecure definitions--
architecture simple_reg_arch of simple_reg is

    begin
        process(clk, rst)
        begin
            if(rst = '1') then
                q <= (others => '0');
            elsif(rising_edge(clk)) then
                q <= d;
            end if;
        end process;

end architecture simple_reg_arch;