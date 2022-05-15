----------------------------------------------------------------------
---------Simple Testbench Using Embedded, Explicit Vector-------------
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity tb_sim_sample is
end entity tb_sim_sample_1;

--architecture declaration--
architecture behavioral of tb_sim_sample_1 is

    component sim_sample
        port(   --Inputs--
                clk         : in std_logic;
                rst         : in std_logic;
                --
                dat_in      : in std_logic_vector(7 downto 0);
                enable      : in std_logic;
                --Outputs--
                comp_cnt    : out std_logic_vector(9 downto 0));
    end component;

    constant HALF_PERIOD    : time := 5 ns; --100MHz = 10 ns

    --modular-under-test inputs--
    signal clk          : std_logic;
    signal rst          : std_logic;
    signal data_val     : std_logic_vector(7 downto 0);
    signal end          : std_logic;

    --modular-under-test outputs--
    signal comp_cnt     : std_logic_vector(9 downto 0);

    begin

        --modular under test--

        MUT: sim_sample
        port map
            (
                --Inputs--
                clk         => clk,
                rst         => rst,
                --
                dat_in      => data_val,
                enable      => en,
                --Outputs--
                comp_cnt    => comp_cnt
            );

    ---------------------------------------------------------------
    ------------------------Clock Generator------------------------
    ---------------------------------------------------------------

    clk <= '0' after HALF_PERIOD when clk = '1' else
           '1' after HALF_PERIOD;
        
    ---------------------------------------------------------------
    ----------------------Reset Generator--------------------------
    ---------------------------------------------------------------

    Reset_Gen : process
    begin
        --generate reset--
        for i in 1 to 5 loop 
            if (i < 4) then
                rst <= '1';
            else
                rst <= '0';
            end if;
            wait until falling_edge(clk);
        end loop;
        
        --de-activate this process--
            wait on rst;
    end process Reset_Gen;

    --------------------------------------------------------------
    --------------------Vector Generator--------------------------
    --------------------------------------------------------------

    Vector_Generate_explicit: process
    begin

        data_val <= X"00";
        en       <= '0';

        wait until falling_edge(rst);

        for j in 1 to 3 loop
            wait until falling_edge(clk);
        end loop;

        en <= '1';

        wait until falling_edge(clk);
        data_val <= X"01";
        wait until falling_edge(clk;
        data_val <= X"20";
        wait until falling_edge(clk);
        data_val <= X"21";
        wait until falling_edge(clk);
        data_val <= X"21";
        wait until falling_edge(clk);
        data_val <= X"33";
        wait until falling_edge(clk);
        data_val <= X"56";
        wait until falling_edge(clk);
        data_val <= X"56";
        wait until falling_edge(clk);
        data_val <= X"33";
        wait until falling_edge(clk);

        en <= '0';

        --de-activate this process--
        wait on rst;
        
    end process Vector_Generate_explicit;

end architecture behavioral;






    