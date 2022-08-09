---------------------------------------------------------------------------------------
-------------------------------4-BIT-NIBBLER-ROM IN VHDL-------------------------------
---------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity rom is
    port(   --Inputs--
            address : in std_logic_vector(7 downto 0);
            clk     : in std_logic;
            --Outputs--
            opcode  : out std_logic_vector(7 downto 0) := (others => '1'));
end entity rom;

--architecture declarations--
architecture rom_arch of rom is

    --signals declarations--
    signal myufm_addr, myufm_dataout                    : std_logic_vector(7 downto 0);
    signal myufm_nread, myufm_nbusy, myufm_data_valid   : std_logic;

    --component declarations--
    component ufm_parallel
        port(   --Inputs--
                ufm_addr_addr       : in std_logic_vector(7 downto 0) := (others => '0');
                ufm_nbusy_nread     : in std_logic := '0';
                --Outputs--
                ufm_datatout        : out std_logic_vector(7 downto 0);
                ufm_data_vaild      : out std_logic;
                ufm_nbusy           : out std_logic := '0');
    end component;

    shared variable nextopcode : std_logic_vector(7 downto 0) := (others => '1');

        begin

            --component instantiations--
            ufm : ufm_parallel
                port map(
                    ufm_addr            => myufm_addr,
                    ufm_nbusy           => myufm_nread,
                    ufm_datatout        => myufm_dataout,
                    ufm_data_vaild      => myufm_data_valid,
                    ufm_nbusy           => myufm_nbusy);

            --process to clock the ROM--
            process(clk)
                begin
                    if rising_edge(clk) then
                        opcode      <= nextopcode;
                        myufm_addr  <= address;
                        myufm_nread <= '0';
                    end if;
            end process;
            
            --process to read the opcode from the ROM--
            process(myufm_data_valid)
                begin
                    if rising_edge(myufm_data_valid) then
                        nextopcode := myufm_dataout;
                    end if;
            end process;

end architecture rom_arch;
