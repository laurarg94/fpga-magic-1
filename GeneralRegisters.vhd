----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Leonardo Araujo dos Santos
-- 
-- Create Date:    16:28:22 03/27/2009 
-- Design Name: 	 General Registers Magic-1 
-- Module Name:    GeneralRegisters - Behavioral 
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

-- Describe general registers behavior (A,B,C,DP,SP,SSP,PC,TPC)

entity GeneralRegisters is
    Port ( EL_A : in  STD_LOGIC;
           L_A_HI : in  STD_LOGIC;
           L_A_LO : in  STD_LOGIC;
           EL_B : in  STD_LOGIC;
           L_B_HI : in  STD_LOGIC;
           L_B_LO : in  STD_LOGIC;
           EL_C : in  STD_LOGIC;
           L_C : in  STD_LOGIC;
           EL_DP : in  STD_LOGIC;
           L_DP : in  STD_LOGIC;
           EL_SP : in  STD_LOGIC;
           L_SP : in  STD_LOGIC;
           EL_SSP : in  STD_LOGIC;
           L_SSP : in  STD_LOGIC;
           EL_PC : in  STD_LOGIC;
           L_PC : in  STD_LOGIC;
           COMMIT : in  STD_LOGIC;
           EL_TPC : in  STD_LOGIC;
           Z : in  STD_LOGIC_VECTOR (0 to 15);
           L : inout  STD_LOGIC_VECTOR (0 to 15));
end GeneralRegisters;

architecture Behavioral of GeneralRegisters is
signal REG_A   : std_logic_vector(0 to 15);
signal REG_B   : std_logic_vector(0 to 15);
signal REG_C   : std_logic_vector(0 to 15);
signal REG_DP  : std_logic_vector(0 to 15);
signal REG_SP  : std_logic_vector(0 to 15);
signal REG_SSP : std_logic_vector(0 to 15);
signal REG_PC  : std_logic_vector(0 to 15);
signal REG_TPC : std_logic_vector(0 to 15);
signal SEL_REG : std_logic_vector(0 to 7);

begin
	-- Process describing register A
	process (L_A_HI,L_A_LO)
	begin		
		-- Load Low byte
		if rising_edge(L_A_LO) then
			REG_A(8 to 15) <= Z(8 to 15);
		end if;
		
		-- Load High byte
		if rising_edge(L_A_HI) then
			REG_A(0 to 7) <= Z(0 to 7);
		end if;			
	end process;
	
	-- Process describing register B
	process (L_B_HI,L_B_LO)
	begin		
		-- Load Low byte
		if rising_edge(L_B_LO) then
			REG_B(8 to 15) <= Z(8 to 15);
		end if;
		
		-- Load High byte
		if rising_edge(L_B_HI) then
			REG_B(0 to 7) <= Z(0 to 7);
		end if;			
	end process;
	
	-- Process describing register C
	process (L_C)
	begin		
		-- Load Register C with Z
		if rising_edge(L_C) then
			REG_C <= Z;
		end if;											
	end process;
	
	-- Process describing register DP
	process (L_DP)
	begin		
		-- Load Register DP with Z
		if rising_edge(L_DP) then
			REG_DP <= Z;
		end if;											
	end process;
	
	-- Process describing register SP
	process (L_SP)
	begin		
		-- Load Register SP with Z
		if rising_edge(L_SP) then
			REG_SP <= Z;
		end if;											
	end process;
	
	-- Process describing register SSP
	process (L_SSP)
	begin		
		-- Load Register SSP with Z
		if rising_edge(L_SSP) then
			REG_SSP <= Z;
		end if;											
	end process;
	
	-- Process describing register PC
	process (L_PC)
	begin		
		-- Load Register PC with Z
		if rising_edge(L_PC) then
			REG_PC <= Z;
		end if;											
	end process;
	
	-- Process describing register TPC
	process (COMMIT)
	begin 		
		-- Load Register TPC with L (Itself)
		if rising_edge(COMMIT) then
			REG_TPC <= L;
		end if;					
	end process;
	
	-- Concatenate 
	SEL_REG <= EL_A & EL_B & EL_C & EL_DP & EL_SP & EL_SSP & EL_PC & EL_TPC;
	
	-- The Xilinx sinthetizer does not allow a signal with multiples inputs, so
	-- we had to use a kind of multiplexer, it will be a little different from 
	-- the original implementation but will also be more secure.
	with SEL_REG select
	L <= REG_A   when "01111111",
		  REG_B   when "10111111",
		  REG_C   when "11011111",
		  REG_DP  when "11101111",
		  REG_SP  when "11110111",
		  REG_SSP when "11111011",
		  REG_PC  when "11111101",
		  REG_TPC when "11111110",
		  "ZZZZZZZZZZZZZZZZ" when others;
end Behavioral;

