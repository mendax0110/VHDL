-------------------------------------------------------------
---------------------LOGIC-ADDER IN VHDL---------------------
-------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity signed_adder--
entity signed_adder is
    port(   --Inputs--
            clr : in std_logic;
            clk : in std_logic;
            a   : in std_logic_vector;
            b   : in std_logic_vector;
            --Outputs--
            q   : out std_logic_vector);
end entity signed_adder;

--architecture signed_adder_arch--
architecture signed_adder_arch of signed_adder is

    --signals--
    signal q_s : signed(a'high+1 downto 0); --extra bit wide--

    begin
        assert(a'length >= b'length)
            report "Port A must be the longer vector if different sizes!"
            severity FAILURE;
        q <= std_logic_vector(q_s);

        adding_proc:
            process(clk, clr)
                begin
                    if(clr = '1') then
                        q_s <= (others => '0');
                    elsif(rising_edge(clk)) then
                        q_s <= ('0' & signed(a)) + ('0' & signed(b));
                    end if;
            end process;

end architecture signed_adder_arch;
