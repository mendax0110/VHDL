------------------------------------------------------
----------------accumulator register------------------
------------------------------------------------------

--entitiy declaration--
entity accumulator_register is
    port(   --Inputs--
            clk         : in std_logic;
            data_in     : in std_logic_vector(7 downto 0);
            load        : in std_logic;
            --Outputs--
            data_out    : out std_logic_vector(7 downto 0));
end entity accumulator_register;

--architecutre definition--
architecture accumulator_register_arch of accumulator_register is
    
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if load = '1' then
                    data_out <= data_in;
                end if;
            end if;
        end process;

end architecture accumulator_register_arch;

