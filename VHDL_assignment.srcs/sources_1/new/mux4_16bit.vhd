----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 04:13:21 PM
-- Design Name: 
-- Module Name: mux4_16bit - Behavioral
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

entity mux4_16bit is
  Port (In0, In1, In2, In3 : in std_logic_vector(15 downto 0);
      s : in std_logic_vector(1 downto 0);
      Z : out std_logic_vector(15 downto 0));
end mux4_16bit;

architecture Behavioral of mux4_16bit is

begin
    Z <= In0 when s = "00" else
        In1 when s = "01" else 
        In2 when s = "10" else 
        In3 when s = "11" else 
        "0000000000000000";

end Behavioral;
