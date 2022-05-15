-------------------------------------
----------------FPU-Unit-------------
-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity FPU_Unit is
    generic(N: positive := 32); --default value for N is 32--
    port(   --Input--
            OPP     : in std_logic_vector(2 downto 0);
            A       : in signed(N-1 downto 0);
            B       : in signed(N-1 downto 0);
            --Output--
            result  : out signed(N-1 downto 0));
end entity FPU_Unit;

--architecure declaration--
architecture FPU_Unit_arch of FPU_Unit is
    -------------------------------------------------
    component MUL_FPU
        generic(N: integer := 32); --default value for N is 32--
        port(   --Input--
                A       : in signed((N-1) downto 0);
                B       : in signed((N-1) downto 0);
                --Output--
                SUM     : out signed((N-1) downto 0));
    end component MUL_FPU;

    component ADD_SUB_FPU
        generic(N: integer := 32); --default value for N is 32--
        port(   --Input--
                OPP             : in std_logic_vector(2 downto 0);
                MUL_result      : in signed(N-1 downto 0);
                ADD_SUB_result  : in signed(N-1 downto 0);
                --Output--
                result          : out signed(N-1 downto 0));
    end component ADD_SUB_FPU;

    component FPU_selector
        generic(N: positive := 32);
        port(   --Input--
                OPP             : in std_logic_vector(2 downto 0);
                MUL_result      : in sigend(N-1 downto 0);
                ADD_SUB_result  : in signed(N-1 downto 0);
                --Output--
                result          : out signed(N-1 downto 0));
    end component FPU_selector;

    --aid signals--
    signal  MUL_result      : signed(N-1 downto 0);
    signal  ADD_SUB_result  : signed(N-1 downto 0);
    begin
        -----------------------------
        --mul components, MUL_result = A * B(floating point ieee 754 number)--
        mul_component : MUL_FPU port map(A, B, MUL_result);

        --add components, MUL_result = A + B(floating point ieee 754 number)--
        add_component : ADD_SUB_FPU port map(OPP(0), A, B, ADD_SUB_result);

        --will output the right HI & LO bits according to the OPP code
        selector : FPU_selector generic map(N)
            port map(OPP, MUL_result, ADD_SUB_result, result);
        -----------------------------
    
end architecture FPU_Unit_arch;