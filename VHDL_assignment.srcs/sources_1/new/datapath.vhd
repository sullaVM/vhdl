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
    Port (const : in std_logic_vector(15 downto 0);
        data_d_in : in std_logic_vector(15 downto 0);
        fs : in std_logic_vector(4 downto 0);
        rw : in std_logic;
        td, tb, mb, md : in std_logic;
        dr, sa, sb : in std_logic_vector(2 downto 0);
        Clk : in std_logic;
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
end datapath;

architecture Behavioral of datapath is
    component reg_file
        Port (sa, sb, dr : in std_logic_vector(2 downto 0);
          td, tb : in std_logic;
          Clk : in std_logic;
          rw : in std_logic;
          d_data : in std_logic_vector(15 downto 0);
          bus_a, bus_b : out std_logic_vector(15 downto 0);
          reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;

    component function_unit
        Port (a, b : in std_logic_vector(15 downto 0);
            g_sel : in std_logic_vector(3 downto 0);
            h_sel : in std_logic_vector(1 downto 0);
            i_r, i_l : in std_logic;
            mf_sel : in std_logic;
            Clk : in std_logic;
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
    signal bus_b_mux :  std_logic_vector(15 downto 0);
    signal z : std_logic_vector(15 downto 0);

    constant Clk_time : time := 30ns;

begin
       register_file: reg_file PORT MAP (
            sa => sa,
            sb => sb,
            dr => dr,
            td => td,
            tb => tb,
            Clk => Clk,
            rw => rw,
            d_data => d_data,
            bus_a => bus_a,
            bus_b => bus_b,
            reg0 => reg0, 
            reg1 => reg1, 
            reg2 => reg2, 
            reg3 => reg3, 
            reg4 => reg4, 
            reg5 => reg5, 
            reg6 => reg6, 
            reg7 => reg7,
            reg8 => reg8
        );
        
        fu: function_unit port map (
            a => bus_a,
            b => bus_b_mux,
            g_sel => fs(3 downto 0),
            h_sel => fs(3 downto 2),
            i_r => i_r,
            i_l => i_l,
            Clk => Clk,
            mf_sel => fs(4),
            ser_left => ser_left,
            ser_right => ser_right,
            z => z
        );
        
        mux_b : mux2_16bit PORT MAP (
            In0 => bus_b,
            In1 => const,
            s => mb,
            Z => bus_b_mux
        );
        
        mux_d : mux2_16bit PORT MAP (
            In0 => z,
            In1 => data_d_in,
            s => md,
            Z => d_data
        );
        
end Behavioral;
