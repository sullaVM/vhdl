----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 06:08:25 PM
-- Design Name: 
-- Module Name: pc_tb - Behavioral
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

entity pc_tb is
--  Port ( );
end pc_tb;

architecture Behavioral of pc_tb is
    component pc
        Port (dr, sb : in std_logic_vector(2 downto 0);
            pl, pi, reset : in std_logic;
            Clk : in std_logic;
            y : out std_logic_vector(15 downto 0));
    end component;
    
    -- inputs
    signal dr, sb : std_logic_vector(2 downto 0);
    signal pl, pi, reset : std_logic;
    
    constant Clk_time : Time := 10ns;
    signal Clk : std_logic := '0';
    
    -- outputs
    signal y : std_logic_vector(15 downto 0);
    
begin
    Clk <= not Clk after Clk_time / 2;

    pc0 : pc port map (
        dr => dr,
        sb => sb,
        pl => pl,
        pi => pi,
        reset => reset,
        Clk => Clk,
        y => y
    );
    
    stim_proc : process
    begin
    
        reset <= '0';
        dr <= "000"; 
        sb <= "001";
        pl <= '0';
        pi <= '1';
        
--        wait for 30 ns;
        
--        dr <= "000"; 
--        sb <= "010";
--        pl <= '1';
--        pi <= '0';
        
        wait;
    end process;


end Behavioral;
