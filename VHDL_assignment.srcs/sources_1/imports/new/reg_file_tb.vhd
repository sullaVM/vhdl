----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2018 03:49:57 PM
-- Design Name: 
-- Module Name: reg_file_tb - Behavioral
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

entity reg_file_tb is
end reg_file_tb;

architecture Behavioral of reg_file_tb is
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT reg_file
    Port (s : in std_logic_vector(2 downto 0);
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;
        data_src : in std_logic;
        data : in std_logic_vector(15 downto 0);
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0));
END COMPONENT;

-- Inputs
signal src_s0, src_s1, src_s2, data_src : std_logic := '0';
signal des :std_logic_vector(2 downto 0);
signal data : std_logic_vector(15 downto 0);
signal Clk : std_logic := '0';
signal s : std_logic_vector(2 downto 0);
constant Clk_time : time := 15ns;

-- Outputs
signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0); 

begin
    Clk <= not Clk after Clk_time / 2;
    -- Instantiate the Unit Under Test (UUT)
    uut: reg_file PORT MAP (
        s => s,
        des_A0 => des(0),
        des_A1 => des(1),
        des_A2 => des(2),
        Clk => Clk,
        data_src => data_src,
        data => data,
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7
    );
 
stim_proc : process
    begin
    
        -- A
         
        wait for 20 ns;
        des <= "000";
        data_src <= '0';
        data <= x"FA2E";
            
        wait for 20 ns;
        des <= "001";
        data_src <= '0';
        data <= x"1C6D";
        
        wait for 20 ns;
        des <= "010";
        data_src <= '0';
        data <= x"0000";
        
        wait for 20 ns;
        des <= "011";
        data_src <= '0';
        data <= x"1111";
        
        wait for 20 ns;
        des <= "100";
        data_src <= '0';
        data <= x"1C1C";
        
        wait for 20 ns;
        des <= "101";
        data_src <= '0';
        data <= x"FFFF";
                
        wait for 20 ns;
        des <= "110";
        data_src <= '0';
        data <= x"1010";
                        
        wait for 20 ns;
        des <= "111";
        data_src <= '0';
        data <= x"ABAB";
        
        -- B
                        
        wait for 20 ns;
        s <= "000";
        des <= "000";
        data_src <= '0';
        data <= "1010101010101010";
        
        wait for 20 ns;
        s <= "000";
        des <= "001";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "001";
        des <= "010";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "010";
        des <= "011";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "011";
        des <= "100";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "100";
        des <= "101";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "101";
        des <= "110";
        data_src <= '1';
        
        wait for 20 ns;
        s <= "110";
        des <= "111";
        data_src <= '1';
                
        wait;
end process;

end Behavioral;
