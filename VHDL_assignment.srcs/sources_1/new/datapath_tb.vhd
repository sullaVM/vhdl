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
        Port (const : in std_logic_vector(15 downto 0);
            data_d_in : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            rw : in std_logic;
            td, tb, mb, md : in std_logic;
            dr, sa, sb : in std_logic_vector(2 downto 0);
            v_flag, c_flag, n_flag, z_flag : out std_logic;
            Clk : in std_logic;
            reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;
    
    -- Inputs
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    signal rw, td, tb, mb, md : std_logic;
    signal fs : std_logic_vector(4 downto 0);
    signal dr, sa, sb : std_logic_vector(2 downto 0);
    signal v_flag, c_flag, n_flag, z_flag : std_logic;
    constant Clk_time : Time := 30ns;
    signal Clk : std_logic := '0';

begin
    Clk <= not Clk after Clk_time / 2;
    
    uut: datapath port map (
        const => const,
        data_d_in => data_d_in,
        fs => fs,
        rw => rw,
        td => td,
        tb => tb,
        mb => mb,
        md => md,
        dr => dr,
        sa => sa,
        sb => sb,
        v_flag => v_flag,
        c_flag => c_flag,
        n_flag => n_flag,
        z_flag => z_flag,
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
    
        -- load X"FFFF" to reg00
        data_d_in <= X"FFFF";
        rw <= '1';
        dr <= "000";
        td <= '0';
        md <= '1';
        
        wait for 30 ns;
        
        -- load X"1111" to reg01
        data_d_in <= X"1111";
        rw <= '1';
        dr <= "001";
        td <= '0';
        md <= '1';
        
        wait for 30 ns;
        
        -- load X"2222" to reg02
        data_d_in <= X"2222";
        rw <= '1';
        dr <= "010";
        td <= '0';
        md <= '1';
        
        wait for 30 ns;
        
        -- load X"3333" to reg03
        data_d_in <= X"3333";
        rw <= '1';
        dr <= "011";
        td <= '0';
        md <= '1';
        
        wait for 30 ns;
        
        -- reg00 + reg01 = reg04 X"11110"
        fs <= "00010";
        rw <= '1';
        dr <= "100";
        sa <= "000";
        sb <= "001";
        mb <= '0';
        tb <= '0';
        td <= '0';
        md <= '0';
        
        wait for 30 ns;
        
        wait;
    end process;
    

end Behavioral;
