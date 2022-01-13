--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:57:24 11/30/2020
-- Design Name:   
-- Module Name:   C:/Users/German/Documents/Facultad/Organizaciones/RV/RV32I/tb_ALU.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         SrcA : IN  std_logic_vector(31 downto 0);
         SrcB : IN  std_logic_vector(31 downto 0);
         ALUControl : IN  std_logic_vector(2 downto 0);
         zero : OUT  std_logic;
         ALUResult : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SrcA : std_logic_vector(31 downto 0) := (others => '0');
   signal SrcB : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUControl : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal ALUResult : std_logic_vector(31 downto 0);

 	--Outputs
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          SrcA => SrcA,
          SrcB => SrcB,
          ALUControl => ALUControl,
          zero => zero,
          ALUResult => ALUResult
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	

      -- insert stimulus here 
		SrcA <= x"00000000";
		SrcB <= "00000000000000000010000000001001";
		
		ALUControl <= "010";

      wait;
   end process;

END;
