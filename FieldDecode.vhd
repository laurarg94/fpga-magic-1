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
           RL_FPL : out  STD_LOGIC;
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
           NEG_DMA_ACK : inout  STD_LOGIC;
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

signal EncoderAddress,EncoderAddressU30U31,EncoderAddressU26U27 : std_logic_vector(0 to 2);
signal EncoderOutputU33,EncoderOutputU32,EncoderOutputU30,EncoderOutputU31 : std_logic_vector(0 to 7);
signal EncoderOutputU26,EncoderOutputU27,InverterTristateBufferOutput : std_logic_vector(0 to 7);
signal U37Output,U34Output,U36Output : std_logic_vector(0 to 3);
signal U35Output,U26G2AInput : std_logic;

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
	
	-- Decode IR signals
	-- Describe U37 74157 quad 2 to 1 Mux
	process (EL,IR(6 to 7))
	begin
		-- A NAND port output is 0 if all inputs are high
		if EL = "1111" then
			-- Select is low ... select A Channel (4+IR(6..7))
			U37Output <= "01" & IR(6) & IR(7); 
		else
			-- Select is high ... select B Channel (pass EL) (MAR,MSW,C,PC,DP,SP,A,B,MDR,PTB,SSP,TPC)
			U37Output <= EL;
		end if;
	end process;
	
	-- Describe U34 74157 quad 2 to 1 Mux
	process (U37Output,FP_L,NEG_STOP_CLK,NEG_DMA_ACK)
	begin
		if NEG_STOP_CLK = '1' and NEG_DMA_ACK = '1' then
			-- Select is low ... select A Channel
			U34Output <= U37Output;
		else
			-- Select is high ... select B Channel
			U34Output <= FP_L;
		end if;
	end process;
	
	-- Describe U35 7485 Comparator
	process (FP_L,U34Output)
	begin
		if FP_L = U34Output then
			U35Output <= '1';
		else
			U35Output <= '0';
		end if;
	end process;
	
	-- RL_FPL Output description
	RL_FPL <= (NEG_CLKS and U35Output) or (FP_L(0) and FP_L(3) and (FP_L(1) nor FP_L(2)));
	
	-- Describe U30 and U31 encoder/demultiplexer behavior handling the MISC signals
	-- the U34Output(0) input will enable/disable U30 or U31
	EncoderAddressU30U31 <= U34Output(1 to 3);
	U30: EncoderDemux port map(U34Output(0),'0','0',EncoderAddressU30U31,EncoderOutputU30);
	U31: EncoderDemux port map('1',U34Output(0),'0',EncoderAddressU30U31,EncoderOutputU31);	
	
	NEG_EL_MAR <= EncoderOutputU31(7);
	NEG_EL_MSW <= EncoderOutputU31(6);
	NEG_EL_C   <= EncoderOutputU31(5);
	NEG_EL_PC  <= EncoderOutputU31(4);
	NEG_EL_DP  <= EncoderOutputU31(3);
	NEG_EL_SP  <= EncoderOutputU31(2);
	NEG_EL_A   <= EncoderOutputU31(1);
	NEG_EL_B   <= EncoderOutputU31(0);
	
	NEG_EL_MDR <= EncoderOutputU30(7);
	NEG_EL_SSP <= EncoderOutputU30(5);
	NEG_EL_TPC <= EncoderOutputU30(4);
	NEG_EL_FCODE <= EncoderOutputU30(3);
	
	-- Use IR/Latch bits to select some registers
	-- Describe U36 74157 quad 2 to 1 Mux
	process(IR(5 to 7),LATCH)
	begin
		-- A NAND port output is 0 if all inputs are high
		if LATCH = "1111" then
			-- Select is low ... select A Channel "0 & IR(5..7)"
			U36Output <= '0' & IR(5 to 7);
		else
			-- Select is high ... select B Channel "LATCH"
			U36Output <= LATCH;
		end if;
	end process;
	
	-- Describe U26 and U27 encoder/demultiplexer behavior handling the IR and LATCH signals
	-- the CLKS and FAULT_PENDING input will enable/disable U26 or U27
	EncoderAddressU26U27 <= U34Output(1 to 3);
	U26G2AInput <= not U36Output(0);
	U26: EncoderDemux port map(CLKS,FAULT_PENDING,U26G2AInput,EncoderAddressU26U27,EncoderOutputU26);
	U27: EncoderDemux port map(CLKS,FAULT_PENDING,U36Output(0),EncoderAddressU26U27,EncoderOutputU27);	
	
	-- U29 TristateBuffer 74F240 will just invert signals in this case.
	InverterTristateBufferOutput <= not EncoderOutputU27;
	
	RL_C    <= InverterTristateBufferOutput(2);
	RL_PC   <= InverterTristateBufferOutput(3);
	RL_DP   <= InverterTristateBufferOutput(4);
	RL_SP   <= InverterTristateBufferOutput(5);
	RL_A_LO <= InverterTristateBufferOutput(6);
	RL_B_LO <= InverterTristateBufferOutput(7);
	
	RL_A_HI <= InverterTristateBufferOutput(6) and LATCH_SZ;
	RL_B_HI <= InverterTristateBufferOutput(7) and LATCH_SZ;
	
	RL_PTB <= not EncoderOutputU26(6);
	RL_MDR <= not EncoderOutputU26(7);
	
	RL_SSP <= InverterTristateBufferOutput(5) and (not MSWM);
	
	RL_MSW <= (not FAULT_PENDING) and (InverterTristateBufferOutput(1) or (NEG_CLKS nor EncoderOutputU33(1)));
	

end Behavioral;

