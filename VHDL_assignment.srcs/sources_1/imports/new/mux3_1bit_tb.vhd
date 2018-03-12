----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 06:51:37 PM
-- Design Name: 
-- Module Name: mux3_1bit_tb - Behavioral
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

entity mux3_1bit_tb is
--  Port ( );
end mux3_1bit_tb;

architecture Behavioral of mux3_1bit_tb is
    component mux3_1bit
        Port (in0, in1, in2 : in std_logic;
            s : in std_logic_vector(1 downto 0);
            z : out std_logic);
    end component;

    -- Inputs
    signal in0, in1, in2 : std_logic;
    signal s : std_logic_vector(1 downto 0);

    -- Outputs
    signal z : std_logic;

begin
    uut : mux3_1bit port map (
       in0 => in0,
       in1 => in1,
       in2 => in2,
       s => s,
       z => z 
    );

    stim_proc : process 
    begin
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        s <= "00";

        wait for 10 ns;
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        s <= "01";

        wait for 10 ns;
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        s <= "10";

    end process;

end Behavioral;
