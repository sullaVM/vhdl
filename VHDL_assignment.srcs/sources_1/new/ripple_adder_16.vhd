----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2018 05:47:48 PM
-- Design Name: 
-- Module Name: ripple_adder_16 - Behavioral
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

entity ripple_adder_16 is
    Port (a, b : in std_logic_vector(15 downto 0);
          cin : in std_logic;
          s : out std_logic_vector(15 downto 0);
          cout : out std_logic
    );
end ripple_adder_16;

architecture Behavioral of ripple_adder_16 is
    COMPONENT full_adder
        Port (x, y, z : in std_logic;
              s, c : out std_logic
        );
    END COMPONENT;
    
    -- Inputs
    signal a, b : 
    
    -- Outputs
    
    
begin


end Behavioral;
