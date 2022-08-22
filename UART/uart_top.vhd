--------------------------------------------------
-------------------uart top-----------------------
--------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity uart_top is
    port(   --Inputs--
            CLOCK_Y3        : in std_logic;
            USER_RESET      : in std_logic;
            USB_RS232_RXD   : in std_logic;
            --Outputs--
            USB_RS232_TXD   : out std_logic);
end entity uart_top;

--architecure definitions--
architecture uart_top_arch of uart_top is

    --Component declarations--
    component LOOPBACK is
        port(   --Inputs--
                CLOCK   : in std_logic;
                RESET   : in std_logic;
                RX      : in std_logic;
                --Outputs--
                TX      : out std_logic);
    end component LOOPBACK;

    --signals--
    signal tx, rx, rx_sync, reset, reset_sync : std_logic;

    begin
        --Loopback instantiation--
        LOOPBACK_inst1 : LOOPBACK
        port map(   --Inputs/Outputs--
            CLOCK   => CLOCK_Y3,
            RESET   => reset,
            RX      => rx,
            TX      => tx
        );

        --deglitch inputs--
        DEGLITCH : process(CLOCK_Y3)
        begin
            if rising_edge(CLOCK_Y3) then
                rx_sync         <= USB_RS232_RXD;
                rx              <= rx_sync;
                reset_sync      <= USER_RESET;
                reset           <= reset_sync;
                USB_RS232_TXD   <= tx;
            end if;
        end process;

end architecture uart_top_arch;