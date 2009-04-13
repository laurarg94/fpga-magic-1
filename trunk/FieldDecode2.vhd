----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Leonardo Araujo dos Santos
-- 
-- Create Date:    19:51:40 04/12/2009 
-- Design Name:    Second part Field Decode from Magic-1
-- Module Name:    FieldDecode2 - Behavioral 
-- Project Name: 	 Magic-1 VHDL
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

entity FieldDecode2 is
    Port ( CLKS : in  STD_LOGIC;
           XL_MODE : in  STD_LOGIC;
           XL_PAGING : in  STD_LOGIC;
           XL_MDR_LO : in  STD_LOGIC;
           XL_MDR_HI : in  STD_LOGIC;
           XL_MAR : in  STD_LOGIC;
           R_RW : in  STD_LOGIC;
           RIMMVAL : in  STD_LOGIC_VECTOR (0 to 1);
           RL_PTB : in  STD_LOGIC;
           RL_FAULT : in  STD_LOGIC;
           FAULT_PENDING : in  STD_LOGIC;
           RCOMMIT : in  STD_LOGIC;
           RL_FPL : in  STD_LOGIC;
           RL_A_HI : in  STD_LOGIC;
           RL_B_HI : in  STD_LOGIC;
           RL_SSP : in  STD_LOGIC;
           RL_C : in  STD_LOGIC;
           RL_PC : in  STD_LOGIC;
           RL_DP : in  STD_LOGIC;
           RL_SP : in  STD_LOGIC;
           RL_A_LO : in  STD_LOGIC;
           RL_B_LO : in  STD_LOGIC;
           RL_MSW : in  STD_LOGIC;
           RL_IE : in  STD_LOGIC;
           R_L_PTE : in  STD_LOGIC;
           RL_MDR : in  STD_LOGIC;
           CLKS_NEG : out  STD_LOGIC;
           L_MODE : out  STD_LOGIC;
           L_PAGING : out  STD_LOGIC;
           L_MDR_LO : out  STD_LOGIC;
           L_MDR_HI : out  STD_LOGIC;
           L_MAR : out  STD_LOGIC;
           COMMIT : out  STD_LOGIC;
           L_FPL : out  STD_LOGIC;
           L_PTB : out  STD_LOGIC;
           L_A_HI : out  STD_LOGIC;
           L_B_HI : out  STD_LOGIC;
           L_SSP : out  STD_LOGIC;
           L_C : out  STD_LOGIC;
           L_PC : out  STD_LOGIC;
           L_DP : out  STD_LOGIC;
           L_SP : out  STD_LOGIC;
           L_A_LO : out  STD_LOGIC;
           L_B_LO : out  STD_LOGIC;
           L_MSW : out  STD_LOGIC;
           L_IE : out  STD_LOGIC;
           L_PTE : out  STD_LOGIC;
           WR : out  STD_LOGIC;
           L_FAULT : out  STD_LOGIC;
           RW : out  STD_LOGIC;
           IMMVAL : out  STD_LOGIC_VECTOR (0 to 1));
end FieldDecode2;

architecture Behavioral of FieldDecode2 is

begin
	CLKS_NEG <= not CLKS;
	
	L_MODE <= XL_MODE and CLKS;
	
	L_PAGING <= XL_PAGING and CLKS;
	
	L_MDR_LO <= RL_MDR or (XL_MDR_LO and CLKS);
	
	L_MDR_HI <= RL_MDR or (XL_MDR_HI and CLKS);
	
	L_MAR <= FAULT_PENDING nor (XL_MAR nand CLKS);
	
	COMMIT <= RCOMMIT;
	
	L_FPL <= RL_FPL;
	
	L_A_HI <= RL_A_HI;
	
	L_B_HI <= RL_B_HI;
	
	L_SSP <= RL_SSP;
	
	L_C <= RL_C;
	
	L_PC <= RL_PC;
	
	L_DP <= RL_DP;
	
	L_SP <= RL_SP;
	
	L_A_LO <= RL_A_LO;
	
	L_B_LO <= RL_B_LO;
	
	L_MSW <= RL_MSW;
	
	L_IE <= RL_IE;
	
	L_PTE <= R_L_PTE;
	
	L_PTB <= RL_PTB;
	
	L_FAULT <= RL_FAULT;
	
	WR <= FAULT_PENDING or (R_RW nand CLKS);
	
	RW <= R_RW;
	
	IMMVAL <= RIMMVAL;

end Behavioral;

