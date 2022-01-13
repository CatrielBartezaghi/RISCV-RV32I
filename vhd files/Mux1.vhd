----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:30 11/09/2020 
-- Design Name: 
-- Module Name:    Mux1 - Behavioral 
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

entity Mux1 is
    Port ( PC_in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_in2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  PCSrc  : in STD_LOGIC;
           PCNext : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux1;

architecture Behavioral of Mux1 is

begin
	-- Si la señal de entrada de PCSrc 1 usa el sumador, sino el resultado de Sum2
	PCNext <= PC_in1 when PCSrc = '0' else PC_in2;

end Behavioral;

