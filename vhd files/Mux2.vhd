----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:56:36 11/09/2020 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
    Port ( RD2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ImmExt : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUSrc : in STD_LOGIC;
           SrcB : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux2;

architecture Behavioral of Mux2 is

begin


SrcB <= RD2  when ALUSrc = '0' else ImmExt;

end Behavioral;

