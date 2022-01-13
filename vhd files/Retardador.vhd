----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:43:07 12/01/2020 
-- Design Name: 
-- Module Name:    Retardador - Behavioral 
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

entity Retardador is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           Sen_ret : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Retardador;

architecture Behavioral of Retardador is

		shared variable cnt : natural range 0 to 300000000; -- tiempo en ns
begin

	process(PC, Sen_ret, clk)
	begin
	
		if(Sen_ret = '1') then
			
			if (cnt = 300000000) then
			--if (cnt = 12) then
				PC_out <= PC ;
				cnt := 0;
			else
				cnt := cnt + 1;
				PC_out <= std_logic_vector(unsigned(PC) - "00000000000000000000000000000100");   
			end if;
		else
			PC_out <= PC;
		end if;
	end process;

end Behavioral;

