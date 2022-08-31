-------------------------------------------------------------------
----------------------SHARED-VARIABLE-IN VHDL----------------------
-------------------------------------------------------------------
package share is
    variable timing_checks_on : BOOLEAN := true;
end package share;

use WORK.share.all;

--entity declaration--
entity dff is
    port(   --Inputs--
            din     : in std_logic;
            clk     : in std_logic;
            --Outputs--
            q       : out std_logic);
end entity dff;

--architecure declaration--
architecture behave of dff is

    begin
        --process declaration--
        process(clk) is
            begin
                if(timing_checks_on) then
                    --timing checks--
                    if(rising_edge(clk)) then
                        q <= din;
                    end if;
                end if;
        end process;

end architecture behave;

use WORK.share.all;

--entity declaration--
entity jkff is
    port(   --Inputs--
            j   : in std_logic;
            k   : in std_logic;
            clk : in std_logic;
            se  : in std_logic;
            clr : in std_logic;
            --Outputs--
            q   : out std_logic;
            q   : out std_logic);
end entity jkff;

--architecure declaration--
architecture behave of jkff is

    begin
        --process declaration--
        process(clk, set, clr) is
            begin
                if(timing_check_on) then
                    --timing checks--
                    if(rising_edge(clk)) then
                        q <= se;
                    end if;
                end if;
        end process;
    
end architecture behave;
