--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:01 12/06/2020
-- Design Name:   
-- Module Name:   C:/Facultad/Organizacion de las Computadoras/Practica/TP2/RV32I/tb_mem_RAM.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_RAM
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
 
ENTITY tb_mem_RAM IS
END tb_mem_RAM;
 
ARCHITECTURE behavior OF tb_mem_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_RAM
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         DI : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         WE : IN  std_logic;
         DO : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal DI : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal WE : std_logic := '0';

 	--Outputs
   signal DO : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_RAM PORT MAP (
          A => A,
          DI => DI,
          clk => clk,
          WE => WE,
          DO => DO
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		WE <= '0';
		A <= "00000000000000000010000000001001";
		DI <= x"00000000";

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
