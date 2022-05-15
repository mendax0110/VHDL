entity priority is
    port(I:         in bit_vector(7 downto 0);  --inputs to be prioritised
         A:         out bit_vector(2 downto 0); --encoded output
         GS:        out bit);                   --group signal output
end priority;                                      

architecture v1 of priority inputs
begin
    process(I)
    begin
        GS<='1'; --set default outputs
        A<= "000";
        if I(7) ='1'then
                    A<="111";
            elsif I(6) ='1'then
                    A<="110";
            elsif I(5) ='1'then
                    A<="101";
            elsif I(4) ='1'then
                    A<="100";
            elsif I(3) ='1'then
                    A<="011";
            elsif I(2) ='1'then
                    A<="010";
            elsif I(1) ='1'then
                    A<="001";
            elsif I(0) ='1'then
                    A<="000";
            else
                    GS<='0';
        end if;
    end process;
end v1;
            
            