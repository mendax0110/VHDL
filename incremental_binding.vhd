-------------------------------------------------------------------
--------------------INCREMENTAL-BINDING IN VHDL--------------------
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity dff is
    generic(delay : time);
    port(   --Inputs--
            din     : in std_logic;
            clock   : in std_logic;
            --Outputs--
            dout    : out std_logic);
end entity dff;

--entity declarations--
entity top is
    port(   --Inputs--
            z       : in std_logic;
            clock   : in std_logic;
            --Outputs--
            qout    : out std_logic);
end entity top;

--architecture declarations--
architecture struct of top is

    --component declarations--
    component dff is
        port(   --Inputs--
                d   : in std_logic;
                clk : in std_logic;
                --Outputs--
                q   : out std_logic);
    end component dff;

    for d1 : dff use entity work.dff(behave)
                    generic map(clk_to_q 0 => 5.2 ns)
                    port map(d => din, clk => clock, q => open);

    signal
        begin
            d1 : dff port map(z, clock, qout);

end architecture struct;

--configuration declarations--
configuration topcon of top is
    
    for struct
        for d1 : dff generic map(clk_to_1 => 8.1 ns)
                    port map(q => dout);
        end for;
    end for;

end configuration;
