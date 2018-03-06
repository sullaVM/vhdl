----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:29:20 PM
-- Design Name: 
-- Module Name: arithmetic_circuit_mux - Behavioral
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

entity arithmetic_circuit_mux is
    Port (ar_b : in std_logic_vector(15 downto 0);
          sel_0, sel_1 : in std_logic;
          y : out std_logic_vector(15 downto 0));
end arithmetic_circuit_mux;

architecture Behavioral of arithmetic_circuit_mux is

begin
    y(0) <= (ar_b(0) and sel_0) or ((not ar_b(0)) and sel_1);
    y(1) <= (ar_b(1) and sel_0) or ((not ar_b(1)) and sel_1);    
    y(2) <= (ar_b(2) and sel_0) or ((not ar_b(2)) and sel_1);    
    y(3) <= (ar_b(3) and sel_0) or ((not ar_b(3)) and sel_1);    
    y(4) <= (ar_b(4) and sel_0) or ((not ar_b(4)) and sel_1);    
    y(5) <= (ar_b(5) and sel_0) or ((not ar_b(5)) and sel_1);    
    y(6) <= (ar_b(6) and sel_0) or ((not ar_b(6)) and sel_1);    
    y(7) <= (ar_b(7) and sel_0) or ((not ar_b(7)) and sel_1);    
    y(8) <= (ar_b(8) and sel_0) or ((not ar_b(8)) and sel_1);    
    y(9) <= (ar_b(9) and sel_0) or ((not ar_b(9)) and sel_1);    
    y(10) <= (ar_b(10) and sel_0) or ((not ar_b(10)) and sel_1);    
    y(11) <= (ar_b(11) and sel_0) or ((not ar_b(11)) and sel_1);    
    y(12) <= (ar_b(12) and sel_0) or ((not ar_b(12)) and sel_1);    
    y(13) <= (ar_b(13) and sel_0) or ((not ar_b(13)) and sel_1);    
    y(14) <= (ar_b(14) and sel_0) or ((not ar_b(14)) and sel_1);    
    y(15) <= (ar_b(15) and sel_0) or ((not ar_b(15)) and sel_1);    
    

end Behavioral;
