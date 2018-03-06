----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 12:54:43 PM
-- Design Name: 
-- Module Name: ripple_carry_adder_16 - Behavioral
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

entity ripple_carry_adder_16 is
  Port (b, a : in std_logic_vector(15 downto 0);
        c0 : in std_logic;
        s : out std_logic_vector(15 downto 0);
        c16 : out std_logic);
end ripple_carry_adder_16;

architecture Behavioral of ripple_carry_adder_16 is
    COMPONENT full_adder
      Port (x, y, z : in std_logic;
            s, c : out std_logic);
    END COMPONENT;

signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15 : std_logic := '0';
--signal c : std_logic_vector(15 downto 1);

begin
    Bit0 : full_adder PORT MAP (
        x => b(0),
        y => a(0),
        z => c0,
        s => s(0),
        c => c1);
    Bit1 : full_adder PORT MAP (
        x => b(1),
        y => a(1),
        z => C1,
        s => s(1),
        c => C2);
    Bit2 : full_adder PORT MAP (
        x => b(2),
        y => a(2),
        z => C2,
        s => s(2),
        c => C3);
    Bit3 : full_adder PORT MAP (
        x => b(3),
        y => a(3),
        z => C3,
        s => s(3),
        c => C4);
        
    Bit4 : full_adder PORT MAP (
        x => b(4),
        y => a(4),
        z => C4,
        s => s(4),
        c => C5);
    Bit5 : full_adder PORT MAP (
        x => b(5),
        y => a(5),
        z => C5,
        s => s(5),
        c => C6);
    Bit6 : full_adder PORT MAP (
        x => b(6),
        y => a(6),
        z => C6,
        s => s(6),
        c => C7);
    Bit7 : full_adder PORT MAP (
        x => b(7),
        y => a(7),
        z => C7,
        s => s(7),
        c => C8);
        
    Bit8 : full_adder PORT MAP (
        x => b(8),
        y => a(8),
        z => C8,
        s => s(8),
        c => C9);
    Bit9 : full_adder PORT MAP (
        x => b(9),
        y => a(9),
        z => C9,
        s => s(9),
        c => C10);
    Bit10 : full_adder PORT MAP (
        x => b(10),
        y => a(10),
        z => C10,
        s => s(10),
        c => C11);
    Bit11 : full_adder PORT MAP (
        x => b(11),
        y => a(11),
        z => C11,
        s => s(11),
        c => C12);
        
    Bit12 : full_adder PORT MAP (
        x => b(12),
        y => a(12),
        z => C12,
        s => s(12),
        c => C13);
    Bit13 : full_adder PORT MAP (
        x => b(13),
        y => a(13),
        z => C13,
        s => s(13),
        c => C14);
    Bit14 : full_adder PORT MAP (
        x => b(14),
        y => a(14),
        z => C14,
        s => s(14),
        c => C15);
    Bit15 : full_adder PORT MAP (
        x => b(15),
        y => a(15),
        z => C15,
        s => s(15),
        c => c16);
       
end Behavioral;
