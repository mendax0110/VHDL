---------------------------------------------------------
----------------d latch memory in vhdl-------------------
---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declarations--
entity d_mem is
    generic(
        N   : integer; --# of address--
        B   : integer; --word zize--
    );
    port(   --Inputs--
            clk     : in std_logic;
            rst     : in std_logic;
            
            we_l    : in std_logic;
            sel_l   : in std_logic;
            
            r_addr  : in std_logic_vector(N-1 downto 0); --read the address--
            w_addr  : in std_logic_vector(N-1 downto 0); --write the address--
            
            w_data  : in std_logic_vector(B-1 downto 0); --data input--
            --Outputs--
            r_data  : out std_logic_vector(B-1 downto 0)); --data output--
end entity d_mem;

--architecure definitions--
architecture d_mem_arch of d_mem is

    type mem_t is array(2**N - 1 downto 0) of std_logic_vector(B-1 downto 0);

    --signal definitions--
    signal mem_i : mem_t; --storage element--
    signal r_data_q : std_logic_vector(B-1 downto 0); --data output register--

    begin

        -- =================
        -- | Storage Logic |
        -- =================
        ram_reg : process(clk) is
            begin
                if rising_edge(clk) then
                    if rst = '1' then
                        mem_i <= (others => (others => '0'));
                        r_data_q <= (others => '0');
                    else
                        if(sel_l = '1') then
                            r_data_q <= (others => '0');
                        else
                            r_data_Q <= mem_i(to_integer(unsigned(r_addr)));

                            if we_l = '0' then
                                mem_i(to_integer(unsigned(w_addr))) <= w_data;
                            end if;
                        end if;
                    end if;
                end if;
        end process ram_reg;

        -- ================
        -- | Output Logic |
        -- ================
        r_data <= r_data_q;

end architecture d_mem_arch;

