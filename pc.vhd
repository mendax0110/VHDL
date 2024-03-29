----------------------------------------------------------------------------
--------------------------------PC IN VHDL----------------------------------
----------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

--entity declaration--
entity program_counter is
    port(   --Inputs--
            clk      : in std_logic;
            PC_in    : in std_logic_vector(7 downto 0);
            rst_bar  : in std_logic; --active low reset signal
            PC_ctrl  : in std_logic;
            --Outputs--
            PC_out   : out std_logic_vector(7 downto 0);
            clk_out  : out std_logic);
end program_counter;

--architecture body declaration--
architecture counter of program_counter is
    begin
        --process declaration--
        pc1 : process(clk, rst_bar, pc_ctrl)
        variable pc   : std_logic_vector(7 downto 0) := "00000000";
        variable pc_1 : std_logic_vector(7 downto 0) := "00000000";
        variable a    : std_logic := '1';
            begin
                if(clk'event and clk = '1') then

                    if(rst_bar = '0') then
                            pc := (others => '0');
                    end if;

                    if(PC_ctrl = '1') then
                            pc_1 := PC-in;
                            a    := '1':
                    end if;

                    if(a = '1') then
                            pc := pc_1;
                            a  := '0';
                    else
                            pc := pc + "00000001";
                    end if;

                    PC_out <= pc;
                end if;
                clk_out <= clk;
        end process pc1;
end counter;

