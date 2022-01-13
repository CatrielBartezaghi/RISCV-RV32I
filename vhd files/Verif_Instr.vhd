----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:45 12/01/2020 
-- Design Name: 
-- Module Name:    Verif_Instr - Behavioral 
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

entity Verif_Instr is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Instr_ret : out  STD_LOGIC_VECTOR (31 downto 0);
           Sen_ret : out  STD_LOGIC);
end Verif_Instr;

architecture Behavioral of Verif_Instr is


begin
	process(Instr)
	begin
		if (Instr = x"00000013") then
			Instr_ret <= x"00000000";
			Sen_ret <= '1'; -- Tiene que hacer la pausa
		else
			Instr_ret <= Instr;
			Sen_ret <= '0';
		end if;
	end process;

end Behavioral;

