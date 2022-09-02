-----------------------------------------------------------------------
-------------------------CPU-TOP-LEVEL IN VHDL-------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.cpu_lib.all;

--entity cpu_top--
entity top is
end top;

--architecture cpu_top_arch--
architecture cpu_top_arch of top is

    --component memory--
    component mem
        port(   --Inputs--
                addr    : in bit16;
                sel     : in std_logic;
                rw      : in std_logic;
                --Outputs--
                ready   : out std_logic;
                data    : inout bit16);
    end component mem;

    --component cpu--
    component cpu
        port(   --Inputs--
                clk     : in std_logic;
                rst     : in std_logic;
                ready   : in std_logic;
                --Outputs--
                addr    : out bit16;
                rw      : out std_logic;
                vma     : out std_logic;
                data    : inout bit16);
    end component cpu;

    --signal declarations--
    signal addr, data       : bit16;
    signal vma, rw, ready   : std_logic;
    signal clk, rst         : std_logic := '0';

    begin

        clk <= not clk after 50 ns;
        rst <= '1', '0' after 100ns;

        m1 : mem port map(addr, vma, rw, ready, data);
        u1 : cpu port map(clk, rst, read, addr, rw, vma, data);

end architecture cpu_top_arch;