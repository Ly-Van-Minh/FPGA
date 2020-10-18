----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2020 09:30:34 PM
-- Design Name: 
-- Module Name: tb_d-flipflop - testbench
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
entity tb_d_flipflop is
end entity tb_d_flipflop;
----------------------------------------------------------------------------------
architecture testbench of tb_d_flipflop is
    component d_flipflop is
        port( i_d : in std_logic;
              i_clk : in std_logic;
              i_rst : in std_logic;
              o_q : out std_logic);
    end component;
    signal i_d: std_logic := '0';
    signal i_clk: std_logic := '0';
    signal i_rst: std_logic := '0';
    signal o_q: std_logic := '0';
    constant c_clk: time := 10 ms;
begin
    dut: d_flipflop
    port map( i_d => i_d,
              i_clk => i_clk,
              i_rst => i_rst,
              o_q => o_q);
    i_clk <= not i_clk after c_clk/2;
    i_rst <= not i_rst after 52 ms;
    i_d <= not i_d after 12 ms;

end architecture testbench;
