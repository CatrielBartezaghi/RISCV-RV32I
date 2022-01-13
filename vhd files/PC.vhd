----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:06 11/06/2020 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( PCNext : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           PC_Out : out  STD_LOGIC_VECTOR (31 downto 0)); -- Falta agregarle el reset
end PC;

architecture Behavioral of PC is

begin


process(Clk, Reset)
	begin
		if Reset = '1' then
			PC_Out <="00000000000000000000000000000000";
		elsif Clk'event and Clk='1' then
				PC_Out<= PCNext;
		end if;
	end process;

end Behavioral;

