----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:22 03/30/2009 
-- Design Name: 
-- Module Name:    MSW - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MSW is
    Port ( Z : in  STD_LOGIC_VECTOR (0 to 15);
           SET_FLAGS : in  STD_LOGIC;
           ALUV : in  STD_LOGIC;
           ALUS : in  STD_LOGIC;
           ALUC : in  STD_LOGIC;
           ALUZ : in  STD_LOGIC;
           L_MSW : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           L_MODE : in  STD_LOGIC;
           L_PAGING : in  STD_LOGIC;
           L_FAULT : in  STD_LOGIC;
           MEMREF : in  STD_LOGIC;
           xCODE_PTB : in  STD_LOGIC;
           L_EI : in  STD_LOGIC;
           EL_MSW : in  STD_LOGIC;
           MSWZ : out  STD_LOGIC;
           MSWC : out  STD_LOGIC;
           MSWS : out  STD_LOGIC;
           MSWV : out  STD_LOGIC;
           MSWM : out  STD_LOGIC;
           MSWE : out  STD_LOGIC;
           MSWP : out  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (0 to 15));
end MSW;

architecture Behavioral of MSW is
signal MEMREF_AND_LFAULT : std_logic;
signal SIG_FLAGS : std_logic_vector(0 to 3);

-- Infer FLIP_FLOPD for holding flags
signal P_FLAG           : std_logic;
signal D_FLAG           : std_logic;
signal E_FLAG           : std_logic;
signal M_FLAG           : std_logic;
signal ARITHMETIC_FLAGS : std_logic_vector(0 to 3);
begin
	-- Process to describe P flag
	process (RESET,L_PAGING, Z(8))
	begin
		if RESET = '0' then
			P_FLAG <= '0';
		else
			if rising_edge(L_PAGING) then
				P_FLAG <= Z(8);
			end if;
		end if;
	end process;
	
	MEMREF_AND_LFAULT <= L_FAULT and MEMREF;
	
	-- Process to describe D flag
	process (L_MODE, MEMREF_AND_LFAULT, xCODE_PTB)
	begin
		if L_MODE = '1' then
			D_FLAG <= '0';
		else
			if rising_edge(MEMREF_AND_LFAULT) then
				D_FLAG <= xCODE_PTB;
			end if;
		end if;
	end process;
	
	-- Process to describe E flag
	process (RESET,L_EI, Z(9))
	begin
		if RESET = '0' then
			E_FLAG <= '0';
		else
			if rising_edge(L_EI) then
				E_FLAG <= Z(9);
			end if;
		end if;
	end process;
	
	-- Process to describe M flag
	process (RESET,L_MODE, Z(11))
	begin
		if RESET = '0' then
			M_FLAG <= '0';
		else
			if rising_edge(L_MODE) then
				M_FLAG <= Z(11);
			end if;
		end if;
	end process;
	
	-- Process to describe selection of flags comming from ALU, or Z (U27)
	process (SET_FLAGS,ALUZ,ALUC,ALUS,ALUV)
	begin
		if SET_FLAGS = '0' then
			SIG_FLAGS <= ALUZ & ALUC & ALUS & ALUV;
		else
			SIG_FLAGS <= Z(12 to 15);
		end if;
	end process;
	
	-- Process to describe flags holding in U26
	process (RESET,L_MSW,SIG_FLAGS)
	begin
		if RESET = '0' then
			ARITHMETIC_FLAGS <= (others => '0');
		else
			if rising_edge(L_MSW) then
				ARITHMETIC_FLAGS <= SIG_FLAGS;
			end if;
		end if;
	end process;
	
	-- Process to describe output selection arrange formed by 74F244 (U25 , U28)
	process (EL_MSW,P_FLAG,E_FLAG,D_FLAG,M_FLAG,ARITHMETIC_FLAGS)
	begin
		if EL_MSW = '1' then
			L <= (others => 'Z');
		else
			L(0 to 7) <= "00000000";
			
			L(8)  <= P_FLAG;
			L(9)  <= E_FLAG;
			L(10) <= D_FLAG;
			L(11) <= M_FLAG;
			L(12) <= ARITHMETIC_FLAGS(3);
			L(13) <= ARITHMETIC_FLAGS(2);
			L(14) <= ARITHMETIC_FLAGS(1);
			L(15) <= ARITHMETIC_FLAGS(0);
		end if;
	end process;
	
	-- Output signal Flags
	MSWZ <= ARITHMETIC_FLAGS(0);
	MSWC <= ARITHMETIC_FLAGS(1);
	MSWS <= ARITHMETIC_FLAGS(2);
	MSWV <= ARITHMETIC_FLAGS(3);
	
	MSWM <= M_FLAG;
	MSWE <= E_FLAG;
	MSWP <= P_FLAG;
	
	
end Behavioral;

