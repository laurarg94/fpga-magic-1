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
		EncoderInputs <= "XXXXXXXX";
		wait for 10 ns;	
		
		-- Test with all Inputs High (Test of Enable Output)
		EnableInput <= '0';
		EncoderInputs <= "11111111";
		wait for 10 ns;
		
		-- Test with EnableInput enabled 0XXXXXXX
		EnableInput <= '0';
		EncoderInputs <= "0XXXXXXX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled X0XXXXXX
		EnableInput <= '0';
		EncoderInputs <= "X0XXXXXX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XX0XXXXX
		EnableInput <= '0';
		EncoderInputs <= "XX0XXXXX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XXX0XXXX
		EnableInput <= '0';
		EncoderInputs <= "XXX0XXXX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XXXX0XXX
		EnableInput <= '0';
		EncoderInputs <= "XXXX0XXX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XXXXX0XX
		EnableInput <= '0';
		EncoderInputs <= "XXXXX0XX";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XXXXXX0X
		EnableInput <= '0';
		EncoderInputs <= "XXXXXX0X";
		wait for 10 ns;
		
		-- Test with EnableInput enabled XXXXXXX0
		EnableInput <= '0';
		EncoderInputs <= "XXXXXXX0";
		wait for 10 ns;      
		
      wait;
   end process;

END;
