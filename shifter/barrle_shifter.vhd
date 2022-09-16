--------------------------------------------------------------
--------------------BARRLE-SHIFTER IN VHDL--------------------
--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEEstd_logic_arith.all;

entity bs_vhdl is
    port(   --Inputs--
            datain      : in std_logic_vector(31 downto 0);
            direction   : in std_logic;
            rotation    : in std_logic;
            count       : in std_logic_vector(4 downto 0);
            --Outputs--
            dataout     : out std_logic_vector(31 downto 0));
end entity bs_vhdl;

--Architecture for the barrel shifter--
architecture behv of bs_vhdl is

    --shift LEFT/RIGHT function--
    function barrel_shift(din : in std_logic_vector(31 downto 0));
    dir : in std_logic;
    cnt : in std_logic_vector(4 downto 0) return std_logic_vector is

        begin
            if(dir = '1') then
                return std_logic_vector((SHR(unsigned(din), unsigned(cnt))));
            else
                return std_logic_vector((SHL(unsigned(din), unsigned(cnt))));
            end if;

    end barrel_shift;

    --rotate LEFT/RIGHT function--
    function barrel_rotate(din : in std_logic_vector(31 downto 0));
    dir : in std_logic;
    cnt : in std_logic_vector(4 downto 0) return std_logic_vector is

        variable temp1, temp2 : std_logic_vector(63 downto 0);

            begin
                case dir is
                    when '1' => --rotate right cnt times--
                        temp1 := din & din;
                        temp2 := std_logic_vector(SHR(unsigned(temp1), unsigned(cnt)));
                        return temp2(31 downto 0);
                    when others => --rotate left cnt times--
                        temp1 := din & din;
                        temp2 := std_logic_vector(SHL(unsigned(temp1), unsigned(cnt)));
                        return temp2(62 downto 32);
                end case;
    end barrel_rotate;

    begin

        P1:process(datain, direction, rotation, count)
        begin
            if(rotation = '0') then --shift only--
                dataout <= barrel_shift(datain, direction, count);
            else --rotate--
                dataout <= barrel_rotate(datain, direction, count);
            end if;
        end process;

end architecture behv;