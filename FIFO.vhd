--------------------------------------------------
------------FIVE IN FIVE OUT----------------------
--------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity FIFO is
    generic(ELEM_NUM    : positive := 4; --number of elements--
            ELEM_BITS   : positive := 3); --number of bits per element--
    
    port(   --Inputs--
            wr, rd, clk     : in std_logic;
            elem_in         : in std_logic_vector(ELEM_BITS -1 downto 0);
            --Outputs--
            elem_out        : out std_logic_vector(ELEM_BITS -1 downto 0));
end entity FIFO;

--architecure definitions--
architecture FIFO_arch of FIFO is
    
    type elem_array_type is array(ELEM_NUM -1 downto 0) of std_logic_vector(ELEM_BITS -1 downto 0);
    signal elem_array : elem_array_type;
    constant empty_elem : std_logic_vector(ELEM_BITS -1 downto 0) := (others => '0');
    signal u1 : unsigned(2 downto 0);

    begin
        main_fifo : process(clk) is
            variable counter : natural range 0 to ELEM_NUM := 0;
            variable prev_rd : boolean := false;
            begin
                if(rising_edge(clk)) then
                    if(prev_rd) then
                        elem_arry <= empty_elem & elem_array(ELEM_NUM -1 downto 1);
                    end if;

                    if(wr = '1' and (counter /= ELEM_NUM)) then
                        elem_array(counter) <= elem_in;
                        counter := counter +1;
                    end if;
                    
                    if(rd = '1' and (counter /= 0)) then
                        counter := counter -1;
                        prev_rd := true;
                    end if;

                    if(rd = '0') then
                        prev_rd := false;
                    end if;
                end if;
        end process;

        elem_out <= elem_array(0);
    
end architecture FIFO_arch;
