library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity table_nine is
    Port (Reset : in std_logic;
          frame_clk : in std_logic;
          state_out : in std_logic_vector(3 downto 0);
          Button : in std_logic_vector(7 downto 0);
          stop : in std_logic;
          chess_positionX1 : out std_logic_vector(9 downto 0);
          chess_positionY1 : out std_logic_vector(9 downto 0);
          chess_size1 : out std_logic_vector(9 downto 0);
          counter_enablesig1 : out std_logic);
end table_nine;

architecture Behavioral of table_nine is
signal movingX : std_logic_vector(9 downto 0);
signal movingY : std_logic_vector(9 downto 0);
signal chess_motionX : std_logic_vector(9 downto 0);
signal chess_motionY : std_logic_vector(9 downto 0);
signal size : std_logic_vector(9 downto 0);

constant chess_centerX : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 320,10);
constant chess_centerY : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 240,10);
constant chess_stepX : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(2 ,10);
constant chess_stepY : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(2 ,10);

constant chess_maxX :  std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 540,10);
constant chess_maxY :  std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 460,10);
constant chess_minX :  std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 100,10);
constant chess_minY :  std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR( 20,10);

begin
     size <= CONV_STD_LOGIC_VECTOR(20, 10); -- assigns the chess size to be 20
get_chess_moving : process (Reset, frame_clk, state_out, button, stop)
begin
if((state_out = "1111") or (state_out = "0010")) then
  if(Reset = '1') then   --Asynchronous Reset
      chess_motionX <= "0000000000";
      chess_motionY <= "0000000000";
      movingX <= chess_centerX;
      movingY <= chess_centerY;
  elsif(rising_edge(frame_clk)) then
    if((movingX + size >= chess_minX) and (movingX + size <= chess_maxX) and (movingY + size >= chess_minY) and (movingY + size <= chess_maxY)) then
       if(stop = '1') then
           if(Button = x"1D") then -- move up
             counter_enablesig1 <= '1';
             chess_motionX <= "0000000000";
             chess_motionY <= not(chess_stepY) + '1';
          elsif(Button = x"1B") then --  move down
             counter_enablesig1 <= '1';
             chess_motionX <= "0000000000";
             chess_motionY <= chess_stepY;
          elsif(Button = x"1C") then --  move left
             counter_enablesig1 <= '1';
             chess_motionX <= not(chess_stepX) + '1';
             chess_motionY <= "0000000000";
          elsif(Button = x"23") then --  move right
             counter_enablesig1 <= '1';
             chess_motionX <= chess_stepX;
             chess_motionY <= "0000000000";
          else 
             counter_enablesig1 <= '0';
             chess_motionX <= chess_motionX;
             chess_motionY <= chess_motionY;
          end if;
       else
             chess_motionX <= chess_motionX;
             chess_motionY <= chess_motionY;
       end if;
     else
         chess_motionX <= "0000000000";
         chess_motionY <= "0000000000";
     end if;
   movingX <= movingX + chess_motionX;
   movingY <= movingY + chess_motionY; 
  end if;             
end if;
end process;

chess_positionX1 <= movingX;
chess_positionY1 <= movingY;
chess_size1 <= size;

end Behavioral;