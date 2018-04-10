----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 03:28:32 PM
-- Design Name: 
-- Module Name: pc - Behavioral
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

entity pc is
    Port (dr, sb : in std_logic_vector(2 downto 0);
        pl, pi, reset : in std_logic;
        Clk : in std_logic;
        y : out std_logic_vector(15 downto 0));
end pc;

architecture Behavioral of pc is
    component reg
      Port (D : in std_logic_vector(15 downto 0);
        load, Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;
    
    component ripple_carry_adder_16
      Port (b, a : in std_logic_vector(15 downto 0);
          c0 : in std_logic;
          s : out std_logic_vector(15 downto 0);
          c16 : out std_logic);
    end component;
    
    -- signals
    signal last_pc, curr_pc, new_pc : std_logic_vector(15 downto 0);
    signal add_res, inc_res : std_logic_vector(15 downto 0);
    signal cin : std_logic := '0';
    signal cout : std_logic;
    signal temp : std_logic_vector(15 downto 0);
    
begin
    
    curr_pc(2 downto 0) <= sb;
    curr_pc(5 downto 3) <= dr;
    curr_pc(15 downto 6) <= "0000000000";
            
    incr : ripple_carry_adder_16 port map (
        b => curr_pc,
        a => X"0001",
        c0 => cin,
        s => inc_res,
        c16 => cout
    );
    
    add : ripple_carry_adder_16 port map (
        b => last_pc,
        a => curr_pc,
        c0 => cin,
        s => add_res,
        c16 => cout
    );
    
    reg0 : reg port map (
        D => new_pc,
        load => '1',
        Clk => Clk,
        Q => last_pc
    );
        
    new_pc <= inc_res when pi = '1' else
                add_res when pl = '1' else
                X"0000" when reset = '1' else
                X"0000";
                
    y <= new_pc;
    
end Behavioral;
