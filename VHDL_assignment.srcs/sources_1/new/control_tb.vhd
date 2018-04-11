----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2018 04:47:58 PM
-- Design Name: 
-- Module Name: control_tb - Behavioral
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

entity control_tb is
--  Port ( );
end control_tb;

architecture Behavioral of control_tb is
    component control
    Port (reset : in std_logic;
            Clk : in std_logic;
            memory_data, prg_c : out std_logic_vector(15 downto 0);
            control_mem_data : out std_logic_vector(27 downto 0);
            reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal reset, Clk_sig : std_logic;
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    signal memory_data, prg_c : std_logic_vector(15 downto 0);
    signal control_mem_data : std_logic_vector(27 downto 0);
    
        constant Clk_time : Time := 15ns;
    signal Clk : std_logic := '0';
    
begin
    Clk <= not Clk after Clk_time / 2;
    cont : control port map (
        reset => reset,
        Clk => Clk,
        memory_data => memory_data,
        control_mem_data => control_mem_data,
        prg_c => prg_c,
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
        reset <= '1';
        
        wait for 50 ns;
        
        reset <= '0';
        
        
        

        
        wait;
    end process;

end Behavioral;
