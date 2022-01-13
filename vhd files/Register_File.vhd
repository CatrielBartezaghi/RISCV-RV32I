----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:47 11/06/2020 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( A1 : in  STD_LOGIC_VECTOR (4 downto 0);
           A2 : in  STD_LOGIC_VECTOR (4 downto 0);
           A3 : in  STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in  STD_LOGIC_VECTOR (31 downto 0);
           WE3 : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           RD1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

	type ramtype is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
	signal mem: ramtype;

begin
	process(Clk)
	begin
		if Clk'event and Clk = '1' then
			-- Si está write enable guardo en memoria 
			if WE3 = '1' then 
				mem(to_integer(unsigned(A3))) <= WD3; 
			end if;
		end if;
	end process;

	process (A1, A2, mem) 
	begin	
		if (to_integer(unsigned(A1)) = 0) then 
			RD1 <= X"00000000";
		else 
			RD1 <= mem(to_integer(unsigned(A1)));  
		end if;
		if (to_integer(unsigned(A2)) = 0) then 
			RD2 <= X"00000000";
		else 
			RD2 <= mem(to_integer(unsigned(A2))); 
		end if;
	end process;

end Behavioral;

