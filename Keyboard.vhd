library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keyboard is 
  Port (Reset : in std_logic;
        Clk : in std_logic;
        Code_33_bit : in std_logic_vector (32 downto 0);
        keyCode_out : out std_logic_vector(7 downto 0));
  end keyboard;
  
architecture Behavior of keyboard is 
type cntrl_state is (A, B, C);
signal state, next_state : cntrl_state;
  begin
       control_state : process (reset, Clk)
       begin
		 if (Reset = '1') then
			 state <= A;
		 elsif (rising_edge(Clk)) then
			state <= next_state;
	     end if;
	   end process;

get_nest_state : process (Code_33_bit(32 downto 0), state)
    begin
         case state is
                      when A =>
                           if (((Code_33_bit(30 downto 23) = x"1D") and (Code_33_bit(19 downto 12) = x"1D")) or -- w is pressed
                               ((Code_33_bit(30 downto 23) = x"1B") and (Code_33_bit(19 downto 12) = x"1B")) or -- s is pressed
                               ((Code_33_bit(30 downto 23) = x"1C") and (Code_33_bit(19 downto 12) = x"1C")) or -- a is pressed
                               ((Code_33_bit(30 downto 23) = x"23") and (Code_33_bit(19 downto 12) = x"23")) or -- d is pressed
                               ((Code_33_bit(30 downto 23) = x"16") and (Code_33_bit(19 downto 12) = x"16")) or -- 1 is pressed
	                           ((Code_33_bit(30 downto 23) = x"1E") and (Code_33_bit(19 downto 12) = x"1E")) or -- 2 is pressed
	                           ((Code_33_bit(30 downto 23) = x"32") and (Code_33_bit(19 downto 12) = x"32")) or -- b is pressed
	                           ((Code_33_bit(30 downto 23) = x"2D") and (Code_33_bit(19 downto 12) = x"2D"))) then -- r is pressed
	                           next_state <= B;
                           else
                               next_state <= A;
                           end if;
                      when B => 
                           if ((Code_33_bit(19 downto 12) = x"F0")) then
                               next_state <= C;
                           else
                               next_state <= B;
                           end if;
                      when C =>
                           if (not(Code_33_bit(19 downto 12) = x"F0")) then
                               next_state <= B;
                           else
                               next_state <= C;
                           end if;
          end case;
     end process;

get_keyCode_out : process(Code_33_bit(32 downto 0), state)
    begin
         case state is 
                      when B => 
                           keyCode_out <= Code_33_bit(30 downto 23);
                      when others =>
                           keyCode_out <= x"FF";
         end case;
    end process;
end Behavior;