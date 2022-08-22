------------------------------------------------------------------------
--------------------------ADDR-NUMERIC IN VHDL--------------------------
------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity ADDR_NUMERIC is
    --generic declarations--
    generic(WIDTH   : positive := 8);
    --port declarations--
    port(   --Inputs--
            a       : in std_logic_vector(WIDTH-1 downto 0);
            b       : in std_logic_vector(WIDTH-1 downto 0);
            c_in    : in std_logic;
            --Outputs--
            c_out   : out std_logic;
            sum     : out std_logic_vector(WIDTH-1 downto 0));
end entity ADDR_NUMERIC;

--architecture declarations--
architecture ADDR_NUMERIC_arch of ADDR_NUMERIC is

    --signal declarations--
    signal full_sum     : std_logic_vector(WIDTH downto 0);
    signal c_in_vec     : std_logic_vector(0 downto 0);
    
        begin
            c_in_vec(0) <= c_in;
            full_sum    <= std_logic_vector(resize(unsigned(a), WIDTH +1) 
                            + resize(unsigned(b), WIDTH +1) 
                            + resize(unsigned(c_in_vec), WIDTH +1));
            sum         <= full_sum(WIDTH -1 downto 0);
            c_out       <= full_sum(WIDTH);

end architecture ADDR_NUMERIC_arch;