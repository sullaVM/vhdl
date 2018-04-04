----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2018 05:39:52 PM
-- Design Name: 
-- Module Name: reg_file - Behavioral
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

entity reg_file is
  Port (mux_a_s, mux_b_s, decoder_s : in std_logic_vector(2 downto 0);
        td, tb : in std_logic;
        Clk : in std_logic;
        rw, data_src : in std_logic;
        d_data : in std_logic_vector(15 downto 0);
        data : in std_logic_vector(15 downto 0);
        bus_a, bus_b : out std_logic_vector(15 downto 0);
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
end reg_file;

architecture Behavioral of reg_file is
-- components
    -- 16-bit register
    COMPONENT reg
       Port(D : IN std_logic_vector(15 downto 0);
            load : IN std_logic;
            Clk : IN std_logic;
            Q : OUT std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- 2 to 4 decoder
    COMPONENT decoder_3to8
       Port (A0 : in std_logic;
             A1 : in std_logic;
             A2 : in std_logic;
             Q0 : out std_logic;
             Q1 : out std_logic;
             Q2 : out std_logic;
             Q3 : out std_logic;
             Q4 : out std_logic;
             Q5 : out std_logic;
             Q6 : out std_logic;
             Q7 : out std_logic);
    END COMPONENT;
    
    -- 8 multiplexer 16-bit
    COMPONENT mux8_16bit is
      Port (In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(2 downto 0);
            Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- 2 multiplexer 16-bit
    COMPONENT mux2_16bit is
      Port (In0 : in std_logic_vector(15 downto 0);
            In1 : in std_logic_vector(15 downto 0);
            s : in std_logic;
            Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, 
        load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic := '0';
signal dec_out_0, dec_out_1, dec_out_2, dec_out_3, dec_out_4,
        dec_out_5, dec_out_6, dec_out_7, dec_out_8 : std_logic := '0';
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q,reg8_q,
        data_src_mux_out, src_reg, a_select_z, b_select_z,
        b_reg_final : std_logic_vector(15 downto 0);
    
begin
-- port maps
    -- reg 0
    reg00: reg PORT MAP (
        D => d_data,
        load => load_reg0,
        Clk => Clk,
        Q => reg0_q);
    
    -- reg 1
    reg01: reg PORT MAP (
        D => d_data,
        load => load_reg1,
        Clk => Clk,
        Q => reg1_q);

    -- reg 2
    reg02: reg PORT MAP (
        D => d_data,
        load => load_reg2,
        Clk => Clk,
        Q => reg2_q);

    -- reg 3
    reg03: reg PORT MAP (
        D => d_data,
        load => load_reg3,
        Clk => Clk,
        Q => reg3_q);

    -- reg 4
    reg04: reg PORT MAP (
        D => d_data,
        load => load_reg4,
        Clk => Clk,
        Q => reg4_q);

    -- reg 5
    reg05: reg PORT MAP (
        D => d_data,
        load => load_reg5,
        Clk => Clk,
        Q => reg5_q);

    -- reg 6
    reg06: reg PORT MAP (
        D => d_data,
        load => load_reg6,
        Clk => Clk,
        Q => reg6_q);
    
    -- reg 7
    reg07: reg PORT MAP (
        D => d_data,
        load => load_reg7,
        Clk => Clk,
        Q => reg7_q);
        
    -- reg 8
    reg08: reg PORT MAP (
        D => d_data,
        load => load_reg8,
        Clk => Clk,
        Q => reg8_q);

    -- destination register decoder
    des_decoder_2to8: decoder_3to8 PORT MAP (
        A0 => decoder_s(0),
        A1 => decoder_s(1), 
        A2 => decoder_s(2),
        Q0 => dec_out_0, 
        Q1 => dec_out_1, 
        Q2 => dec_out_2, 
        Q3 => dec_out_3, 
        Q4 => dec_out_4, 
        Q5 => dec_out_5, 
        Q6 => dec_out_6, 
        Q7 => dec_out_7 
     );
     
     load_reg0 <= dec_out_0 and rw;
     load_reg1 <= dec_out_1 and rw;
     load_reg2 <= dec_out_2 and rw;
     load_reg3 <= dec_out_3 and rw;
     load_reg4 <= dec_out_4 and rw;
     load_reg5 <= dec_out_5 and rw;
     load_reg6 <= dec_out_6 and rw;
     load_reg7 <= dec_out_7 and rw;

    -- 8 to 1 source register multiplexer
    b_select_mux : mux8_16bit PORT MAP (
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        s => mux_b_s,
        Z => b_select_z
    );
    
    a_select_mux : mux8_16bit PORT MAP (
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        s => mux_a_s,
        Z => a_select_z
    );
    
    b_sel_mux_2 : mux2_16bit PORT MAP (
        In0 => b_select_z,
        In1 => reg8_q,
        s => td,
        Z => b_reg_final
    );
    
    a_sel_mux_2 : mux2_16bit PORT MAP (
        In0 => a_select_z,
        In1 => reg8_q,
        s => tb,
        Z => bus_a
    );
    
    -- 2 to 1 multiplexer
    mux_B : mux2_16bit PORT MAP (
        In0 => b_reg_final,
        In1 => data,
        s => data_src,
        Z => bus_b
    );
    
    reg0 <= reg0_q;
    reg1 <= reg1_q;
    reg2 <= reg2_q;
    reg3 <= reg3_q;
    reg4 <= reg4_q;
    reg5 <= reg5_q;
    reg6 <= reg6_q;
    reg7 <= reg7_q;
    
end Behavioral;
