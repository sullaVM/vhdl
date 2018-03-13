----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 17:45:21
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
    Port (a, b : in std_logic_vector(15 downto 0);
        g_sel : in std_logic_vector(3 downto 0);
        h_sel : in std_logic_vector(1 downto 0);
        i_r, i_l : in std_logic;
        mf_sel : in std_logic;
        ser_left, ser_right : out std_logic;
        v, c, n, z_flag : out std_logic;
        z : out std_logic_vector(15 downto 0));
end function_unit;

architecture Behavioral of function_unit is
    component arithmetic_logic_unit
        Port (a_data, b_data : in std_logic_vector(15 downto 0);
          cin : in std_logic;
          op_s1, op_s2 : in std_logic;
          mode_s : in std_logic;
          g_data : out std_logic_vector(15 downto 0);
          cout : out std_logic);
    end component;
    
    component shifter_unit
        Port (b_shift : in std_logic_vector(15 downto 0);
          i_r, i_l : in std_logic;
          s : in std_logic_vector(1 downto 0);
          ser_l, ser_r : out std_logic;
          h : out std_logic_vector(15 downto 0));
    end component;
    
    component mux2_16bit
      Port (In0 : in std_logic_vector(15 downto 0);
          In1 : in std_logic_vector(15 downto 0);
          s : in std_logic;
          Z : out std_logic_vector(15 downto 0));
    end component;
    
    COMPONENT flags
        Port (res : in std_logic_vector(15 downto 0);
            cin : in std_logic;
            cout : in std_logic;
            z, v, c, n : out std_logic);
    END COMPONENT;
    
    -- Signals
    signal z_alu, z_shf : std_logic_vector(15 downto 0);
    signal cin, cout : std_logic;
    signal i_right, i_left : std_logic := '0';
    
begin
    alu : arithmetic_logic_unit port map (
        a_data => a,
        b_data => b,
        cin => g_sel(0),
        op_s1 => g_sel(2),
        op_s2 => g_sel(1),
        mode_s => g_sel(3),
        g_data => z_alu,
        cout => cout
    );
    
    shifter : shifter_unit port map (
        b_shift => b,
        i_r => i_right,
        i_l => i_left,
        s => h_sel,
        ser_l => ser_left,
        ser_r => ser_right,
        h => z_shf
    );
    
    mux : mux2_16bit port map (
        In0 => z_alu,
        In1 => z_shf,
        s => mf_sel,
        Z => z
    );
    
    fl : flags PORT MAP (
        res => z_alu,
        cin => cin,
        cout => cout,
        z => z_flag,
        v => v,
        c => c,
        n => n
    );

end Behavioral;
