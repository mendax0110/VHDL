entity dff is
    generic(delay   : time);
    port(din, clock : in std_logic;
              dout  : out std_logic;)
end entity dff;

entity top is
    port(z, clock : in std_logic;
            qout  : out std_logic);
end entity top;

architecture struct of top is
    component dff is
        port(d, clk : in std_logic;
                q   : out std_logic);
    end component dff;
    for d1 : dff use entity WORK.dff(behave)
                    generic map(clk_to_q => 5.2 ns)
                    port map(d => din, clk => clock, q => open);
    signal
        begin
            -- ..
            --..
        d1 : dff port map(z, clock, qout);
end architecture struct;

configuration topcon of top is
    for struct
        for d1 : dff generic map(clk_to_1 => 8.1 ns)
                     port map(q => dout);
        end for;
    end for;
end configuration topcon;
