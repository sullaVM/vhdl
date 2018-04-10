----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2018 06:02:59 PM
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
--  Port ( );
end control;

architecture Behavioral of control is
    component datapath
    Port (const : in std_logic_vector(15 downto 0);
        data_d_in : in std_logic_vector(15 downto 0);
        fs : in std_logic_vector(4 downto 0);
        rw : in std_logic;
        td, tb, mb, md : in std_logic;
        dr, sa, sb : in std_logic_vector(2 downto 0);
        Clk : in std_logic;
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;
    
    component memory 
        Port (address : in unsigned(15 downto 0);
            write_data : in std_logic_vector(15 downto 0);
            MemWrite, MemRead : in std_logic;
            Clk : in std_logic;
            read_data : out std_logic_vector(15 downto 0));
    end component;
    
    component control_memory
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
    end component;
    
    component mux8_1bit
      Port (In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic;
          s : in std_logic_vector(2 downto 0);
          Z : out std_logic);
    end component;
    
    component reg
      Port (D : in std_logic_vector(15 downto 0);
          load, Clk : in std_logic;
          Q : out std_logic_vector(15 downto 0));
    end component;
    
    -- Signals
    -- datapath
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    signal rw, td, tb, mb, md : std_logic;
    signal fs : std_logic_vector(4 downto 0);
    signal dr, sa, sb : std_logic_vector(2 downto 0);
    
    -- memory
    signal address : unsigned(15 downto 0);
    signal write_data, read_data : std_logic_vector(15 downto 0);
    signal memwrite, memread : std_logic;
    
    -- control memory
    signal mw, mm, ta, pl,
        pi, il, mc : std_logic;
    signal ms : std_logic_vector(2 downto 0);
    signal na : std_logic_vector(7 downto 0);
    signal in_car : std_logic_vector(7 downto 0);
        
    -- reg
    signal D : std_logic_vector(15 downto 0); -- data from Memory
    signal ir_q : std_logic_vector(15 downto 0);
    
    constant Clk_time : Time := 30ns;
    signal Clk : std_logic := '0';
     
begin
    Clk <= not Clk after Clk_time / 2;

    dp: datapath port map (
        const => const,
        data_d_in => data_d_in,
        fs => fs,
        rw => rw,
        td => td,
        tb => tb,
        mb => mb,
        md => md,
        dr => dr,
        sa => sa,
        sb => sb,
        Clk => Clk,
        reg0 => reg0,
        reg1 => reg1, 
        reg2 => reg2, 
        reg3 => reg3, 
        reg4 => reg4,
        reg5 => reg5, 
        reg6 => reg6, 
        reg7 => reg7
    );
    
    mem : memory port map (
        address => address,
        write_data => write_data,
        MemWrite => MemWrite,
        MemRead => MemRead,
        Clk => Clk,
        read_data => read_data
    );
    
    ir: reg port map (
        D => read_data,
        load => il,
        Clk => Clk,
        Q => ir_q
    );
    
    con_mem : control_memory port map (
        MW => mw,
        MM => mm,
        RW => rw,
        MD => md,
        FS => fs,
        MB => mb,
        TB => tb,
        TA => ta,
        TD => td,
        PL => pl,
        PI => pi,
        IL => il,
        MC => mc,
        MS => ms,
        NA => na,
        IN_CAR => in_car
    );
        
        
end Behavioral;
