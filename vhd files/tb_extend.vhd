--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:53 12/06/2020
-- Design Name:   
-- Module Name:   C:/Facultad/Organizacion de las Computadoras/Practica/TP2/RV32I/tb_extend.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Extend
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
 
ENTITY tb_extend IS
END tb_extend;
 
ARCHITECTURE behavior OF tb_extend IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Extend
    PORT(
         entry : IN  std_logic_vector(24 downto 0);
         ImmSrc : IN  std_logic_vector(1 downto 0);
         ImmExt : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entry : std_logic_vector(24 downto 0) := (others => '0');
   signal ImmSrc : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ImmExt : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal RD_A : std_logic_vector (31 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Extend PORT MAP (
          entry => entry,
          ImmSrc => ImmSrc,
          ImmExt => ImmExt
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		RD_A <= "00000000000100000000010010010011"; -- addi x9, x0, 1
		entry <= "0000000000100000001000110";
		ImmSrc <= "00"; 

      -- insert stimulus here 

      wait;
   end process;

END;
