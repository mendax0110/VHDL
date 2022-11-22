------------------------------------------------------
------------------------TOP---------------------------
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declaration--
entity top is
    port(   --Inputs--
            item_select     : in std_logic_vector(1 downto 0);
            request         : in std_logic;
            on_tl           : in std_logic;
            take_item       : in std_logic;
            reset           : in std_logic;
            clk             : in std_logic;
            --Outputs--
            ready_led       : out std_logic;
            seg_out         : out std_logic_vector(7 downto 0);
            seg_sel         : out std_logic_vector(7 downto 0));
end entity top;

--architecture declaration--
architecture top_arch of top is

    component seven_four
        port(   --Inputs--
                in1         : in std_logic_vector(3 downto 0);
                in2         : in std_logic_vector(3 downto 0);
                in3         : in std_logic_vector(3 downto 0);
                in4         : in std_logic_vector(3 downto 0);
                clk         : in std_logic;
                --Outputs--
                dp          : out std_logic;
                sel         : out std_logic_vector(3 downto 0);
                segment     : out std_logic_vector(6 downto 0));
    end component;

    --component declaration--
    component FSM
        port(   --Inputs--
                item_select         : in std_logic_vector(1 downto 0);
                request             : in std_logic;
                one_tl              : in std_logic;
                take_item           : in std_logic;
                reset               : in std_logic;
                clk                 : in std_logic;
                --Outputs--
                ready_led           : out std_logic;
                current_state       : out std_logic_vector(3 downto 0);
                girilen_para_out    : out std_logic_vector(3 downto 0));
    end component;
    
    --signal declaration--
    signal current_state_out    : std_logic_vector(3 downto 0);
    signal w4                   : std_logic;
    signal w5                   : std_logic_vector(6 downto 0);
    signal seg_sel_4            : std_logic_vector(3 downto 0);
    signal show_TL              : std_logic_vector(3 downto 0);

    begin

        --map FSM component--
        c0  :   FSM port map(item_select, request, one_tl, take_item, reset, clk, ready_led, current_state_out, show_TL);
        c1  :   seven_four port map(show_TL, "0000", current_state_out, "0101", clk, w4, seg_sel_4, w5);
        
        seg_out <= (w5 & w4);
        seg_sel <= "1111" & seg_sel_4;

end architecture top_arch;


