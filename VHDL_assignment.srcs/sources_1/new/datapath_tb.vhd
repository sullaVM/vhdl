----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 09:45:41 AM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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

entity datapath_tb is
--  Port ( );
end datapath_tb;

architecture Behavioral of datapath_tb is
    component datapath
         Port (cw : in std_logic_vector(16 downto 0);
           const : in std_logic_vector(15 downto 0);
           data_d_in : in std_logic_vector(15 downto 0);
           Clk : in std_logic;
           reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : out std_logic_vector(15 downto 0));
    end component;
    
    -- Inputs
    signal cw : std_logic_vector(16 downto 0);
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    constant Clk_time : Time := 30ns;
   signal Clk : std_logic := '0';

begin
    Clk <= not Clk after Clk_time / 2;
    
    uut: datapath port map (
        cw => cw,
        const => const,
        data_d_in => data_d_in,
        Clk => Clk,
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
        data_d_in <= "1111111111111111";
        
        
        wait for 30 ns;
        cw <= "00100000000000011";

        
        wait;
    end process;
    

end Behavioral;
