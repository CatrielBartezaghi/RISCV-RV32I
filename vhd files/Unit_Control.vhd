----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:24 11/06/2020 
-- Design Name: 
-- Module Name:    Unit_Control - Behavioral 
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

entity Unit_Control is
    Port ( 
			  f7 : in  STD_LOGIC;
			  f3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  Cod_inst : in  STD_LOGIC_VECTOR (6 downto 0); -- Op
			  Zero: in STD_LOGIC;
           Sel_Signal : out  STD_LOGIC_VECTOR (14 downto 0));
end Unit_Control;

architecture Behavioral of Unit_Control is

	signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);
	signal RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, PCSrc: STD_LOGIC;
	signal ALUControl,ImmSrc : STD_LOGIC_VECTOR(2 downto 0);
	signal f3f7 : STD_LOGIC_VECTOR(3 downto 0);
	
	
	signal op: STD_LOGIC;

begin

	
	
	------------------
	-- Main decoder --
	------------------
	
	--Con el cod inst
	
	process(Cod_inst)
	begin
	case Cod_inst is
		when "0000011" => --lw	(Tipo I)
		RegWrite <= '1'; ImmSrc <= "000"; ALUSrc <= '1'; MemWrite <= '0'; ResultSrc <= '1'; Branch <= '0'; ALUOp <= "00";
		
		when "0010011" => --addi	(Tipo I)
		RegWrite <= '1'; ImmSrc <= "000"; ALUSrc <= '1'; MemWrite <= '0'; ResultSrc <= '1'; Branch <= '0'; ALUOp <= "00";
		
		when "0100011" => --sw  (Tipo S)
			RegWrite <= '0'; ImmSrc <= "001"; ALUSrc <= '1'; MemWrite <= '1'; ResultSrc <= 'X'; Branch <= '0'; ALUOp <= "00";
			
		when "0110011" => -- add, sub, slt, or, and  (Tipo R)
			RegWrite <= '1'; ImmSrc <= "011"; ALUSrc <= '0'; MemWrite <= '0'; ResultSrc <= '0'; Branch <= '0'; ALUOp <= "10";  
			
		when "1100011" => -- beq  (Tipo B)
			RegWrite <= '0'; ImmSrc <= "010"; ALUSrc <= '0'; MemWrite <= '0'; ResultSrc <= 'X'; Branch <= '1'; ALUOp <= "01";
		
		when "1101111" => --Instrucciones tipo J
			RegWrite <= '0'; ImmSrc <= "100"; ALUSrc <= 'X'; MemWrite <= '0'; ResultSrc <= 'X'; Branch <= '1'; ALUOp <= "XX"; 
		
		when others => 
			RegWrite <= '0'; ImmSrc <= "000"; ALUSrc <= '0'; MemWrite <= '0'; ResultSrc <= '0'; Branch <= '0'; ALUOp <= "00";
	end case;
	end process;
	
	
	-- Cod_inst(5) = op
	
	-----------------
	-- ALU Decoder --
	-----------------
	
	f3f7 <= f3 & f7;
	op <= Cod_inst(5); -- No sirve por la tabla
	
	ALUControl <=
		"010" when (ALUOp="00") else 						-- add
		"110" when (ALUOp="01") else 						-- subtract
		"010" when (ALUOp="10" and f3f7="0000") else -- add
		"110" when (ALUOp="10" and f3f7="0001") else -- subtract
		"111" when (ALUOp="10" and f3f7="0100") else -- set less than
		"001" when (ALUOp="10" and f3f7="1100") else -- or
		"000" when (ALUOp="10" and f3f7="1110") else -- and
		"000"; -- Este caso nose si va
		
	---------
	-- AND --
	---------
	PCSrc <= Branch and Zero;
	
	----------------
	-- Asignación --
	----------------
	Sel_signal(14) <= PCSrc;
	Sel_signal(13) <= ResultSrc;
	Sel_signal(12) <= MemWrite;
	Sel_signal(11 downto 9) <= ALUControl;
	Sel_signal(8) <= ALUSrc;
	Sel_signal(7 downto 6) <= "00";	--No se usa.
	Sel_signal(5) <= RegWrite;
	Sel_signal(4 downto 2) <= ImmSrc;
	Sel_signal(1 downto 0) <= "00";
end Behavioral;

