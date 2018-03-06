----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2018 05:02:35 PM
-- Design Name: 
-- Module Name: decoder_2to4 - Behavioral
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

entity decoder_2to4 is
  Port (A0 : in std_logic;
        A1 : in std_logic;
        A2 : in std_logic;
        Q0 : out std_logic;
        Q1 : out std_logic;
        Q2 : out std_logic;
        Q3 : out std_logic;
        Q4 : out std_logic;
        Q5 : out std_logic;
        Q6 : out std_logic;
        Q7 : out std_logic);
end decoder_2to4;

architecture Behavioral of decoder_2to4 is
begin
    Q0<=    ((not A0) and (not A1)) after 5 ns;
            Q1<= (A0 and (not A1)) after 5 ns;
            Q2<= ((not A0) and A1) after 5 ns;
            Q3<= (A0 and A1) after 5 ns;

end Behavioral;
