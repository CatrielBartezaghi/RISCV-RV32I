----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:57:55 11/09/2020 
-- Design Name: 
-- Module Name:    Mux3 - Behavioral 
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

entity Mux3 is
    Port ( ReadData : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           ResultSrc : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux3;

architecture Behavioral of Mux3 is

begin

	Result <= ReadData when ResultSrc = '0' else ALUResult;

end Behavioral;

