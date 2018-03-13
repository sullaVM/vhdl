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
            const : in std_logic_vector(15 downto 0); -- decoder
            data_d_in : in std_logic_vector(15 downto 0); -- mux D
            reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : out std_logic_vector(15 downto 0));

    end component;
    
    -- Inputs
    signal cw : std_logic_vector(16 downto 0);
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal z_reg0, z_reg1, z_reg2, z_reg3, 
           z_reg4, z_reg5, z_reg6, z_reg7 : std_logic_vector(15 downto 0);

begin
    stim_proc : process
    begin
        cw <= "00000000000000001";
        data_d_in <= x"FFFF";
        
        wait for 30 ns;
        cw <= "00000000010000001";
        
        wait;
    end process;
    

end Behavioral;
