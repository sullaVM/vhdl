----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 01:23:06 PM
-- Design Name: 
-- Module Name: ripple_carry_adder_16_tb - Behavioral
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

entity ripple_carry_adder_16_tb is
--  Port ( );
end ripple_carry_adder_16_tb;

architecture Behavioral of ripple_carry_adder_16_tb is
    COMPONENT ripple_carry_adder_16
        Port (b, a : in std_logic_vector(15 downto 0);
              c0 : in std_logic;
              s : out std_logic_vector(15 downto 0);
              c16 : out std_logic);
    END COMPONENT;

    -- Inputs
    signal b, a : std_logic_vector(15 downto 0) := "0000000000000000";
    signal c0 : std_logic := '0';
    
    -- Outputs
    signal s : std_logic_vector(15 downto 0);
    signal c16: std_logic;
        
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: ripple_carry_adder_16 PORT MAP (
        b => b,
        a => a,
        c0 => c0,
        s => s,
        c16 => c16
    );
    
    stim_proc : process
    begin
        wait for 10ns;
        c0 <= '0';
        b <= "0000000000000000";
        a <= "0000000000000000";
        
        wait for 10ns;
        a <= "0000000000000001";
        
        wait for 10ns;
        b <= "0000000000000001";
        a <= "0000000000000000";
        
        wait for 10ns;
        b <= "0000000000000001";
        a <= "0000000000000001";
        
        wait for 10ns;
        c0 <= '1';
    end process;
end Behavioral;
