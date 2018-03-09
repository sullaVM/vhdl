----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 05:57:58 PM
-- Design Name: 
-- Module Name: arithmetic_circuit_16bit_tb - Behavioral
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

entity arithmetic_circuit_16bit_tb is
--  Port ( );
end arithmetic_circuit_16bit_tb;

architecture Behavioral of arithmetic_circuit_16bit_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT arithmetic_circuit_16bit
        Port (a, b : in std_logic_vector(15 downto 0);
            cin : in std_logic;
            s0, s1 : in std_logic;
            g : out std_logic_vector(15 downto 0);
            cout : out std_logic);
    END COMPONENT;

    -- Inputs
    signal a, b : std_logic_vector(15 downto 0) := "0000000000000000";
    signal cin, s0, s1 : std_logic := '0';

    -- Outputs
    signal g : std_logic_vector(15 downto 0) := "0000000000000000";
    signal cout : std_logic := '0';
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: arithmetic_circuit_16bit PORT MAP (
        a => a,
        b => b,
        cin => cin,
        s0 => s0,
        s1 => s1,
        g => g,
        cout => cout
    );

    stim_proc : process
    begin

        -- Carry 0
        a <= "0000000000000000";
        b <= "0000000000000000";
        cin <= '0';
        s0 <= '0';
        s1 <= '0';

        wait for 10 ns;
        a <= "0000000000000001";
        b <= "0000000000000001";
        cin <= '0';
        s0 <= '0';
        s1 <= '1';

        wait for 10 ns;
        a <= "0000000000000001";
        b <= "0000000000000011";
        cin <= '0';
        s0 <= '1';
        s1 <= '0';

        wait for 10 ns;
        a <= "0000000000000011";
        b <= "0000000000000001";
        cin <= '0';
        s0 <= '1';
        s1 <= '1';

        -- Carry 1
        wait for 10 ns;
       a <= "0000000000000000";
        b <= "0000000000000000";
        cin <= '1';
        s0 <= '0';
        s1 <= '0';

        wait for 10 ns;
        a <= "0000000000000001";
        b <= "0000000000000001";
        cin <= '1';
        s0 <= '0';
        s1 <= '1';

        wait for 10 ns;
        a <= "0000000000000001";
        b <= "0000000000000011";
        cin <= '1';
        s0 <= '1';
        s1 <= '0';

        wait for 10 ns;
        a <= "0000000000000001";
        b <= "0000000000000011";
        cin <= '1';
        s0 <= '1';
        s1 <= '1';
        
        wait;
        
    end process;

end Behavioral;
