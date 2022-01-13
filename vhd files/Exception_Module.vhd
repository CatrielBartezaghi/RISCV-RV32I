----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:21 12/01/2020 
-- Design Name: 
-- Module Name:    Exception_Module - Behavioral 
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

entity Exception_Module is
    Port ( Instr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           Instr_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Exception_Module;

architecture Behavioral of Exception_Module is

begin


end Behavioral;

