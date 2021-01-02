----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------------------------
entity Microprocessor is

    ----------------------------Ram--------------------------------
    -- generic(address_bus: integer := 4;
    --         data_bus: integer := 4);
            
    -- port ( i_clk:        in std_logic;
    --        i_read_write: in std_logic;
    --        i_n_enable:   in std_logic;
    --        i_address:    in std_logic_vector(address_bus-1 downto 0);
    --        i_data_in:    in std_logic_vector(data_bus-1 downto 0);
    --        o_data_out:   out std_logic_vector(data_bus-1 downto 0));

    ------------------------------Rom-------------------------------
    -- generic(address_bus: integer := 8;
    --         data_bus:    integer := 4);
    -- port ( i_clk:     in std_logic;
    --        i_address: in std_logic_vector((address_bus-1) downto 0);
    --        o_data:    out std_logic_vector((data_bus-1) downto 0));
    ---------------------------Alu---------------------------------
    -- generic(data_bus: integer := 4);
    -- port ( i_Alu_in1:  in std_logic_vector(data_bus-1 downto 0);
    --        i_Alu_in2:  in std_logic_vector(data_bus-1 downto 0);
    --        i_opcode:   in std_logic_vector(2 downto 0);
    --        o_Alu_out:  out std_logic_vector(data_bus-1 downto 0);
    --        o_ZC_flags: out std_logic_vector(1 downto 0));

    -------------------General Purpose Register--------------------
    -- generic(data_bus: integer := 4);
    -- port ( i_clk:     in std_logic;
    --        i_opcode:  in std_logic;
    --        i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --        o_res_out: out std_logic_vector((data_bus-1) downto 0));

    ------------------Program counter Register---------------------
    -- generic(data_bus: integer := 4);
    -- port ( i_clk:     in std_logic;
    --        i_opcode:  in std_logic_vector(2 downto 0);
    --        i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --        o_res_out: out std_logic_vector((data_bus-1) downto 0));

    -------------------------Multiplexer_2x1-----------------------
    -- generic(data_bus: integer := 4);
    -- port ( i_Mux_in1: in std_logic_vector((data_bus-1) downto 0);
    --        i_Mux_in2: in std_logic_vector ((data_bus-1) downto 0);
    --        i_select:  in std_logic;
    --        o_Mux_out: out std_logic_vector ((data_bus-1) downto 0));

    ---------------- Instruction Decoder ---------------------------
    -- port ( i_clk:            in std_logic;
    --        i_reset:          in std_logic;
    --        i_ZC_flags:       in std_logic_vector(1 downto 0);
    --        i_instruction:    in std_logic_vector(3 downto 0);
    --        o_pc_clear:       out std_logic;
    --        o_pc_increase:    out std_logic;
    --        o_pc_load:        out std_logic;
    --        o_reg_load:       out std_logic;
    --        o_mar_load:       out std_logic;
    --        o_ram_enable:     out std_logic;
    --        o_ram_read_write: out std_logic;
    --        o_mux_select:     out std_logic;
    --        o_ir_load:        out std_logic;
    --        o_a_load:         out std_logic;
    --        o_buff_load:      out std_logic;
    --        o_alu_opcode:     out std_logic_vector(2 downto 0));
    -------------------- Microprocessor ---------------------------
    port ( i_clk:      in std_logic;
           i_reset:    in std_logic;
           o_output:   out std_logic_vector(3 downto 0);
           o_rom_addr: out std_logic_vector(7 downto 0);
           o_rom_data: out std_logic_vector(7 downto 0);
           o_ram_addr: out std_logic_vector(3 downto 0);
           o_alu:      out std_logic_vector(3 downto 0);
           o_IR:       out std_logic_vector(3 downto 0);
           o_mux:      out std_logic_vector(3 downto 0);
           o_flags:    out std_logic_vector(1 downto 0);
           o_buf:      out std_logic_vector(3 downto 0));

end entity Microprocessor;
----------------------------------------------------------------------------------
architecture Behavioral of Microprocessor is

    ------------------------------Ram------------------------------
    -- component Ram is
    --     port ( i_clk:        in std_logic;
    --            i_read_write: in std_logic;
    --            i_n_enable:   in std_logic;
    --            i_address:    in std_logic_vector(address_bus-1 downto 0);
    --            i_data_in:    in std_logic_vector(data_bus-1 downto 0);
    --            o_data_out:   out std_logic_vector(data_bus-1 downto 0));
    -- end component;

    ------------------------------Rom-------------------------------
    -- component Rom is
    --     port ( i_clk:     in std_logic;
    --            i_address: in std_logic_vector((address_bus-1) downto 0);
    --            o_data:    out std_logic_vector((data_bus-1) downto 0));
    -- end component;
    ----------------------------Alu--------------------------------
    -- component Alu is
    --     port ( i_Alu_in1:  in std_logic_vector(data_bus-1 downto 0);
    --            i_Alu_in2:  in std_logic_vector(data_bus-1 downto 0);
    --            i_opcode:   in std_logic_vector(2 downto 0);
    --            o_Alu_out:  out std_logic_vector(data_bus-1 downto 0);
    --            o_ZC_flags: out std_logic_vector(1 downto 0));        
    -- end component;

    -------------------General Purpose Register---------------------
    -- component General_Purpose_Register is
    --     port ( i_clk:     in std_logic;
    --         i_opcode:  in std_logic;
    --         i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --         o_res_out: out std_logic_vector((data_bus-1) downto 0));
    -- end component;

    ------------------Program counter Register----------------------
    -- component Program_Counter_Register is
    --     port ( i_clk:     in std_logic;
    --            i_opcode:  in std_logic_vector(2 downto 0);
    --            i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --            o_res_out: out std_logic_vector((data_bus-1) downto 0));
    -- end component;

    -------------------------Multiplexer_2x1-----------------------
    -- component Multiplexer_2x1 is
    --     port ( i_Mux_in1: in std_logic_vector((data_bus-1) downto 0);
    --         i_Mux_in2: in std_logic_vector ((data_bus-1) downto 0);
    --         i_select:  in std_logic;
    --         o_Mux_out: out std_logic_vector ((data_bus-1) downto 0));
    -- end component;

    ---------------- Instruction Decoder ---------------------------
    -- component Instruction_Decoder is
    --     port ( i_clk:            in std_logic;
    --            i_reset:          in std_logic;
    --            i_ZC_flags:       in std_logic_vector(1 downto 0);
    --            i_instruction:    in std_logic_vector(3 downto 0);
    --            o_pc_clear:       out std_logic;
    --            o_pc_increase:    out std_logic;
    --            o_pc_load:        out std_logic;
    --            o_reg_load:       out std_logic;
    --            o_mar_load:       out std_logic;
    --            o_ram_enable:     out std_logic;
    --            o_ram_read_write: out std_logic;
    --            o_mux_select:     out std_logic;
    --            o_ir_load:        out std_logic;
    --            o_a_load:         out std_logic;
    --            o_buff_load:      out std_logic;
    --            o_flags_load:     out std_logic;
    --            o_alu_opcode:     out std_logic_vector(2 downto 0));
    -- end component;

    -------------------- Microprocessor ----------------------------
        
    component Ram is
        generic(address_bus: integer := 4;
                data_bus: integer := 4);

        port ( i_clk:        in std_logic;
               i_read_write: in std_logic;
               i_n_enable:   in std_logic;
               i_address:    in std_logic_vector(address_bus-1 downto 0);
               i_data_in:    in std_logic_vector(data_bus-1 downto 0);
               o_data_out:   out std_logic_vector(data_bus-1 downto 0));
    end component;

    component Rom is
        generic(address_bus: integer := 8;
                data_bus:    integer := 4);
        port ( i_clk:     in std_logic;
               i_address: in std_logic_vector((address_bus-1) downto 0);
               o_data:    out std_logic_vector((data_bus-1) downto 0));
    end component;

    component Alu is
        generic(data_bus: integer := 4);

        port ( i_Alu_in1:  in std_logic_vector(data_bus-1 downto 0);
               i_Alu_in2:  in std_logic_vector(data_bus-1 downto 0);
               i_opcode:   in std_logic_vector(2 downto 0);
               o_Alu_out:  out std_logic_vector(data_bus-1 downto 0);
               o_ZC_flags: out std_logic_vector(1 downto 0));        
    end component;

    component General_Purpose_Register is
        generic(data_bus: integer := 4);

        port ( i_clk:     in std_logic;
            i_opcode:  in std_logic;
            i_res_in:  in std_logic_vector((data_bus-1) downto 0);
            o_res_out: out std_logic_vector((data_bus-1) downto 0));
    end component;

    component Program_Counter_Register is
        generic(data_bus: integer := 8);

        port ( i_clk:     in std_logic;
               i_opcode:  in std_logic_vector(2 downto 0);
               i_res_in:  in std_logic_vector((data_bus-1) downto 0);
               o_res_out: out std_logic_vector((data_bus-1) downto 0));
    end component;

    component Multiplexer_2x1 is
        generic(data_bus: integer := 4);

        port ( i_Mux_in1: in std_logic_vector((data_bus-1) downto 0);
            i_Mux_in2: in std_logic_vector ((data_bus-1) downto 0);
            i_select:  in std_logic;
            o_Mux_out: out std_logic_vector ((data_bus-1) downto 0));
    end component;

    component Instruction_Decoder is
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
    end component;

    signal s_A_Alu:             std_logic_vector(3 downto 0);
    signal s_A_Alu_Ram:         std_logic_vector(3 downto 0);
    signal s_Buf_Alu_MAR:       std_logic_vector(3 downto 0);
    signal s_Mar_Ram:           std_logic_vector(3 downto 0);
    signal s_Mux_Buf:           std_logic_vector(3 downto 0);
    signal s_Mux_Ram:           std_logic_vector(3 downto 0);
    signal s_Mux_Rom_IR_PC_Reg: std_logic_vector(3 downto 0);
    signal s_Reg_PC:            std_logic_vector(3 downto 0);
    signal s_IR_InstrDec:       std_logic_vector(3 downto 0);
    signal s_Rom_PC:            std_logic_vector(7 downto 0);
    signal s_PC_in:             std_logic_vector(7 downto 0);
    signal s_ZC_flags_Alu:      std_logic_vector(3 downto 0);
    signal s_ZC_flags_InstrDec: std_logic_vector(3 downto 0);
    signal s_pc_opcode:         std_logic_vector(2 downto 0);
    signal s_alu_opcode:        std_logic_vector(2 downto 0);
    signal s_clk:               std_logic;
    signal s_reset:             std_logic;
    signal s_reg_load:          std_logic;
    signal s_mar_load:          std_logic;
    signal s_ram_enable:        std_logic;
    signal s_ram_read_write:    std_logic;
    signal s_mux_select:        std_logic;
    signal s_ir_load:           std_logic;
    signal s_a_load:            std_logic;
    signal s_buff_load:         std_logic;
    signal s_flags_load:        std_logic;

begin

    ------------------------------Ram-------------------------------
    -- dut: Ram
    -- port map(i_clk => i_clk, i_read_write => i_read_write, i_n_enable => i_n_enable,
    --          i_address => i_address, i_data_in => i_data_in, o_data_out => o_data_out);

    ------------------------------Rom-------------------------------
    -- dut: Rom
    --     port map(i_clk => i_clk, i_address => i_address, o_data => o_data);
    -------------------------------Alu------------------------------
    -- dut: Alu
    --     port map(i_Alu_in1 => i_Alu_in1, i_Alu_in2 => i_Alu_in2, i_opcode => i_opcode,
    --              o_Alu_out => o_Alu_out, o_ZC_flags => o_ZC_flags);

    ----------------------General Purpose Register------------------
    -- dut: General_Purpose_Register
    --     port map(i_clk => i_clk, i_opcode => i_opcode, i_res_in => i_res_in, o_res_out => o_res_out);

    ------------------Program counter Register-----------------------
    -- dut: Program_Counter_Register
    --     port map(i_clk => i_clk, i_opcode => i_opcode, i_res_in => i_res_in, o_res_out => o_res_out);

    -------------------------Multiplexer_2x1-----------------------
    -- dut: Multiplexer_2x1
    --     port map(i_Mux_in1 => i_Mux_in1, i_Mux_in2 => i_Mux_in2, i_select => i_select, o_Mux_out => o_Mux_out);

    ---------------- Instruction Decoder ---------------------------
    -- dut: Instruction_Decoder
    --     port map(i_clk => i_clk, i_reset => i_reset, i_ZC_flags => i_ZC_flags, i_instruction => i_instruction,
    --              o_pc_clear => o_pc_clear, o_pc_increase => o_pc_increase, o_pc_load => o_pc_load,
    --              o_reg_load => o_reg_load, o_mar_load => o_mar_load, o_ram_enable => o_ram_enable,
    --              o_ram_read_write => o_ram_read_write, o_mux_select => o_mux_select, o_ir_load => o_ir_load,
    --              o_a_load => o_a_load, o_buff_load => o_buff_load, o_alu_opcode => o_alu_opcode);

    -------------------- Microprocessor ---------------------------
    s_clk <= i_clk;
    s_reset <= i_reset;
    s_PC_in <= (s_Reg_PC & s_Mux_Rom_IR_PC_Reg);
    o_output <= s_A_Alu_Ram;
    o_rom_addr <= s_Rom_PC;
    o_rom_data <= s_PC_in;
    o_ram_addr <= s_Mar_Ram;
    o_alu      <= s_A_Alu;
    o_IR       <= s_IR_InstrDec;
    o_mux      <= s_Mux_Buf;
    o_buf      <= s_Buf_Alu_MAR;
    o_flags    <= s_ZC_flags_InstrDec(1 downto 0);
    
    A: General_Purpose_Register
        generic map(4) port map(i_clk => s_clk, i_opcode => s_a_load, i_res_in => s_A_Alu,
                                o_res_out => s_A_Alu_Ram);

    Alum: Alu 
        generic map(4) port map(i_Alu_in1 => s_A_Alu_Ram, i_Alu_in2 => s_Buf_Alu_MAR, i_opcode => s_alu_opcode,
                                o_Alu_out => s_A_Alu, o_ZC_flags => s_ZC_flags_Alu(1 downto 0));

    Buff: General_Purpose_Register
        generic map(4) port map(i_clk => s_clk, i_opcode => s_buff_load, i_res_in => s_Mux_Buf,
                                o_res_out => s_Buf_Alu_MAR);

    Mux: Multiplexer_2x1
        generic map(4) port map(i_Mux_in1 => s_Mux_Rom_IR_PC_Reg, i_Mux_in2 => s_Mux_Ram, i_select => s_mux_select,
                                o_Mux_out => s_Mux_Buf);

    Ramm: Ram
    generic map (4, 4)port map(i_clk => s_clk, i_read_write => s_ram_read_write, i_n_enable => s_ram_enable,
                               i_address => s_Mar_Ram, i_data_in => s_A_Alu_Ram, o_data_out => s_Mux_Ram);

    Mar: General_Purpose_Register
    generic map(4) port map(i_clk => s_clk, i_opcode => s_mar_load, i_res_in => s_Buf_Alu_MAR,
                            o_res_out => s_Mar_Ram);
    
    Romm: Rom
        generic map(8, 4)port map(i_clk => s_clk, i_address => s_Rom_PC, o_data => s_Mux_Rom_IR_PC_Reg);
    
    Reg: General_Purpose_Register
    generic map(4) port map(i_clk => s_clk, i_opcode => s_reg_load, i_res_in => s_Mux_Rom_IR_PC_Reg,
                            o_res_out => s_Reg_PC);

    PC: Program_Counter_Register
        generic map(8) port map(i_clk => s_clk, i_opcode => s_pc_opcode, 
                                i_res_in => s_PC_in, o_res_out => s_Rom_PC);

    IR: General_Purpose_Register
        generic map(4) port map(i_clk => s_clk, i_opcode => s_ir_load, i_res_in => s_Mux_Rom_IR_PC_Reg,
                                o_res_out => s_IR_InstrDec);
                                
    InstrDec: Instruction_Decoder
        port map(i_clk => s_clk, i_reset => s_reset, i_ZC_flags => s_ZC_flags_InstrDec(1 downto 0), 
                 i_instruction => s_IR_InstrDec, o_pc_clear => s_pc_opcode(0), o_pc_increase => s_pc_opcode(1),
                 o_pc_load => s_pc_opcode(2), o_reg_load => s_reg_load, o_mar_load => s_mar_load, 
                 o_ram_enable => s_ram_enable, o_ram_read_write => s_ram_read_write, o_mux_select => s_mux_select,
                 o_ir_load => s_ir_load, o_a_load => s_a_load, o_buff_load => s_buff_load, 
                 o_flags_load => s_flags_load, o_alu_opcode => s_alu_opcode);
    FR: General_Purpose_Register
    generic map(4) port map(i_clk => s_clk, i_opcode => s_flags_load, i_res_in => s_ZC_flags_Alu,
                            o_res_out => s_ZC_flags_InstrDec);
end architecture Behavioral;
---------------------------------------------------------------------------------- 