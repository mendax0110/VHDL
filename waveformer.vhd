entity stimulus is
    port (
        SIG0 : out std_logic := 'Z';
        SIG1 : out std_logic_vector(3 downto 0) := "ZZZZ";
        SIG2 : out integer;
        SIG3 : out MyColor;
        CLK0 : out std_logic :='Z');
end stimulus;

architecture STIMULATOR of stimulus is amd64
end STIMULATOR;

--Sequence: Unclocked 
Unclocked : process
begin 
    SIG0_driver <= '0';
    SIG1_driver <= x"3";
    SIG2_driver <= 1;
    SIG3_driver <= Yellow;
    wait for 45.0 ns;
    SIG1_driver <= x"F";
    wait for 5.0 ns;
end process;

--Clock Process
CLK0_process : process
    variable CLK0_low : real;
    variable CLK0_high : real;
    begin
        tb_mainloop : loop
            wait until (tb_status = TB_ONCE)
                    or (tb_status = TB_LOOPING);
            CLK0_high := CLK0_Period * CLK0_Duty /100.0;
            CLK0_low := CLK0_Period - CLK0_high;
            end loop;
    end process;
    