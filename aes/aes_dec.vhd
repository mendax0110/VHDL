---------------------------------------------------------------
----------------------------aes-dec----------------------------
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--entity declarations--
entity aes_dec is
    port(   --Inputs--
            clk         : in std_logic;
            rst         : in std_logic;
            dec_key     : in std_logic_vector(127 downto 0);
            ciphertext  : in std_logic_vector(127 downto 0);
            --Outputs--
            plaintext   : out std_logic_vector(127 downto 0);
            done        : out std_logic);
end entity aes_dec;

--architecture definitions--
architecture aes_dec_arch of aes_dec is

    signal mux_output           : std_logic_vector(127 downto 0);
    signal reg_output           : std_logic_vector(127 downto 0);
    signal inv_mixcol_input     : std_logic_vector(127 downto 0);
    signal inv_mixcol_output    : std_logic_vector(127 downto 0);
    signal invsr_input          : std_logic_vector(127 downto 0);
    signal invsb_input          : std_logic_vector(127 downto 0);
    signal feedback             : std_logic_vector(127 downto 0);
    signal round_key            : std_logic_vector(127 downto 0);
    signal round_const          : std_logic_vector(7 downto 0);
    signal is_first_round       : std_logic;

    begin
        --Descryption body--
        mux_output <= ciphertext when rst = '0' else feedback;
        reg_inst : entity work.reg
            generic map(
                    size => 128
            )
            port map(
                    clk => clk,
                    d   => mux_output,
                    q   => reg_output
            );

        add_round_key_inst : entity work.add_round_key
            port map(
                    input1 => reg_output,
                    input2 => round_key,
                    output => inv_mixcol_input
            );
        inv_mix_columns_inst : entity work.inv_mix_columns
            port map(
                    input_data  => inv_mixcol_input,
                    output_data => inv_mixcol_output
            );
        invsr_input <= inv_mixcol_input when is_first_round = '1' else inv_mixcol_ouput;
        inv_shift_rows_inst : entity work.inv_shift_rows
            port map(
                    input  => invsr_input,
                    output => invsb_input
            );
        
        inv_sub_byte_inst : entity work.inv_sub_byte
            port map(
                    input_data  => invsb_input,
                    output_data => feedback
            );
        --Key schedule--
        key_schedule_inst : entity work.key_schedule
            port map(
                    clk         => clk,
                    rst         => rst,
                    key         => dec_key,
                    round_const => round_const,
                    round_key   => round_key
            );
        --Controller-- 
        controller_inst : entity work.Controller
            port map(
                    clk             => clk,
                    rst             => rst,
                    rconst          => round_const,
                    is_first_round  => is_first_round,
                    done            => done
            );
        plaintext <= inv_mixcol_input;

end architecture aex_dec_arch;