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
			  LATCH_SZ : in STD_LOGIC;
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
			  NEG_DO_RSHIFT : out STD_LOGIC;
			  NEG_DO_BRANCH : out STD_LOGIC;
           NEG_SYSCALL : out  STD_LOGIC;
           NEG_HALT : out  STD_LOGIC;
           NEG_BKPT : out  STD_LOGIC;
           NEG_TRAPO : out  STD_LOGIC;
           NEG_E_PTE : out  STD_LOGIC;
           NEG_SET_FLAGS : out  STD_LOGIC);
end FieldDecode;

architecture Behavioral of FieldDecode is

component EncoderDemux is
    Port ( E3 : in  STD_LOGIC;
           E2 : in  STD_LOGIC;
           E1 : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (2 downto 0);  -- A2,A1,A0
           Output : out  STD_LOGIC_VECTOR (7 downto 0)); -- O7,O6,O5,O4,O3,O2,O1,O0
end component;

signal EncoderAddress : std_logic_vector(0 to 2);
signal EncoderOutputU33,EncoderOutputU32 : std_logic_vector(0 to 7);

begin
	NEG_ER_MDR <= ER(1);
	NEG_ER_IMM <= not ER(1);
	
	-- Describe U32 and U33 encoder/demultiplexer behavior handling the MISC signals
	-- the MISC(0) input will enable/disable U33 or U32
	EncoderAddress <= MISC(1 to 3);
	U33: EncoderDemux port map('1',MISC(0),'0',EncoderAddress,EncoderOutputU33);
	U32: EncoderDemux port map(MISC(0),'0','0',EncoderAddress,EncoderOutputU32);
	
	-- Signals from U33
	NEG_SYSCALL <= EncoderOutputU33(6);
	NEG_HALT <= EncoderOutputU33(5);
	NEG_BKPT <= EncoderOutputU33(4);
	NEG_TRAPO <= EncoderOutputU33(3);
	NEG_E_PTE <= EncoderOutputU33(2);
	NEG_SET_FLAGS <= EncoderOutputU33(1);
	XINIT_INST <= not EncoderOutputU33(0);
	R_L_PTE <= EncoderOutputU33(2) or NEG_CLKS;
	INIT_INST <= EncoderOutputU33(0) nor NEG_CLKS;
	
	-- Signals from U32
	NEG_DO_RSHIFT <= EncoderOutputU32(7);
	NEG_DMA_ACK <= EncoderOutputU32(6);
	RL_IE <= EncoderOutputU32(5) nor NEG_CLKS;
	NEG_DO_BRANCH <= EncoderOutputU32(4);
	NEG_CLR_TRAP <= EncoderOutputU32(3) nor NEG_CLKS;

end Behavioral;

