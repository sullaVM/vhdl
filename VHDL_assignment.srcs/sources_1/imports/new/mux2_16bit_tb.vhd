----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 04:09:01 PM
-- Design Name: 
-- Module Name: mux2_16bit_tb - Behavioral
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

entity mux2_16bit_tb is
end mux2_16bit_tb;

architecture Behavioral of mux2_16bit_tb is
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT mux2_16bit is
    Port (In0 : in std_logic_vector(15 downto 0);
          In1 : in std_logic_vector(15 downto 0);
          s : in std_logic;
          Z : out std_logic_vector(15 downto 0));
END COMPONENT;

-- Inputs
signal In0, In1 : std_logic_vector(15 downto 0);
signal s : std_logic;

-- Outputs
signal Z : std_logic_vector(15 downto 0);

begin

-- instantiate the Unit Under Test (UUT)
uut: mux2_16bit PORT MAP (
    In0 => In0,
    In1 => In1,
    s => s,
    Z => Z
);

stim_proc : process
begin
    In0 <= "1010101010101010";
    In1 <= "1100101011001010";
    
    wait for 10 ns;
        s <= '0';
    wait for 10 ns;
        s <= '1';
end process;

end Behavioral;
