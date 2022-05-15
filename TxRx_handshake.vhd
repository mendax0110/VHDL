------------------------------------------------------------------------
-----------------Transmission-Receive-data-Handshake--------------------
------------------------------------------------------------------------
library IEEE;
library XESS;
use IEEE.std_logic_1164.all;
use XESS.CommonPckg.all;
use work.XessBoardPckg.all;

--entity defininion--
entity TxRx_handshake is
    port(   --Inputs--
            ctrl_i  : in std_logic; --Control signal form source--
            done_i  : in std_logic; --Op done signal from the destination--
            --Outputs--
            ctrl_o  : out std_logic := LO;  --Control signal to the destination--
            done_o  : out std_logic := LO)); --Op done signal to the source--
end entity TxRx_handshake;

--architecture definitions--
architecture TxRx_handshake_arch of TxRx_handshake is
    
    signal done_r : std_logic := LO;

    begin
        process(ctrl_i, done_i, done_r)
        begin
            --raise the control to the destination as soon as the source asserts it,
            --hold it until the desitnation finishes the operation, and then lower it.--
            if ctrl_i = HI and done_i = LO and done_r = LO then
                ctrl_o <= HI;
            elsif done_i = HI or done_r = HI then
                ctrl_o <= LO;
            end if;

            --Tell the source when the destination finishes doing the operation--
            --hold the done signal until the source lowers its contorl signal--
            if ctrl_i = LO then
                done_r <= LO;
            elsif done_i = HI then
                done_r <= HI;
            end if;
        end process;

    done_o <= done_r;

end architecture TxRx_handshake_arch;