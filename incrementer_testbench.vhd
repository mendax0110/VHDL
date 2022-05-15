library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity tb_inc is
    generic(width : integer := 8);
end tb_inc;

architecture behv of tb_inc is

--define the internal signal which are connected to the UUT

signal datain: std_logic_vector(width-1 downto 0);
signal control: std_logic;
signal dataout: std_logic_vector(width-1 downto 0);
signal flag: std_logic;

--component declaration : required to define the interface of
--the instantiated component

component incrementer
    generic(width : integer);
    port(datain : in std_logic_vector(width-1 downto 0);
        control : in std_logic;
        dataout : out std_logic_vector(width-1 downto 0);
        flag : out std_logic);
end component;

begin

--Process statement providing stimuli to UUT

P1:process
begin
    wait for 2 ns;
    control <= '1'; --increment mode
    loop1_260:for i in 0 to 259 loop
        datain <= conv_std_logic_vector(i, width);
        wait for 10 ns;
    end loop;
        control<='0';--feedthrough mode
        loop2_260:for i in 0 to 259 loop
            datain <= conv_std_logic_vector(i, width);
            wait for 10 ns;
        end loop;
end process;

-------Instantiating the component for testing

I1:incrementer generic map(width => width)
    port map(datain => datain, control => control, dataout => dataout, flag =>flag);
end behv;

--Configuration declaration to bind component declaration to entity-architecture

configuration CFG_top of tb_inc is
    for behv
        for I1:incrementer use entity work.incrementer(behv);
        end for;
    end for;
end CFG_top;
 