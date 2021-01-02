----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------------------------

entity Alu is

    generic(data_bus: integer := 4);
    port ( i_Alu_in1:  in std_logic_vector((data_bus-1) downto 0);
           i_Alu_in2:  in std_logic_vector((data_bus-1) downto 0);
           i_opcode:   in std_logic_vector(2 downto 0);
           o_Alu_out:  out std_logic_vector((data_bus-1) downto 0);
           o_ZC_flags: out std_logic_vector(1 downto 0));
end entity Alu;
----------------------------------------------------------------------------------
architecture Behavioral of Alu is

    signal s_arithmetic: std_logic_vector(data_bus downto 0);
    signal s_logic:      std_logic_vector((data_bus-1) downto 0);
    signal s_Alu_out:    std_logic_vector((data_bus-1) downto 0);
begin

    --Arithmetic unit
    with i_opcode(1 downto 0) select
         s_arithmetic <= ('0' & i_Alu_in1) + ('0' & i_Alu_in2) when "00",
                         ('0' & i_Alu_in1) - ('0' & i_Alu_in2) when "01",
                         ('0' & i_Alu_in1) + ('0' & x"1") when "10",
                         ('0' & i_Alu_in1) - ('0' & x"1") when others;


    --Logic unit
    with i_opcode(1 downto 0) select
            s_logic <= x"0" when "00",
                       i_Alu_in2 when "01",
                       i_Alu_in1 and i_Alu_in2 when "10",
                       not i_Alu_in1  when others;

    with i_opcode(2) select 
        s_Alu_out <= s_arithmetic(data_bus-1 downto 0) when '0',
                     s_logic when others;    

    o_ZC_flags(0) <= s_arithmetic(data_bus) when i_opcode(2) = '0' else -- Carry flag
                     '0';
    o_ZC_flags(1) <= '1' when s_Alu_out = x"0" else -- Zero flag
                     '0';  
    o_Alu_out <= s_Alu_out;
end architecture Behavioral;
----------------------------------------------------------------------------------