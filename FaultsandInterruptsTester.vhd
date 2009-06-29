--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:57:13 05/19/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/FaultsandInterruptsTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FaultsandInterrupts
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
 
ENTITY FaultsandInterruptsTester IS
END FaultsandInterruptsTester;
 
ARCHITECTURE behavior OF FaultsandInterruptsTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FaultsandInterrupts
    PORT(
         NEG_RESET : IN  std_logic;
         NEG_IRQ0 : IN  std_logic;
         NEG_IRQ1 : IN  std_logic;
         NEG_IRQ2 : IN  std_logic;
         NEG_IRQ3 : IN  std_logic;
         NEG_IRQ4 : IN  std_logic;
         NEG_IRQ5 : IN  std_logic;
         NEG_EL_FCODE : IN  std_logic;
         MSWM : IN  std_logic;
         PRIV : IN  std_logic;
         MSWV : IN  std_logic;
         NEG_TRAPO : IN  std_logic;
         CLKM : IN  std_logic;
         NEG_DMA_REQ : IN  std_logic;
         MSWE : IN  std_logic;
         NEG_NP : IN  std_logic;
         NEG_NW : IN  std_logic;
         NEG_BKPT : IN  std_logic;
         NEG_SYSCALL : IN  std_logic;
         IOCLK : IN  std_logic;
         NEG_NEXT0 : IN  std_logic;
         CLKS : IN  std_logic;
         NEG_CLR_TRAP : IN  std_logic;
         L : OUT  std_logic_vector(0 to 15);
         RL_FAULT : INOUT  std_logic;
         ENCODER : INOUT  std_logic_vector(0 to 3);
         FAULT_PENDING : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NEG_RESET : std_logic := '1';
   signal NEG_IRQ0 : std_logic := '1';
   signal NEG_IRQ1 : std_logic := '1';
   signal NEG_IRQ2 : std_logic := '1';
   signal NEG_IRQ3 : std_logic := '1';
   signal NEG_IRQ4 : std_logic := '1';
   signal NEG_IRQ5 : std_logic := '1';
   signal NEG_EL_FCODE : std_logic := '1';
   signal MSWM : std_logic := '0';
   signal PRIV : std_logic := '0';
   signal MSWV : std_logic := '0';
   signal NEG_TRAPO : std_logic := '1';
   signal CLKM : std_logic := '0';
   signal NEG_DMA_REQ : std_logic := '1';
   signal MSWE : std_logic := '0';
   signal NEG_NP : std_logic := '1';
   signal NEG_NW : std_logic := '1';
   signal NEG_BKPT : std_logic := '1';
   signal NEG_SYSCALL : std_logic := '1';
   signal IOCLK : std_logic := '0';
   signal NEG_NEXT0 : std_logic := '1';
   signal CLKS : std_logic := '0';
   signal NEG_CLR_TRAP : std_logic := '1';

	--BiDirs
   signal RL_FAULT : std_logic;
   signal ENCODER : std_logic_vector(0 to 3);
   signal FAULT_PENDING : std_logic;

 	--Outputs
   signal L : std_logic_vector(0 to 15);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FaultsandInterrupts PORT MAP (
          NEG_RESET => NEG_RESET,
          NEG_IRQ0 => NEG_IRQ0,
          NEG_IRQ1 => NEG_IRQ1,
          NEG_IRQ2 => NEG_IRQ2,
          NEG_IRQ3 => NEG_IRQ3,
          NEG_IRQ4 => NEG_IRQ4,
          NEG_IRQ5 => NEG_IRQ5,
          NEG_EL_FCODE => NEG_EL_FCODE,
          MSWM => MSWM,
          PRIV => PRIV,
          MSWV => MSWV,
          NEG_TRAPO => NEG_TRAPO,
          CLKM => CLKM,
          NEG_DMA_REQ => NEG_DMA_REQ,
          MSWE => MSWE,
          NEG_NP => NEG_NP,
          NEG_NW => NEG_NW,
          NEG_BKPT => NEG_BKPT,
          NEG_SYSCALL => NEG_SYSCALL,
          IOCLK => IOCLK,
          NEG_NEXT0 => NEG_NEXT0,
          CLKS => CLKS,
          NEG_CLR_TRAP => NEG_CLR_TRAP,
          L => L,
          RL_FAULT => RL_FAULT,
          ENCODER => ENCODER,
          FAULT_PENDING => FAULT_PENDING
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name    
 
   CLKS_process :process
   begin
		CLKS <= '0';
		wait for 2 ns;
		CLKS <= '1';
		wait for 2 ns;
   end process;
	
	CLKM_process :process
   begin
		CLKM <= '0';
		wait for 5 ns;
		CLKM <= '1';
		wait for 5 ns;
   end process;
	
	IOCLK_process :process
   begin
		IOCLK <= '0';
		wait for 8 ns;
		IOCLK <= '1';
		wait for 8 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
		NEG_RESET <= '0';
      wait for 10 ns;	

      NEG_RESET <= '1';
		wait for 20 ns;		

      REPORT "Testing Interrupts..." SEVERITY WARNING;		
				
		
		-- Interrupt on IRQ_4		
		MSWE <= '1';			-- Signals to propagate one interrupt		
		NEG_EL_FCODE <= '0'; -- Signal to enable L BUS with Interrupt or fault
		NEG_NEXT0 <= '0';		-- Latch Interrupt into U56
		NEG_IRQ4 <= '0';		-- Interrupt line 5
		wait for 20 ns;
		
		NEG_IRQ4 <= '1';
		wait for 20 ns;
		
		-- Clear Interrupts		
		MSWE <= '0';				
		NEG_EL_FCODE <= '1';
		NEG_NEXT0 <= '1';
		wait for 30 ns;
				
		

      wait;
   end process;

END;
