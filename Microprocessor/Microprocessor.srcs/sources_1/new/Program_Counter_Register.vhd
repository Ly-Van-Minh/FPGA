
-- Program counter(PC) for 4 bits Microprocessor
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------------------------

entity Program_Counter_Register is

    generic(data_bus: integer := 8);
    port ( i_clk:     in std_logic;
           i_opcode:  in std_logic_vector(2 downto 0);
           i_res_in:  in std_logic_vector((data_bus-1) downto 0);
           o_res_out: out std_logic_vector((data_bus-1) downto 0));
end entity Program_Counter_Register;
----------------------------------------------------------------------------------

architecture Behavioral of Program_Counter_Register is

    signal s_pc_res: std_logic_vector((data_bus-1) downto 0);
begin
    process(i_clk, i_opcode, i_res_in)
    begin
        if(rising_edge(i_clk)) then
            if(i_opcode(0) = '1') then -- clear pc register
                s_pc_res <= x"00";
            else
                if(i_opcode(1) = '1') then -- increase pc register by 1;
                    s_pc_res <= s_pc_res + 1;
                else
                    if(i_opcode(2) = '1') then -- load new data into pc register;
                        s_pc_res <= i_res_in;
                    end if;
                end if;
            end if;
        end if;
        o_res_out <= s_pc_res;
    end process;
end architecture Behavioral;
----------------------------------------------------------------------------------