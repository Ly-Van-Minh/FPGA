
-- General purpose register for 4 bits Microprocessor
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------------------

entity General_Purpose_Register is

    generic(data_bus: integer := 4);
    port ( i_clk:     in std_logic;
           i_opcode:  in std_logic;
           i_res_in:  in std_logic_vector((data_bus-1) downto 0);
           o_res_out: out std_logic_vector((data_bus-1) downto 0));
end entity General_Purpose_Register;
----------------------------------------------------------------------------------

architecture Behavioral of General_Purpose_Register is

begin

    process(i_clk, i_opcode, i_res_in)
    begin
        if(rising_edge(i_clk)) then
            if(i_opcode = '1') then -- load new data into rom
                o_res_out <= i_res_in;
            end if;
        end if;
    end process;
end architecture Behavioral;
----------------------------------------------------------------------------------