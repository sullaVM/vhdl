----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 06:51:04 PM
-- Design Name: 
-- Module Name: mux3_1bit - Behavioral
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

entity mux3_1bit is
    Port (in0, in1, in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic);
end mux3_1bit;

architecture Behavioral of mux3_1bit is

begin
    z <= in0 after 1 ns when s = "00" else
        in1 after 1 ns when s = "01" else
        in2 after 1 ns when s = "10" else
        '0';

end Behavioral;
