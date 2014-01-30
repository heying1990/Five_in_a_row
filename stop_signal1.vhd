library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity stop_detector1 is
  Port(Q1 : in std_logic_vector(4 downto 0);
       SetZero : out std_logic;
       stop : out std_logic);
end stop_detector1;      

architecture Behavioral of stop_detector1 is  
signal stopsig : std_logic;
signal SetZerosig : std_logic;
begin
get_stop_signal : process(Q1)
begin
     if(Q1 = "11001") then -- count to 15 which the chess move 30 pixels
         stopsig <= '1'; 
         SetZerosig <= '1';
     elsif(Q1 = "00000") then
         stopsig <= '1';
         SetZerosig <= '0';
     else
         stopsig <= '0';
         SetZerosig <= '0';
     end if;
end process;
stop <= stopsig;
SetZero <= SetZerosig;
end Behavioral;