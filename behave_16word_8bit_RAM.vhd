LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram16x8 IS
    PORT(address :              IN STD_LOGIC_VECTOR(3 DOWNTO0);
        csbar, oebar, webar :   IN STD_LOGIC;
        data :                  INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ram16x8;

ARCHITECTURE version1 OF ram16x8 IS
    BEGIN
        PROCESS(address, csbar, oebar, webar, data)
                TYPE ram_array IS ARRAY(0 TO 15) OF BIT_VECTOR(7 DONWTO 0);
                VARIABLE index : INTEGER:=0;
                VARIABLE ram_store : ram_array;
        BEGIN 
                IF csbar = '0' THEN
        --calculate address as an integer
                index := 0;
                FOR i IN address'RANGE LOOP
                            IF address(i) = '1' THEN
                                            index := index + 2**i;
                            END IF;
                END LOOP;
        IF rising_edge(webar) THEN
                    --write to ram on rising edge of write pulse
                    ram_store(index) := To_bitvector(data);
        ELSIF oebar = '0' THEN
                    data <= To_StdlogicVector(ram_store(index));
        ELSE
                    data <= "ZZZZZZZZ";
        END IF;
    ELSE
        data <= "ZZZZZZZZ";
    END IF;
END PROCESS;
END version1;
