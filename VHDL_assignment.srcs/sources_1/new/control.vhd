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
    Port (reset : in std_logic
    );
end control;

architecture Behavioral of control is
    component datapath
        Port (const : in std_logic_vector(15 downto 0);
            data_d_in : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            rw : in std_logic;
            td, tb, ta, mb, md : in std_logic;
            dr, sa, sb : in std_logic_vector(2 downto 0);
            v_flag, c_flag, n_flag, z_flag : out std_logic;
            bus_a, bus_b : out std_logic_vector(15 downto 0);
            Clk : in std_logic;
            reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;
    
    component memory 
        Port (address : in unsigned(15 downto 0);
            write_data : in std_logic_vector(15 downto 0);
            MemWrite : in std_logic;
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
   
   component mux2_16bit
     Port (In0 : in std_logic_vector(15 downto 0);
         In1 : in std_logic_vector(15 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(15 downto 0));
   end component;
   
   component zero_fill
       Port (x : in std_logic_vector(2 downto 0);
         y : out std_logic_vector(15 downto 0));
   end component;
   
   component extend
       Port (dr, sb : in std_logic_vector(2 downto 0);
           ext : out std_logic_vector(15 downto 0));
   end component;
   
   component pc
       Port (extend : in std_logic_vector(15 downto 0);
           pl, pi, reset : in std_logic;
           Clk : in std_logic;
           y : out std_logic_vector(15 downto 0));
   end component;
   
   component mux2_8bit
      Port (In0 : in std_logic_vector(7 downto 0);
           In1 : in std_logic_vector(7 downto 0);
           s : in std_logic;
           Z : out std_logic_vector(7 downto 0));
   end component;
    
    -- Signals
    -- datapath
    signal const, data_d_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    signal rw, td, tb, mb, md : std_logic;
    signal v_flag, c_flag, n_flag, z_flag : std_logic;
    signal not_z_flag, not_c_flag : std_logic;
    signal bus_a, bus_b : std_logic_vector(15 downto 0);
    signal fs : std_logic_vector(4 downto 0);
    signal dr, sa, sb : std_logic_vector(2 downto 0);
    
    -- memory
    signal address : unsigned(15 downto 0);
    signal write_data, read_data : std_logic_vector(15 downto 0);
    signal mem_address : unsigned(15 downto 0);
    
    -- control memory
    signal mw, mm, ta, pl,
        pi, il, mc : std_logic;
    signal ms : std_logic_vector(2 downto 0);
    signal na : std_logic_vector(7 downto 0);
    signal in_car : std_logic_vector(7 downto 0);
        
    -- reg
    signal D : std_logic_vector(15 downto 0); -- data from Memory
    signal ir_q : std_logic_vector(15 downto 0);
    
    -- mux_b
    
    -- mux_s
    signal mux_s_z : std_logic;
    
    -- mux_m
    signal mux_m_z : std_logic_vector(15 downto 0);
    
    -- mux_c
    signal mux_c_out, opcode : std_logic_vector(7 downto 0);
    
    -- pc
    signal ext : std_logic_vector(15 downto 0);
    signal program_cnt : std_logic_vector(15 downto 0);
    
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
        ta => ta,
        mb => mb,
        md => md,
        dr => ir_q(8 downto 6),
        sa => ir_q(5 downto 3),
        sb => ir_q(2 downto 0),
        v_flag => v_flag,
        c_flag => c_flag,
        n_flag => n_flag,
        z_flag => z_flag,
        bus_a => bus_a,
        bus_b => bus_b,
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
        address => mem_address,
        write_data => bus_b,
        MemWrite => mw,
        Clk => Clk,
        read_data => read_data
    );
    
    ir: reg port map (
        D => read_data,
        load => il,
        Clk => Clk,
        Q => ir_q
    );
    
    zf : zero_fill port map (
        x => ir_q(2 downto 0),
        y => const
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
    
    not_z_flag <= not z_flag;
    not_c_flag <= not c_flag;
          
    mux_s : mux8_1bit port map (
        In0 => '0',
        In1 => '1', 
        In2 => c_flag, 
        In3 => v_flag, 
        In4 => z_flag, 
        In5 => n_flag, 
        In6 => not_c_flag, 
        In7 => not_z_flag,
        s => ms,
        Z => mux_s_z
    );
          
    mux_m : mux2_16bit port map (
        In0 => bus_a,
        In1 => program_cnt,
        s => mm,
        Z => mux_m_z
    );
    
    extender : extend port map (
        dr => dr,
        sb => sb,
        ext => ext
    );
    
    prog_count : pc port map (
        extend => ext,
        pi => pi,
        pl => pl,
        reset => reset,
        Clk => Clk,
        y => program_cnt
    );

    mux_c : mux2_8bit port map (
        In0 => na,
        In1 => opcode,
        s => mc,
        Z => mux_c_out
    );
    
    mem_address <= unsigned(mux_m_z);
        
        
end Behavioral;
