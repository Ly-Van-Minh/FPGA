----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2020 05:49:38 PM
-- Design Name: 
-- Module Name: comp_add - Behavioral
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
--use UNISIM.VComponents.all
----------------------------------------------------------------------------------

entity comp_add is
    Port ( i_a, i_b : in integer range 0 to 7;
           o_comp : out std_logic;
           o_sum : out integer range 0 to 15);
end entity comp_add;
----------------------------------------------------------------------------------

architecture Behavioral of comp_add is

begin
    o_comp <= '1' when i_a > i_b else '0';
    o_sum <= i_a + i_b;
end architecture Behavioral;
