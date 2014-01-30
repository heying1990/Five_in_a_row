library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_change is
   Port ( Reset : in std_logic;
          frame_clk : in std_logic;
          Button : in std_logic_vector(7 downto 0);
          success1 : in std_logic;
          success2 : in std_logic;          
          state_out : out std_logic_vector(3 downto 0));
end state_change;

architecture Behavioral of state_change is

type cntrl_state is (welcoming, nine, level1, fifteen, level2, win1, win2);
signal state, next_state : cntrl_state;

begin

start_control : process(Reset, frame_clk)
	begin
		if (Reset = '1') then
			state <= welcoming;
		elsif (rising_edge(frame_clk)) then
			state <= next_state;
	    end if;
	end process;

get_next_state: process(Button, success1, success2)
begin
	case state is

		when welcoming =>
			if ( Button = x"16" ) then -- when 1 is pressed for level 1 (9x9)
				next_state <= nine;
			elsif( Button = x"1E" )then -- when 2 is pressed for level 2 (15x15)
	            next_state <= fifteen;	
			else
			    next_state <= welcoming;
			end if;

		when nine =>
		    if ((Button = x"1D") or (Button = x"1B") or (Button = x"1C")or (Button = x"23")) then -- when direction button is pressed start game
				next_state <= level1;
			elsif(Button = x"32" )then -- when press B means Back to welcoming page
                next_state <= welcoming;
			else
			    next_state <= nine;
			end if;
			
		when fifteen =>
		    if ((Button = x"1D") or (Button = x"1B") or (Button = x"1C")or (Button = x"23")) then -- when direction button is pressed start game
		        next_state <= level2;
			elsif(Button = x"32" )then -- when press B means Back to welcoming page
                next_state <= welcoming;			
		    else
			    next_state <= fifteen;
			end if;
			
		when level1 =>
		    if (success1 = '1' ) then -- win the game
		        next_state <= win1;
			elsif (Button = x"2D")then -- when R is pressed means restart
                next_state <= nine;
			elsif(Button = x"32")then -- press B to back to welcoming page
                next_state <= welcoming;
			else
			    next_state <= level1;
			end if;
		when level2 =>
		    if (success2 = '1' ) then -- win the game
		        next_state <= win2;
			elsif (Button = x"2D")then -- when R is pressed means restart
                next_state <= fifteen;
			elsif(Button = x"32")then -- press B to back to welcoming page
                next_state <= welcoming;
			else
			    next_state <= level2;
			end if;
		when win1 =>
			if(Button = x"32")then
                next_state <= welcoming;
            elsif (Button = x"2D")then -- when R is pressed means restart this level
                next_state <= nine; 
            else        
			    next_state <= win1;
            end if;
	    when win2 =>
			if(Button = x"32")then
                next_state <= welcoming;
            elsif (Button = x"2D")then -- when R is pressed means restart this level
                next_state <= fifteen; 
            else        
			    next_state <= win2;
            end if;
     end case;
end process;
  
get_state_out : process(state)
begin
	case state is
	    when welcoming =>
	       state_out <= "0000";
		when nine =>
		   state_out <= "1001";
		when fifteen =>
		   state_out <= "1111";
	    when level1 =>
	       state_out <= "0001";
	    when level2 =>
	       state_out <= "0010";
		when win1 =>
		   state_out <= "1110"; 
	    when win2 =>
	       state_out <= "1101"; 
	end case;	
end process;
end Behavioral; 