--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:10:37 03/27/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/ALU_Tester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- Test bench of ALU
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
USE ieee.numeric_std.ALL;

USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
 
ENTITY ALU_Tester IS
END ALU_Tester;
 
ARCHITECTURE behavior OF ALU_Tester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         R : IN  std_logic_vector(0 to 15);
         L : IN  std_logic_vector(0 to 15);
         Z : OUT  std_logic_vector(0 to 15);
         DO_RSHIFT : IN  std_logic;
         ALUOP_SZ : IN  std_logic;
         MSWC : IN  std_logic;
         USE_CARRY : IN  std_logic;
         ALUOP : IN  std_logic_vector(0 to 1);
         IR : IN  std_logic_vector(0 to 7);
         ALUV : OUT  std_logic;
         ALUC : OUT  std_logic;
         ALUS : OUT  std_logic;
         ALUZ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic_vector(0 to 15) := (others => '0');
   signal L : std_logic_vector(0 to 15) := (others => '0');
   signal DO_RSHIFT : std_logic := '0';
   signal ALUOP_SZ : std_logic := '0';
   signal MSWC : std_logic := '0';
   signal USE_CARRY : std_logic := '0';
   signal ALUOP : std_logic_vector(0 to 1) := (others => '0');
   signal IR : std_logic_vector(0 to 7) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(0 to 15);
   signal ALUV : std_logic;
   signal ALUC : std_logic;
   signal ALUS : std_logic;
   signal ALUZ : std_logic;
	
	SHARED VARIABLE TX_OUT : LINE;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          R => R,
          L => L,
          Z => Z,
          DO_RSHIFT => DO_RSHIFT,
          ALUOP_SZ => ALUOP_SZ,
          MSWC => MSWC,
          USE_CARRY => USE_CARRY,
          ALUOP => ALUOP,
          IR => IR,
          ALUV => ALUV,
          ALUC => ALUC,
          ALUS => ALUS,
          ALUZ => ALUZ
        );
 
    
	-- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;			
		-- Wait 20 ns for system to settle		
		REPORT "ADD without carry" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "11";
		R <= conv_std_logic_vector(2, 16);
		L <= conv_std_logic_vector(3, 16);		
		wait for 20 ns;			
				
		REPORT "SUB wintout carry" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "10";
		R <= conv_std_logic_vector(3, 16);
		L <= conv_std_logic_vector(2, 16);		
		wait for 20 ns;

		REPORT "AND" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "01";
		R <= "0000000001000000";
		L <= "0000000001000100";
		wait for 20 ns;		
		
		REPORT "SUB by IR without carry" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "00";
		IR <= "X010XXXX";
		R <= conv_std_logic_vector(6, 16);
		L <= conv_std_logic_vector(2, 16);		
		wait for 20 ns;
		
		REPORT "ADD by IR without carry" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "00";
		IR <= "X011XXXX";
		R <= conv_std_logic_vector(6, 16);
		L <= conv_std_logic_vector(2, 16);		
		wait for 20 ns;
		
		REPORT "XOR by IR" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "00";
		IR <= "X100XXXX";
		R <= conv_std_logic_vector(6, 16);
		L <= conv_std_logic_vector(6, 16);		
		wait for 20 ns;
		
		REPORT "OR by IR" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "00";
		IR <= "X101XXXX";
		R <= "0000000001000000";
		L <= "0000000001000100";
		wait for 20 ns;
		
		REPORT "AND by IR" SEVERITY WARNING;
		USE_CARRY <= '0';
		ALUOP <= "00";
		IR <= "X110XXXX";
		R <= "0000000001000000";
		L <= "0000000001000100";
		wait for 20 ns;
		
		REPORT "ADD by IR with carry" SEVERITY WARNING;
		USE_CARRY <= '1';
		MSWC <= '1';
		ALUOP <= "00";
		IR <= "X011XXXX";
		R <= conv_std_logic_vector(4, 16);
		L <= conv_std_logic_vector(4, 16);		
		wait for 20 ns;
		
		REPORT "SUB by IR with carry" SEVERITY WARNING;
		USE_CARRY <= '1';
		MSWC <= '1';
		ALUOP <= "00";
		IR <= "X010XXXX";
		R <= conv_std_logic_vector(4, 16);
		L <= conv_std_logic_vector(4, 16);		
		wait for 20 ns;
		
		REPORT "ADD by IR creating Carry" SEVERITY WARNING;
		USE_CARRY <= '0';
		MSWC <= '0';
		ALUOP <= "00";
		IR <= "X011XXXX";
		R <= conv_std_logic_vector(40000, 16);
		L <= conv_std_logic_vector(40000, 16);		
		wait for 20 ns;
		
		REPORT "SUB by IR creating zero flag" SEVERITY WARNING;
		USE_CARRY <= '0';
		MSWC <= '0';
		ALUOP <= "00";
		IR <= "X010XXXX";
		R <= conv_std_logic_vector(10, 16);
		L <= conv_std_logic_vector(10, 16);		
		wait for 20 ns;
		
		REPORT "ADD by IR creating Overflow" SEVERITY WARNING;
		USE_CARRY <= '0';
		MSWC <= '0';
		ALUOP <= "00";
		IR <= "X011XXXX";
		R <= conv_std_logic_vector(32760, 16);
		L <= conv_std_logic_vector(14, 16);		
		wait for 20 ns;

      wait;
   end process;

END;
