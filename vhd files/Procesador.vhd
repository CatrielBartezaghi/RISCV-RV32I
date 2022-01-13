----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:00 11/06/2020 
-- Design Name: 
-- Module Name:    Procesador - Behavioral 
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

entity Procesador is
    Port ( 
			Clock : in  STD_LOGIC;
			Reset : in  STD_LOGIC; 
			Data_in : in STD_LOGIC_VECTOR (31 downto 0);
			ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
			RD2 : OUT STD_LOGIC_VECTOR (31 downto 0);
			we : OUT std_logic
		);
end Procesador;

architecture Behavioral of Procesador is

	COMPONENT Camino_Datos
	PORT(
		Ctrl_in : IN std_logic_vector(14 downto 0); -- Esta es la salida de la unidad de control con todas las señales
		Data_Load : IN std_logic_vector(31 downto 0); -- Data que entra
		Clock : IN std_logic;
		Reset : IN std_logic;          
		Instr : OUT STD_LOGIC_VECTOR (31 downto 0);
		Zero : OUT STD_LOGIC;
		ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
		RD2 : OUT STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Unit_Control
	PORT(
		f7 : in  STD_LOGIC;
		f3 : in  STD_LOGIC_VECTOR (2 downto 0);
	   Cod_inst : in  STD_LOGIC_VECTOR (6 downto 0);
	   Zero: in STD_LOGIC;
	   Sel_Signal : out  STD_LOGIC_VECTOR (14 downto 0)
		);
	END COMPONENT;
	

	-- Variables aux
	signal Ctrl_out : std_logic_vector(8 downto 0);
	signal Dir : std_logic_vector(5 downto 0);
	signal Dout : std_logic_vector(31 downto 0);
	
	signal Sel_signal : std_logic_vector(14 downto 0);
	signal we_auxiliar : std_logic;
	
	signal zero : std_logic;
	
	-- unidadControl
	signal Instraux : STD_LOGIC_VECTOR (31 downto 0);
	signal AluResultaux : STD_LOGIC_VECTOR(31 downto 0);
	signal RD2aux : STD_LOGIC_VECTOR(31 downto 0);
	signal opCode : STD_LOGIC_VECTOR(6 downto 0);


begin
	
	Inst_Camino_Datos: Camino_Datos PORT MAP(
		Ctrl_in => Sel_Signal,
		Data_Load => Data_in,
		Clock => Clock,
		Reset => Reset,
		Instr => Instraux,
		Zero => zero,
		ALUResult => AluResultaux,
		RD2 => RD2aux		
	);
	
	
	Inst_Unit_Control: Unit_Control PORT MAP(
		f7 => Instraux(30),
		f3 => Instraux(14 downto 12),
		Cod_inst => Instraux(6 downto 0), -- OP
		Zero => zero,
		Sel_Signal => Sel_signal
	);
	
	ALUResult <= AluResultaux;
	RD2 <= RD2Aux;
	we <= Sel_signal(12);


end Behavioral;

