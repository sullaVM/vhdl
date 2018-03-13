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
  Port (mux_a_s, mux_b_s, decoder_s : in std_logic_vector(2 downto 0);
      Clk : in std_logic;
      rw, data_src : in std_logic;
      d_data : in std_logic_vector(15 downto 0);
      data : in std_logic_vector(15 downto 0);
      bus_a, bus_b : out std_logic_vector(15 downto 0));
END COMPONENT;

-- Inputs
signal mux_a_s, mux_b_s, decoder_s : std_logic_vector(2 downto 0);
signal rw, data_src : std_logic;
signal d_data, data : std_logic_vector(15 downto 0);
signal Clk : std_logic := '0';
constant Clk_time : time := 30ns;

-- Outputs
signal bus_a, bus_b : std_logic_vector(15 downto 0); 

begin
    Clk <= not Clk after Clk_time / 2;
    -- Instantiate the Unit Under Test (UUT)
    uut: reg_file PORT MAP (
        mux_a_s => mux_a_s,
        mux_b_s => mux_b_s,
        decoder_s => decoder_s,
        Clk => Clk,
        rw => rw,
        data_src => data_src,
        d_data => d_data,
        data => data,
        bus_a => bus_a,
        bus_b => bus_b
    );
 
stim_proc : process
    begin
        d_data <= x"00FF";
        
        -- A
        rw <= '1';
        mux_a_s <= "000";
        mux_b_s <= "000";
        decoder_s <= "000";
        data_src <= '0';
        data <= x"FA2E";
        
        wait for 30 ns;
        rw <= '1';
        mux_a_s <= "001";
        mux_b_s <= "010";
        decoder_s <= "010";
        data_src <= '1';
        data <= x"FA2E";
   
        wait;
end process;

end Behavioral;
