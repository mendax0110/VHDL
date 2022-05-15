--------------------------------------------------------
------------------------rca in vhdl---------------------
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity rca is
    generic(M : integer := 32);
    port(   --Inputs--
            a, b    : in std_logic_vector(M-1 downto 0);
            cin     : in std_logic;
            --Outputs--
            s       : out std_logic_vector(M-1 downto 0);
            cout    : out std_logic);
end entity rca;

--architecure definitions--
architecture rca_arch of rca is

    --component definitions--
    component full_addr
    port(   --Inputs--
            a, b, cin : in std_logic;
            --Outputs--
            s, cout   : out std_logic);
    end component full_addr;

    --create intermediate signal that will hold c values--
    signal c : std_logic_vector(M downto 0) := (others => '0');

    begin
        c(0) <= cin;
        cout <= c(M);

        gfa : for i in 0 to M-1 generate
            fa : full_addr
                port map(a=>a(i), b=>(i), cin=>c(i), s=>s(i), cout=>c(i+1));
        end generate;

end architecture rca_arch;
