------------------------------------------------
-------------------TxUnit-----------------------
------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity TxUnit is
    port(   --Inputs--
            clk_i       : in std_logic; --Clock signal--
            reset_i     : in std_logic; --reset input--
            enable_i    : in std_logic; --enable input--
            load_i      : in std_logic; --load input--
            datai_i     : in std_logic_vector(7 downto 0); --byte to transmit--
            --Outputs--
            txd_o       : out std_logic; --RS-232 Data output--
            busy_o      : out std_logic; --Tx busy--
            wip_o       : out std_logic); --work in progress(transmitting or w/data to)
end entity TxUnit;

--architecture definition--
architecture TxUnit_arch of TxUnit is
    
    signal  tbuff_r     : std_logic_vector(7 downto 0); --transmit buffer--
    signal  t_r         : std_logic_vector(7 downto 0); --transmit register--
    signal  loaded_r    : std_logic := '0'; --buffer loaded--
    signal  txd_r       : std_logic := '1'; --Tx buffer ready--
    signal  bitpos      : integer range 0 to 10; --bit position in the frame--

    begin
        busy_o <= load_i or loaded_r;
        txd_o  <= txd_r;
        wip_o  <= '1' when loaded_r = '1' or bitpos/=0 else '0';

        --Tx process--
        process(clk_i)
        begin
            if rising_edge(clk_i) then
                if reset_i = '1' then
                    loaded_r <= '0';
                    bitpos   <= 0;
                    txd_r    <= '1';
                else --reset_i = '0'--
                    if load_i = '1' then
                        tbuff_r   <= datai_i;
                        loaded_r  <= '1';
                    end if;
                    if enable_i = '1' then
                        case bitpos is
                            when 0 => --idle or stop bit--
                                txd_r <= '1';
                                if loaded_r = '1' then --start transmit. next is start bit--
                                    t_r <= tbuff_r;
                                    loaded_r <= '0';
                                    bitpos <= 1;
                                end if;
                            when 1 => --start bit--
                                txd_r <= '0';
                                bitpos <= 2;
                            when others =>
                                txd_r <= t_r(bitpos -2); --serialisation of t_r--
                                bitpos <= bitpos +1;
                        end case;
                        if bitpos = 9 then --bit8, next is stop bit--
                            bitpos <= 0;
                        end if;
                    end if;
                end if;
            end if;
        end process;

end architecture TxUnit_arch;