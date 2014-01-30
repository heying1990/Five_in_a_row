library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity Color_Mapper is
  Port (state_out : in std_logic_vector(3 downto 0);
        line00x1 : in std_logic_vector(9 downto 0);
        line00y1 : in std_logic_vector(9 downto 0);
        line01x1 : in std_logic_vector(9 downto 0);
        line01y1 : in std_logic_vector(9 downto 0);
        line02x1 : in std_logic_vector(9 downto 0);
        line02y1 : in std_logic_vector(9 downto 0);
        line03x1 : in std_logic_vector(9 downto 0);
        line03y1 : in std_logic_vector(9 downto 0);
        line04x1 : in std_logic_vector(9 downto 0);
        line04y1 : in std_logic_vector(9 downto 0);
        line05x1 : in std_logic_vector(9 downto 0);
        line05y1 : in std_logic_vector(9 downto 0);
        line06x1 : in std_logic_vector(9 downto 0);
        line06y1 : in std_logic_vector(9 downto 0);
        line07x1 : in std_logic_vector(9 downto 0);
        line07y1 : in std_logic_vector(9 downto 0);
        line08x1 : in std_logic_vector(9 downto 0);
        line08y1 : in std_logic_vector(9 downto 0);
        
        line00x2 : in std_logic_vector(9 downto 0);
        line00y2 : in std_logic_vector(9 downto 0);
        line01x2 : in std_logic_vector(9 downto 0);
        line01y2 : in std_logic_vector(9 downto 0);
        line02x2 : in std_logic_vector(9 downto 0);
        line02y2 : in std_logic_vector(9 downto 0);
        line03x2 : in std_logic_vector(9 downto 0);
        line03y2 : in std_logic_vector(9 downto 0);
        line04x2 : in std_logic_vector(9 downto 0);
        line04y2 : in std_logic_vector(9 downto 0);
        line05x2 : in std_logic_vector(9 downto 0);
        line05y2 : in std_logic_vector(9 downto 0);
        line06x2 : in std_logic_vector(9 downto 0);
        line06y2 : in std_logic_vector(9 downto 0);
        line07x2 : in std_logic_vector(9 downto 0);
        line07y2 : in std_logic_vector(9 downto 0);
        line08x2 : in std_logic_vector(9 downto 0);
        line08y2 : in std_logic_vector(9 downto 0);
        line09x2 : in std_logic_vector(9 downto 0);
        line09y2 : in std_logic_vector(9 downto 0);
        line10x2 : in std_logic_vector(9 downto 0);
        line10y2 : in std_logic_vector(9 downto 0);
        line11x2 : in std_logic_vector(9 downto 0);
        line11y2 : in std_logic_vector(9 downto 0);
        line12x2 : in std_logic_vector(9 downto 0);
        line12y2 : in std_logic_vector(9 downto 0);
        