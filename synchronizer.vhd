----------------------------------------------------
-----------------synchronizer-----------------------
----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaraions--
entity synchronizer is
    generic(
        RESET_VALUE     : std_logic := '0'; --reset value of all flip-flops in the chain--
        NUM_FLIP_FLOPS  : natural;  := 2;   --number of flip-flops in the synchronizer chain--
    );
    port(   --Inputs--
            rst         : in std_logic; --asynchronous, high-active--
            clk         : in std_logic; --destination clock--
            data_in     : in std_logic;
            --Outputs--
            data_out    : out std_logic);
end entity synchronizer;

--architecture definitions--
architecture synchronizer_arch of synchronizer is

    --synchronizer chan of FF--
    signal sync_chain : std_logic_vector(NUM_FLIP_FLOPS -1 downto 0) := (others => RESET_VALUE);

    --xilinx XST : disable shift-register LUT(SRL) extraction--
    attribute shreg_extract : string;
    attribute shreg_extract of sync_chain : signal is "no";

    --viavdo: set ASYNC_REG to specify registers receive asyncronous data--
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of sync_chain : signal is "TRUE";

    begin
        --clock and reset logic--
        main : process(clk, rst)
        begin
            if rst = '1' then
                sync_chain <= (others => RESET_VALUE);
            elsif rising_edge(clk) then
                sync_chain <= sync_chain(sync_chain'high -1 downto 0) & data_in;
            end if;
        end process;

        data_out <= sync_chain(sync_chain'high);

end architecture synchronizer_arch;
