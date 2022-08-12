-----------------------------------------------------------------------
----------------------------16-WORD-8BIT-RAM---------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity ram16x8 is
    port(   --Inputs--
            address     : in std_logic_vector(3 downto 0)
            csbar       : in std_logic;
            webar       : in std_logic;
            oebar       : in std_logic;
            --Outputs--
            data        : inout std_logic_vector(7 downto 0));
end entity ram16x8;

--architecture declaration--
architecture ram16x8_arch of ram16x8 is

    begin
        --process declaration--
        process(address, csbar, webar, oebar, data)
            TYPE ram_type is array (0 to 15) of std_logic_vector(7 downto 0);
            VARIABLE index : integer := 0;
            VARIABLE ram_store : ram_type;

        begin
            if csbar = '0' then
                index := 0;
                --calculate address as an integer--
                for i in address'RANGE LOOP
                    if address(i) = '1' then
                        index := index + 2**i;
                    end if;
                end loop;
                --write to ram on rising edge of write pulse--
                if rising_edge(webar) then
                    ram_store(index) := To_bitvector(data);
                elsif oebar = '0' then
                    data <= To_StdlogicVector(ram_store(index));
                else
                    data <= "ZZZZZZZZ";
                end if;
            else
                data <= "ZZZZZZZZ";
            end if;
        end process;
    
end architecture ram16x8_arch;
        