--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:03:57 05/13/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/FieldDecodeTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FieldDecode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
 
ENTITY FieldDecodeTester IS
END FieldDecodeTester;
 
ARCHITECTURE behavior OF FieldDecodeTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FieldDecode
    PORT(
         IR : IN  std_logic_vector(0 to 7);
         EL : IN  std_logic_vector(0 to 3);
         LATCH : IN  std_logic_vector(0 to 3);
         RL_FPL : OUT  std_logic;
         FP_L : IN  std_logic_vector(0 to 3);
         NEG_STOP_CLK : IN  std_logic;
         RCOMMIT : IN  std_logic;
         MISC : IN  std_logic_vector(0 to 3);
         CLKS : IN  std_logic;
         FAULT_PENDING : IN  std_logic;
         ER : IN  std_logic_vector(0 to 1);
         NEG_CLKS : IN  std_logic;
         RL_MDR : OUT  std_logic;
         RL_PTB : OUT  std_logic;
         RL_A_HI : OUT  std_logic;
         RL_B_HI : OUT  std_logic;
         RL_SSP : OUT  std_logic;
         MSWM : IN  std_logic;
         LATCH_SZ : IN  std_logic;
         RL_C : OUT  std_logic;
         RL_PC : OUT  std_logic;
         RL_DP : OUT  std_logic;
         RL_SP : OUT  std_logic;
         RL_A_LO : OUT  std_logic;
         RL_B_LO : OUT  std_logic;
         NEG_ER_MDR : OUT  std_logic;
         NEG_ER_IMM : OUT  std_logic;
         NEG_EL_FCODE : OUT  std_logic;
         NEG_EL_TPC : OUT  std_logic;
         NEG_EL_SSP : OUT  std_logic;
         NEG_EL_MDR : OUT  std_logic;
         NEG_DMA_ACK : inout  std_logic;
         RL_MSW : OUT  std_logic;
         NEG_EL_MAR : OUT  std_logic;
         NEG_EL_MSW : OUT  std_logic;
         NEG_EL_C : OUT  std_logic;
         NEG_EL_PC : OUT  std_logic;
         NEG_EL_DP : OUT  std_logic;
         NEG_EL_SP : OUT  std_logic;
         NEG_EL_A : OUT  std_logic;
         NEG_EL_B : OUT  std_logic;
         NEG_CLR_TRAP : OUT  std_logic;
         RL_IE : OUT  std_logic;
         R_L_PTE : OUT  std_logic;
         INIT_INST : OUT  std_logic;
         XINIT_INST : OUT  std_logic;
         NEG_DO_RSHIFT : OUT  std_logic;
         NEG_DO_BRANCH : OUT  std_logic;
         NEG_SYSCALL : OUT  std_logic;
         NEG_HALT : OUT  std_logic;
         NEG_BKPT : OUT  std_logic;
         NEG_TRAPO : OUT  std_logic;
         NEG_E_PTE : OUT  std_logic;
         NEG_SET_FLAGS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(0 to 7) := (others => '0');
   signal EL : std_logic_vector(0 to 3) := (others => 'U');
   signal LATCH : std_logic_vector(0 to 3) := (others => 'U');
   signal RL_FPL : std_logic := '0';
   signal FP_L : std_logic_vector(0 to 3) := (others => '0');
   signal NEG_STOP_CLK : std_logic := '1';
   signal RCOMMIT : std_logic := '0';
   signal MISC : std_logic_vector(0 to 3) := (others => 'X');
   signal CLKS : std_logic := '1';
   signal FAULT_PENDING : std_logic := '0';
   signal ER : std_logic_vector(0 to 1) := (others => '0');
   signal NEG_CLKS : std_logic := '0';
   signal MSWM : std_logic := '0';
   signal LATCH_SZ : std_logic := '0';

 	--Outputs
   signal RL_MDR : std_logic;
   signal RL_PTB : std_logic;
   signal RL_A_HI : std_logic;
   signal RL_B_HI : std_logic;
   signal RL_SSP : std_logic;
   signal RL_C : std_logic;
   signal RL_PC : std_logic;
   signal RL_DP : std_logic;
   signal RL_SP : std_logic;
   signal RL_A_LO : std_logic;
   signal RL_B_LO : std_logic;
   signal NEG_ER_MDR : std_logic;
   signal NEG_ER_IMM : std_logic;
   signal NEG_EL_FCODE : std_logic;
   signal NEG_EL_TPC : std_logic;
   signal NEG_EL_SSP : std_logic;
   signal NEG_EL_MDR : std_logic;
   signal NEG_DMA_ACK : std_logic;
   signal RL_MSW : std_logic;
   signal NEG_EL_MAR : std_logic;
   signal NEG_EL_MSW : std_logic;
   signal NEG_EL_C : std_logic;
   signal NEG_EL_PC : std_logic;
   signal NEG_EL_DP : std_logic;
   signal NEG_EL_SP : std_logic;
   signal NEG_EL_A : std_logic;
   signal NEG_EL_B : std_logic;
   signal NEG_CLR_TRAP : std_logic;
   signal RL_IE : std_logic;
   signal R_L_PTE : std_logic;
   signal INIT_INST : std_logic;
   signal XINIT_INST : std_logic;
   signal NEG_DO_RSHIFT : std_logic;
   signal NEG_DO_BRANCH : std_logic;
   signal NEG_SYSCALL : std_logic;
   signal NEG_HALT : std_logic;
   signal NEG_BKPT : std_logic;
   signal NEG_TRAPO : std_logic;
   signal NEG_E_PTE : std_logic;
   signal NEG_SET_FLAGS : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FieldDecode PORT MAP (
          IR => IR,
          EL => EL,
          LATCH => LATCH,
          RL_FPL => RL_FPL,
          FP_L => FP_L,
          NEG_STOP_CLK => NEG_STOP_CLK,
          RCOMMIT => RCOMMIT,
          MISC => MISC,
          CLKS => CLKS,
          FAULT_PENDING => FAULT_PENDING,
          ER => ER,
          NEG_CLKS => NEG_CLKS,
          RL_MDR => RL_MDR,
          RL_PTB => RL_PTB,
          RL_A_HI => RL_A_HI,
          RL_B_HI => RL_B_HI,
          RL_SSP => RL_SSP,
          MSWM => MSWM,
          LATCH_SZ => LATCH_SZ,
          RL_C => RL_C,
          RL_PC => RL_PC,
          RL_DP => RL_DP,
          RL_SP => RL_SP,
          RL_A_LO => RL_A_LO,
          RL_B_LO => RL_B_LO,
          NEG_ER_MDR => NEG_ER_MDR,
          NEG_ER_IMM => NEG_ER_IMM,
          NEG_EL_FCODE => NEG_EL_FCODE,
          NEG_EL_TPC => NEG_EL_TPC,
          NEG_EL_SSP => NEG_EL_SSP,
          NEG_EL_MDR => NEG_EL_MDR,
          NEG_DMA_ACK => NEG_DMA_ACK,
          RL_MSW => RL_MSW,
          NEG_EL_MAR => NEG_EL_MAR,
          NEG_EL_MSW => NEG_EL_MSW,
          NEG_EL_C => NEG_EL_C,
          NEG_EL_PC => NEG_EL_PC,
          NEG_EL_DP => NEG_EL_DP,
          NEG_EL_SP => NEG_EL_SP,
          NEG_EL_A => NEG_EL_A,
          NEG_EL_B => NEG_EL_B,
          NEG_CLR_TRAP => NEG_CLR_TRAP,
          RL_IE => RL_IE,
          R_L_PTE => R_L_PTE,
          INIT_INST => INIT_INST,
          XINIT_INST => XINIT_INST,
          NEG_DO_RSHIFT => NEG_DO_RSHIFT,
          NEG_DO_BRANCH => NEG_DO_BRANCH,
          NEG_SYSCALL => NEG_SYSCALL,
          NEG_HALT => NEG_HALT,
          NEG_BKPT => NEG_BKPT,
          NEG_TRAPO => NEG_TRAPO,
          NEG_E_PTE => NEG_E_PTE,
          NEG_SET_FLAGS => NEG_SET_FLAGS
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
    
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      wait for 10 ns;

		-- Test MISC(Controls Signals)
		REPORT "Test MISC(Controls Signals)" SEVERITY WARNING;
		REPORT "None" SEVERITY WARNING;
		MISC <= x"0";	-- None
		wait for 10 ns;
		
		REPORT "Halt" SEVERITY WARNING;
		MISC <= x"2";	-- Halt
		wait for 10 ns;
		
		REPORT "Trap on Overflow" SEVERITY WARNING;
		MISC <= x"4";	-- Trap on Overflow
		wait for 10 ns;
		
		REPORT "Latch PTE" SEVERITY WARNING;
		MISC <= x"5";	-- Latch PTE
		wait for 10 ns;
		
		REPORT "Set Flags from alu op" SEVERITY WARNING;
		MISC <= x"6";	-- Set Flags from alu op
		wait for 10 ns;
     
	   REPORT "Init Inst (clear MDR, PC->TPC, latch IR)" SEVERITY WARNING;
		MISC <= x"7";	-- Init Inst (clear MDR, PC->TPC, latch IR)
		wait for 10 ns;
		
		REPORT "Right shift alu output" SEVERITY WARNING;
		MISC <= x"8";	-- Right shift alu output
		wait for 10 ns;
		
		REPORT "DMA Ack" SEVERITY WARNING;
		MISC <= x"9";	-- DMA Ack
		wait for 10 ns;
		
		REPORT "Latch MSW (Interrupt Enable)" SEVERITY WARNING;
		MISC <= x"A";	-- Latch MSW (Interrupt Enable)
		wait for 10 ns;
		
		REPORT "Do Branch" SEVERITY WARNING;
		MISC <= x"B";	-- Do Branch
		wait for 10 ns;
		
		REPORT "Latch MSW (In trap)" SEVERITY WARNING;
		MISC <= x"C";	-- Latch MSW (In trap)
		wait for 10 ns;
		
		REPORT "Commit state" SEVERITY WARNING;
		MISC <= x"D";	-- Commit state
		wait for 10 ns;
		
		REPORT "Test EL (Enable L Bus)" SEVERITY WARNING;
		EL <= x"0";	-- MAR
		wait for 10 ns;
		
		EL <= x"1";	-- MSW
		wait for 10 ns;
		
		EL <= x"2"; -- C
		wait for 10 ns;
		
		EL <= x"3"; -- PC
		wait for 10 ns;
		
		EL <= x"4"; -- DP
		wait for 10 ns;
		
		EL <= x"5"; -- SP
		wait for 10 ns;
		
		EL <= x"6"; -- A
		wait for 10 ns;
		
		EL <= x"7"; -- B
		wait for 10 ns;
		
		EL <= x"8"; -- MDR
		wait for 10 ns;
		
		EL <= x"9"; -- PTB
		wait for 10 ns;
		
		EL <= x"A"; -- SSP
		wait for 10 ns;
		
		EL <= x"B"; -- TPC
		wait for 10 ns;
		
		EL <= x"F"; -- (4 + IR(6..7))
		IR <= (others => '1');
		wait for 10 ns;
		
		-- Test LATCH(Register latch signal)
		REPORT "Test LATCH(Controls Signals witch gets the value of some registers)" SEVERITY WARNING;
		LATCH_SZ <= '1';
		IR <= (others => 'U');
		
		LATCH <= x"0";	-- None
		wait for 10 ns;
		
		LATCH <= x"1"; -- Select MSW
		wait for 10 ns;
		
		LATCH <= x"2"; -- Select C
		wait for 10 ns;
		
		LATCH <= x"3"; -- Select PC
		wait for 10 ns;
		
		LATCH <= x"4"; -- Select DP
		wait for 10 ns;
		
		LATCH <= x"5"; -- Select SP
		wait for 10 ns;
		
		LATCH <= x"6"; -- Select A
		wait for 10 ns;
		
		LATCH <= x"7"; -- Select B
		wait for 10 ns;
		
		LATCH <= x"8"; -- Select MDR from Z
		wait for 10 ns;
		
		LATCH <= x"9"; -- Select PTB
		wait for 10 ns;
		
		LATCH <= x"A"; -- A low placeholder
		wait for 10 ns;
		
		LATCH <= x"B"; -- A high placeholder
		wait for 10 ns;
		
		LATCH <= x"C"; -- B low placeholder
		wait for 10 ns;
		
		LATCH <= x"D"; -- C low placeholder
		wait for 10 ns;
		
		LATCH <= x"E"; -- SSP placeholder
		wait for 10 ns;
		
		IR <= x"00";	-- x"00" indicate 8 bits
		wait for 1 ns;
		LATCH <= x"F"; -- IR_REG (IR(5..7))		
		wait for 10 ns;
		
		-- Select MSW by IR
		IR <= x"01";
		wait for 10 ns;
		
		-- Select C by IR
		IR <= x"02";
		wait for 10 ns;
		
		-- Select PC by IR
		IR <= x"03";
		wait for 10 ns;
		
		-- Select DP by IR
		IR <= x"04";
		wait for 10 ns;
		
		-- Select SP by IR
		IR <= x"05";
		wait for 10 ns;
		
		-- Select A by IR
		IR <= x"06";
		wait for 10 ns;
		
		-- Select B by IR
		IR <= x"07";
		wait for 10 ns;		
		
		-- Select B by IR
		IR <= (others => 'U');
		LATCH_SZ <= '0';
		wait for 10 ns;
			
      wait;
   end process;

END;
