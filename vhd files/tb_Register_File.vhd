--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:50 11/28/2020
-- Design Name:   
-- Module Name:   C:/Users/German/Documents/Facultad/Organizaciones/RV/RV32I/tb_Register_File.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY tb_Register_File IS
END tb_Register_File;
 
ARCHITECTURE behavior OF tb_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         A1 : IN  std_logic_vector(4 downto 0);
         A2 : IN  std_logic_vector(4 downto 0);
         A3 : IN  std_logic_vector(4 downto 0);
         WD3 : IN  std_logic_vector(31 downto 0);
         WE3 : IN  std_logic;
         Clk : IN  std_logic;
         RD1 : OUT  std_logic_vector(31 downto 0);
         RD2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A1 : std_logic_vector(4 downto 0) := (others => '0');
   signal A2 : std_logic_vector(4 downto 0) := (others => '0');
   signal A3 : std_logic_vector(4 downto 0) := (others => '0');
   signal WD3 : std_logic_vector(31 downto 0) := (others => '0');
   signal WE3 : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal RD1 : std_logic_vector(31 downto 0);
   signal RD2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
	signal RD_A : std_logic_vector (31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          A1 => A1,
          A2 => A2,
          A3 => A3,
          WD3 => WD3,
          WE3 => WE3,
          Clk => Clk,
          RD1 => RD1,
          RD2 => RD2
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		--RD_A <= "00000000000000000000000000000000";



      wait for Clk_period*10;

      -- insert stimulus here
		
		-- Código ejemplo 
		-- 100000000010010010011
		-- addi x9, x0, 1
		
		RD_A <= "00000000000100000000010010010011"; -- addi x9, x0, 1
	
		A2 <= RD_A(24 downto 20);
		A1 <= RD_A(19 downto 15);
		A3 <= RD_A(11 downto 7);
		WD3 <= x"00000001";
		WE3 <= '0';
		
      wait for 100 ns;	
		
  
   end process;

END;
