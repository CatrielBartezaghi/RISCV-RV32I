--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:01:49 12/01/2020
-- Design Name:   
-- Module Name:   C:/Users/germa/Documents/Facultad/Organizaciones/RV32I/tb_retardador.vhd
-- Project Name:  RV32I
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Retardador
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
 
ENTITY tb_retardador IS
END tb_retardador;
 
ARCHITECTURE behavior OF tb_retardador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Retardador
    PORT(
         PC : IN  std_logic_vector(31 downto 0);
         Sen_ret : IN  std_logic;
         clk : IN  std_logic;
         PC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Sen_ret : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Retardador PORT MAP (
          PC => PC,
          Sen_ret => Sen_ret,
          clk => clk,
          PC_out => PC_out
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
      wait for 100 ns;	
		PC <= x"00000001";
		Sen_ret <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
