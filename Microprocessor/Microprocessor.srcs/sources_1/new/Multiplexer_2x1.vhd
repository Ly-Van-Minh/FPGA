-- Multiplexer 2 to 1 for 4 bits Microprocessor

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------------------

entity Multiplexer_2x1 is

    generic(data_bus: integer := 4);
    port ( i_Mux_in1: in std_logic_vector((data_bus-1) downto 0);
           i_Mux_in2: in std_logic_vector ((data_bus-1) downto 0);
           i_select:  in std_logic;
           o_Mux_out: out std_logic_vector ((data_bus-1) downto 0));
end entity Multiplexer_2x1;
----------------------------------------------------------------------------------

architecture Behavioral of Multiplexer_2x1 is

begin

    with i_select select
        o_Mux_out <= i_Mux_in1 when '0',
                     i_Mux_in2 when others;
end architecture Behavioral;
----------------------------------------------------------------------------------