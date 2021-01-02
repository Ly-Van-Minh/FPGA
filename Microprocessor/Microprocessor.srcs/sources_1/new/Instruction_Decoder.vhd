-- Instruction Decoder for 4 bits Microprocessor

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------------------

entity Instruction_Decoder is
    port ( i_clk:            in std_logic;
           i_reset:          in std_logic;
           i_ZC_flags:       in std_logic_vector(1 downto 0);
           i_instruction:    in std_logic_vector(3 downto 0);
           o_pc_clear:       out std_logic;
           o_pc_increase:    out std_logic;
           o_pc_load:        out std_logic;
           o_reg_load:       out std_logic;
           o_mar_load:       out std_logic;
           o_ram_enable:     out std_logic;
           o_ram_read_write: out std_logic;
           o_mux_select:     out std_logic;
           o_ir_load:        out std_logic;
           o_a_load:         out std_logic;
           o_buff_load:      out std_logic;
           o_flags_load:     out std_logic;
           o_alu_opcode:     out std_logic_vector(2 downto 0));
end entity Instruction_Decoder;
----------------------------------------------------------------------------------
architecture Behavioral of Instruction_Decoder is

    type state_t is (reset_s, fetch_s, decode_s, lda_s, sta_s, add_s, sub_s, 
                     jz_s, jc_s, and_s, cma_s, inca_s, dcra_s, hlt_s);

    signal s_pr_state: state_t;
    signal s_nx_state: state_t;
begin

    --------- Lower section of FSM -------------
    process(i_clk, i_reset)
    begin
        if(rising_edge(i_clk)) then
            if(i_reset = '1') then
                s_pr_state <= reset_s;
            else
                s_pr_state <= s_nx_state;
            end if;
        end if;
    end process;

    --------- Upper section of FSM -------------
    process(s_pr_state, i_ZC_flags, i_instruction)
    begin
        
        case s_pr_state is
                when reset_s =>
                o_pc_clear       <= '1'; -- clear PC
                o_pc_increase    <= '0';
                o_pc_load        <= '0';
                o_reg_load       <= '0';
                o_mar_load       <= '0';
                o_ram_enable     <= '1';
                o_ram_read_write <= '1';
                o_mux_select     <= '0';
                o_ir_load        <= '0';
                o_a_load         <= '0';
                o_buff_load      <= '0';
                o_flags_load     <= '1';
                o_alu_opcode     <= "000";
                s_nx_state <= fetch_s;
            when fetch_s => 
                o_flags_load     <= '0';
                o_buff_load      <= '0';
                -- o_reg_load       <= '1'; -- Load MSB of Address
                o_pc_load        <= '0';
                o_a_load         <= '0';
                o_pc_clear       <= '0';
                o_pc_load        <= '0';  
                o_ram_enable     <= '1';
                o_ram_read_write <= '1';             
                o_ir_load        <= '1'; -- load struction into IR
                o_pc_increase    <= '1'; -- increase PC 
                s_nx_state <= decode_s;
            when decode_s =>
                o_ir_load        <= '0';
                -- o_flags_load     <= '0';
                case i_instruction is
                    when "1000" => 
                        o_buff_load      <= '1';
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= lda_s;
                    when "1001" =>
                        o_buff_load      <= '1'; -- Load data from ROM into BUFFER
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= sta_s;
                    when "1010" =>
                        o_buff_load      <= '1'; -- Load data from ROM into BUFFER
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= add_s;
                    when "1011" =>
                        o_buff_load      <= '1'; -- Load data from ROM into BUFFER
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= sub_s;
                    when "1100" =>
                        o_buff_load      <= '0'; -- Load data from ROM into BUFFER
                        o_reg_load       <= '1'; -- Load MSB of Address
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= jz_s;
                    when "1101" =>
                        -- o_buff_load      <= '1'; -- Load data from ROM into BUFFER
                        o_reg_load       <= '1'; -- Load MSB of Address
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= jc_s;
                    when "1110" =>
                        o_buff_load      <= '1'; -- Load data from ROM into BUFFER
                        o_pc_increase    <= '1'; -- increase PC
                        s_nx_state <= and_s;
                    when "0000" =>
                        o_pc_increase    <= '0'; 
                        s_nx_state <= cma_s;
                    when "0010" =>
                        o_pc_increase    <= '0'; 
                        s_nx_state <= inca_s;
                    when "0100" =>
                        o_pc_increase    <= '0'; 
                        s_nx_state <= dcra_s;
                    when "0110" => 
                        o_pc_increase    <= '0'; 
                        s_nx_state <= hlt_s;
                    when others =>
                        o_pc_increase    <= '0'; 
                        s_nx_state <= hlt_s;
                end case;
            when lda_s =>
                o_flags_load     <= '1';
                o_mux_select     <= '0'; -- Select data from ROM              
                o_alu_opcode     <= "101"; -- A <- Buffer
                o_a_load         <= '1'; -- load data from ALU into A
                o_buff_load      <= '0';
                o_pc_increase    <= '0'; -- increase PC
                s_nx_state <= fetch_s;
            when sta_s =>
                o_flags_load     <= '1';
                o_buff_load      <= '0';
                o_mux_select     <= '0'; -- Select data from ROM
                o_mar_load       <= '1'; -- load data from Buffer into MAR
                o_ram_enable     <= '0'; -- enable RAM
                o_ram_read_write <= '0'; -- enable write into RAM
                o_pc_increase    <= '0'; -- increase PC 
                s_nx_state <= fetch_s;
            when add_s =>
                o_flags_load     <= '1';
                o_buff_load      <= '0';
                o_mux_select     <= '0'; -- Select data from ROM
                o_alu_opcode     <= "000"; -- A <- A + Buffer
                o_a_load         <= '1'; -- load data from ALU into A
                o_pc_increase    <= '0'; -- increase PC 
                s_nx_state <= fetch_s;
            when sub_s =>
                o_flags_load     <= '1';
                o_buff_load      <= '0';
                o_mux_select     <= '0'; -- Select data from ROM
                o_alu_opcode     <= "001"; -- A <- A - Buffer
                o_a_load         <= '1'; -- load data from ALU into A
                o_pc_increase    <= '0'; -- increase PC 
                s_nx_state <= fetch_s;
            when jz_s =>
                o_buff_load      <= '0';
                o_pc_increase    <= '0';
                if(i_ZC_flags(1) = '1') then
                    o_reg_load       <= '0';
                    o_pc_load        <= '1';
                end if;   
                s_nx_state <= fetch_s; 
            when jc_s =>
                o_buff_load      <= '0';
                o_pc_increase    <= '0';
                if(i_ZC_flags(0) = '1') then 
                    o_reg_load       <= '0';
                    o_pc_load        <= '1';
                end if;
                s_nx_state <= fetch_s;
            when and_s =>
                o_flags_load     <= '1';
                o_buff_load      <= '0';
                o_mux_select     <= '0'; -- Select data from ROM
                o_alu_opcode     <= "110"; -- A <- A and Buffer
                o_a_load         <= '1'; -- load data from ALU into A
                o_pc_increase    <= '0'; -- increase PC 
                s_nx_state <= fetch_s;
            when cma_s =>
                o_flags_load     <= '1';
                o_mux_select     <= '0'; -- Select data from ROM
                o_a_load         <= '1'; -- load data from ALU into A
                o_buff_load      <= '0';
                o_alu_opcode     <= "111"; -- A <- not A
                s_nx_state <= fetch_s;  
            when inca_s =>
                o_flags_load     <= '1';
                o_mux_select     <= '0'; -- Select data from ROM
                o_a_load         <= '1'; -- load data from ALU into A
                o_buff_load      <= '0';
                o_alu_opcode     <= "010"; -- A <- A + 1
                s_nx_state <= fetch_s;
            when dcra_s =>
                o_flags_load     <= '1';
                o_mux_select     <= '0'; -- Select data from ROM
                o_a_load         <= '1'; -- load data from ALU into A
                o_buff_load      <= '0';
                o_alu_opcode     <= "011"; -- A <- A - 1
                s_nx_state <= fetch_s;
            when hlt_s =>
                o_flags_load     <= '1';
                o_pc_clear       <= '0'; 
                o_pc_increase    <= '0';
                o_pc_load        <= '0';
                o_reg_load       <= '0';
                o_mar_load       <= '0';
                o_ram_enable     <= '1';
                o_ram_read_write <= '1';
                o_mux_select     <= '0';
                o_ir_load        <= '0';
                o_a_load         <= '0';
                o_buff_load      <= '0';
                o_alu_opcode     <= "100";
                s_nx_state <= hlt_s;
            when others =>
                s_nx_state <= fetch_s;
        end case;
    end process;
end architecture Behavioral;
----------------------------------------------------------------------------------