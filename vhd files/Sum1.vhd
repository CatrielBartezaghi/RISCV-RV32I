----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:27 11/09/2020 
-- Design Name: 
-- Module Name:    Sum1 - Behavioral 
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

entity Sum1 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4 : out  STD_LOGIC_VECTOR (31 downto 0));
end Sum1;

architecture Behavioral of Sum1 is

begin

	PCPlus4 <= std_logic_vector(unsigned(PC) + "00000000000000000000000000000100"); 

end Behavioral;

