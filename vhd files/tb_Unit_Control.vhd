--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:49:23 11/30/2020
-- Design Name:   
-- Module Name:   C:/Users/German/Documents/Facultad/Organizaciones/RV/RV32I/tb_Unit_Control.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unit_Control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Unit_Control IS
END tb_Unit_Control;
 
ARCHITECTURE behavior OF tb_Unit_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unit_Control
    PORT(
         f7 : IN  std_logic;
         f3 : IN  std_logic_vector(2 downto 0);
         Cod_inst : IN  std_logic_vector(6 downto 0);
         Zero : IN  std_logic;
         Sel_Signal : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal f7 : std_logic := '0';
   signal f3 : std_logic_vector(2 downto 0) := (others => '0');
   signal Cod_inst : std_logic_vector(6 downto 0) := (others => '0');
   signal Zero : std_logic := '0';

 	--Outputs
   signal Sel_Signal : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal RD_A : std_logic_vector (31 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unit_Control PORT MAP (
          f7 => f7,
          f3 => f3,
          Cod_inst => Cod_inst,
          Zero => Zero,
          Sel_Signal => Sel_Signal
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     -- wait for 100 ns;	
		-- f7 <= '0';
	   -- f3 <= "000";
	   -- Cod_inst <= "0100011";
	   -- Zero <= '0';
		
		
		--RD_A <= "00000000000100000000010010010011"; -- addi x9, x0, 1
		RD_A <= "00000000000100000000010010010011"; -- addi x9, x0, 1
		
		--RD_A <= x"00102303" ;
		
		--RD_A <= "00000001001000101000010001100011" ; --beq x5, x18, sal1 = beq x5, x18, 0x00000008"
		wait for 20 ns;
		
		f7 <= RD_A(30);
		
	   f3 <= RD_A(14 downto 12);
	   wait for 10 ns;
		Cod_inst <= RD_A(6 downto 0);
	   wait for 10 ns;
		Zero <= '1';
		

      wait;
   end process;

END;
