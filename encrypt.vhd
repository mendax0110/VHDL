------------------------------------------------
--------------------Encryption------------------
------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declaration--
entity encrypt is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            initial     : in std_logic; --initial image to be encrypted--
            key         : in std_logic_vector(199 downto 0); --secret key to encrypt or decrypt the image--
            encrypt     : in std_logic; --if 1 >> encrypt -- if 0 >> decrypt--
            --Outputs--
            outImage    : out std_logic);
end entity encrypt;

------------------------------------types-----------------------------------------

--architecure definition--
architecture encrypt_arch of encrypt is

    type storage is array(199 downto 0, 199 downto 0) of integer; --data recieved form uart--
    type output is array(199 downto 0, 199 downto 0) of integer; --data will be sent to uart--
    -----------------------------------states-----------------------------------------------
    type states is (state0, state1, state2, state3, state4);
    --state0 : recieve data form uart
    --state1 : make a decision(encrypt or decrypt)
    --state2 : encryption
    --state3 : decryption
    --state4 : return data to matlab
    ----------------------------------signals------------------------------------------------
    signal state_m : states;
    signal s : storage;
    signal o : output;
    -----------------------------------key---------------------------------------------------
    signal K : std_logic_vector(199 downto 0);
    K <= x"123456789ABC048D159E26AF0123456789ABC048D159E26AF";
    -----------------------------------------------------------------------------------------

    begin
        process(clk, rst)
        variable i : integer := 0; -- i:= i + 1; --
        variable j : integer := 0; -- j:= j + 1; --
        begin
            ----------------------------reset----------------------------------------------
            if(clk = '1' and clk'event) then

                if(reset = '1') then
                    state_m <= state0;
            
                else
                    ---------------------------state0------------------------------------------
                    case state_m is
                        when state0 =>
                            --recieve data--
                            state_m <= state1;
                        ------------------state1-------------------------------------------
                        when state1 =>
                            if(encrypt = '1') then
                                state_m <= state2;
                            else
                                state_m <= state3;
                            end if;
                        -----------------state2--------------------------------------------
                        when state2 =>
                            o(i, 0) <= s(i, j) XOR k(j);

                            if j >= 200 then
                                i := i + 1;
                                j := 0;
                            else
                                j := j + 1;
                            end if;
                            state_m <= state4;
                        ----------------state3--------------------------------------------
                        when state3 =>
                            o(i, 0) <= s(i, j) XOR k(j);

                            if j >= 200 then
                                i := i + 1;
                                j := 0;
                            else
                                j := j + 1;
                            end if;
                            state_m <= state4;
                        --------------state4---------------------------------------------
                        when state4 =>
                        --return the image to matlab--
                end if;
            end if;
        end process;

end architecture of encrypt_arch;


                                
