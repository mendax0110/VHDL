-----------------------------------------------------
----------arithmetic logic unit mini-----------------
-----------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.constants.all;
use work.ctypes.all;

--entity declarations--
entity ALU is
    port(   --Inputs--
            clk         : in aluModes;
            aOpr        : in std_logic_vector(wordLength -1 downto 0);
            bOpr        : in std_logic_vector(wordLength -1 downto 0);
            --Outputs--
            zf          : out std_logic;
            result      : out std_logic_vector(wordLength -1 downto 0));
end entity ALU;

--architecure definition--
architecture ALU_arch of ALU is

    signal tresult: std_logic_vector(wordLength -1 downto 0);

    begin
        process(iFn, aOpr, bOpr)
        begin
            case iFn is
                when mAdd => tresult <= (aOpr + bOpr);
                when mNor => tresult <= (not (a0pr or bopr));
                when mCmp => tresult <= (aOpr xor bOpr);
                when mRot => tresult <= bOpr(0) & bOpr(wordLength -1 downto 1);
            end case;
        
            if(unsigned(tresult) = 0) then
                zf <= '1';
            else
                zf <= '0';
            end if;

            result <= tresult;
        end process;

end architecture ALU_arch;