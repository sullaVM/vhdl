----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2018 06:02:59 PM
-- Design Name: 
-- Module Name: control - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
--  Port ( );
end control;

architecture Behavioral of control is
    component datapath
    Port (const : in std_logic_vector(15 downto 0);
        data_d_in : in std_logic_vector(15 downto 0);
        fs : in std_logic_vector(4 downto 0);
        rw : in std_logic;
        td, tb, mb, md : in std_logic;
        dr, sa, sb : in std_logic_vector(2 downto 0);
        Clk : in std_logic;
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;
    
    component memory 
        Port (address : in unsigned(15 downto 0);
            write_data : in std_logic_vector(15 downto 0);
            MemWrite, MemRead : in std_logic;
            read_data : out std_logic_vector(15 downto 0));
    end component;
    
    component control_memory
        Port (MW : out std_logic;
            MM : out std_logic;
            RW : out std_logic;
            MD : out std_logic;
            FS : out std_logic_vector(4 downto 0);
            MB : out std_logic;
            TB : out std_logic;
            TA : out std_logic;
            TD : out std_logic;
            PL : out std_logic;
            PI : out std_logic;
            IL : out std_logic;
            MC : out std_logic;
            MS : out std_logic_vector(2 downto 0);
            NA : out std_logic_vector(7 downto 0);
            IN_CAR : in std_logic_vector(7 downto 0));
    end component;
    
    -- Signals
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    signal rw, td, tb, mb, md : std_logic;
    signal fs : std_logic_vector(4 downto 0);
    signal dr, sa, sb : std_logic_vector(2 downto 0);
    
    constant Clk_time : Time := 30ns;
    signal Clk : std_logic := '0';
     
begin
    Clk <= not Clk after Clk_time / 2;

    dp: datapath port map (
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

end Behavioral;
