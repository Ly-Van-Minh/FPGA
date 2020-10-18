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

entity comp_add_tb is
end entity comp_add_tb;
----------------------------------------------------------------------------------

architecture tb of comp_add_tb is
    component comp_add
        port( i_a, i_b : in integer range 0 to 7;
              o_comp : out std_logic;
              o_sum : out integer range 0 to 15 );
    end component comp_add;
    signal i_a: integer := 0;
    signal i_b: integer := 0;
    signal o_comp: std_logic;
    signal o_sum: integer;

begin
    dut: comp_add 
    port map(
        i_a => i_a,
        i_b => i_b,
        o_comp => o_comp,
        o_sum => o_sum);
    simuli: process  
        i_a <= 5;
        i_b <= i_b++ after 10ms;  
    end process       
end architecture tb;
