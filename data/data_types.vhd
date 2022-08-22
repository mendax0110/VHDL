-----------------------------------------------------
-----------------vhdl data types---------------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--setup the packages--
package data_types is
    type vector is array(natural range <>) of std_logic_vector(31 downto 0);
    function to_vec (slv: std_logic_vector) return vector;
    function to_slv (v: vector) return std_logic_vector;
end package data_types;

--make the package body--
package body data_types is

    function to_vec (slv: std_logic_vector) return vector is
    variable c: vector (0 to (slv'length/32)-1);
    begin
        for I in c'range loop
            c(I) := slv((I*32)+31 downto (I*32));
        end loop;
        return c;
    end function to_vec;

    function to_slv (v: vector) return std_logic_vector is
    variable slv: std_logic_vector ((v'length*32)) := v(I);
    begin
        for I in v'range loop
            slv((I*32)+31 downto (I*32)) := v(I);
        end loop;
        return slv;
    end function to_slv;

end package body data_types;