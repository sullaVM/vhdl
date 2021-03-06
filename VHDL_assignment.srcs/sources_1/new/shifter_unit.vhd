----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 06:31:54 PM
-- Design Name: 
-- Module Name: shifter_unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter_unit is
    Port (b_shift : in std_logic_vector(15 downto 0);
          i_r, i_l : in std_logic;
          s : in std_logic_vector(1 downto 0);
          ser_l, ser_r : out std_logic;
          h : out std_logic_vector(15 downto 0));
end shifter_unit;

architecture Behavioral of shifter_unit is

begin


end Behavioral;
