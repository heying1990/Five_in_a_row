library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity Color_Mapper is
  Port (state_out : in std_logic_vector(3 downto 0);
        DrawX : in std_logic_vector(9 downto 0);
        DrawY : in std_logic_vector(9 downto 0);
        chess_positionX1 : in std_logic_vector(9 downto 0);
        chess_positionY1 : in std_logic_vector(9 downto 0);
        chess_positionX2 : in std_logic_vector(9 downto 0);
        chess_positionY2 : in std_logic_vector(9 downto 0);
        chess_size1 : in std_logic_vector(9 downto 0);
        chess_size2 : in std_logic_vector(9 downto 0);
        Red : out std_logic_vector(9 downto 0);
        Green : out std_logic_vector(9 downto 0);
        Blue : out std_logic_vector(9 downto 0));
end Color_Mapper;

architecture Behavioral of Color_Mapper is
signal square_color : std_logic_vector(2 downto 0);

begin

Draw_Chess_table : process (DrawX, DrawY, state_out, chess_positionX1, chess_positionY1, chess_positionX2, chess_positionY2, chess_size1, chess_size2)

begin
  if (state_out = "0000") then -- welcoming page
    if((DrawX <= CONV_STD_LOGIC_VECTOR(361, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(279, 10)) and (DrawY <= CONV_STD_LOGIC_VECTOR(175, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(10, 10)))then
        if((DrawX <= CONV_STD_LOGIC_VECTOR(350, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY <= CONV_STD_LOGIC_VECTOR(155, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(30, 10)))then
            if(((DrawX <= CONV_STD_LOGIC_VECTOR(330, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(310, 10))) or ((DrawY <= CONV_STD_LOGIC_VECTOR(50, 10)) or (DrawY >= CONV_STD_LOGIC_VECTOR(135, 10))))then
                square_color <= "100"; -- draw an I here
            else 
                square_color <= "010"; 
            end if;
        elsif((DrawX = CONV_STD_LOGIC_VECTOR(361, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(360, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(279, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(280, 10))
           or (DrawY = CONV_STD_LOGIC_VECTOR(175, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(174, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(10, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(11, 10)))then
            square_color <= "100";
        else
            square_color <= "010";    
        end if; 
    else 
          square_color <= "000"; 
    end if; 
    
  elsif ((state_out = "1001") or (state_out = "0001")) then -- this is 9x9 table
      if((DrawX <=CONV_STD_LOGIC_VECTOR(500, 10))and (DrawX >=CONV_STD_LOGIC_VECTOR(119, 10))and (DrawY <= CONV_STD_LOGIC_VECTOR(341, 10))and (DrawY >=CONV_STD_LOGIC_VECTOR(39, 10)))then
		if((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and (DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and (DrawY <= CONV_STD_LOGIC_VECTOR(440, 10))and (DrawY >=CONV_STD_LOGIC_VECTOR(40, 10)))then
			 if(((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(89, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(91, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(139, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(141, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(189, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(191, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(239, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(241, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(289, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(291, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(339, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(341, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(520, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(120, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(389, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(391, 10)))or
				
				((DrawX <=CONV_STD_LOGIC_VECTOR(171, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(169, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(221, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(219, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(271, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(269, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(321, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(319, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(371, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(369, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(421, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(419, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10)))or
				((DrawX <=CONV_STD_LOGIC_VECTOR(471, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(469, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(40, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(440, 10))))then
					square_color <= "111"; --line (black)
			 elsif((((DrawX - chess_positionX1) * (DrawX - chess_positionX1)) + ((DrawY - chess_positionY1) * (DrawY - chess_positionY1))) <= (chess_size1*chess_size1)) then
					square_color <= "101"; -- grey (chess)
			 else
					square_color <= "110";--brown (background)
			 end if;
		else
					square_color <= "111";
		end if;
	  else
	       square_color <= "011"; -- green background color
	  end if;


  elsif ((state_out = "1111") or (state_out = "0010")) then -- this is 15x15 table
     if((DrawX <=CONV_STD_LOGIC_VECTOR(545, 10))and (DrawX >=CONV_STD_LOGIC_VECTOR(124, 10))and (DrawY <= CONV_STD_LOGIC_VECTOR(465, 10))and (DrawY >=CONV_STD_LOGIC_VECTOR(44, 10)))then
		if((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and (DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and (DrawY <= CONV_STD_LOGIC_VECTOR(464, 10))and (DrawY >=CONV_STD_LOGIC_VECTOR(45, 10)))then
			if(
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(74, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(76, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(104, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(106, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(134, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(136, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(164, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(166, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(194, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(196, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(224, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(226, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(254, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(256, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(284, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(286, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(314, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(316, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(344, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(346, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(374, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(376, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(404, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(406, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(544, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(125, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(434, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(436, 10)))or

			   ((DrawX <=CONV_STD_LOGIC_VECTOR(156, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(154, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(186, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(184, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(216, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(214, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(246, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(244, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(276, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(274, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(306, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(304, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(336, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(334, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(366, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(364, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(396, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(394, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(426, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(424, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(456, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(454, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(486, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(484, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10)))or
			   ((DrawX <=CONV_STD_LOGIC_VECTOR(516, 10))and(DrawX >=CONV_STD_LOGIC_VECTOR(514, 10))and(DrawY >=CONV_STD_LOGIC_VECTOR(45, 10))and (DrawY <=CONV_STD_LOGIC_VECTOR(464, 10))))then
					square_color <= "111";--line(black)
			elsif((((DrawX - chess_positionX2) * (DrawX - chess_positionX2)) + ((DrawY - chess_positionY2) * (DrawY - chess_positionY2))) <= (chess_size2*chess_size2)) then
					square_color <= "101";-- grey(ball)
			else
					square_color <= "110"; --brown color(background)
			end if;
		else
					square_color <= "111";
		end if;
	else
	       square_color <= "011"; -- green background color
	end if;



  
  
  elsif(state_out = "0101" or state_out = "0111")then -- win page
     if((DrawX <= CONV_STD_LOGIC_VECTOR(470, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(170, 10)) and (DrawY <= CONV_STD_LOGIC_VECTOR(340, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(140, 10)))then
        if((DrawX = CONV_STD_LOGIC_VECTOR(470, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(469, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(170, 10)) or (DrawX = CONV_STD_LOGIC_VECTOR(171, 10))
            or (DrawY = CONV_STD_LOGIC_VECTOR(340, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(349, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(140, 10)) or (DrawY = CONV_STD_LOGIC_VECTOR(141, 10)))then
               square_color <= "100";
        elsif(((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(205, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(215, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(200, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(195, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(225, 10)))or 
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(235, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(245, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(245, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(235, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(235, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(265, 10)))or 
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(255, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(265, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(275, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(285, 10)))or 
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(280, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(275, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(305, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(245, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(235, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(275, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(305, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(200, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(275, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(305, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(325, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(335, 10)))or 
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(280, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(325, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(355, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(245, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(235, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(325, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(355, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(200, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(325, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(355, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(365, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(375, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(385, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(395, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(240, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(375, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(380, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(240, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(380, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(385, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(405, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(415, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(285, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(195, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(425, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(435, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(290, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(285, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(405, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(420, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(285, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(280, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(405, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(435, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(200, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(195, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(405, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(435, 10)))or
              ((DrawY <= CONV_STD_LOGIC_VECTOR(195, 10)) and (DrawY >= CONV_STD_LOGIC_VECTOR(190, 10)) and (DrawX >= CONV_STD_LOGIC_VECTOR(405, 10)) and (DrawX <= CONV_STD_LOGIC_VECTOR(420, 10))))then
                square_color <= "100";
        else
                square_color <= "010";    
        end if;  
     else 
                square_color <= "000"; 
     end if;   
  else 
                square_color <= "000"; 
  end if; 
end process Draw_Chess_table;

  RGB_Display : process (square_color) -- color define
  begin
    if (square_color = "000") then -- white
      Red   <= "0000000000";
      Green <= "0000000000";
      Blue  <= "0000000000";
    elsif (square_color = "001") then -- Red
      Red   <= "1111111111";
      Green <= "0000000000";
      Blue  <= "0000000000";
    elsif (square_color = "010") then -- Blue
      Red   <= "0000000000";
      Green <= "0000000000";
      Blue  <= "1111111111";
    elsif (square_color = "011") then -- green
      Red   <= "0000000000";
      Green <= "1111111111";
      Blue  <= "0000000000";
    elsif (square_color = "100") then -- oringe
      Red   <= "1111111111";
      Green <= "0111111111";
      Blue  <= "0000000000";
    elsif (square_color = "101") then -- grey
      Red   <= "0000011111";
      Green <= "0000011111";
      Blue  <= "0000011111";
    elsif (square_color = "110") then -- brown
      Red   <= "1111111111";
      Green <= "0111111111";
      Blue  <= "0000011111";
    elsif (square_color = "111") then -- black
      Red   <= "1111111111";
      Green <= "1111111111";
      Blue  <= "1111111111";
    end if;
  end process RGB_Display;
end Behavioral;

