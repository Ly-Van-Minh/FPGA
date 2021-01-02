--------------------- Rom 128x4 for 4 bits Microprocessor ------------------------

----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------

entity Rom is

    generic(address_bus: integer := 8;
            data_bus:    integer := 4);
    port ( i_clk:     in std_logic;
           i_address: in std_logic_vector((address_bus-1) downto 0);
           o_data:    out std_logic_vector((data_bus-1) downto 0));
end entity Rom;
----------------------------------------------------------------------------------

architecture Behavioral of Rom is
    type rom_type is array(0 to ((2**address_bus)-1)) of std_logic_vector((data_bus-1) downto 0);
    -- signal s_address: std_logic_vector((address_bus-1) downto 0);
    constant const_rom: rom_type := ( 0  => "1000", -- LDA
                                      1  => "0101", -- #5
                                      2  => "1001", -- STA
                                      3  => "0010", -- 2H
                                      4  => "1010", -- ADD
                                      5  => "0110", -- #6
                                      6  => "1011", -- SUB
                                      7  => "0010", -- #2
                                      8  => "1110", -- AND
                                      9  => "0111", -- #7
                                      10 => "0000", -- CMA
                                      11 => "0010", -- INCA
                                      12 => "0100", -- DCRA
                                      13 => "1011", -- SUB
                                      14 => "1110", -- #14
                                      15 => "1100", -- JZ
                                      16 => "0001", -- 4 MSB of 14h
                                      17 => "0100", -- 4 LSB of 14h
                                      18 => "1010", -- ADD
                                      19 => "1000", -- #8
                                      20 => "1010", -- ADD
                                      21 => "1001", -- #9
                                      22 => "1011", -- SUB
                                      23 => "0100", -- #4
                                      24 => "1010", -- ADD
                                      25 => "1110", -- #e
                                      26 => "1101", -- JC
                                      27 => "0000", -- 4 MSB of 00h
                                      28 => "0000", -- 4 LSB of 00h
                                      29 => "0110",
                                      others => "0000");
begin

    process(i_clk)
    begin
        if(rising_edge(i_clk)) then
            -- s_address <= i_address;
        end if;
    end process;
    o_data <= const_rom(to_integer(unsigned(i_address)));
end architecture Behavioral;
----------------------------------------------------------------------------------