----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 04:57:46 PM
-- Design Name: 
-- Module Name: logic_unit_16bit - Behavioral
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

entity logic_unit_16bit is
    Port (a_log, b_log : in std_logic_vector(15 downto 0);
        s0_log, s1_log : in std_logic;
        g_log : out std_logic_vector(15 downto 0));
end logic_unit_16bit;

architecture Behavioral of logic_unit_16bit is
    COMPONENT mux4_16bit
        Port (In0, In1, In2, In3 : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(1 downto 0);
            Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- Signals
    signal In0, In1, In2, In3, z : std_logic_vector(15 downto 0) := "0000000000000000";
    signal s : std_logic_vector(1 downto 0);
    
begin
    In0 <= a_log and b_log;
    In1 <= a_log or b_log;
    In2 <= a_log xor b_log;
    In3 <= not a_log;
    
    s(0) <= s0_log;
    s(1) <= s1_log;
    
    mux : mux4_16bit PORT MAP (
        In0 => In0,
        In1 => In1,
        In2 => In2,
        In3 => In3,
        s => s,
        z => g_log
    );
    
end Behavioral;
