-------------------------------------------------------
---------------SIMPLE-F-SYNTH IN VHDL------------------
-------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity simple_f_synth is
    generic(N : integer := 5);
    port(   --Inputs--
            clock               : in std_logic;
            reset               : in std_logic;
            frequency_control   : in std_logic_vector(N - 1 downto 0);
            frequency           : out std_logic);
end entity simple_f_synth;

--architecture declaration--
architecture simple_f_synth_arch of simple_f_synth is

    --component declaration--
    component simple_f_synth_carry_adder is
        generate(N : integer);
        port(   A, D   : in std_logic_vector(N - 1 downto 0);
                cin    : in std_logic;
                Sum    : out std_logic_vector(N - 1 downto 0);
                Cout   : out std_logic);
    end component;

    --component declaration--
    component reg is
        generic(N : integer);
        port(   clock   : in std_logic;
                reset   : in std_logic;
                enable  : in std_logic;
                data    : in std_logic_vector(N - 1 downto 0);
                q       : out std_logic_vector(N - 1 downto 0));
    end component;

    --constant declaration--
    constant HIGH   : std_logic := '1';
    constant LOW    : std_logic := '0';

    --signal declaration--
    signal addr_output, reg_output : std_logic_vector(N - 1 downto 0);
    signal Cout                    : std_logic;

    begin

        adder : simple_f_synth_carry_adder
        generic map(N => N)
        port map(   A    => frequency_control,
                    B    => reg_output,
                    Cin  => LOW,
                    Sum  => addr_output,
                    Cout => Cout);
        
        accumulator : reg
        generic map(N => N)
        port map(   clock   => clock,
            	    reset   => reset,
                    enable  => HIGH,
                    data    => addr_output,
                    q       => reg_output);

        --removes output data hazards coming from the asynchronous adder--
        output_reg  : process(clock, reset)
        begin
            if(reset = '1') then
                frequency <= '0';
            elsif(rising_edge(clock)) then
                frequency <= Cout;
            end if;
        end process;

end architecture simple_f_synth_arch;



        