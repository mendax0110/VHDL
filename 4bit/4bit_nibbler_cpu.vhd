library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entitiy declaration--
entity NibblerCPU is
    port(   clk : in std_logic;
            rst : in std_logic;
            
            prog_addr : out std_logic_vector(11 downto 0);
            prog_data : in std_logic_vector(7 downto 0);
            
            mem_addr     : out std_logic_vector(11 downto 0);
            mem_data_in  : in std_logic_vector(3 downto 0);
            mem_data_out : out std_logic_vector(3 downto 0);
            mem_write    : out std_logic;
            
            io_addr      : out std_logic_vector(3 downto 0);
            io_data_in   : in std_logic_vector(3 downto 0);
            io_data_out  : out std_logic_vector(3 downto 0);
            io_write     : out std_logic;
            io_read      : out std_logic);
end NibblerCPU;

--architecture declaration--
architecture behavioral of NibblerCPU is
    type phase_t        is (FETCH_PHASE, EXECUTE_PHASE);
    type pc_action_t    is (PC_NOP, PC_INCREMENT, PC_LOAD);
    type alu_src_t      is (ALU_MEMORY, ALU_IMMEDIATE);
    type alu_action_t   is (ALU_OP_LEFT, ALU_OP_RIGHT, ALU_OP_ADD, ALU_OP_SUB, ALU_OP_NOR);
    type a_action_t     is (A_NOP, A_LOAD_ALU, A_LOAD_MEMORY, A_LOAD_IO);

    signal pc       : unsigned(11 downto 0) := "000000000000";
    signal a        : std_logic_vector(3 downto 0);
    signal cf, zf   : std_logic := '0';
    signal ir       : std_logic_vector(7 downto 0);
    signal phase    : phase_t;

    signal alu_right   : std_logic_vector(3 downto 0);
    signal alu_left_x  : unsigned(4 downto 0);
    signal alu_right_x : unsigned(4 downto 0);
    signal alu_out     : unsigned(4 downto 0);

    signal pc_action  : pc_action_t;
    signal load_flags : boolean;
    signal alu_src    : alu__src_t;
    signal alu_action : alu_action_t;
    signal a_action   : a_action_t;
    
        begin
            prog_addr    <= std_logic_vector(pc);
            mem_addr     <= ir(3 downto 0) & prog_data;
            io_addr      <= ir(3 downto 0);
            io_data_out  <= a;
            mem_data_out <= a;

            fetch : process(clk, phase) begin
                if rising_edge(clk) and phase = FETCH_PHASE then
                    ir <= prog_data;
                end if;

                with alu_src select
                    alu_right <= ir(3 downto 0) when ALU_IMMEDIATE,
                                 mem_data_in    when ALU_MEMORY;
                    
                    alu_left_x  <= unsigned('0' & a);
                    alu_right_x <= unsigned('0' & alu_right);
                
                with alu_action select
                    alu_out  <= alu_left_x                     when ALU_OP_LEFT,
                                alu_right_x                    when ALU_OP_RIGHT,
                                (alu_left_x)  +  (alu_right_x) when ALU_OP_ADD,
                                (alu_left_x)  -  (alu_right_x) when ALU_OP_SUB,
                                (alu_left_x) nor (alu_right_x) when ALU_OP_NOR;

                update_regs : process(rst, clk) begin
                    if rst = '1' then
                        pc      <= to_unsigned(0, 12);
                        phase   <= FETCH_PHASE;
                    elsif rising_edge(clk) then
                        case a_action is
                            when A_LOAD_ALU     => a <= std_logic_vector(alu_out(3 downto 0));
                            when A_LOAD_MEMORY  => a <= mem_data_in;
                            when A_LOAD_IO      => a <= io_data_in;
                            when a_NOP          =>
                        end case;

                        case pc_action is
                            when PC_INCREMENT   => pc <= pc + 1;
                            when PC_LOAD        => pc <= unsigned(ir(3 downto 0) & prog_data);
                            when PC_NOP         =>
                        end case;

                        if load_flags then
                            cf <= alu_out(4);
                            zf <= not (alu_out(3) and alu_out(2) and alu_ou(1) and alu_out(0));
                        end if;

                        if phase = FETCH_PHASE then
                           phase <= EXECUTE_PHASE;
                        else
                           phase <= FETCH_PHASE;
                        end if;
                    end if;
            end process;

            decode : process(ir, phase, cf, zf) begin

                load_flags      <= false;
                pc_action       <= PC_NOP;
                alu_src         <= ALU_MEMORY;
                alu_action      <= ALU_OP_ADD;
                a_action        <= A_NOP;
                mem_write       <= '0';
                io_read         <= '0';
                io_write        <= '0';

                if phase = FETCH_PHASE then
                    pc_action <= PC_INCREMENT;
                else
                    case ir(7 downto 4) is
                        when "0000" => -- JC
                            if cf = '1' then
                                pc_action <= PC_LOAD;
                            else
                                pc_action <= PC_INCREMENT;
                            end if;
                        when "0001" => --JNC
                            if cf = '0' then
                                pc_action <= PC_LOAD;
                            else
                                pc_action <= PC_INCREMENT;
                            end if;
                        when "0010" => --CMPI
                            alu_src     <= ALU_IMMEDIATE;
                            alu_action  <= ALU_OP_SUB;
                            load_flags  <= true;
                        when "0011" => --CMPM
                            alu_src     <= ALU_MEMORY;
                            alu_action  <= ALU_OP_SUB;
                            load_flags  <= true;
                        when "0100" => --LIT
                            alu_src     <= ALU_IMMEDIATE;
                            alu_action  <= ALU_OP_RIGHT;
                            a_action    <= A_LOAD_ALU;
                        when "0101" => --IN
                            io_read     <= '1';
                            a_action    <= A_LOAD_IO;
                        when "0110" => --LD
                            pc_action   <= PC_INCREMENT;
                            a_action    <= A_LOAD_MEMORY;
                        when "0111" => -- ST
                            pc_action   <= PC_INCREMENT;
                            alu_action  <= ALU_OP_LEFT;
                            mem_write   <= '1';
                        when "1000" => --JZ
                            if zf = '0' then
                                pc_action <= PC_LOAD;
                            else
                                pc_action <= PC_INCREMENT;
                            end if;
                        when "1010" => --ADDI
                            alu_src     <= ALU_IMMEDIATE;
                            alu_action  <= ALU_OP_ADD;
                            a_action    <= A_LOAD_ALU;
                            load_flags  <= true;
                        when "1011" => --ADDM
                            alu_src     <= ALU_MEMORY;
                            alu_action  <= ALU_OP_ADD;
                            a_action    <= A_LOAD_ALU;
                            load_flags  <= true;
                        when "1100" => --JMP
                            pc_action   <= PC_LOAD;
                        when "1101" => --OUT
                            io_write    <= '1';
                        when "1110" => --NORI
                            alu_src     <= ALU_IMMEDIATE;
                            alu_action  <= ALU_OP_NOR;
                            a_action    <= A_LOAD_ALU;
                            load_flags  <= true;
                        when "1111" => --NORM
                            alu_src     <= ALU_MEMORY;
                            alu_action  <= ALU_OP_NOR;
                            a_action    <= A_LOAD_ALU;
                            load_flags  <= true;
                        when others =>
                    end case;
                end if;
            end process;
        
end behavioral;

