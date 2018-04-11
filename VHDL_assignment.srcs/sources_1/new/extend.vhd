----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2018 11:19:35 AM
-- Design Name: 
-- Module Name: extend - Behavioral
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

entity extend is
    Port (dr, sb : in std_logic_vector(2 downto 0);
            ext : out std_logic_vector(15 downto 0));
end extend;

architecture Behavioral of extend is

begin
    ext(2 downto 0) <= sb;
    ext(5 downto 3) <= dr;
    ext(15 downto 6) <= "0000000000";

end Behavioral;
