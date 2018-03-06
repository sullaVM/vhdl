----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2018 03:49:57 PM
-- Design Name: 
-- Module Name: reg_tb - Behavioral
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

entity reg_tb is
end reg_tb;

architecture Behavioral of reg_tb is
-- Component declaration for the Unit Under Test
COMPONENT reg
  Port (D : in std_logic_vector(15 downto 0);
      load, Clk : in std_logic;
      Q : out std_logic_vector(15 downto 0));
END COMPONENT;

-- Inputs
signal D : std_logic_vector(15 downto 0);
signal load : std_logic;
constant Clk_time : Time := 10ns;
signal Clk : std_logic := '0';

-- Outputs
signal Q : std_logic_vector(15 downto 0);

begin
    Clk <= not Clk after Clk_time / 2;
    
-- Instantiate the Unit Under Test
uut: reg PORT MAP (
    D => D,
    load => load,
    Clk => Clk,
    Q => Q);
    
stim_proc: process 
begin 
    D <= "1000100101010101";
    load <= '0';
    
    wait for 10 ns;
    load <= '1';
    
    wait;
 
 end process;

end Behavioral;
