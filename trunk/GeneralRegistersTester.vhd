--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:28:06 03/28/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/GeneralRegistersTester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GeneralRegisters
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
 
ENTITY GeneralRegistersTester IS
END GeneralRegistersTester;
 
ARCHITECTURE behavior OF GeneralRegistersTester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GeneralRegisters
    PORT(
         EL_A : IN  std_logic;
         L_A_HI : IN  std_logic;
         L_A_LO : IN  std_logic;
         EL_B : IN  std_logic;
         L_B_HI : IN  std_logic;
         L_B_LO : IN  std_logic;
         EL_C : IN  std_logic;
         L_C : IN  std_logic;
         EL_DP : IN  std_logic;
         L_DP : IN  std_logic;
         EL_SP : IN  std_logic;
         L_SP : IN  std_logic;
         EL_SSP : IN  std_logic;
         L_SSP : IN  std_logic;
         EL_PC : IN  std_logic;
         L_PC : IN  std_logic;
         COMMIT : IN  std_logic;
         EL_TPC : IN  std_logic;
         Z : IN  std_logic_vector(0 to 15);
         L : INOUT  std_logic_vector(0 to 15)
        );
    END COMPONENT;
    

   --Inputs
   signal EL_A : std_logic := '1';
   signal L_A_HI : std_logic := '0';
   signal L_A_LO : std_logic := '0';
   signal EL_B : std_logic := '1';
   signal L_B_HI : std_logic := '0';
   signal L_B_LO : std_logic := '0';
   signal EL_C : std_logic := '1';
   signal L_C : std_logic := '0';
   signal EL_DP : std_logic := '1';
   signal L_DP : std_logic := '0';
   signal EL_SP : std_logic := '1';
   signal L_SP : std_logic := '0';
   signal EL_SSP : std_logic := '1';
   signal L_SSP : std_logic := '0';
   signal EL_PC : std_logic := '1';
   signal L_PC : std_logic := '0';
   signal COMMIT : std_logic := '0';
   signal EL_TPC : std_logic := '1';
   signal Z : std_logic_vector(0 to 15) := (others => '0');

 	--Outputs
   signal L : std_logic_vector(0 to 15);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GeneralRegisters PORT MAP (
          EL_A => EL_A,
          L_A_HI => L_A_HI,
          L_A_LO => L_A_LO,
          EL_B => EL_B,
          L_B_HI => L_B_HI,
          L_B_LO => L_B_LO,
          EL_C => EL_C,
          L_C => L_C,
          EL_DP => EL_DP,
          L_DP => L_DP,
          EL_SP => EL_SP,
          L_SP => L_SP,
          EL_SSP => EL_SSP,
          L_SSP => L_SSP,
          EL_PC => EL_PC,
          L_PC => L_PC,
          COMMIT => COMMIT,
          EL_TPC => EL_TPC,
          Z => Z,
          L => L
        );
 
  -- Stimulus process
   stim_proc: process
   begin		
      -- Test low byte load in REG_A
		Z <= "0000111111110000";
		L_A_HI <= '0';
		L_A_LO <= '1';		
      wait for 20 ns;	

		Z <= (others => 'U');
		L_A_HI <= '0';
		L_A_LO <= '0';
		EL_A <= '0';
      wait for 20 ns;	      
		
		-- Test high byte load in REG_A
		Z <= "0000111111110000";
		L_A_HI <= '1';
		L_A_LO <= '0';		
		EL_A <= '1';
      wait for 20 ns;	

		Z <= (others => 'U');
		L_A_HI <= '0';
		L_A_LO <= '0';
		EL_A <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test low byte load in REG_B
		Z <= "1111111100000000";
		L_B_HI <= '0';
		L_B_LO <= '1';		
		EL_A <= '1';
      wait for 20 ns;	

		Z <= (others => 'U');
		L_B_HI <= '0';
		L_B_LO <= '0';
		EL_B <= '0';
      wait for 20 ns;	      
		
		-- Test high byte load in REG_B
		Z <= "0000000011111111";
		L_B_HI <= '1';
		L_B_LO <= '0';		
		EL_B <= '1';
      wait for 20 ns;	

		Z <= (others => 'U');
		L_B_HI <= '0';
		L_B_LO <= '0';
		EL_B <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_C
		Z <= "1111111100000000";
		L_C <= '1';		
		EL_B <= '1';
      wait for 20 ns;
		
		Z <= (others => 'U');
		L_C <= '0';				
		EL_C <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_DP
		Z <= "0000000011111111";
		L_DP <= '1';		
		EL_C <= '1';
      wait for 20 ns;
		
		Z <= (others => 'U');
		L_DP <= '0';				
		EL_DP <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_SP
		Z <= "1010101010101010";
		L_SP <= '1';		
		EL_DP <= '1';
      wait for 20 ns;
		
		Z <= (others => 'U');
		L_SP <= '0';				
		EL_SP <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_SSP
		Z <= "0101010101010101";
		L_SSP <= '1';		
		EL_SP <= '1';
      wait for 20 ns;
		
		Z <= (others => 'U');
		L_SSP <= '0';				
		EL_SSP <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_PC
		Z <= "0000000000000001";
		L_PC <= '1';		
		EL_SSP <= '1';
      wait for 20 ns;
		
		Z <= (others => 'U');
		L_PC <= '0';				
		EL_PC <= '0';
      wait for 20 ns;
---------------------------------------------------------------------------------------
		-- Test load in REG_TPC		
		COMMIT <= '1';	-- Save "0000000000000001" from L (Last value in REG_PC)
      wait for 20 ns;
		
		EL_PC <= '1';
		COMMIT <= '0';				
		-- Get REG_A
		EL_A <= '0';
      wait for 20 ns;
		
		-- Get REG_TPC
		EL_A <= '1';
		EL_TPC <= '0';

      wait;
   end process;

END;
