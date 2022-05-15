--------------------------------------------------------------------
--------------------------SIMPLE LSFR IN VHDL-----------------------
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity lsfr is
    port(   --Inputs--
            rst     : in std_logic;
            clk     : in std_logic;
            --Outputs--
            q       : out std_logic_vector(7 downto 0));
end entity lsfr;

--architecure definitions--
architecture lsfr_arch of lsfr is

    --signal definitions--
    signal internal_state   : std_logic_vector(7 downto 0);
    signal lsfr_input       : std_logic;

    begin
        q           <= internal_state;
        lsfr_input  <= internal_state(7) xor internal_state(5) xor internal_state(4) xor internal_state(3);

        process(clk)
        begin
            if(rising_edge(clk)) then
                if(rst = '0') then
                    internal_state <= "0000001";
                else
                    internal_state <= internal_state(6 downto 0) & lsfr_input;
                end if;
            else
                null;
            end if;
        end process;

end architecture lsfr_arch;
