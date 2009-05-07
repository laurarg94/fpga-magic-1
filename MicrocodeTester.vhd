--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:20:56 04/22/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/MicrocodeTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Microcode
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

 
ENTITY MicrocodeTester IS
END MicrocodeTester;
 
ARCHITECTURE behavior OF MicrocodeTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Microcode
    PORT(
         NEG_RESET : IN  std_logic;
         CLKM : IN  std_logic;
         INIT_INST : IN  std_logic;
         FAULT_PENDING : IN  std_logic;
         MSWC : IN  std_logic;
         MSWZ : IN  std_logic;
         MSWS : IN  std_logic;
         MSWV : IN  std_logic;
         NEG_DO_BRANCH : IN  std_logic;
         ENCODER : IN  std_logic_vector(0 to 3);
         DBUS : IN  std_logic_vector(0 to 7);
         NEG_DMA_ACK : IN  std_logic;
         NEG_FP_WRITE : IN  std_logic;
         IR : INOUT  std_logic_vector(0 to 7);
         NEXT_SIG : INOUT  std_logic_vector(0 to 7);
         NEG_NEXT0 : OUT  std_logic;
         R_RW : OUT  std_logic;
         NEG_E_MDR_HI : INOUT  std_logic;
         NEG_E_MDR_LO : INOUT  std_logic;
         LATCH : OUT  std_logic_vector(0 to 3);
         XL_MAR : OUT  std_logic;
         XL_MDR_LO : OUT  std_logic;
         XL_MDR_HI : OUT  std_logic;
         PRIV : OUT  std_logic;
         XL_MODE : OUT  std_logic;
         XL_PAGING : OUT  std_logic;
         MISC : OUT  std_logic_vector(0 to 3);
         EL : OUT  std_logic_vector(0 to 3);
         ER : OUT  std_logic_vector(0 to 1);
         RIMMVAL : OUT  std_logic_vector(0 to 1);
         ALUOP_SZ : OUT  std_logic;
         ALUOP : OUT  std_logic_vector(0 to 1);
         USE_CARRY : OUT  std_logic;
         LATCH_SZ : OUT  std_logic;
         RUSER_PTB : OUT  std_logic;
         CODE_PTB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NEG_RESET : std_logic := '1';
   signal CLKM : std_logic := '0';
   signal INIT_INST : std_logic := '0';
   signal FAULT_PENDING : std_logic := '0';
   signal MSWC : std_logic := '0';
   signal MSWZ : std_logic := '0';
   signal MSWS : std_logic := '0';
   signal MSWV : std_logic := '0';
   signal NEG_DO_BRANCH : std_logic := '1';
   signal ENCODER : std_logic_vector(0 to 3) := (others => '0');
   signal DBUS : std_logic_vector(0 to 7) := (others => '0');
   signal NEG_DMA_ACK : std_logic := '0';
   signal NEG_FP_WRITE : std_logic := '0';

	--BiDirs
   signal IR : std_logic_vector(0 to 7);
   signal NEXT_SIG : std_logic_vector(0 to 7);

 	--Outputs
   signal NEG_NEXT0 : std_logic;
   signal R_RW : std_logic;
   signal NEG_E_MDR_HI : std_logic;
   signal NEG_E_MDR_LO : std_logic;
   signal LATCH : std_logic_vector(0 to 3);
   signal XL_MAR : std_logic;
   signal XL_MDR_LO : std_logic;
   signal XL_MDR_HI : std_logic;
   signal PRIV : std_logic;
   signal XL_MODE : std_logic;
   signal XL_PAGING : std_logic;
   signal MISC : std_logic_vector(0 to 3);
   signal EL : std_logic_vector(0 to 3);
   signal ER : std_logic_vector(0 to 1);
   signal RIMMVAL : std_logic_vector(0 to 1);
   signal ALUOP_SZ : std_logic;
   signal ALUOP : std_logic_vector(0 to 1);
   signal USE_CARRY : std_logic;
   signal LATCH_SZ : std_logic;
   signal RUSER_PTB : std_logic;
   signal CODE_PTB : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Microcode PORT MAP (
          NEG_RESET => NEG_RESET,
          CLKM => CLKM,
          INIT_INST => INIT_INST,
          FAULT_PENDING => FAULT_PENDING,
          MSWC => MSWC,
          MSWZ => MSWZ,
          MSWS => MSWS,
          MSWV => MSWV,
          NEG_DO_BRANCH => NEG_DO_BRANCH,
          ENCODER => ENCODER,
          DBUS => DBUS,
          NEG_DMA_ACK => NEG_DMA_ACK,
          NEG_FP_WRITE => NEG_FP_WRITE,
          IR => IR,
          NEXT_SIG => NEXT_SIG,
          NEG_NEXT0 => NEG_NEXT0,
          R_RW => R_RW,
          NEG_E_MDR_HI => NEG_E_MDR_HI,
          NEG_E_MDR_LO => NEG_E_MDR_LO,
          LATCH => LATCH,
          XL_MAR => XL_MAR,
          XL_MDR_LO => XL_MDR_LO,
          XL_MDR_HI => XL_MDR_HI,
          PRIV => PRIV,
          XL_MODE => XL_MODE,
          XL_PAGING => XL_PAGING,
          MISC => MISC,
          EL => EL,
          ER => ER,
          RIMMVAL => RIMMVAL,
          ALUOP_SZ => ALUOP_SZ,
          ALUOP => ALUOP,
          USE_CARRY => USE_CARRY,
          LATCH_SZ => LATCH_SZ,
          RUSER_PTB => RUSER_PTB,
          CODE_PTB => CODE_PTB
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name    
 
   CLK_process :process
   begin		
		CLKM <= '0';
		wait for 100 ns;
		CLKM <= '1';
		wait for 100 ns;		
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
		wait for 1 ns;
		REPORT "Holding RESET state for a while" SEVERITY WARNING;
		NEG_RESET <= '0';		
		wait for 20 ns;
		NEG_RESET <= '1';
      wait for 10 ns;	      

      -- Entering Opcode (do_halt)
		REPORT "Entering OPCODE (do_halt) from DBUS" SEVERITY WARNING;
		DBUS <= "00000000";
		INIT_INST <= '1';		
		--wait for 1 ns;
		wait for 10 ns;

		INIT_INST <= '0';
		wait for 1000 ns;
		
		-- Entering Opcode (do_ld)
		REPORT "Entering OPCODE (do_ld) from DBUS" SEVERITY WARNING;
		DBUS <= "00000001";
		INIT_INST <= '1';		
		wait for 10 ns;
		
		INIT_INST <= '0';
		wait for 1000 ns;

		-- Entering Opcode (do_ld)
		REPORT "Entering OPCODE (do_ld) from DBUS" SEVERITY WARNING;
		DBUS <= "00000010";
		INIT_INST <= '1';		
		wait for 10 ns;
		
		INIT_INST <= '0';
		wait for 1000 ns;
		
      wait;
   end process;

END;
