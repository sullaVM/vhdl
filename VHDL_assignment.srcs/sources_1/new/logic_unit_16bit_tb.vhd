----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 05:09:14 PM
-- Design Name: 
-- Module Name: logic_unit_16bit_tb - Behavioral
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

entity logic_unit_16bit_tb is
--  Port ( );
end logic_unit_16bit_tb;

architecture Behavioral of logic_unit_16bit_tb is
    COMPONENT logic_unit_16bit
        Port (a_log, b_log : in std_logic_vector(15 downto 0);
            s0_log, s1_log : in std_logic;
            g_log : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- Inputs
    signal a_log, b_log : std_logic_vector(15 downto 0);
    signal s0_log, s1_log : std_logic;
    
    -- Outputs
    signal g_log : std_logic_vector(15 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : logic_unit_16bit PORT MAP (
        a_log => a_log,
        b_log => b_log,
        s0_log => s0_log,
        s1_log => s1_log,
        g_log => g_log
    ); 
    
    stim_proc : process
    begin
    
        -- AND
        a_log <= "0000000000000000";
        b_log <= "0000000000000000";
        s0_log <= '0';
        s1_log <= '0';
        
        wait for 10 ns;
        a_log <= "0000000000000000";
        b_log <= "0000000000000001";
        s0_log <= '0';
        s1_log <= '0';
        
        wait for 10 ns;
        a_log <= "0000000000000001";
        b_log <= "0000000000000001";
        s0_log <= '0';
        s1_log <= '0';
        
        -- OR
        wait for 10 ns;
        a_log <= "0000000000000000";
        b_log <= "0000000000000000";
        s0_log <= '0';
        s1_log <= '1';
        
        wait for 10 ns;
        a_log <= "0000000000000000";
        b_log <= "0000000000000001";
        s0_log <= '0';
        s1_log <= '1';
        
        wait for 10 ns;
        a_log <= "0000000000000001";
        b_log <= "0000000000000001";
        s0_log <= '0';
        s1_log <= '1';
        
        -- XOR
        wait for 10 ns;
        a_log <= "0000000000000000";
        b_log <= "0000000000000000";
        s0_log <= '1';
        s1_log <= '0';
        
        wait for 10 ns;
        a_log <= "0000000000000000";
        b_log <= "0000000000000001";
        s0_log <= '1';
        s1_log <= '0';
        
        wait for 10 ns;
        a_log <= "0000000000000001";
        b_log <= "0000000000000001";
        s0_log <= '1';
        s1_log <= '0';
        
        -- NOT
        wait for 10 ns;
        a_log <= "0000000000000001";
        s0_log <= '1';
        s1_log <= '1';

    
        wait;   
    end process;

end Behavioral;
