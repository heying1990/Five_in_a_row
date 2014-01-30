library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_FlipFlop is
port(D, clk, reset: in std_logic;
     Q: out std_logic);
end D_FlipFlop;

architecture behavioral of D_FlipFlop is
begin
 Dflipflop : process(reset, clk)
 begin
   if (reset = '1') then
      Q <= '0';
   elsif(rising_edge(clk)) then
      Q <= D;
   end if;
 end process;
end behavioral;