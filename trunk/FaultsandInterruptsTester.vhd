--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:34:50 04/13/2009
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
 
ENTITY FaultsandInterruptsTester IS
END FaultsandInterruptsTester;
 
ARCHITECTURE behavior OF FaultsandInterruptsTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FaultsandInterrupts
    PORT(
         RESET : IN  std_logic;
         IRQ0 : IN  std_logic;
         IRQ1 : IN  std_logic;
         IRQ2 : IN  std_logic;
         IRQ3 : IN  std_logic;
         IRQ4 : IN  std_logic;
         IRQ5 : IN  std_logic;
         EL_FCODE : IN  std_logic;
         MSWM : IN  std_logic;
         PRIV : IN  std_logic;
         MSWV : IN  std_logic;
         TRAPO : IN  std_logic;
         CLKM : IN  std_logic;
         DMA_REQ : IN  std_logic;
         MSWE : IN  std_logic;
         NP : IN  std_logic;
         NW : IN  std_logic;
         BKPT : IN  std_logic;
         SYSCALL : IN  std_logic;
         IOCLK : IN  std_logic;
         NEXT0 : IN  std_logic;
         CLKS : IN  std_logic;
         CLR_TRAP : IN  std_logic;
         L : OUT  std_logic_vector(0 to 15);
         RL_FAULT : OUT  std_logic;
         ENCODER : OUT  std_logic_vector(0 to 3);
         FAULT_PENDING : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal IRQ0 : std_logic := '0';
   signal IRQ1 : std_logic := '0';
   signal IRQ2 : std_logic := '0';
   signal IRQ3 : std_logic := '0';
   signal IRQ4 : std_logic := '0';
   signal IRQ5 : std_logic := '0';
   signal EL_FCODE : std_logic := '0';
   signal MSWM : std_logic := '0';
   signal PRIV : std_logic := '0';
   signal MSWV : std_logic := '0';
   signal TRAPO : std_logic := '0';
   signal CLKM : std_logic := '0';
   signal DMA_REQ : std_logic := '0';
   signal MSWE : std_logic := '0';
   signal NP : std_logic := '0';
   signal NW : std_logic := '0';
   signal BKPT : std_logic := '0';
   signal SYSCALL : std_logic := '0';
   signal IOCLK : std_logic := '0';
   signal NEXT0 : std_logic := '0';
   signal CLKS : std_logic := '0';
   signal CLR_TRAP : std_logic := '0';

 	--Outputs
   signal L : std_logic_vector(0 to 15);
   signal RL_FAULT : std_logic;
   signal ENCODER : std_logic_vector(0 to 3);
   signal FAULT_PENDING : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FaultsandInterrupts PORT MAP (
          RESET => RESET,
          IRQ0 => IRQ0,
          IRQ1 => IRQ1,
          IRQ2 => IRQ2,
          IRQ3 => IRQ3,
          IRQ4 => IRQ4,
          IRQ5 => IRQ5,
          EL_FCODE => EL_FCODE,
          MSWM => MSWM,
          PRIV => PRIV,
          MSWV => MSWV,
          TRAPO => TRAPO,
          CLKM => CLKM,
          DMA_REQ => DMA_REQ,
          MSWE => MSWE,
          NP => NP,
          NW => NW,
          BKPT => BKPT,
          SYSCALL => SYSCALL,
          IOCLK => IOCLK,
          NEXT0 => NEXT0,
          CLKS => CLKS,
          CLR_TRAP => CLR_TRAP,
          L => L,
          RL_FAULT => RL_FAULT,
          ENCODER => ENCODER,
          FAULT_PENDING => FAULT_PENDING
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period := 1ns;
 
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
