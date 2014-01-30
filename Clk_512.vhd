library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clk_512 is -- for this unit, we need to build up a new lower speed clock which is 512 times slower than system clock
		Port( Clk: in std_logic;
			  Reset: in std_logic;
			  Clk512: out std_logic);
end Clk_512;

architecture Behavioral of Clk_512 is
signal counter_512: std_logic_vector (9 downto 0);  -- we have to devide 512 so we need 10 bits to make it count to 512
  begin
	    process(counter_512) 
	      begin
		  if(counter_512 = "1000000000") then -- since we only take one pulse for each 512 count, we now is similar to devide the clock speed to 512 times
		     Clk512 <= '1';
		  else
			 Clk512 <= '0';
		  end if;
	    end process;
	    
	    process (Clk, Reset)
	      begin
		  if (Reset ='1') then
			  counter_512 <= "0000000000";    
		  elsif(Clk='1'and Clk'event) then  
			    counter_512 <= counter_512+ "0000000001"; -- 512 counter will increament accompany with system clock
		  end if;
	    end process;
end Behavioral;