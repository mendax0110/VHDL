-----------------------------------------
--------------bram-----------------------
-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity--
entity bram is
    generic(
        M   : integer := 10;
        N   : integer := 32
    );
    port(   --Inputs--
            clk     : in std_logic;
            we      : in std_logic;
            addr    : in std_logic_vector(M - 1 downto 0);
            din     : in std_logic_vector(N - 1 downto 0);
            --Outputs--
            dout    : out std_logic_vector(N -1 downto 0));
end entity bram;

--architecture definitions--
architecture bram_arch of bram is

    --signal definition--
    type ram_type is array(0 to 2**M - 1) of std_logic_vector(N - 1 downto 0);
    signal RAM : ram_type := (others => (others => '0'));

    process(clk) is
        begin
            if rising_edge(clk) then
                if we = '1' then
                    RAM(to_integer(unsigned(addr))) <= din;
                    --dout <= din; --optional, write first--
                end if;
                dout <= RAM(to_integer(unsigned(addr)));
            end if;
    end process;

end architecture bram_arch;