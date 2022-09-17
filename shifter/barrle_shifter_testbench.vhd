---------------------------------------------------------------------------
---------------------BARRLE-SHIFTER-TESTBENCH IN VHDL----------------------
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

--entity declaration--
entity tb_bs is
end tb_bs;

--architecture declaration--
architecture behv of tb_bs is

    --instanting the UUT--
    component bs_vhdl
        port(   --Inputs--
                datain      : in  std_logic_vector(7 downto 0);
                direction   : in  std_logic;
                count       : in  std_logic_vector(4 downto 0);
                --Outputs--
                dataout     : out std_logic_vector(31 downto 0));
    end component bs_vhdl;

    --defining the signals connected to the UUT--
    signal datain      : std_logic_vector(31 downto 0);
    signal direction   : std_logic;
    signal count       : std_logic_vector(4 downto 0);
    signal dataout     : std_logic_vector(31 downto 0);

    begin

        --instanting the UUT--
        |1 : bs_vhdl port map(
            datain      => datain,
            direction   => direction,
            count       => count,
            dataout     => dataout
        );

        --applying stimulus to the UUT--
        P1 : process

            begin
                wait for 2 ns;
                    rotation    <= '0'; --shift mode--
                    datain      <= To_std_logic_vector(X"AAAAAAAA");
                    direction   <= '0': --left shift--

                    loop1 : for i in 0 to 31 loop
                        count <= To_std_logic_vector(i, 5);
                        wait for 10 ns;
                    end loop;

                    direction <= '1'; --RIGHT
                    loop3 : for i in 0 to 31 loop
                        count <= conv_std_logic_vector(i, 5);
                    wait for 10 ns;
                    end loop;

                    direction <= '1'; --RIGHT
                    rotation <= '1'; --barrel shift
                    datain <= To_std_logic_vector(X"55555555");
                    loop2 : for i in 0 to 31 loop
                        count <= conv_std_logic_vector(i, 5);
                    wait for 10 ns;
                    end loop;

                    direction <= '0'; --LEFT
                    loop4 : for i in 0 to 31 loop
                        count <= conv_std_logic_vector(i, 5);
                    wait for 10 ns;
                    end loop;
        end process;

end architecture behv;

--top level configuration declaration--
configuration CFG_top of tb_bs is
    for behv
        for |1 : bs_vhdl use entity work.bs_vhdl(behv);
        end for;
    end for;
end configuration CFG_top;

                    