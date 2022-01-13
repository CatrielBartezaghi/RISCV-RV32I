----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:34 11/06/2020 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (31 downto 0));
end TOP;

architecture Behavioral of TOP is
	
	COMPONENT Procesador
	PORT(
		Clock : in  STD_LOGIC;
      Reset : in  STD_LOGIC; 
		Data_in : in STD_LOGIC_VECTOR (31 downto 0);
		ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
		RD2 : OUT STD_LOGIC_VECTOR (31 downto 0);
		we : OUT std_logic
		);
	END COMPONENT;
	
	
	COMPONENT mem_RAM
	PORT(
		A : IN std_logic_vector(31 downto 0);
		DI : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		WE : IN std_logic;          
		DO : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;




-- Variables aux
signal We : std_logic;
signal ALUResult, RD2, DO : std_logic_vector(31 downto 0);

begin


	Inst_Procesador: Procesador PORT MAP(
		Clock => clk,
		Reset => reset,
		Data_in => DO,
		ALUResult => ALUResult,
		RD2 => RD2,
		we => we
	);
	
		
	Inst_mem_RAM: mem_RAM PORT MAP(
		A => ALUResult,
		DI => RD2,
		clk => clk,
		WE => we,
		DO => DO
	);
	

	leds <= ALUResult;


end Behavioral;

