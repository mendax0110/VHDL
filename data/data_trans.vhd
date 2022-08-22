------------------------------------------------------------
---------------enable user data transmission----------------
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity declarations--
entity enable_user_data_transmission is
    port(   --Inputs--
            rst                     : in std_logic;
            clk                     : in std_logic;
            start_usr_data_trans    : in std_logic;
            stop_usr_data_trans     : in std_logic;
            --Outputs--
            usr_data_sel            : out std_logic);
end entity enable_user_data_transmission;

--architecure definitions--
architecture enable_user_data_tranmission_arch of enable_user_data_transmission is

    --signal declarations--
    signal usr_data_sel_prev : std_logic := '0';
    
    begin
        process(clk)
        begin
            if rst = '1' then
                usr_data_sel <= '0';
                usr_data_sel_prev <= '0';
            else
                if clk'event and clk = '1' then
                    if(start_usr_data_trans = '1' and usr_data_sel_prev = '0') then
                        usr_data_sel <= '1';
                        usr_data_sel_prev <= '1';
                    end if;
                    if(stop_usr_data_trans = '0' and usr_data_sel_prev = '1') then --stop_usr_data_tranmission--
                        usr_data_sel <= '0';
                        usr_data_sel_prev <= '0';
                    end if;
                end if;
            end if;
        end process;

end architecture enable_user_data_transmisson_arch;
