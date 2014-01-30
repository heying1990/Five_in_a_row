library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_start2 is
  Port(Reset : in std_logic;
       frame_clk : in std_logic;
       counter_enable2 : in std_logic;
       Q2 : out std_logic_vector(4 downto 0); 
       stop : out std_logic);
end counter_start2;       

architecture Behavioral of counter_start2 is  
signal counter : std_logic_vector(4 downto 0);
signal stopsig : std_logic;
begin
get_counter_start : process (Reset, frame_clk, counter_enable2)
begin
    if(Reset = '1') then   --Asynchronous Reset
      counter <= "00000";
      stopsig <= '1';
    elsif(rising_edge(frame_clk)) then
       if(counter_enable2 = '1') then
        counter <= counter + "00001";
        stopsig <= '0';
       end if;        
    end if;
end process;
Q2 <= counter;
stop <= stopsig;
end Behavioral;
