----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2020 10:26:33 AM
-- Design Name: 
-- Module Name: tb_Reg_Comp_Add - testbench
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
entity tb_Reg_Comp_Add is
end entity tb_Reg_Comp_Add;
----------------------------------------------------------------------------------
architecture testbench of tb_Reg_Comp_Add is
    component Reg_Comp_Add is
        port( i_clk: in std_logic;
              i_a: in integer range 0 to 7;
              i_b: in integer range 0 to 7;
              o_comp: out std_logic;
              o_sum: out integer range 0 to 15);
    end component;
    signal s_clk: std_logic := '0';
    signal s_a: integer range 0 to 7 := 0;
    signal s_b: integer range 0 to 7 := 0;
    signal s_comp: std_logic;
    signal s_sum: integer range 0 to 15;
    constant c_clk: time := 1 ms;
begin
    dut: Reg_Comp_Add
        port map( i_clk => s_clk,
                  i_a => s_a,
                  i_b => s_b,
                  o_comp => s_comp,
                  o_sum => s_sum);
    s_clk <= not s_clk after c_clk/2;
    s_a <= 5;
    uut: process
    begin
        if(s_b < 7) then
            s_b <= s_b + 1;
            wait for 3 ms;
        else
            s_b <= 0;
            wait for 3 ms;
        end if;
    end process;
end architecture testbench;
