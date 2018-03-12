----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 09:40:22 AM
-- Design Name: 
-- Module Name: arithmetic_circuit_16bit - Behavioral
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

entity arithmetic_circuit_16bit is
    Port (a, b : in std_logic_vector(15 downto 0);
          cin : in std_logic;
          s0, s1 : in std_logic;
          g : out std_logic_vector(15 downto 0);
          cout : out std_logic);
end arithmetic_circuit_16bit;

architecture Behavioral of arithmetic_circuit_16bit is

    -- Arithmetic Circiot MUX
    COMPONENT arithmetic_circuit_mux
        Port (ar_b : in std_logic_vector(15 downto 0);
              sel_0, sel_1 : in std_logic;
              y : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- Ripple Carry Adder
    COMPONENT ripple_carry_adder_16
      Port (b, a : in std_logic_vector(15 downto 0);
           c0 : in std_logic;
           s : out std_logic_vector(15 downto 0);
           c16 : out std_logic);
    END COMPONENT;
    
    -- Signals
    signal y, s : std_logic_vector(15 downto 0); 
    

begin
    mux : arithmetic_circuit_mux PORT MAP (
        ar_b => b,
        sel_0 => s0,
        sel_1 => s1,
        y => y
    );
    
    rca : ripple_carry_adder_16 PORT MAP (
        b => y,
        a => a,
        c0 => cin,
        s => g,
        c16 => cout
    );
    
        
end Behavioral;
