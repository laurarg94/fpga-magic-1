----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leonardo Araujo dos Santos
-- 
-- Create Date:    16:28:22 03/27/2009 
-- Design Name: 	 Special Registers Magic-1 
-- Module Name:    SpecialRegisters - Behavioral 
-- Project Name: 	 Magic-1 VHDL
-- Target Devices: Spartan3
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Describe the Special registers
entity SpecialRegisters is
    Port ( IMMVAL : in  STD_LOGIC_VECTOR (0 to 1);
           ER_IMM : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (0 to 15);
           RESET : in  STD_LOGIC;
           L_MAR : in  STD_LOGIC;
           Z : in  STD_LOGIC_VECTOR (0 to 15);
           MAR : inout  STD_LOGIC_VECTOR (0 to 15);
           EL_MAR : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (0 to 15));
end SpecialRegisters;

architecture Behavioral of SpecialRegisters is
--signal MAR_tmp : std_logic_vector(0 to 15);
begin

	-- Process to describe behavior of IMM
	process (IMMVAL,ER_IMM)
	begin
		if ER_IMM = '0' then
			R(15) <= IMMVAL(1);
			
			-- Let all other bits (0 to 14) receive value from IMMVAL(0)
			for i in 0 to 14 loop
				R(i) <= IMMVAL(0);
			end loop;										
		else
			R <= (OTHERS => 'Z');
		end if;
	end process;
	
	-- Process to describe behavior of MAR (Memory Address register)
	process (RESET,L_MAR)
	begin
		if RESET = '0' then
			MAR <= (others => '0');
		else
			if rising_edge(L_MAR) then
				MAR <= Z;				
			end if;
		end if;
	end process;
	
	-- Process to describe behavior of loading MAR value in L bus
	process (EL_MAR)
	begin
		if EL_MAR = '0' then
			L <= MAR;
		else
			L <= (OTHERS => 'Z');
		end if;
	end process;

end Behavioral;

