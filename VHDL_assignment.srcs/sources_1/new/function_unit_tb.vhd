----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 17:45:55
-- Design Name: 
-- Module Name: function_unit_tb - Behavioral
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

-- Uncomment the following li  brary declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity function_unit_tb is
--  Port ( );
end function_unit_tb;

architecture Behavioral of function_unit_tb is
    component function_unit
        Port (a, b : in std_logic_vector(15 downto 0);
            g_sel : in std_logic_vector(3 downto 0);
            h_sel : in std_logic_vector(1 downto 0);
            i_r, i_l : in std_logic;
            mf_sel : in std_logic;
            ser_left, ser_right : out std_logic;
            z : out std_logic_vector(15 downto 0));
    end component;

    -- Inputs
    signal a, b : std_logic_vector(15 downto 0);
    signal g_sel : std_logic_vector(3 downto 0);
    signal h_sel : std_logic_vector(1 downto 0);
    signal i_r, i_l, mf_sel: std_logic := '0';
    
    -- Outputs
    signal ser_left, ser_right : std_logic;
    signal z : std_logic_vector(15 downto 0) := "0000000000000000";
    
begin
    
    uut: function_unit port map (
        a => a,
        b => b,
        g_sel => g_sel,
        h_sel => h_sel,
        i_r => i_r,
        i_l => i_l,
        mf_sel => mf_sel,
        ser_left => ser_left,
        ser_right => ser_right,
        z => z
    );
    
    stim_proc : process
    begin
    
        --
        a <= "1111111111111111";
        b <= "1010101010101010";
        g_sel <= "0000";
        h_sel <= "00";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000000";
        b <= "0000000000000001";
        g_sel <= "0001";
        h_sel <= "00";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000001";
        b <= "0000000000000001";
        g_sel <= "0010";
        h_sel <= "00";
        mf_sel <= '0';
                
        wait for 20 ns;
        a <= "0000000000000001";
        b <= "0000000000000000";
        g_sel <= "0011";
        h_sel <= "00";
        mf_sel <= '0';    
        
        wait for 20 ns;
        a <= "0000000000000001";
        b <= "1111111111111111";
        g_sel <= "0100";
        h_sel <= "01";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000000";
        b <= "1111111111111111";
        g_sel <= "0101";
        h_sel <= "01";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000011";
        b <= "0000000000000001";
        g_sel <= "0110";
        h_sel <= "01";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "1111111111111111";
        b <= "1010101010101010";
        g_sel <= "0111";
        h_sel <= "01";
        mf_sel <= '0';
               
        --
        
        wait for 20 ns;
        a <= "0000000000000001";
        b <= "0000000000000001";
        g_sel <= "1000";
        h_sel <= "00";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000000";
        b <= "1111111111111111";
        g_sel <= "1010";
        h_sel <= "10";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "0000000000000011";
        b <= "0000000000000001";
        g_sel <= "1100";
        h_sel <= "10";
        mf_sel <= '0';
        
        wait for 20 ns;
        a <= "1111111111111111";
        b <= "1010101010101010";
        g_sel <= "1110";
        h_sel <= "10";
        mf_sel <= '0';
        
        --
        
        wait for 20 ns;
        a <= "0000000000000000";
        b <= "1111111111111111";
        g_sel <= "0000";
        h_sel <= "00";
        mf_sel <= '1';
        
        wait for 20 ns;
        a <= "0000000000000011";
        b <= "0000000000000001";
        g_sel <= "0100";
        h_sel <= "01";
        mf_sel <= '1';
        
        wait for 20 ns;
        a <= "1111111111111111";
        b <= "1010101010101010";
        g_sel <= "1000";
        h_sel <= "10";
        mf_sel <= '1';
        
        wait;
        
    end process;

end Behavioral;
