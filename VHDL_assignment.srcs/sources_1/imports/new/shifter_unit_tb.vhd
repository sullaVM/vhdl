----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 06:32:12 PM
-- Design Name: 
-- Module Name: shifter_unit_tb - Behavioral
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

entity shifter_unit_tb is
--  Port ( );
end shifter_unit_tb;

architecture Behavioral of shifter_unit_tb is
    component shifter_unit
        Port (b_shift : in std_logic_vector(15 downto 0);
            i_r, i_l : in std_logic;
            s : in std_logic_vector(1 downto 0);
            ser_l, ser_r : out std_logic;
            h : out std_logic_vector(15 downto 0));
    end component;

    -- Inputs
    signal b_shift : std_logic_vector(15 downto 0);
    signal i_r, i_l : std_logic := '0';
    s : std_logic_vector(1 downto 0);

    -- Outputs
    signal ser_1, ser_r : std_logic;
    signal h : std_logic_vector(15 downto 0);

begin
    uut : shifter_unit port map (
        b_shift => b_shift,
        i_r => i_r,
        i_l => i_l,
        ser_l => ser_l,
        ser_r => ser_r,
        h => h
    );

    stim_proc : process
    begin
        b_shift <= "1010101010101010";
        s <= "00";

        wait for 10 ns;
        s <= "01";

        wait for 10 ns;
        s <= "10";

    end process;

end Behavioral;
