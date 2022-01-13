--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:05:53 12/01/2020
-- Design Name:   
-- Module Name:   C:/Users/germa/Documents/Facultad/Organizaciones/RV32I/tb_Verif_Instr.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Verif_Instr
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
 
ENTITY tb_Verif_Instr IS
END tb_Verif_Instr;
 
ARCHITECTURE behavior OF tb_Verif_Instr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Verif_Instr
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         Instr_ret : OUT  std_logic_vector(31 downto 0);
         Sen_ret : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Instr_ret : std_logic_vector(31 downto 0);
   signal Sen_ret : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Verif_Instr PORT MAP (
          Instr => Instr,
          Instr_ret => Instr_ret,
          Sen_ret => Sen_ret
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Instr <= "00000000000000000000000000000011";
      -- insert stimulus here 

      wait;
   end process;

END;
