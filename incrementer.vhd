library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity incrementer is
    generic (width : integer :=8);
    port ( datain : in std_logic_vector(width-1 downto 0);
           control: in std_logic;
           dataout: out std_logic_vector(width-1 downto 0);
           flag : out std_logic);
end incrementer;

architecture behv of incrementer is

signal dataout_int: std_logic_vector(width-1 downto 0);
begin
    process(datain, control)
    begin
        if (control = '1')then --increment
            dataout_int<=datain + '1';
        else --feedthrough
            dataout_int<=datain;
        end if;
    end process;
    dataout<=dataout_int;
    flag<='1'when(control= '1' and datain = To_std_logic_vector(X"FF")) else '0';
end behv;

