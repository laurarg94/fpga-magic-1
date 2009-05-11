--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:52:02 05/10/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/EncoderDemuxTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EncoderDemux
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
 
ENTITY EncoderDemuxTester IS
END EncoderDemuxTester;
 
ARCHITECTURE behavior OF EncoderDemuxTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EncoderDemux
    PORT(
         E3 : IN  std_logic;
         E2 : IN  std_logic;
         E1 : IN  std_logic;
         Address : IN  std_logic_vector(2 downto 0);
         Output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal E3 : std_logic := '0';
   signal E2 : std_logic := '0';
   signal E1 : std_logic := '0';
   signal Address : std_logic_vector(2 downto 0) := "XXX";

 	--Outputs
   signal Output : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EncoderDemux PORT MAP (
          E3 => E3,
          E2 => E2,
          E1 => E1,
          Address => Address,
          Output => Output
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 10 ns;	

		-- Put lines enabled with address 000
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "000";
		wait for 10 ns;	
		
		-- Put lines enabled with address 001
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "001";
		wait for 10 ns;	
		
		-- Put lines enabled with address 010
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "010";
		wait for 10 ns;	
		
		-- Put lines enabled with address 011
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "011";
		wait for 10 ns;
		
		-- Put lines enabled with address 100
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "100";
		wait for 10 ns;
		
		-- Put lines enabled with address 101
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "101";
		wait for 10 ns;
		
		-- Put lines enabled with address 110
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "110";
		wait for 10 ns;
		
		-- Put lines enabled with address 111
		E3 <= '1';
		E2 <= '0';
		E1 <= '0';
		Address <= "111";
		wait for 10 ns;
		
		-- Put lines enabled with address 111
		E3 <= '1';
		E2 <= '0';
		E1 <= '1';
		Address <= "111";
		wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
