--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions from Magic-1 cpu 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package standardDefinitions is

  subtype aluControl_type is std_logic_vector(0 to 2);    

-- Declare constants
  constant alu_sub : aluControl_type := "010";
  constant alu_add : aluControl_type := "011";
  constant alu_xor : aluControl_type := "100";
  constant alu_or : aluControl_type := "101";
  constant alu_and : aluControl_type := "110";  
  constant alu_dontcare : aluControl_type := "XXX";
 
-- Declare functions and procedure  

end standardDefinitions;