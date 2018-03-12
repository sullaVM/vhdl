----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 05:06:26 PM
-- Design Name: 
-- Module Name: arithmetic_logic_unit - Behavioral
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

entity arithmetic_logic_unit is
    Port (a_data, b_data : in std_logic_vector(15 downto 0);
          cin : in std_logic;
          op_s1, op_s2 : in std_logic;
          mode_s : in std_logic;
          g_data : out std_logic_vector(15 downto 0);
          cout : out std_logic);
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is
    -- AC
    COMPONENT arithmetic_circuit_16bit
        Port (a, b : in std_logic_vector(15 downto 0);
          cin : in std_logic;
          s0, s1 : in std_logic;
          g : out std_logic_vector(15 downto 0);
          cout : out std_logic);
    END COMPONENT;
    
    -- LU
    COMPONENT logic_unit_16bit
        Port (a_log, b_log : in std_logic_vector(15 downto 0);
            s0_log, s1_log : in std_logic;
            g_log : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- MUX
    COMPONENT mux2_16bit
      Port (In0 : in std_logic_vector(15 downto 0);
          In1 : in std_logic_vector(15 downto 0);
          s : in std_logic;
          Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- Signals
    signal ac_g, lu_g : std_logic_vector(15 downto 0);
    
begin
    ac : arithmetic_circuit_16bit PORT MAP (
        a => a_data,
        b => b_data,
        cin => cin,
        s0 => op_s1,
        s1 => op_s2,
        g => ac_g,
        cout => cout
    );
    
    lu : logic_unit_16bit PORT MAP (
        a_log => a_data,
        b_log => b_data,
        s0_log => op_s1,
        s1_log => op_s2,
        g_log => lu_g
    );
    
    mux : mux2_16bit PORT MAP (
        In0 => ac_g,
        In1 => lu_g,
        s => mode_s,
        Z => g_data
    );

end Behavioral;
