----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2020 09:27:57 PM
-- Design Name: 
-- Module Name: d-flipflop - Behavioral
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
entity d_flipflop is
    Port ( i_d : in std_logic;
           i_clk : in std_logic;
           i_rst : in std_logic;
           o_q : out std_logic);
end entity d_flipflop;
----------------------------------------------------------------------------------
architecture Behavioral of d_flipflop is

begin
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_q <= '0';
        elsif(rising_edge(i_clk)) then
            o_q <= i_d;
        end if;
    end process;

end architecture Behavioral;
