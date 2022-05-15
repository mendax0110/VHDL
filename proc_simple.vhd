-----------------------------------------------
--------------Simple Processor-----------------
-----------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity processor is
    port(   --Inputs--
            clk     : in std_logic;
            rst     : in std_logic);
end entity processor;

--architecture declaration--
architecture struct of processor is

    -- ===========
    -- |Constants|
    -- ===========
    constant N : integer := 16; --Memory size (= data width for simplicity)
    constant B : integer := 16; --Data width
    constant R : integer := 4;  --Register file dimension

    -- ===================
    -- | Internal Signals|
    -- ===================
    signal opcode           : std_logic_vector(3 downto 0);
    signal pc_en            : std_logic;
    signal ir_en            : std_logic;

    signal alu_op_b_sel     : std_logic;
    signal alu_ctrl_op      : std_logic_vector(1 downto 0);

    signal reg_we_l         : std_logic;
    signal reg_op_a_sel     : std_logic;
    signal reg_op_b_sel     : std_logic;
    signal reg_wr_d_sel     : std_logic;

    signal mem_sel_l        : std_logic;
    signal mem_we_l         : std_logic;

    begin

        -- =============
        -- | Data path |
        -- =============
        data_path_unit : entity work.data_path
                generic map(N => N
                            B => R
                            R => R)

                            port map(
                                        clk             => clk,
                                        rst             => rst,
                                        alu_op_b_sel    => alu_op_b_sel,
                                        alu_ctrl_op     => alu_ctrl_op,
                                        pc_en           => pc_en,
                                        ir_en           => ir_en,
                                        reg_we_l        => reg_we_l,
                                        reg_op_a_sel    => reg_op_a_sel,
                                        reg_op_b_sel    => reg_op_b_sel,
                                        reg_wr_d_sel    => reg_wr_d_sel,
                                        mem_sel_l       => mem_sel_l,
                                        mem_we_l        => mem_we_l,
                                        opcode          => opcode
                                    );

        -- =======
        -- | FSM |
        -- =======
        ctrl_fsm_unit : entity work.ctrl_fsm
                            port map(
                                        clk             => clk,
                                        rst             => rst,
                                        opcode          => opcode,
                                        alu_op_b_sel    => alu_op_b_sel,
                                        alu_ctrl_op     => alu_ctrl_op,
                                        pc_en           => pc_en,
                                        ir_en           => ir_en,
                                        reg_we_l        => reg_we_l,
                                        reg_op_a_sel    => reg_op_a_sel,
                                        reg_op_b_sel    => reg_op_b_sel,
                                        reg_wr_d_sel    => reg_wr_d_sel,
                                        mem_sel_l       => mem_sel_l,
                                        mem_we_l        => mem_we_l,
                                    );                      

end architecture struct;