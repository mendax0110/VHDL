library IEEE;
use IEEE.std_logic_1164.all;
use IEE.std_logic_arith.all;

entity tb_bs is
end tb_bs;

architecture behv of tb_bs is

--Instantiating the UUT

component bs_vhdl
    port(datain : in std_logic_vector(31 downto 0);
        direction : in std_logic;
        count : in std_logic_vector(4 downto 0);
        dataout : out std_logic_vector(31 downto 0));
end component;

--Defining the signals connected to the UUT

signal datain : std_logic_vector(31 downto 0);
signal direction : std_logic;
signal rotation : std_logic;
signal count : std_logic_vector(4 downto 0);
signal dataout : std_logic_vector(31 downto 0);

begin

--Instantiating the UUT

|1 : bs_vhdl port map(datain => datain,
direction => direction,
rotation => rotation,
count => count,
dataout => dataout);

--Applying Stimuli

P1 : process

    	begin
        wait for 2 ns;
        rotation <= '0'; --shift mode
        datain <= To_std_logic_vector(X"AAAAAAAA");
        direction <= '0'; --LEFT
        loop1 : for i in 0 to 31 loop
            count <= conv_std_logic_vector(i, 5);
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
end behv;

--TOP LEVEL CONFIGURATION DECLERATION

configuration CFG_top of tb_bs is
    for behb
        for |1 : bs_vhdl use entity work.bs_vhdl(behv);
        end for;
    end for;
end CFG_top;

