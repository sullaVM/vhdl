----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 09:45:22 AM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port (cw : in std_logic_vector(16 downto 0);
        const : in std_logic_vector(15 downto 0);
        data_d_in : in std_logic_vector(15 downto 0));
end datapath;

architecture Behavioral of datapath is
    component reg_file
         Port (mux_a_s, mux_b_s, decoder_s : in std_logic_vector(2 downto 0);
          Clk : in std_logic;
          rw, data_src : in std_logic;
          d_data : in std_logic_vector(15 downto 0);
          data : in std_logic_vector(15 downto 0);
          bus_a, bus_b : out std_logic_vector(15 downto 0));
    end component;

    component function_unit
        Port (a, b : in std_logic_vector(15 downto 0);
            g_sel : in std_logic_vector(3 downto 0);
            h_sel : in std_logic_vector(1 downto 0);
            i_r, i_l : in std_logic;
            mf_sel : in std_logic;
            ser_left, ser_right : out std_logic;
            z : out std_logic_vector(15 downto 0));
    end component;
    
    component mux2_16bit
        Port (In0 : in std_logic_vector(15 downto 0);
          In1 : in std_logic_vector(15 downto 0);
          s : in std_logic;
          Z : out std_logic_vector(15 downto 0));
    end component;
   
   -- Signals   
    signal d_data, data : std_logic_vector(15 downto 0);
    signal bus_a, bus_b : std_logic_vector(15 downto 0); 
    signal i_r, i_l, ser_left, ser_right : std_logic := '0';
    signal z : std_logic_vector(15 downto 0);

    signal Clk : std_logic := '0';
    constant Clk_time : time := 30ns;



   
begin
       register_file: reg_file PORT MAP (
            mux_a_s => cw(13 downto 11),
            mux_b_s => cw(10 downto 8),
            decoder_s => cw(16 downto 14),
            Clk => Clk,
            rw => cw(0),
            data_src => cw(7),
            d_data => d_data,
            data => const,
            bus_a => bus_a,
            bus_b => bus_b
        );
        
        fu: function_unit port map (
            a => bus_a,
            b => bus_b,
            g_sel => cw(5 downto 2),
            h_sel => cw(5 downto 4),
            i_r => i_r,
            i_l => i_l,
            mf_sel => cw(6),
            ser_left => ser_left,
            ser_right => ser_right,
            z => z
        );
        
        mux_d : mux2_16bit PORT MAP (
            In0 => data_d_in,
            In1 => z,
            s => cw(1),
            Z => d_data
        );

end Behavioral;
