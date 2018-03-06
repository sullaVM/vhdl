----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:38:52 PM
-- Design Name: 
-- Module Name: arithmetic_circuit_mux_tb - Behavioral
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

entity arithmetic_circuit_mux_tb is
--  Port ( );
end arithmetic_circuit_mux_tb;

architecture Behavioral of arithmetic_circuit_mux_tb is
    COMPONENT arithmetic_circuit_mux
         Port (ar_b : in std_logic_vector(15 downto 0);
          sel_0, sel_1 : in std_logic;
          y : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- Inputs
    signal ar_a, ar_b : std_logic_vector(15 downto 0);
    signal sel_0, sel_1 : std_logic;
    
    -- Outputs
    signal y : std_logic_vector(15 downto 0);
    
begin
    uut : arithmetic_circuit_mux PORT MAP (
        ar_b => ar_b,
        sel_0 => sel_0,
        sel_1 => sel_1,
        y => y
    );
    
    stim_proc : process
    begin
        ar_a <= "0000000000000000";
        ar_b <= "0000000000000000";
        sel_0 <= '0';
        sel_1 <= '0';
        
        wait for 10ns;
        ar_a <= "0000000000000001";
        ar_b <= "0000000000000001";
        sel_0 <= '0';
        sel_1 <= '0';
        
        wait for 10ns;
        ar_a <= "0000000000000001";
        ar_b <= "0000000000000001";
        sel_0 <= '0';
        sel_1 <= '1';
                
        wait for 10ns;
        ar_a <= "0000000000000011";
        ar_b <= "0000000000000001";
        sel_0 <= '1';
        sel_1 <= '0';
                        
        wait for 10ns;
        ar_a <= "0000000000000001";
        ar_b <= "0000000000000001";
        sel_0 <= '1';
        sel_1 <= '1';
        
    end process;

end Behavioral;
