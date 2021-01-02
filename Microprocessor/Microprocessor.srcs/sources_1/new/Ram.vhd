----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------
entity Ram is

    generic(address_bus: integer := 4;
            data_bus: integer := 4);

    port ( i_clk:          in std_logic;
           i_read_write:   in std_logic;
           i_n_enable:     in std_logic;
           i_address:      in std_logic_vector((address_bus-1) downto 0);
           i_data_in:      in std_logic_vector((data_bus-1) downto 0);
           o_data_out:     out std_logic_vector((data_bus-1) downto 0));
end entity Ram;
----------------------------------------------------------------------------------
architecture Behavioral of Ram is

    type ram_type is array (0 to ((2**address_bus)-1)) of std_logic_vector((data_bus-1) downto 0);
    signal s_read_write: std_logic;
    signal s_enable:     std_logic;
    signal s_address:    std_logic_vector((address_bus-1) downto 0);
    signal s_data_in:    std_logic_vector((data_bus-1) downto 0);
    signal s_ram:        ram_type :=((others => (others => '0')));
begin

    process(i_clk, i_read_write, i_n_enable, i_address, i_data_in)
    begin
        if(rising_edge(i_clk)) then
            s_read_write <= i_read_write;
            s_enable     <= i_n_enable;
            s_address    <= i_address;
            s_data_in    <= i_data_in;
            
            if(s_enable = '0') then
                if(s_read_write = '0') then -- Write data into Ram
                    s_ram(to_integer(unsigned(s_address))) <= s_data_in;
                else                                                        -- Read data from Ram
                    o_data_out <= s_ram(to_integer(unsigned(s_address)));
                end if;
            else
                o_data_out <= "0000";
            end if;
        end if;
    end process;
end architecture Behavioral;
----------------------------------------------------------------------------------