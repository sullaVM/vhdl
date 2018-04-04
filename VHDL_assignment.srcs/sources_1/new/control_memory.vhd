----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 09:42:57 AM
-- Design Name: 
-- Module Name: control_memory - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_memory is
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
end control_memory;

architecture Behavioral of control_memory is
type mem_array is array(0 to 255) of std_logic_vector(15 downto 0);

begin
memory_m : process (IN_CAR)
    variable control_mem : mem_array := ( 
        X"FFFFFFF",
        X"FFFFFFF",  
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF",
        X"FFFFFFF");
    
    variable addr : integer;
    variable control_out : std_logic_vector(27 downto 0);

    begin
        addr := conv_integer(IN_CAR);
        control_out := control_mem(addr);
        MW <= control_out(0);
        MM <= control_out(1);
        RW <= control_out(2);
        MD <= control_out(3);
        FS <= control_out (8 downto 4);
        MB <= control_out(0);
        TB <= control_out(10);
        TA <= control_out(11);
        TD <= control_out(12);
        PL <= control_out(13);
        PI <= control_out(14);
        IL <= control_out(15);
        MC <= control_out(16);
        MS <= control_out(19 downto 17);
        NA <= control_out(27 downto 20);
    end process;
end Behavioral;
