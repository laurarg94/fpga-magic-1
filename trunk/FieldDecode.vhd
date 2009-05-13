----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:32:57 05/12/2009 
-- Design Name: 
-- Module Name:    FieldDecode - Behavioral 
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

entity FieldDecode is
    Port ( IR : in  STD_LOGIC_VECTOR (0 to 7);
           EL : in  STD_LOGIC_VECTOR (0 to 3);
           LATCH : in  STD_LOGIC_VECTOR (0 to 3);
           RL_FPL : in  STD_LOGIC;
           FP_L : in  STD_LOGIC_VECTOR (0 to 3);
           NEG_STOP_CLK : in  STD_LOGIC;
           RCOMMIT : in  STD_LOGIC;
           MISC : in  STD_LOGIC_VECTOR (0 to 3);
           CLKS : in  STD_LOGIC;
           FAULT_PENDING : in  STD_LOGIC;
           ER : in  STD_LOGIC_VECTOR (0 to 1);
           NEG_CLKS : in  STD_LOGIC;
           RL_MDR : out  STD_LOGIC;
           RL_PTB : out  STD_LOGIC;
           RL_A_HI : out  STD_LOGIC;
           RL_B_HI : out  STD_LOGIC;
           RL_SSP : out  STD_LOGIC;
           MSWM : in  STD_LOGIC;
           RL_C : out  STD_LOGIC;
           RL_PC : out  STD_LOGIC;
           RL_DP : out  STD_LOGIC;
           RL_SP : out  STD_LOGIC;
           RL_A_LO : out  STD_LOGIC;
           RL_B_LO : out  STD_LOGIC;
           NEG_ER_MDR : out  STD_LOGIC;
           NEG_ER_IMM : out  STD_LOGIC;
           NEG_EL_FCODE : out  STD_LOGIC;
           NEG_EL_TPC : out  STD_LOGIC;
           NEG_EL_SSP : out  STD_LOGIC;
           NEG_EL_MDR : out  STD_LOGIC;
           NEG_DMA_ACK : out  STD_LOGIC;
           RL_MSW : out  STD_LOGIC;
           NEG_EL_MAR : out  STD_LOGIC;
           NEG_EL_MSW : out  STD_LOGIC;
           NEG_EL_C : out  STD_LOGIC;
           NEG_EL_PC : out  STD_LOGIC;
           NEG_EL_DP : out  STD_LOGIC;
           NEG_EL_SP : out  STD_LOGIC;
           NEG_EL_A : out  STD_LOGIC;
           NEG_EL_B : out  STD_LOGIC;
           NEG_CLR_TRAP : out  STD_LOGIC;
           RL_IE : out  STD_LOGIC;
           R_L_PTE : out  STD_LOGIC;
           INIT_INST : out  STD_LOGIC;
           XINIT_INST : out  STD_LOGIC;
           NEG_SYSCALL : out  STD_LOGIC;
           NEG_HALT : out  STD_LOGIC;
           NEG_BKPT : out  STD_LOGIC;
           NEG_TRAPO : out  STD_LOGIC;
           NEG_E_PTE : out  STD_LOGIC;
           NEG_SET_FLAGS : out  STD_LOGIC);
end FieldDecode;

architecture Behavioral of FieldDecode is

begin
	NEG_ER_MDR <= ER(1);
	NEG_ER_IMM <= not ER(1);

end Behavioral;

