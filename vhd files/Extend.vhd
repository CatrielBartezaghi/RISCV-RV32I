----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:24 11/09/2020 
-- Design Name: 
-- Module Name:    Extend - Behavioral 
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

-- Uncomment the following library declaration if entryantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Extend is
    Port ( entry : in  STD_LOGIC_VECTOR (24 downto 0);
			  ImmSrc : in STD_LOGIC_VECTOR(2 downto 0);
           ImmExt : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end Extend;

architecture Behavioral of Extend is

signal ImmExtAux : STD_LOGIC_VECTOR(31 downto 0);

begin

process(entry,ImmSrc,ImmExtAux)

begin



CASE ImmSrc IS
		WHEN "000" =>  --I
			IF (entry(24) = '0') THEN
				ImmExt <= x"00000"  & entry(24 downto 13);
			ELSE
				ImmExt <= x"FFFFF"  & entry(24 downto 13);
			END IF; 
			
		WHEN "001" =>  --S
			IF (entry(24) = '0') THEN
				ImmExt <= x"00000" & entry(24 downto 18) & entry(4 downto 0);
			ELSE
				ImmExt <= x"FFFFF" & entry(24 downto 18) & entry(4 downto 0);
			END IF;
			
		WHEN "011" =>  --R
			IF (entry(24) = '0') THEN
				ImmExt <= x"00000000" ;
			ELSE
				ImmExt <= x"FFFFFFFF";
			END IF;
		WHEN "010" =>  --B
			IF (entry(24) = '0') THEN
				ImmExt <= x"00000" & entry(24) & entry(0) & entry(23 downto 18) & entry(4 downto 1);
			ELSE
				ImmExt <= x"FFFFF" & entry(24) & entry(0) & entry(23 downto 18) & entry(4 downto 1);
			END IF;
			
		WHEN "100" =>  --J
			IF (entry(24) = '0') THEN
				ImmExt <= x"000" & entry(24) & entry(12 downto 5) & entry(13) & entry(23 downto 14);
			ELSE
				ImmExt <= x"FFF" & entry(24) & entry(12 downto 5) & entry(13) & entry(23 downto 14);
			END IF; 
			
		WHEN others => 
			ImmExt <= "00000000000000000000000000000000";
end case;


end process;

end Behavioral;

