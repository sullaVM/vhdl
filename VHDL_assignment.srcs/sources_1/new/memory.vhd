----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 07:11:21 PM
-- Design Name: 
-- Module Name: memory - Behavioral
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

entity memory is -- use unsigned for memory address
    Port (address : in unsigned(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite, MemRead : in std_logic;
        read_data : out std_logic_vector(15 downto 0));
end memory;

architecture Behavioral of memory is
    type mem_array is array(0 to 255) of std_logic_vector(15 downto 0);
    -- define type, for memory arrays
    
    begin
        mem_process: process (address, write_data)
        -- initialize data memory, X denotes hexadecimal number
        
            variable data_mem : mem_array := (
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000",
                    X"0000"
            );
            
            variable addr : integer;
            
            begin -- the following type conversion function is in std_logic_arith
            addr:=conv_integer(address(2 downto 0));
                if MemWrite ='1' then
                    data_mem(addr):= write_data;
                elsif MemRead='1' then
                    read_data <= data_mem(addr) after 10 ns;
                end if;
        end process;
end Behavioral;