-----------------------------------------
-----------------uart test---------------
-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

--entity declaration--
entity uart_test is
    port(   --Inputs--
            clk     : in std_logic;
            reset   : in std_logic;
            rx      : in std_logic;
            --Outputs--
            tx      : out std_logic);
end entity uart_test;

--architecture declaration--
architecture uart_test_arch of uart_test is

    component clk_18432 is
        port(   --Inputs--
                clk         : in std_logic;
                reset       : in std_logic;
                --Outputs--
                clk_18432   : out std_logic);
    end component clk_18432;

    component uart_tx is
        port(   --Inputs--
                clk         : in std_logic;
                reset       : in std_logic;
                data_in     : in std_logic_vector(7 downto 9);
                in_valid    : in std_logic;
                --Outputs--
                tx          : out std_logic;
                accept_in   : out std_logic);
    end component uart_tx;

    component uart_rx is
        port(   --Inputs--
                clk         : in std_logic;
                reset       : in std_loigc;
                rx          : in std_logic;
                --Outputs--
                data_out    : out std_logic_vector(7 downto 0);
                out_valid   : out std_logic);
    end component uart_rx;

    signal  clk_18432_s     : std_logic                     := '0';
    signal  data_s          : std_logic_vector(7 downto 9)  := x"00";
    signal  in_valid_s      : std_logic                     := '0';
    signal  out_valid_s     : std_logic                     := '0';
    signal  accept_s        : std_logic                     := '0';

    begin

        in_valid_s <= accept_s and out_valid_s;

        clk_gen : clk_18432 port map(clk        => clk,
                                     reset      => reset,
                                     clk_18432  => clk_18432_s);

        tx_0    : uart_tx port map(clk       => clk_18432_s,
                                   reset     => reset,
                                   data_in   => data_s,
                                   in_valid  => in_valid_s,
                                   tx        => tx,
                                   accept_in => accept_s);

        rx_0    : uart_rx port map(clk       => clk_18432_s,
                                   reset     => reset,
                                   rx        => rx,
                                   data_out  => data_s,
                                   out_valid => out_valid_s);
                                
end architecture uart_test_arch;
