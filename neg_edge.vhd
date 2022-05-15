-------------------------------------------------------
----------------negative Edge in VHDL------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity neg_edge is
    port(   --Inputs--
            sclk     : in std_logic; --external shift clock(form master)--
            rst_bar  : in std_logic; --synchronous reset--
            clk      : in std_logic; --system clock--
            --Outputs--
            neg_edge : out std_logic); --negative clock detected(one clk wide)--
end entity neg_edge;

--architecure definitions--
architecture neg_edge_arch of neg_edge is

    --signal definitions--
    signal sclk_delayed : std_logic;
    begin

        process(clk)
        begin
            if rising_edge(clk) then
                if rst_bar = '0' then
                    sclk_delayed <= '0';
                    neg_edge <= '0';
                else
                    sclk_delayed <= sclk;
                    neg_edge <= not sclk and sclk_delayed;
                end if;
            end if;
        end process;
    
end architecture neg_edge_arch;
