----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 04:19:57 PM
-- Design Name: 
-- Module Name: mux4_16bit_tb - Behavioral
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

entity mux4_16bit_tb is
--  Port ( );
end mux4_16bit_tb;

architecture Behavioral of mux4_16bit_tb is
        -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mux4_16bit
        Port (s : in  std_logic_vector(1 downto 0);
             in0 : in  std_logic_vector(15 downto 0);
             in1 : in  std_logic_vector(15 downto 0);
             in2 : in  std_logic_vector(15 downto 0);
             in3 : in  std_logic_vector(15 downto 0);
             z : out  std_logic_vector(15 downto 0)
            );
    END COMPONENT;
    
    -- Inputs
    signal s : std_logic_vector(1 downto 0) := "00";
    signal in0, in1, in2, in3 : std_logic_vector(15 downto 0) := "0000000000000000";
    
    -- Outputs
    signal z : std_logic_vector(15 downto 0);
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut : mux4_16bit PORT MAP (
        s => s,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        z => z
    );
        
    stim_proc : process
    begin
        in0 <= "0000000000000000";
        in1 <= "0000000000000001";
        in2 <= "1111111111111111";
        in3 <= "0000000000000011";
        
        s <= "00";
        
        wait for 5 ns;
        s <= "01";
        
        wait for 5 ns;
        s <= "10";
        
        wait for 5 ns;
        s <= "11";
        
        wait;
    end process;
end Behavioral;
