----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 10:27:54 AM
-- Design Name: 
-- Module Name: flags - Behavioral
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

entity flags is
    Port (res : in std_logic_vector(15 downto 0);
        cin : in std_logic;
        cout : in std_logic;
        z, v, c, n : out std_logic);
end flags;

architecture Behavioral of flags is

begin
    z <= '1' when res = "0000000000000000" else
        '0';
    v <= cin xor cout;
    c <= cout;
    n <= '1' when res(15) = '1' else
        '0';

end Behavioral;
