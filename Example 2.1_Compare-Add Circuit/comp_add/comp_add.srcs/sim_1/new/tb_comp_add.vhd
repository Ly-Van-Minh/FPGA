----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2020 02:37:34 PM
-- Design Name: 
-- Module Name: tb_comp_add - Behavioral
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

entity tb_comp_add is
end entity tb_comp_add;

architecture testbench of tb_comp_add is
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
dut: comp_add port map(
    i_a => i_a,
    i_b => i_b,
    o_comp => o_comp,
    o_sum => o_sum);  
    i_a <= 5;
    uut: process
    begin
        if(i_b < 7) then
            i_b <= i_b + 1; 
        else 
            i_b <= 0;
        end if;
        wait for 10ms;
    end process uut;
end architecture testbench;
