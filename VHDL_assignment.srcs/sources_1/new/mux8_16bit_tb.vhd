----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 04:09:01 PM
-- Design Name: 
-- Module Name: mux8_16bit_tb - Behavioral
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

entity mux8_16bit_tb is
--  Port ( );
end mux8_16bit_tb;

architecture Behavioral of mux8_16bit_tb is
-- Component Declaration for the Unit Under Test

COMPONENT mux8_16bit 
Port (In0 : in std_logic_vector(15 downto 0);
      In1 : in std_logic_vector(15 downto 0);
      In2 : in std_logic_vector(15 downto 0);
      In3 : in std_logic_vector(15 downto 0);
      In4 : in std_logic_vector(15 downto 0);
      In5 : in std_logic_vector(15 downto 0);
      In6 : in std_logic_vector(15 downto 0); 
      In7 : in std_logic_vector(15 downto 0);
      s : in std_logic_vector(2 downto 0);
      Z : out std_logic_vector(15 downto 0));
END COMPONENT;

-- Inputs
signal s : std_logic_vector(2 downto 0);
signal In0, In1, In2, In3, In4, In5, 
       In6, In7 : std_logic_vector(15 downto 0);

-- Outputs
signal Z: std_logic_vector(15 downto 0);

begin
-- instantiate the Unit Under Test
uut : mux8_16bit PORT MAP (
    s => s,
    In0 => In0,
    In1 => In1,
    In2 => In2,
    In3 => In3,
    In4 => In4,
    In5 => In5,
    In6 => In6,
    In7 => In7,
    Z => Z
);

stim_proc : process
begin
    In0 <= "1011011001010010";
    In1 <= "1010101010101010";
    In2 <= "1111111111111111";
    In3 <= "0000001111111011";
    In4 <= "0010101011101101";
    In5 <= "0011101110111101";
    In6 <= "1001110111010101";
    In7 <= "1100111101101111";
    
    wait for 10 ns;
        s <= "000";
    wait for 10 ns;
        s <= "001";  
    wait for 10 ns;
        s <= "010";  
    wait for 10 ns;
        s <= "011";
    wait for 10 ns;
        s <= "100";   
    wait for 10 ns;
        s <= "101"; 
    wait for 10 ns;
        s <= "110"; 
    wait for 10 ns;
        s <= "111";     
        
end process;

end Behavioral;
