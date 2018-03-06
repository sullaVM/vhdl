----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 03:57:45 PM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    COMPONENT full_adder 
        Port (x, y, z : in std_logic;
              s, c : out std_logic);
    END COMPONENT;
    
    -- Inputs
    signal x, y, z : std_logic; 
    
    -- Outputs
    signal s, c : std_logic;
    
begin
-- instantiate the Unit Under Test
uut : full_adder PORT MAP (
    x => x,
    y => y,
    z => z,
    s => s,
    c => c
);

stim_proc : process
begin
    x <= '0';
    y <= '0';
    z <= '0';
    
    wait for 10 ns;
    x <= '0';
    y <= '0';
    z <= '1';
    
    wait for 10 ns;
    x <= '0';
    y <= '1';
    z <= '0';
    
    wait for 10 ns;
    x <= '0';
    y <= '1';
    z <= '1';
    
    wait for 10 ns;
    x <= '1';
    y <= '0';
    z <= '0';
    
    wait for 10 ns;
    x <= '1';
    y <= '0';
    z <= '1';
    
    wait for 10 ns;
    x <= '1';
    y <= '1';
    z <= '0';
    
    wait for 10 ns;
    x <= '1';
    y <= '1';
    z <= '1';
    
    wait;

end process;
    


end Behavioral;
