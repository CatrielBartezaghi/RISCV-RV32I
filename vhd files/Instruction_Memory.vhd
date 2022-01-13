----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:36 11/06/2020 
-- Design Name: 
-- Module Name:    Instruction_Memory - Behavioral 
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
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Memory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);                 
   signal ROM : rom_type:= (		
     
		x"00100493",
		x"00300413",
		
		x"00000013",
		
		x"01000913",
		x"009462b3",
		
		x"00000013",		
		
		x"00947333",
		x"009403b3", 
		x"40940e33", 
		x"40848eb3", 
		x"00942f33",
		x"0084afb3",
		x"009ea8b3", 
		x"00100293", 
		x"00000013", --interrupcion 12
		x"00000313", 
		x"01228463",	--x"01228863", -- beq x5, x18, sal1 = beq x5, x18, 0x00000008 HACE EL SALTO
		x"005282b3",
		x"00130313",
		x"ffbff06f",	--x"ff5ff06f",	-- j while = jal x0, 0xfffffffa 
		x"000004b3",
		x"00000293",
		x"00a00313",	
		x"00628463",	--x"00628863",	-- beq x5, x6, sal2 = beq x5, x6, 0x00000008
		x"008484b3",
		x"00128293",
		x"ffbff06f",	--x"ff5ff06f",	-- j for = jal x0, 0xffffffa
   	x"00802023", --sw
		x"00902223",
		x"01202423",
		x"00002583", --lw
		x"00402603",
		x"00802683",
		others => X"00000000"
          ); 
		-- x"00000013" es el nop
begin

	RD <= ROM(to_integer(unsigned(A))/4); -- se convierte la direccion de hexa a decimal y se divide por 4 ya que una instruccion utiliza 4 bytes.
	 

end Behavioral;

