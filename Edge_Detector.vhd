library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Edge_Detector is --  this the edge detector we made, in order to detect whether a new key has been pressed or an old key has been released from the keyboard
   Port ( Reset : in std_logic; 
          ps2Clk : in std_logic;
          Clk_512: in std_logic;
          DataReady : out std_logic);
end Edge_Detector;

architecture behavioral of Edge_Detector is

component D_FlipFlop is  -- here we adopting use two D-FF to build an edge detector from the lecture slides, we take ps2clk as D input to detect its falling edge
	Port( Clk: in std_logic;
		  Reset: in std_logic;
		  D : in std_logic;
		  Q: out std_logic);
end component D_FlipFlop;

signal Q1, Q2: std_logic;
begin
D_FlipFlop_1: D_FlipFlop
	port map (Reset => Reset,
			  Clk => Clk_512,
			  D => ps2Clk,
			  Q => Q1);		  
D_FlipFlop_2: D_FlipFlop
	port map (Reset => Reset,
			  Clk => Clk_512,
			  D => Q1,
			  Q => Q2);		
			    
detect_falling_edge: process(Reset,Q1,Q2)
begin
		if ((Q1='0') and (Q2 = '1')) then -- here we successfully to detect the falling edge of the clock and we can give the signal to register to get new data shift in
			DataReady <= '1'; -- new key has been pressed, so tell the 55 bit register to get new data
		else
			DataReady <= '0'; -- no new key has been pressed, so forbid 55 bit register to get data
		end if;
	end process;
end Behavioral;