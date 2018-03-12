----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2018 04:28:59 PM
-- Design Name: 
-- Module Name: mux8_16bit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8_16bit is
  Port (In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(2 downto 0);
        Z : out std_logic_vector(15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is

begin
    Z <=    In0 after 5 ns when s = "000" else
            In1 after 5 ns when s = "001" else 
            In2 after 5 ns when s = "010" else 
            In3 after 5 ns when s = "011" else 
            In4 after 5 ns when s = "100" else 
            In5 after 5 ns when s = "101" else
            In6 after 5 ns when s = "110" else
            In7 after 5 ns when s = "111" else
            "0000000000000000" after 5 ns;
end Behavioral;
