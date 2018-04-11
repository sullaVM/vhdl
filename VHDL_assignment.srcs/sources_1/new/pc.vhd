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
    Port (extend : in std_logic_vector(15 downto 0);
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
    signal last_pc, next_pc : std_logic_vector(15 downto 0);
    signal add_temp, inc_temp : std_logic_vector(15 downto 0);
    
begin
   
    add : ripple_carry_adder_16 port map (
        b => last_pc,
        a => extend,
        c0 => '0',
        s => add_temp
    );
    
    inc : ripple_carry_adder_16 port map (
        b => last_pc,
        a => X"0001",
        c0 => '0',
        s => inc_temp
    );
    
    next_pc <= add_temp when pl = '1' else
                inc_temp when pi = '1' else
                X"0000" when reset = '1' else
                X"0000";
                
    reg0 : reg port map (
        D => next_pc,
        load => '1',
        Clk => Clk,
        Q => last_pc
    );
    
    y <= last_pc;
            

    
end Behavioral;
