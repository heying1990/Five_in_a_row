library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity counter is
  Port(Clk : in std_logic;
       Reset : in std_logic;
       Counter_out : out std_logic_vector(1 downto 0));
end counter;  


architecture Behavioral of counter is
signal count: std_logic_vector(1 downto 0);

Begin
  operate : process( Clk, Reset, count) 
  begin
     if(Reset = '1')then
         count <= "00";
     elsif(rising_edge(Clk)) then
         count <= count + "01";
     end if;
 end process;
 Counter_out <= count;
end Behavioral;