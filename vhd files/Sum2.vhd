----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:33 11/09/2020 
-- Design Name: 
-- Module Name:    Sum2 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sum2 is
    Port ( Sum_PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           ImmExt : in  STD_LOGIC_VECTOR (31 downto 0);
           PCTarget : out  STD_LOGIC_VECTOR (31 downto 0));
end Sum2;

architecture Behavioral of Sum2 is

begin

PCTarget <= Sum_PC_in + ImmExt;

end Behavioral;

