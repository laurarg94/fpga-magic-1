--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:07 03/27/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/SpecialRegisterTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SpecialRegisters
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
 
ENTITY SpecialRegisterTester IS
END SpecialRegisterTester;
 
ARCHITECTURE behavior OF SpecialRegisterTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SpecialRegisters
    PORT(
         IMMVAL : IN  std_logic_vector(0 to 1);
         ER_IMM : IN  std_logic;
         R : OUT  std_logic_vector(0 to 15);
         RESET : IN  std_logic;
         L_MAR : IN  std_logic;
         Z : IN  std_logic_vector(0 to 15);
         MAR : inout  std_logic_vector(0 to 15);
         EL_MAR : IN  std_logic;
         L : OUT  std_logic_vector(0 to 15)
        );
    END COMPONENT;
    

   --Inputs
   signal IMMVAL : std_logic_vector(0 to 1) := (others => '0');
   signal ER_IMM : std_logic := '0';
   signal RESET : std_logic := '0';
   signal L_MAR : std_logic := '0';
   signal Z : std_logic_vector(0 to 15) := (others => '0');
   signal EL_MAR : std_logic := '0';

 	--Outputs
   signal R : std_logic_vector(0 to 15);
   signal MAR : std_logic_vector(0 to 15);
   signal L : std_logic_vector(0 to 15);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SpecialRegisters PORT MAP (
          IMMVAL => IMMVAL,
          ER_IMM => ER_IMM,
          R => R,
          RESET => RESET,
          L_MAR => L_MAR,
          Z => Z,
          MAR => MAR,
          EL_MAR => EL_MAR,
          L => L
        );
 
   

   -- Stimulus process
   stim_proc: process
   begin		
	   RESET <= '1';
		EL_MAR <= '1';
		MAR <= (others => 'Z');
      wait for 20 ns;			
		-- Wait 20 ns for system to settle
		REPORT "IMMVAL=01 and ER_IMM=1" SEVERITY WARNING;
      IMMVAL <= "01";
		ER_IMM <= '1';
		wait for 20 ns;
		
		REPORT "IMMVAL=01 and ER_IMM=1" SEVERITY WARNING;
      IMMVAL <= "01";
		ER_IMM <= '0';
		wait for 20 ns;
		
		REPORT "RESET" SEVERITY WARNING;
      RESET <= '0';		
		wait for 20 ns;
		
		REPORT "LOAD MAR from Z" SEVERITY WARNING;
      RESET <= '1';		
		Z <= "1111000011110011";
		L_MAR <= '1';
		wait for 20 ns;
		
		REPORT "LOAD L from MAR" SEVERITY WARNING;      
		EL_MAR <= '0';
		wait for 20 ns;
		
		REPORT "PUT L High Impedance" SEVERITY WARNING;      
		EL_MAR <= '1';
		wait for 20 ns;
		
		REPORT "Test MAR memory" SEVERITY WARNING;      
		L_MAR <= '0';
		Z <= "1111111111000000";
		wait for 20 ns;

      wait;
   end process;

END;
