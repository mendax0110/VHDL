library IEEE;
use IEEE.std_logic_1164.all;

entity reg_test is 
    port(   clk : in std_logic;
            ce  : in std_logic;
            clr : in std_logic;
            d   : in std_logic_vector(3 downto 0);
            q   : out std_logic_vector(3 downto 0));
end reg_test;

architecture regtest_arch of reg_test is
    component FDCE_A
        port(   clk : in std_logic;
                ce  : in std_logic;
                clr : in std_logic;
                d   : in std_logic;
                q   : out std_logic);
    end component;

        begin
            --component instances--
            fdc_1a : FDCE_A
            port map(   d   => d(0),
                        clk => clk,
                        ce  => ce,
                        clr => clr,
                        q   => q(0));

            fdc_2a : FDCE_A
            port map(   d   => d(1),
                        clk => clk,
                        ce  => ce,
                        clr => clr,
                        q   => q(1)); 
            
            fdc_3a : FDCE_A
            port map(   d   => d(2),
                        clk => clk,
                        ce  => ce,
                        clr => clr,
                        q   => q(2));
            
            fdc_4a : FDCE_A
            port map(   d   => d(3),
                        clk => clk,
                        ce  => ce,
                        clr => clr,
                        q   => q(3));

end regtest_arch;
