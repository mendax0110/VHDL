----------------------------------------------------------------------------
-------------------ODD-PARITY-GENERATOR-TESTBENCH IN VHDL-------------------
----------------------------------------------------------------------------
entity ODD_PARITY_TB is
end ODD_PARITY_TB;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.anu.all;

--architecture declaration--
architecture OP_TB_ARCH of ODD_PARITY_TB is

  --component declaration--
  component Parity_Generator1
      port(   --Inputs--
              input_stream : in input;
              clk          : in std_logic;
              --Outputs--
              parity       : out std_logic);
  end component;

  --signal declaration--
  signal input_stream : input;
  signal clk          : std_logic;
  signal parity       : bit;

  begin
      U1 : Parity_Generator1
          port map( input_stream => input_stream,
                    clk          => clk,
                    parity       => parity);
                  
      --process declaration--
      Input1 : process(clk)
          begin
              if clk   <= 'U' then clk <= '0' after 1 ns;
              else clk <= not clk after 1 ns;
              end if;
      end process;

      Input2 : process(clk)
          begin
              input_stream <= "10100110" after 1 ns, "01111100" after 2 ns;
      end process;

end architecture OP_TB_ARCH;

--configuration declaration--
configuration cfg_op of ODD_PARITY_TB is
    for OP_TB_ARCH
    end for;
end configuration;
