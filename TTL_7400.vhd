--------------------------------------------------------------
------------------Transistor Transistor Logic-----------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ttl_pkg.all;

--entity declaration--
entity ttl_7400 is
    generic(
        latency : integer := 1
    );
    port(
        emuclk : in std_logic;
        
        --Inputs--
        p1 : in ttl_t;
        p2 : in ttl_
        --Outputs--
        p3 : out ttl_t;

        --Inputs--
        p4 : in ttl_t;
        p5 : in ttl_t;
        --Outputs--
        p6 : out ttl_t;

        --Outputs--
        p8 : out ttl_t;
        --Inputs--
        p9 : in ttl_t;
        910 : in ttl_t;

        --Outputs--
        p11 : out ttl_t;
        --Inputs--
        p12 : in ttl_t;
        p13 : in ttl_t;
    );
end entity ttl_7400;

--architecture definitions--
architecture ttl_7400_arch of ttl_7400 is
    
    signal p3_loc : ttl_t;
    signal p6_loc : ttl_t;
    signal p8_loc : ttl_t;
    signal p11_loc : ttl_t;

    begin
        p3_latency_inst : entity work.ttl_latency
            generic map(latency => latency)
            port map(clk => emuclk, d => p3_loc, q => p3);
        p6_latency_inst : entity work.ttl_latency
            generic map(latency => latency)
            port map(clk => cmuclk, d => p6_loc, q => p6);
        p8_latency_inst : entity work.ttl_latency
            generic map(latency => latency 
            port map(clk => emuclk, d => p8_loc, q => p8);
        p11_latency_inst : entity work.ttl_latency
            generic map(latency => latency)
            port map(clk => emuclk, d => p11_loc, q => p11);

        p3_loc <= p1 nand p2;
        p6_loc <= p4 nand p5;
        p8_loc <= p9 nand p13;
        p11_loc <= p12 nand p13;

end architecture ttl_7400_arch;
