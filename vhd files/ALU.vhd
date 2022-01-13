----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:15 11/09/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	 Generic(N : integer := 32);
    Port ( SrcA : in  STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUControl : in STD_LOGIC_VECTOR(2 downto 0);
			  zero : out STD_LOGIC; 
           ALUResult : inout  STD_LOGIC_VECTOR (31 downto 0)); -- Lo puse inout
end ALU;

architecture Behavioral of Alu is



begin

process(SrcA, SrcB, ALUControl)
	begin

	
	case(ALUControl) IS
			when "010" => --add
				ALUResult <= std_logic_vector(unsigned(SrcA) + unsigned(SrcB));
			when "110" => --sub
				ALUResult <= std_logic_vector(unsigned(SrcA) - unsigned(SrcB)); 
			when "000" => --and
				ALUResult <= SrcA and SrcB;
			when "001" => --or
				ALUResult <= SrcA or SrcB; 
			when "111" => --slt
				if (signed(SrcA) < signed(SrcB)) then	
					ALUResult <= x"00000001";
				else
					ALUResult <= x"00000000"; 
				end if;
			when others => 
				ALUResult <= x"00000000"; 
		end case;
end process;

-- Hacemos el zero
zero <= '1' when (ALUResult = X"00000000") else '0';

		
end Behavioral;

