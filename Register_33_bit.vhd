library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_33_bit is -- we use  up down left right as control so we need bigger register
    Port ( Clk : in std_logic;
           Reset : in std_logic;
           ps2data : in std_logic; 
           data_en: in std_logic;
           Data_out : out std_logic_vector(32 downto 0));
end register_33_bit;

architecture Behavioral of register_33_bit is
signal data_33_bit: std_logic_vector(32 downto 0);
  begin
     get_data : process(Clk, Reset, ps2data, data_en)
  begin
     if (Reset = '1') then
		 data_33_bit <= "000000000000000000000000000000000"; 
	 elsif (rising_edge(Clk)) then
		if (data_en ='1') then
			data_33_bit <= ps2data & data_33_bit(32 downto 1);
		else
			data_33_bit <= data_33_bit;
		end if;
	 end if;
  end process;
Data_out <= data_33_bit;
end Behavioral;