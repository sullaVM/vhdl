----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 06:31:54 PM
-- Design Name: 
-- Module Name: shifter_unit - Behavioral
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

entity shifter_unit is
    Port (b_shift : in std_logic_vector(15 downto 0);
          i_r, i_l : in std_logic;
          s : in std_logic_vector(1 downto 0);
          ser_l, ser_r : out std_logic;
          h : out std_logic_vector(15 downto 0));
end shifter_unit;

architecture Behavioral of shifter_unit is
    component mux3_1bit
        Port (in0, in1, in2 : in std_logic;
            s : in std_logic_vector(1 downto 0);
            z : out std_logic);
    end component;

begin
    mux0 : mux3_1bit port map (
        in0 => b_shift(0),
        in1 => b_shift(1),
        in2 => i_l,
        s => s,
        z => h(0)
    );

    mux1 : mux3_1bit port map (
        in0 => b_shift(1),
        in1 => b_shift(2),
        in2 => b_shift(0),
        s => s,
        z => h(1)
    );

    mux2 : mux3_1bit port map (
        in0 => b_shift(2),
        in1 => b_shift(3),
        in2 => b_shift(1),
        s => s,
        z => h(2)
    );

    mux3 : mux3_1bit port map (
        in0 => b_shift(3),
        in1 => b_shift(4),
        in2 => b_shift(2),
        s => s,
        z => h(3)
    );

    mux4 : mux3_1bit port map (
        in0 => b_shift(4),
        in1 => b_shift(5),
        in2 => b_shift(3),
        s => s,
        z => h(4)
    );

    mux5 : mux3_1bit port map (
        in0 => b_shift(5),
        in1 => b_shift(6),
        in2 => b_shift(4),
        s => s,
        z => h(5)
    );

    mux6 : mux3_1bit port map (
        in0 => b_shift(6),
        in1 => b_shift(7),
        in2 => b_shift(5),
        s => s,
        z => h(6)
    );

    mux7 : mux3_1bit port map (
        in0 => b_shift(7),
        in1 => b_shift(8),
        in2 => b_shift(6),
        s => s,
        z => h(7)
    );

    mux8 : mux3_1bit port map (
        in0 => b_shift(8),
        in1 => b_shift(9),
        in2 => b_shift(7),
        s => s,
        z => h(8)
    );

    mux9 : mux3_1bit port map (
        in0 => b_shift(9),
        in1 => b_shift(10),
        in2 => b_shift(8),
        s => s,
        z => h(9)
    );

    mux10 : mux3_1bit port map (
        in0 => b_shift(10),
        in1 => b_shift(11),
        in2 => b_shift(9),
        s => s,
        z => h(10)
    );

    mux11 : mux3_1bit port map (
        in0 => b_shift(11),
        in1 => b_shift(12),
        in2 => b_shift(10),
        s => s,
        z => h(11)
    );

    mux12 : mux3_1bit port map (
        in0 => b_shift(12),
        in1 => b_shift(13),
        in2 => b_shift(11),
        s => s,
        z => h(12)
    );

    mux13 : mux3_1bit port map (
        in0 => b_shift(13),
        in1 => b_shift(14),
        in2 => b_shift(12),
        s => s,
        z => h(13)
    );

    mux14 : mux3_1bit port map (
        in0 => b_shift(14),
        in1 => b_shift(15),
        in2 => b_shift(13),
        s => s,
        z => h(14)
    );

    mux15 : mux3_1bit port map (
        in0 => b_shift(15),
        in1 => i_r,
        in2 => b_shift(14),
        s => s,
        z => h(15)
    );

    ser_l <= b_shift(15);
    ser_r <= b_shift(0);

end Behavioral;
