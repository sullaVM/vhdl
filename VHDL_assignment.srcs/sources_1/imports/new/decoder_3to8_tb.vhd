----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2018 03:49:57 PM
-- Design Name: 
-- Module Name: decoder_2to8_tb - Behavioral
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

entity decoder_3to8_tb is
end decoder_3to8_tb;

architecture Behavioral of decoder_3to8_tb is
-- Component Declaration for the Unit Under Test
COMPONENT decoder_3to8
    Port (A0 : in std_logic;
          A1 : in std_logic;
          A2 : in std_logic;
          Q0 : out std_logic;
          Q1 : out std_logic;
          Q2 : out std_logic;
          Q3 : out std_logic;
          Q4 : out std_logic;
          Q5 : out std_logic;
          Q6 : out std_logic;
          Q7 : out std_logic);
END COMPONENT;

-- Inputs
signal A0, A1, A2 : std_logic;

-- Outputs
signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : std_logic;

begin
-- Instantiate the Unit Under Test
uut : decoder_3to8 PORT MAP (
    A0 => A0,
    A1 => A1,
    A2 => A2,
    Q0 => Q0,
    Q1 => Q1,
    Q2 => Q2,
    Q3 => Q3,
    Q4 => Q4,
    Q5 => Q5,
    Q6 => Q6,
    Q7 => Q7
);

stim_proc : process
begin
    A2 <= '0';
    A1 <= '0';
    A0 <= '0';

    wait for 10 ns;
    A2 <= '0';
    A1 <= '0';
    A0 <= '1';

    wait for 10 ns;
    A2 <= '0';
    A1 <= '1';
    A0 <= '0';

    wait for 10 ns;
    A2 <= '0';
    A1 <= '1';
    A0 <= '1';

    wait for 10 ns;
    A2 <= '1';
    A1 <= '0';
    A0 <= '0';

    wait for 10 ns;
    A2 <= '1';
    A1 <= '0';
    A0 <= '1';

    wait for 10 ns;
    A2 <= '1';
    A1 <= '1';
    A0 <= '0';

    wait for 10 ns;
    A2 <= '1';
    A1 <= '1';
    A0 <= '1';
    
    wait;
end process;

end Behavioral;
