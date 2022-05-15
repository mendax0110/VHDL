library IEEE;
use IEEE.std_logic_1164.all;

entity rom is
    port(   address : in std_logic_vector(7 downto 0);
            opcode  : out std_logic_vector(7 downto 0) := (others => '1');
            clk     : in std_logic);
end rom;

architecture behaviour of rom is
    
    signal myufm_addr, myufm_dataout : std_logic_vector(7 downto 0);
    signal myufm_nread, myufm_nbusy, myufm_data_valid : std_logic;

        component ufm_parallel
            port(   ufm_addr_addr               : in std_logic_vector(7 downto 0) := (others => '0');
                    ufm_data_vaild_data_valid   : out std_logic;
                    ufm_dataout_dataout         : out std_logic_vector(7 downto 0);
                    ufm_nbusy_nbusy             : out std_logic;
                    ufm_nbusy_nread             : in std_logic := '0');
        end component;

        shared variable nextopcode : std_logic_vector(7 downto 0) := (others => '1');

        begin
            
            ufm : ufm_parallel port map(myufm_addr, myufm_data_valid, myufm_dataout, myufm_nbusy, myufm_nread);

            process(clk)
                begin
                    if rising_edge(clk) then
                            opcode <= nextopcode;
                            myufm_addr <= addres;
                            myufm_nread <= '0';
                    end if;
            end process;

            process(myufm_data_valid)
                begin
                    if rising_edge(myufm_data_valid) then
                            nextopcode := myufm_dataout;
                    end if;
             end process;

end behaviour;
