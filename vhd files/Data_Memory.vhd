----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:37 11/06/2020 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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

entity Data_Memory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           WD : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is

begin


end Behavioral;

