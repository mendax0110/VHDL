--------------------------------------------------------------
-----------------CLOCKS AND REGISTERS IN VHDL-----------------
--------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity clks_n_regs_5 is
    port(   --Inputs--
            clk  : in std_logic;
            rst  : in std_logic;
            
            start : in std_logic;
            stop  : in std_logic;
            --Outputs--
            count   : out std_logic_vector(3 downto 0);
            stop_d2 : out std_logic);
end entity clks_n_regs_5;

--architecture declaration--
architecture clks_n_regs_5_arch of clks_n_regs_5 is
    
    signal count_us : unsigned(3 downto 0);

    begin
        ----------design  implementation----------
        Reg_Proc : process(clk, rst)
            variable cnt_en  : std_logic;
            variable stop_d1 : std_logic;
        begin
            if (rst = '1') then
                cnt_en   :=  '0';
                count_us <= X'0';
                stop_d1  :=  '0';
                stop_d2  <=  '0';
            elsif rising_edge(clk) then
                --SR Flop--
                if (start = '1') then
                    cnt_en := '1';
                elsif (stop = '1') then
                    cnt_en := '0';
                end if;

                --two delays--
                stop_d1 := stop;
                stop_d2 <= stop_d1;
            
            end if;
        end process;
        
        count <= std_logic_vector(count us);

end architecture clk_n_regs_5_arch;