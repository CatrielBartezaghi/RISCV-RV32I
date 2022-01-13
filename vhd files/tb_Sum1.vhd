--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:13:49 11/28/2020
-- Design Name:   
-- Module Name:   C:/Users/German/Documents/Facultad/Organizaciones/RV/RV32I/tb_Sum1.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sum1
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
 
ENTITY tb_Sum1 IS
END tb_Sum1;
 
ARCHITECTURE behavior OF tb_Sum1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sum1
    PORT(
         PC : IN  std_logic_vector(31 downto 0);
         PCPlus4 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PCPlus4 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum1 PORT MAP (
          PC => PC,
          PCPlus4 => PCPlus4
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 5 ms;
		PC <= x"00000001";
		wait;
   end process;

END;
