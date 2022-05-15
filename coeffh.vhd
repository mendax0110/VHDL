----------------------------------------------------
-------------------coeff helpers--------------------
----------------------------------------------------
library IEEE;
library IEEE_proposed;
use IEEE.math_real.all;
use IEEE.proposed.standard_additions.all;

--package definitions--
package coeffh is

    function optimum_scalling(coeffs : real_vector) return integer;
    function scale_coeffs(coeffs : real_vector; scale : real) return integer_vector;

end package coeffh;

--body definitions--
package body coeffhelpers is

    --determine the optimum power of two scaling for filters coefficients--
    function optimum_scaling(coeffs : real_vector) return integer is
        begin
            return integer(trunc(log2(maximum(coeffs))));
    end function optimum_scaling;

    --scale a real coefficient vector and convert to integers--
    function scale_coeffs(coeffs : real_vector; scale : real) return integer_vector is
        variable result_vec : integer_vector(0 to coeffs'length-1);
            begin
                for ct in coeffs'range loop
                    result_vec(ct) := integer(scale*coeffs(ct));
                end loop;
        return result_vec;
    end function scale_coeffs;

end package body coeffhelpers;

