----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------------------------

entity Microprocessor_tb is

    -------------------Ram----------------------------
    -- generic(address_bus: integer := 4;
    --         data_bus: integer := 4);
    -------------------Rom----------------------------
    -- generic(address_bus: integer := 8;
    --         data_bus:    integer := 4);
    -----------------------Alu-------------------------
    -- generic(data_bus: integer := 4);

    -------------General_Purpose_Register-----------------
    -- generic(data_bus: integer := 4);

    ------------------Program counter Register-----------
    -- generic(data_bus: integer := 4);

    ----------------------Multiplexer_2x1-----------------
    -- generic(data_bus: integer := 4);
end entity Microprocessor_tb;
----------------------------------------------------------------------------------
architecture Behavioral of Microprocessor_tb is

    ------------------------Ram--------------------------------
    -- component Microprocessor is
    --     port ( i_clk:        in std_logic;
    --            i_read_write: in std_logic;
    --            i_n_enable:   in std_logic;
    --            i_address:    in std_logic_vector(address_bus-1 downto 0);
    --            i_data_in:    in std_logic_vector(data_bus-1 downto 0);
    --            o_data_out:   out std_logic_vector(data_bus-1 downto 0));
    -- end component;

    -- signal s_clk:        std_logic := '0';
    -- signal s_read_write: std_logic := '0';
    -- signal s_n_enable:   std_logic := '0';
    -- signal s_address:    std_logic_vector(address_bus-1 downto 0) := (others => '0');
    -- signal s_data_in:    std_logic_vector(data_bus-1 downto 0) := (others => '0');
    -- signal s_data_out:   std_logic_vector(data_bus-1 downto 0);
    -- constant const_clk: time := 1 us;

    ------------------------Rom--------------------------------
    -- component Microprocessor is
    --     port ( i_clk:     in std_logic;
    --            i_address: in std_logic_vector((address_bus-1) downto 0);
    --            o_data:    out std_logic_vector((data_bus-1) downto 0));
    -- end component;

    -- signal s_clk:       std_logic := '0';
    -- signal s_address:   std_logic_vector((address_bus-1) downto 0) := (others => '0');
    -- signal s_data:      std_logic_vector((data_bus-1) downto 0);
    -- constant const_clk: time := 1 us;
    --------------------------Alu---------------------------
    -- component Microprocessor is
    --     port ( i_Alu_in1:  in std_logic_vector(data_bus-1 downto 0);
    --            i_Alu_in2:  in std_logic_vector(data_bus-1 downto 0);
    --            i_opcode:   in std_logic_vector(2 downto 0);
    --            o_Alu_out:  out std_logic_vector(data_bus-1 downto 0);
    --            o_ZC_flags: out std_logic_vector(1 downto 0));
    -- end component;

    -- signal s_Alu_in1:  std_logic_vector(data_bus-1 downto 0) := (others => '0');
    -- signal s_Alu_in2:  std_logic_vector(data_bus-1 downto 0) := (others => '0');
    -- signal s_opcode:   std_logic_vector(2 downto 0) := (others => '0');
    -- signal s_Alu_out:  std_logic_vector(data_bus-1 downto 0);
    -- signal s_ZC_flags: std_logic_vector(1 downto 0);

    ---------------General Purpose Register------------------
    -- component Microprocessor is
    --     port ( i_clk:     in std_logic;
    --            i_opcode:  in std_logic;
    --            i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --            o_res_out: out std_logic_vector((data_bus-1) downto 0));
    -- end component;

    -- signal s_clk:     std_logic := '0';
    -- signal s_opcode:  std_logic := '0';
    -- signal s_res_in:  std_logic_vector((data_bus-1) downto 0) := (others => '0');
    -- signal s_res_out: std_logic_vector((data_bus-1) downto 0);
    -- constant const_clk: time := 1 us;

    ------------------Program counter Register----------------------
    -- component Microprocessor is
    --     port ( i_clk:     in std_logic;
    --            i_opcode:  in std_logic_vector(2 downto 0);
    --            i_res_in:  in std_logic_vector((data_bus-1) downto 0);
    --            o_res_out: out std_logic_vector((data_bus-1) downto 0));
    -- end component;

    -- signal s_clk:     std_logic := '0';
    -- signal s_opcode:  std_logic_vector(2 downto 0) := (others => '0');
    -- signal s_res_in:  std_logic_vector((data_bus-1) downto 0) := (others => '0');
    -- signal s_res_out: std_logic_vector((data_bus-1) downto 0);
    -- constant const_clk: time := 1 us;

    -------------------------Multiplexer_2x1-----------------------
    -- component Microprocessor is
    --     port ( i_Mux_in1: in std_logic_vector((data_bus-1) downto 0);
    --            i_Mux_in2: in std_logic_vector ((data_bus-1) downto 0);
    --            i_select:  in std_logic;
    --            o_Mux_out: out std_logic_vector ((data_bus-1) downto 0));
    -- end component;

    -- signal s_Mux_in1: std_logic_vector((data_bus-1) downto 0) := (others => '0');
    -- signal s_Mux_in2: std_logic_vector((data_bus-1) downto 0) := (others => '0');
    -- signal s_select:  std_logic := '0';
    -- signal s_Mux_out: std_logic_vector((data_bus-1) downto 0);

    ---------------- Instruction Decoder ---------------------------
    -- component Microprocessor is
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
    --            o_alu_opcode:     out std_logic_vector(2 downto 0));
    -- end component;
  
    -- signal s_clk:            std_logic := '0';
    -- signal s_reset:          std_logic := '0';
    -- signal s_ZC_flags:       std_logic_vector(1 downto 0) := (others => '0');
    -- signal s_instruction:    std_logic_vector(3 downto 0) := (others => '0');
    -- signal s_pc_clear:       std_logic;
    -- signal s_pc_increase:    std_logic;
    -- signal s_pc_load:        std_logic;
    -- signal s_reg_load:       std_logic;
    -- signal s_mar_load:       std_logic;
    -- signal s_ram_enable:     std_logic;
    -- signal s_ram_read_write: std_logic;
    -- signal s_mux_select:     std_logic;
    -- signal s_ir_load:        std_logic;
    -- signal s_a_load:         std_logic;
    -- signal s_buff_load:      std_logic;
    -- signal s_alu_opcode:     std_logic_vector(2 downto 0);
    -- constant const_clk: time := 1 us;

    -------------------- Microprocessor ---------------------------
    component Microprocessor is
        port ( i_clk:   in std_logic;
               i_reset: in std_logic;
               o_output: out std_logic_vector(3 downto 0);
               o_rom_addr: out std_logic_vector(7 downto 0);
               o_rom_data: out std_logic_vector(7 downto 0);
               o_ram_addr: out std_logic_vector(3 downto 0);
               o_alu:      out std_logic_vector(3 downto 0);
               o_IR:       out std_logic_vector(3 downto 0);
               o_mux:      out std_logic_vector(3 downto 0);
               o_flags:    out std_logic_vector(1 downto 0);
               o_buf:      out std_logic_vector(3 downto 0));
    end component;

    signal s_clk:       std_logic := '0';
    signal s_reset:     std_logic := '0';
    signal s_output:    std_logic_vector(3 downto 0);
    signal s_rom_addr:  std_logic_vector(7 downto 0);
    signal s_rom_data:  std_logic_vector(7 downto 0);
    signal s_ram_addr:  std_logic_vector(3 downto 0);
    signal s_alu:       std_logic_vector(3 downto 0);
    signal s_IR:        std_logic_vector(3 downto 0);
    signal s_mux:       std_logic_vector(3 downto 0);
    signal s_flags:     std_logic_vector(1 downto 0);
    signal s_buf:       std_logic_vector(3 downto 0);
    constant const_clk: time := 10 us;

begin

    --------------------------------Ram----------------------------
    -- dut: Microprocessor
    --     port map(i_clk => s_clk, i_read_write => s_read_write, i_n_enable => s_n_enable,
    --              i_address => s_address, i_data_in => s_data_in, o_data_out => s_data_out);
    
    -- s_clk <= not s_clk after const_clk/2;

    -- n_enable: process
    -- begin
    --     s_n_enable <= '0';
    --     wait for 50 us;
    --     s_n_enable <= '1';
    --     wait for 40 us;
    -- end process n_enable;

    -- read_write: process
    -- begin
    --     s_read_write <= '0';
    --     wait for 30 us;
    --     s_read_write <= '1';
    --     wait;
    -- end process read_write;

    -- address: process
    -- begin
    --     s_address <= std_logic_vector(unsigned(s_address) + 1);
    --     wait for 2 us;
    -- end process address;

    -- data_in: process
    -- begin
    --     s_data_in <= std_logic_vector(unsigned(s_data_in) + 1);
    --     wait for 4 us;
    -- end process data_in;

    --------------------------------Rom----------------------------
    -- dut: Microprocessor
    --     port map(i_clk => s_clk, i_address => s_address, o_data => s_data);

    -- s_clk <= not s_clk after const_clk/2;

    -- address: process
    -- begin
    --     s_address <= s_address + 1;
    --     wait for 15 us;
    -- end process address;

    --------------------------------Alu-------------------------------
    -- dut: Microprocessor
    --     port map(i_Alu_in1 => s_Alu_in1, i_Alu_in2 => s_Alu_in2, i_opcode => s_opcode,
    --              o_Alu_out => s_Alu_out, o_ZC_flags => s_ZC_flags);

    -- in1:process
    -- begin
    --     s_Alu_in1 <= s_Alu_in1 + x"1";
    --     wait for 20 us;
    -- end process in1;

    -- in2: process
    -- begin
    --     s_Alu_in2 <= s_Alu_in2 + x"1";
    --     wait for 25 us;
    -- end process in2;

    -- opcode: process
    -- begin
    --     s_opcode <= s_opcode + "001";
    --     wait for 10 us;
    -- end process opcode;

    -----------------General Purpose Register------------------------
    -- dut: Microprocessor
    --     port map(i_clk => s_clk, i_opcode => s_opcode, i_res_in => s_res_in, o_res_out => s_res_out);

    -- s_clk <= not s_clk after const_clk/2;
    -- opcode: process
    -- begin
    --     s_opcode <= '0';
    --     wait for 20 us;
    --     s_opcode <= '1';
    --     wait for 50 us;
    -- end process opcode;

    -- res_in: process
    -- begin
    --     s_res_in <= s_res_in + 1;
    --     wait for 5 us;
    -- end process res_in;

    ------------------Program counter Register-----------------------
    -- dut: Microprocessor
    --     port map(i_clk => s_clk, i_opcode => s_opcode, i_res_in => s_res_in, o_res_out => s_res_out);

    -- s_clk <= not s_clk after const_clk/2;

    -- opcode: process
    -- begin
    --     s_opcode <= s_opcode + 1;
    --     wait for 10 us;
    -- end process opcode;

    -- res_in: process
    -- begin
    --     s_res_in <= s_res_in + 1;
    --     wait for 5 us;
    -- end process res_in;

    -------------------------Multiplexer_2x1-----------------------
    -- dut: Microprocessor
    --     port map(i_Mux_in1 => s_Mux_in1, i_Mux_in2 => s_Mux_in2, i_select => s_select, o_Mux_out => s_Mux_out);

    -- Mux_in1: process
    -- begin
    --     s_Mux_in1 <= s_Mux_in1 + 1;
    --     wait for 10 us;
    -- end process Mux_in1;

    -- Mux_in2: process
    -- begin
    --     s_Mux_in2 <= s_Mux_in2 + 1;
    --     wait for 5 us;
    -- end process Mux_in2;

    -- sel: process
    -- begin
    --     s_select <= not s_select;
    --     wait for 50 us;
    -- end process sel;

    ---------------- Instruction Decoder ---------------------------
    -- dut: Microprocessor
    -- port map(i_clk => s_clk, i_reset => s_reset, i_ZC_flags => s_ZC_flags, i_instruction => s_instruction,
    --          o_pc_clear => s_pc_clear, o_pc_increase => s_pc_increase, o_pc_load => s_pc_load,
    --          o_reg_load => s_reg_load, o_mar_load => s_mar_load, o_ram_enable => s_ram_enable,
    --          o_ram_read_write => s_ram_read_write, o_mux_select => s_mux_select, o_ir_load => s_ir_load,
    --          o_a_load => s_a_load, o_buff_load => s_buff_load, o_alu_opcode => s_alu_opcode);

    -- s_clk <= not s_clk after const_clk/2;
    -- reset: process
    -- begin
    --     s_reset <= '1';
    --     wait for 50 us;
    --     s_reset <= '0';
    --     wait for 1000 ms;
    -- end process reset;

    -- zc_flags: process
    -- begin
    --     s_ZC_flags <= s_ZC_flags + 1;
    --     wait for 150 us;
    -- end process zc_flags;

    -- instruction: process
    -- begin
    --     s_instruction <= "1000";
    --     wait for 15 us;
    --     s_instruction <= "1001";
    --     wait for 15 us;
    --     s_instruction <= "1010";
    --     wait for 15 us;
    --     s_instruction <= "1011";
    --     wait for 15 us;
    --     -- s_instruction <= "1100";
    --     -- wait for 15 us;
    --     -- s_instruction <= "1101";
    --     -- wait for 15 us;
    --     s_instruction <= "1110";
    --     wait for 15 us;
    --     s_instruction <= "0000";
    --     wait for 15 us;
    --     s_instruction <= "0010";
    --     wait for 15 us;
    --     s_instruction <= "0100";
    --     wait for 15 us;
    --     -- s_instruction <= "0001";
    --     -- wait for 15 us;
    --     -- s_instruction <= "0010";
    --     -- wait for 15 us;
    --     -- s_instruction <= "0101";
    --     -- wait for 15 us;
    --     -- s_instruction <= "0111";
    --     -- wait for 15 us;
    --     -- s_instruction <= "0110";
    --     -- wait for 15 us;
    --     -- s_instruction <= "0111";
    --     -- wait for 15 us;
    --     -- s_instruction <= "1111";
    --     -- wait for 15 us;
    -- end process instruction; 

    -------------------- Microprocessor ---------------------------

    dut: Microprocessor
        port map(i_clk => s_clk, i_reset => s_reset, o_output => s_output, o_rom_addr => s_rom_addr,
                 o_rom_data => s_rom_data, o_ram_addr => s_ram_addr,o_alu => s_alu, o_IR => s_IR,
                 o_mux => s_mux, o_flags => s_flags, o_buf => s_buf);

    s_clk <= not s_clk after const_clk/2;

    reset: process
    begin
        s_reset <= '1';
        wait for 100 us;
        s_reset <= '0';
        wait for 1000 us;
    end process reset;

end architecture Behavioral;
----------------------------------------------------------------------------------