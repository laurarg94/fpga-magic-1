--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:52:27 04/04/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/MDRTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MDR
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
 
ENTITY MDRTester IS
END MDRTester;
 
ARCHITECTURE behavior OF MDRTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MDR
    PORT(
         DBUS : INOUT  std_logic_vector(0 to 7);
         RW : IN  std_logic;
         DMA_ACK : IN  std_logic;
         Z : IN  std_logic_vector(0 to 15);
         XL_MDR_HI : IN  std_logic;
         XL_MDR_LO : IN  std_logic;
         L_MDR_HI : IN  std_logic;
         L_MDR_LO : IN  std_logic;
         COMMIT : IN  std_logic;
         E_MDR_HI : IN  std_logic;
         E_MDR_LO : IN  std_logic;
         ER_MDR : IN  std_logic;
         EL_MDR : IN  std_logic;
         R : OUT  std_logic_vector(0 to 15);
         L : OUT  std_logic_vector(0 to 15)
        );
    END COMPONENT;
    

   --Inputs
   signal RW : std_logic := '0';
   signal DMA_ACK : std_logic := '0';
   signal Z : std_logic_vector(0 to 15) := (others => '0');
   signal XL_MDR_HI : std_logic := '0';
   signal XL_MDR_LO : std_logic := '0';
   signal L_MDR_HI : std_logic := '0';
   signal L_MDR_LO : std_logic := '0';
   signal COMMIT : std_logic := '1';
   signal E_MDR_HI : std_logic := '1';
   signal E_MDR_LO : std_logic := '1';
   signal ER_MDR : std_logic := '1';
   signal EL_MDR : std_logic := '1';

	--BiDirs
   signal DBUS : std_logic_vector(0 to 7);

 	--Outputs
   signal R : std_logic_vector(0 to 15);
   signal L : std_logic_vector(0 to 15);   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MDR PORT MAP (
          DBUS => DBUS,
          RW => RW,
          DMA_ACK => DMA_ACK,
          Z => Z,
          XL_MDR_HI => XL_MDR_HI,
          XL_MDR_LO => XL_MDR_LO,
          L_MDR_HI => L_MDR_HI,
          L_MDR_LO => L_MDR_LO,
          COMMIT => COMMIT,
          E_MDR_HI => E_MDR_HI,
          E_MDR_LO => E_MDR_LO,
          ER_MDR => ER_MDR,
          EL_MDR => EL_MDR,
          R => R,
          L => L          
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- Loading value from DBUS
		COMMIT <= '0';
		DBUS <= "10010001";
		RW <= '0';
		Z <= "0000000011111111";
		DMA_ACK <= '1';		
		wait for 20 ns;
		
		-- Latch D into MDR HIGH and get results in R(High)
		--XL_MDR_LO <= '0';	
		XL_MDR_HI <= '1';
		L_MDR_HI <= '1'; -- Latch from D
		ER_MDR <= '0';	  -- Get output in R
		wait for 20 ns;
		
		-- Latch Z(8..15) into MDR LOW and get results in R(LOW)
		XL_MDR_LO <= '0';			
		L_MDR_LO <= '1'; -- Latch from Z		
		wait for 20 ns;
		
		-- Get output in L also
		EL_MDR <= '0';
		wait for 20 ns;
		
		-- Clean MDR with commit signal
		COMMIT <= '1';
		DBUS <= (others => 'Z');
		wait for 2 ns;
		COMMIT <= '0';
		L_MDR_LO <= '0';
		L_MDR_HI <= '0';
		wait for 20 ns;
		
		-- Relase line R and L
		EL_MDR <= '1';
		ER_MDR <= '1';
		wait for 20 ns;
		
		-- Load MDR with Z
		Z <= "1010101001000001";
		XL_MDR_LO <= '0';			
		XL_MDR_HI <= '0';
		L_MDR_LO <= '1'; -- Latch from Z		
		L_MDR_HI <= '1'; -- Latch from Z
		wait for 20 ns;
		
		-- Relase line R and L
		EL_MDR <= '0';
		ER_MDR <= '0';
		wait for 20 ns;
		
		-- Now read the result(high) in DBUS
		E_MDR_HI <= '0';
		E_MDR_LO <= '1';
		RW <= '1';
		wait for 20 ns;
		
		-- Now read the result(low) in DBUS
		E_MDR_HI <= '1';
		E_MDR_LO <= '0';
		RW <= '1';
		wait for 20 ns;
		
		
      wait;
   end process;

END;
