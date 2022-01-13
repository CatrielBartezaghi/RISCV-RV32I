----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:22 11/06/2020 
-- Design Name: 
-- Module Name:    Camino_Datos - Behavioral 
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

entity Camino_Datos is
    Port ( Ctrl_in : in  STD_LOGIC_VECTOR (14 downto 0);
           Data_Load : in  STD_LOGIC_VECTOR (31 downto 0);
           Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Instr : OUT STD_LOGIC_VECTOR (31 downto 0);
			  Zero : OUT STD_LOGIC;
			  ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
			  RD2 : OUT STD_LOGIC_VECTOR (31 downto 0)
			);
			  
end Camino_Datos;

architecture Behavioral of Camino_Datos is

	COMPONENT Register_File
	PORT(
		A1 : IN std_logic_vector(4 downto 0);
		A2 : IN std_logic_vector(4 downto 0);
		A3 : IN std_logic_vector(4 downto 0);
		WD3 : IN std_logic_vector(31 downto 0);
		WE3 : IN std_logic;
		Clk : IN std_logic;          
		RD1 : OUT std_logic_vector(31 downto 0);
		RD2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		PCNext : IN std_logic_vector(31 downto 0);
		Clk : IN std_logic;          
      Reset : IN  STD_LOGIC;
		PC_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Instruction_Memory
	PORT(
		A : IN std_logic_vector(31 downto 0);          
		RD : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		
	COMPONENT Extend
	PORT(
		entry : IN std_logic_vector(24 downto 0);
		ImmSrc  : in STD_LOGIC_VECTOR(2 downto 0);
		ImmExt : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		SrcA : in  STD_LOGIC_VECTOR (31 downto 0);
	   SrcB : in  STD_LOGIC_VECTOR (31 downto 0);
	   ALUControl : in STD_LOGIC_VECTOR(2 downto 0);
	   zero : out STD_LOGIC; 
	   ALUResult : inout  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sum1
	PORT(
		PC : IN std_logic_vector(31 downto 0);          
		PCPlus4 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Sum2
	PORT(
		Sum_PC_in : IN std_logic_vector(31 downto 0);
		ImmExt : IN std_logic_vector(31 downto 0);          
		PCTarget : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux1
	PORT(
		PC_in1 : IN std_logic_vector(31 downto 0);
		PC_in2 : IN std_logic_vector(31 downto 0);     
		PCSrc  : in STD_LOGIC;		
		PCNext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux2
	PORT(
		RD2 : IN std_logic_vector(31 downto 0);
		ImmExt : IN std_logic_vector(31 downto 0);
		ALUSrc : IN std_logic;
		SrcB : OUT std_logic_vector(31 downto 0)   
		);
	END COMPONENT;
	
	
	COMPONENT Mux3
	PORT(
		ReadData : IN std_logic_vector(31 downto 0);
		ALUResult : IN std_logic_vector(31 downto 0);          
		ResultSrc : in  STD_LOGIC;
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	

	COMPONENT Verif_Instr
	PORT(
		Instr : IN std_logic_vector(31 downto 0);          
		Instr_ret : OUT std_logic_vector(31 downto 0);
		Sen_ret : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Retardador
	PORT(
		PC : IN std_logic_vector(31 downto 0);
		Sen_ret : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	
signal PC_A, PCNext_A : std_logic_vector(31 downto 0);
signal RD : std_logic_vector(31 downto 0);
signal A1, A2, A3 : std_logic_vector(4 downto 0);
signal WD3, R15, RD1, RD2_A : std_logic_vector(31 downto 0);
signal A, WD, RD_A : std_logic_vector(31 downto 0);
signal entry_ext : std_logic_vector(24 downto 0);
signal ImmExt : std_logic_vector(31 downto 0);
signal ALU_Result : std_logic_vector(31 downto 0);
signal Sum1Result : std_logic_vector(31 downto 0);
signal Sum2Result : std_logic_vector(31 downto 0);
signal SrcB : std_logic_vector(31 downto 0);
signal zero_a : std_logic;
signal Instr_r : STD_LOGIC_VECTOR(31 downto 0);
signal Sen_r : STD_LOGIC;
signal PC_Final : STD_LOGIC_VECTOR(31 downto 0);

begin

	
	Inst_Mux1: Mux1 PORT MAP(
		PC_in1 => Sum1Result,
		PC_in2 => Sum2Result,
		PCSrc => Ctrl_in(14),
		PCNext => PCNext_A
	);
	
	Inst_PC: PC PORT MAP(
		PCNext => PCNext_A,
		Clk => Clock,
		Reset => Reset,
		PC_Out => PC_A
	);
	
	Inst_Instruction_Memory: Instruction_Memory PORT MAP(
		A => PC_A,
		RD => RD_A
	);
	
	
	Inst_Verif_Instr: Verif_Instr PORT MAP(
		Instr => RD_A,
		Instr_ret => Instr_r,
		Sen_ret => Sen_r
	);


	Inst_Retardador: Retardador PORT MAP(
		PC => PC_A,
		Sen_ret => Sen_r,
		clk => Clock,
		PC_out => PC_Final
	);
	
	-- Sumador para lo de arriba
	Inst_Sum1: Sum1 PORT MAP(
		PC => PC_Final,
		PCPlus4 => Sum1Result
	);
	
	-- Decompongo para el Register file
	A2 <= Instr_r(24 downto 20);
	A1 <= Instr_r(19 downto 15);
	A3 <= Instr_r(11 downto 7);
	
	-- Decompongo para el Extend
	entry_ext <= Instr_r(31 downto 7);
	
	-- Banco de registros
	Inst_Register_File: Register_File PORT MAP(
		A1 => A1,
		A2 => A2,
		A3 => A3,
		WD3 => WD3,
		WE3 => Ctrl_in(5),
		Clk => Clock,
		RD1 => RD1,
		RD2 => RD2_A
	);
	
	-- El extend
	Inst_Extend: Extend PORT MAP(
		entry => entry_ext,
		ImmSrc => Ctrl_in(4 downto 2),
		ImmExt => ImmExt
	);

	Inst_Mux2: Mux2 PORT MAP(
		RD2 => RD2_A,
		ImmExt => ImmExt,
		ALUSrc => Ctrl_in(8),
		SrcB => SrcB
	);

	
	Inst_ALU: ALU PORT MAP(
		SrcA => RD1,
		SrcB => SrcB,
		ALUControl => Ctrl_in(11 downto 9),
		zero => zero_a,
		ALUResult => ALU_Result
	);
		
		
	Inst_Sum2: Sum2 PORT MAP(
		Sum_PC_in => PC_Final,
		ImmExt => ImmExt,
		PCTarget => Sum2Result
	);
	
	
	-- Aca entran cosas de la ram
	Inst_Mux3: Mux3 PORT MAP(
		ReadData => Data_Load,
		ALUResult => ALU_Result,
		ResultSrc => Ctrl_in(13),
		Result => WD3
	);
	
	-- Las salidas son: 
--	Instr : OUT STD_LOGIC_VECTOR (31 downto 0);
	Instr <= Instr_r;
--	Zero : OUT STD_LOGIC;
	Zero <= zero_a;
--	ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
	ALUResult <= ALU_Result;													--CAAAAAAAAMBIAAAAAAAAAAR------------------------
--	RD2 : OUT STD_LOGIC_VECTOR (31 downto 0);
	RD2 <= RD2_A;
	

end Behavioral;

