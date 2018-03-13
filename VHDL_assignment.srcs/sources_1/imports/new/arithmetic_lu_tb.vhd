----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 05:41:00 PM
-- Design Name: 
-- Module Name: arithmetic_lu_tb - Behavioral
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

entity arithmetic_lu_tb is
--  Port ( );
end arithmetic_lu_tb;

architecture Behavioral of arithmetic_lu_tb is
    COMPONENT arithmetic_logic_unit
        Port (a_data, b_data : in std_logic_vector(15 downto 0);
            cin : in std_logic;
            op_s1, op_s2 : in std_logic;
            mode_s : in std_logic;
            g_data : out std_logic_vector(15 downto 0);
            cout : out std_logic);
    END COMPONENT;
    
    -- Inputs
    signal a_data, b_data : std_logic_vector(15 downto 0);
    signal cin, op_s1, op_s2, mode_s : std_logic;
    
    -- Outputs
    signal g_data : std_logic_vector(15 downto 0);
    signal cout : std_logic;
    
begin
    uut : arithmetic_logic_unit PORT MAP (
        a_data => a_data,
        b_data => b_data,
        cin => cin,
        op_s1 => op_s1,
        op_s2 => op_s2,
        mode_s => mode_s,
        g_data => g_data,
        cout => cout
    );
    
    stim_proc : process
    begin
        -- Select AC
        -- F = A
        a_data <= "0000000000000001";
        b_data <= "0000000000000000";
        mode_s <= '0';
        op_s1 <= '0';
        op_s2 <= '0';
        cin <= '0';

        -- F = A + 1
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000000";
        mode_s <= '0';
        op_s1 <= '0';
        op_s2 <= '0';
        cin <= '1';

        -- F = A + B
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '0';
        op_s1 <= '0';
        op_s2 <= '1';
        cin <= '0';
        
        -- F = A + B + 1
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '0';
        op_s1 <= '0';
        op_s2 <= '1';
        cin <= '1';

        -- F = A + B'
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "1111111111111111";
        mode_s <= '0';
        op_s1 <= '1';
        op_s2 <= '0';
        cin <= '0';

        -- F = A + B' + 1
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "1111111111111111";
        mode_s <= '0';
        op_s1 <= '1';
        op_s2 <= '0';
        cin <= '1';
        
        -- F = A - 1
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000000";
        mode_s <= '0';
        op_s1 <= '1';
        op_s2 <= '1';
        cin <= '0';

        -- F = A
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '0';
        op_s1 <= '1';
        op_s2 <= '1';
        cin <= '1';
        
        -- Select LU
        -- F = A AND B
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '1';
        op_s1 <= '0';
        op_s2 <= '0';
        cin <= '0';
        
        -- F = A OR B
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000000";
        mode_s <= '1';
        op_s1 <= '0';
        op_s2 <= '1';
        cin <= '0';
                
        -- F = A XOR B
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '1';
        op_s1 <= '1';
        op_s2 <= '0';
        cin <= '0';
                
        -- F = NOT A
        wait for 20 ns;
        a_data <= "0000000000000001";
        b_data <= "0000000000000001";
        mode_s <= '1';
        op_s1 <= '1';
        op_s2 <= '1';
        cin <= '0';
        
        wait;
        
    end process;


end Behavioral;
