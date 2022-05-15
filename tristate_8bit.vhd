-----------------------------------------------------------------------
-----------------------Tristate 8Bit buffer----------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity tristate_8bit_buffer is
    port(   --Inputs--
            data_input      : in std_logic_vector(7 downto 0);
            enable,vdd,vss  : in std_logic;
            --Outputs--
            data_output     : out std_logic_vector(7 downto 0));
end entity tristate_8bit_buffer;

--architecure definition--
architecture tristate_8bit_buffer_arch of tristate_8bit_buffer is

    component tristate_8bit_buffer is
        port(   --Inputs--
                data_in     : in std_logic;
                enable      : in std_logic;
                vdd         : in std_logic;
                vss         : in std_logic;
                --Ouputs--
                data_out    : out std_logic);
    end component;

    begin
        buffer : for k in 7 downto 0 generate
            Uk : tristate_8bit_buffer
                port map (
                            data_input(k),
                            enable,
                            vdd,
                            vss,
                            data_output(k)
                );
        end generate buffer;

end architecture tristate_8bit_buffer_arch;

