--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:57 04/12/2009
-- Design Name:   
-- Module Name:   C:/fpga-magic-1/FieldDecode2Tester.vhd
-- Project Name:  Magic_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FieldDecode2
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
 
ENTITY FieldDecode2Tester IS
END FieldDecode2Tester;
 
ARCHITECTURE behavior OF FieldDecode2Tester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FieldDecode2
    PORT(
         CLKS : IN  std_logic;
         XL_MODE : IN  std_logic;
         XL_PAGING : IN  std_logic;
         XL_MDR_LO : IN  std_logic;
         XL_MDR_HI : IN  std_logic;
         XL_MAR : IN  std_logic;
         R_RW : IN  std_logic;
         RIMMVAL : IN  std_logic_vector(0 to 1);
         RL_PTB : IN  std_logic;
         RL_FAULT : IN  std_logic;
         FAULT_PENDING : IN  std_logic;
         RCOMMIT : IN  std_logic;
         RL_FPL : IN  std_logic;
         RL_A_HI : IN  std_logic;
         RL_B_HI : IN  std_logic;
         RL_SSP : IN  std_logic;
         RL_C : IN  std_logic;
         RL_PC : IN  std_logic;
         RL_DP : IN  std_logic;
         RL_SP : IN  std_logic;
         RL_A_LO : IN  std_logic;
         RL_B_LO : IN  std_logic;
         RL_MSW : IN  std_logic;
         RL_IE : IN  std_logic;
         R_L_PTE : IN  std_logic;
         RL_MDR : IN  std_logic;
         CLKS_NEG : OUT  std_logic;
         L_MODE : OUT  std_logic;
         L_PAGING : OUT  std_logic;
         L_MDR_LO : OUT  std_logic;
         L_MDR_HI : OUT  std_logic;
         L_MAR : OUT  std_logic;
         COMMIT : OUT  std_logic;
         L_FPL : OUT  std_logic;
         L_PTB : OUT  std_logic;
         L_A_HI : OUT  std_logic;
         L_B_HI : OUT  std_logic;
         L_SSP : OUT  std_logic;
         L_C : OUT  std_logic;
         L_PC : OUT  std_logic;
         L_DP : OUT  std_logic;
         L_SP : OUT  std_logic;
         L_A_LO : OUT  std_logic;
         L_B_LO : OUT  std_logic;
         L_MSW : OUT  std_logic;
         L_IE : OUT  std_logic;
         L_PTE : OUT  std_logic;
         WR : OUT  std_logic;
         L_FAULT : OUT  std_logic;
         RW : OUT  std_logic;
         IMMVAL : OUT  std_logic_vector(0 to 1)
        );
    END COMPONENT;
    

   --Inputs
   signal CLKS : std_logic := '0';
   signal XL_MODE : std_logic := '0';
   signal XL_PAGING : std_logic := '0';
   signal XL_MDR_LO : std_logic := '0';
   signal XL_MDR_HI : std_logic := '0';
   signal XL_MAR : std_logic := '0';
   signal R_RW : std_logic := '0';
   signal RIMMVAL : std_logic_vector(0 to 1) := (others => '0');
   signal RL_PTB : std_logic := '0';
   signal RL_FAULT : std_logic := '0';
   signal FAULT_PENDING : std_logic := '0';
   signal RCOMMIT : std_logic := '0';
   signal RL_FPL : std_logic := '0';
   signal RL_A_HI : std_logic := '0';
   signal RL_B_HI : std_logic := '0';
   signal RL_SSP : std_logic := '0';
   signal RL_C : std_logic := '0';
   signal RL_PC : std_logic := '0';
   signal RL_DP : std_logic := '0';
   signal RL_SP : std_logic := '0';
   signal RL_A_LO : std_logic := '0';
   signal RL_B_LO : std_logic := '0';
   signal RL_MSW : std_logic := '0';
   signal RL_IE : std_logic := '0';
   signal R_L_PTE : std_logic := '0';
   signal RL_MDR : std_logic := '0';

 	--Outputs
   signal CLKS_NEG : std_logic;
   signal L_MODE : std_logic;
   signal L_PAGING : std_logic;
   signal L_MDR_LO : std_logic;
   signal L_MDR_HI : std_logic;
   signal L_MAR : std_logic;
   signal COMMIT : std_logic;
   signal L_FPL : std_logic;
   signal L_PTB : std_logic;
   signal L_A_HI : std_logic;
   signal L_B_HI : std_logic;
   signal L_SSP : std_logic;
   signal L_C : std_logic;
   signal L_PC : std_logic;
   signal L_DP : std_logic;
   signal L_SP : std_logic;
   signal L_A_LO : std_logic;
   signal L_B_LO : std_logic;
   signal L_MSW : std_logic;
   signal L_IE : std_logic;
   signal L_PTE : std_logic;
   signal WR : std_logic;
   signal L_FAULT : std_logic;
   signal RW : std_logic;
   signal IMMVAL : std_logic_vector(0 to 1);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FieldDecode2 PORT MAP (
          CLKS => CLKS,
          XL_MODE => XL_MODE,
          XL_PAGING => XL_PAGING,
          XL_MDR_LO => XL_MDR_LO,
          XL_MDR_HI => XL_MDR_HI,
          XL_MAR => XL_MAR,
          R_RW => R_RW,
          RIMMVAL => RIMMVAL,
          RL_PTB => RL_PTB,
          RL_FAULT => RL_FAULT,
          FAULT_PENDING => FAULT_PENDING,
          RCOMMIT => RCOMMIT,
          RL_FPL => RL_FPL,
          RL_A_HI => RL_A_HI,
          RL_B_HI => RL_B_HI,
          RL_SSP => RL_SSP,
          RL_C => RL_C,
          RL_PC => RL_PC,
          RL_DP => RL_DP,
          RL_SP => RL_SP,
          RL_A_LO => RL_A_LO,
          RL_B_LO => RL_B_LO,
          RL_MSW => RL_MSW,
          RL_IE => RL_IE,
          R_L_PTE => R_L_PTE,
          RL_MDR => RL_MDR,
          CLKS_NEG => CLKS_NEG,
          L_MODE => L_MODE,
          L_PAGING => L_PAGING,
          L_MDR_LO => L_MDR_LO,
          L_MDR_HI => L_MDR_HI,
          L_MAR => L_MAR,
          COMMIT => COMMIT,
          L_FPL => L_FPL,
          L_PTB => L_PTB,
          L_A_HI => L_A_HI,
          L_B_HI => L_B_HI,
          L_SSP => L_SSP,
          L_C => L_C,
          L_PC => L_PC,
          L_DP => L_DP,
          L_SP => L_SP,
          L_A_LO => L_A_LO,
          L_B_LO => L_B_LO,
          L_MSW => L_MSW,
          L_IE => L_IE,
          L_PTE => L_PTE,
          WR => WR,
          L_FAULT => L_FAULT,
          RW => RW,
          IMMVAL => IMMVAL
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
