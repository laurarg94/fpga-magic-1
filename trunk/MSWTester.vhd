--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:39 03/30/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/MSWTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MSW
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
 
ENTITY MSWTester IS
END MSWTester;
 
ARCHITECTURE behavior OF MSWTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MSW
    PORT(
         Z : IN  std_logic_vector(0 to 15);
         SET_FLAGS : IN  std_logic;
         ALUV : IN  std_logic;
         ALUS : IN  std_logic;
         ALUC : IN  std_logic;
         ALUZ : IN  std_logic;
         L_MSW : IN  std_logic;
         RESET : IN  std_logic;
         L_MODE : IN  std_logic;
         L_PAGING : IN  std_logic;
         L_FAULT : IN  std_logic;
         MEMREF : IN  std_logic;
         xCODE_PTB : IN  std_logic;
         L_EI : IN  std_logic;
         EL_MSW : IN  std_logic;
         MSWZ : OUT  std_logic;
         MSWC : OUT  std_logic;
         MSWS : OUT  std_logic;
         MSWV : OUT  std_logic;
         MSWM : OUT  std_logic;
         MSWE : OUT  std_logic;
         MSWP : OUT  std_logic;
         L : OUT  std_logic_vector(0 to 15)
        );
    END COMPONENT;
    

   --Inputs
   signal Z : std_logic_vector(0 to 15) := (others => '0');
   signal SET_FLAGS : std_logic := '0';
   signal ALUV : std_logic := '0';
   signal ALUS : std_logic := '0';
   signal ALUC : std_logic := '0';
   signal ALUZ : std_logic := '0';
   signal L_MSW : std_logic := '0';
   signal RESET : std_logic := '0';
   signal L_MODE : std_logic := '0';
   signal L_PAGING : std_logic := '0';
   signal L_FAULT : std_logic := '0';
   signal MEMREF : std_logic := '0';
   signal xCODE_PTB : std_logic := '0';
   signal L_EI : std_logic := '0';
   signal EL_MSW : std_logic := '0';

 	--Outputs
   signal MSWZ : std_logic;
   signal MSWC : std_logic;
   signal MSWS : std_logic;
   signal MSWV : std_logic;
   signal MSWM : std_logic;
   signal MSWE : std_logic;
   signal MSWP : std_logic;
   signal L : std_logic_vector(0 to 15);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MSW PORT MAP (
          Z => Z,
          SET_FLAGS => SET_FLAGS,
          ALUV => ALUV,
          ALUS => ALUS,
          ALUC => ALUC,
          ALUZ => ALUZ,
          L_MSW => L_MSW,
          RESET => RESET,
          L_MODE => L_MODE,
          L_PAGING => L_PAGING,
          L_FAULT => L_FAULT,
          MEMREF => MEMREF,
          xCODE_PTB => xCODE_PTB,
          L_EI => L_EI,
          EL_MSW => EL_MSW,
          MSWZ => MSWZ,
          MSWC => MSWC,
          MSWS => MSWS,
          MSWV => MSWV,
          MSWM => MSWM,
          MSWE => MSWE,
          MSWP => MSWP,
          L => L
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- RESET
		RESET <= '1';
		wait for 20 ns;
		
		-- Test ALU flags comming from line Z
		SET_FLAGS <= '1';	-- Select flags comming from Z		
		Z <= "UUUUUUUUUUUU1010";
		EL_MSW <= '1';
		L_MSW <= '1';		
      wait for 20 ns;	

      wait;
   end process;

END;
