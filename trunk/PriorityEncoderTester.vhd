--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:08 05/09/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/PriorityEncoderTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PriorityEncoder
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
 
ENTITY PriorityEncoderTester IS
END PriorityEncoderTester;
 
ARCHITECTURE behavior OF PriorityEncoderTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PriorityEncoder
    PORT(
         EnableInput : IN  std_logic;
         EncoderInputs : IN  std_logic_vector(7 downto 0);
         EncoderOutputs : OUT  std_logic_vector(2 downto 0);
         EnableOutputs : OUT  std_logic;
         GroupOutput : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal EnableInput : std_logic := '1';
   signal EncoderInputs : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal EncoderOutputs : std_logic_vector(2 downto 0);
   signal EnableOutputs : std_logic;
   signal GroupOutput : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PriorityEncoder PORT MAP (
          EnableInput => EnableInput,
          EncoderInputs => EncoderInputs,
          EncoderOutputs => EncoderOutputs,
          EnableOutputs => EnableOutputs,
          GroupOutput => GroupOutput
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10ns.
      wait for 10 ns;	
		
		-- Test with EnableInput disabled
		EnableInput <= '1';
		EncoderInputs <= "00000001";
		wait for 10 ns;	
		
		-- Test with EnableInput enabled 00000000
		EnableInput <= '0';
		EncoderInputs <= "00000000";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00000001
		EnableInput <= '0';
		EncoderInputs <= "00000001";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00000010
		EnableInput <= '0';
		EncoderInputs <= "00000010";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00000100
		EnableInput <= '0';
		EncoderInputs <= "00000100";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00001000
		EnableInput <= '0';
		EncoderInputs <= "00001000";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00010000
		EnableInput <= '0';
		EncoderInputs <= "00010000";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 00100000
		EnableInput <= '0';
		EncoderInputs <= "00100000";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 01000000
		EnableInput <= '0';
		EncoderInputs <= "01000000";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 10000000
		EnableInput <= '0';
		EncoderInputs <= "10000000";
		wait for 10 ns;
	
      -- Now we're going to test the priority behavior
		EnableInput <= '0';
		EncoderInputs <= "01000001";
		wait for 10 ns;
		
      wait;
   end process;

END;
