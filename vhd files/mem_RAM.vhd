----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:52 11/06/2020 
-- Design Name: 
-- Module Name:    mem_RAM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_RAM is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0); -- Entra de la alu
           DI : in  STD_LOGIC_VECTOR (31 downto 0); -- Dato inmediato
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DO : out  STD_LOGIC_VECTOR (31 downto 0));
end mem_RAM;

architecture Behavioral of mem_RAM is
--architecture syn of rams_04 is
    type ram_type is array (63 downto 0) of std_logic_vector (31 downto 0);
    signal RAM : ram_type :=( OTHERS => "00000000000000000000000000000000");
begin

    process (clk, WE, A, DI, RAM)
    begin
		if (unsigned(A) < 63) then
        if (clk'event and clk = '1') then

            if (WE = '1') then
                RAM(to_integer(unsigned(A))) <= DI; --Si we es 1, escribo el dato en la posicion de memoria
            end if;

        end if;
		  DO <= RAM(to_integer(unsigned(A))); --La salida es el dato que hay en la posicion A
		 end if;
    end process;
	 


end Behavioral;

