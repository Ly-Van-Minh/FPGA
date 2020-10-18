----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2020 10:25:47 AM
-- Design Name: 
-- Module Name: Reg_Comp_Add - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
----------------------------------------------------------------------------------
entity Reg_Comp_Add is
    Port ( i_clk: in std_logic;
           i_a: in integer range 0 to 7;
           i_b: in integer range 0 to 7;
           o_comp: out std_logic;
           o_sum: out integer range 0 to 15);
end entity Reg_Comp_Add;
----------------------------------------------------------------------------------
architecture Behavioral of Reg_Comp_Add is
    signal s_comp: std_logic;
    signal s_sum: integer range 0 to  15;
begin
    s_comp <= '1' when i_a > i_b else '0';
    s_sum <= i_a + i_b;
    process(i_clk)
    begin
        if(rising_edge(i_clk)) then
            o_comp <= s_comp;
            o_sum <= s_sum;
        end if;
    end process;

end architecture Behavioral;
