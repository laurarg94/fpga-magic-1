----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:02 03/28/2009 
-- Design Name: 
-- Module Name:    GeneralRegisters - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GeneralRegisters is
    Port ( EL_A : in  STD_LOGIC;
           L_A_HI : in  STD_LOGIC;
           L_A_LO : in  STD_LOGIC;
           EL_B : in  STD_LOGIC;
           L_B_HI : in  STD_LOGIC;
           L_B_LO : in  STD_LOGIC;
           EL_C : in  STD_LOGIC;
           L_C : in  STD_LOGIC;
           EL_DP : in  STD_LOGIC;
           L_DP : in  STD_LOGIC;
           EL_SP : in  STD_LOGIC;
           L_SP : in  STD_LOGIC;
           EL_SSP : in  STD_LOGIC;
           L_SSP : in  STD_LOGIC;
           EL_PC : in  STD_LOGIC;
           L_PC : in  STD_LOGIC;
           COMMIT : in  STD_LOGIC;
           EL_TPC : in  STD_LOGIC;
           Z : in  STD_LOGIC_VECTOR (0 to 15);
           L : out  STD_LOGIC_VECTOR (0 to 15));
end GeneralRegisters;

architecture Behavioral of GeneralRegisters is

begin


end Behavioral;

