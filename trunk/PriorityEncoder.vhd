----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Leonardo Araujo dos Santos
-- 
-- Create Date:    17:31:18 05/09/2009 
-- Design Name: 
-- Module Name:    PriorityEncoder - Behavioral 
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

entity PriorityEncoder is
    Port ( EnableInput : in  STD_LOGIC;
           EncoderInputs : in  STD_LOGIC_VECTOR (7 downto 0);   -- I7 I6 I5 I4 I3 I2 I1 I0
           EncoderOutputs : out  STD_LOGIC_VECTOR (2 downto 0); -- A2 A1 A0
           EnableOutputs : out  STD_LOGIC;
           GroupOutput : out  STD_LOGIC);	-- GroupOutput goes low on priority detect
end PriorityEncoder;

architecture Behavioral of PriorityEncoder is
signal EncoderOutputs_Buffer : STD_LOGIC_VECTOR (2 downto 0);
begin
	-- Implementation of 8 input 74148 Priority encoder (I7 most priotity)
	-- A priority is assigned to each input so that when
	-- two or more inputs are simultaneously active, the input with the
   -- highest priority is represented on the output, with input line I7 having
   -- the highest priority.
	
	--A2 & A1 & A0
	EncoderOutputs_Buffer <= "000" when (EncoderInputs(7) = '0') else		-- More priority (EncoderInputs(7)) NEG_I7
									 "001" when (EncoderInputs(6) = '0') else
									 "010" when (EncoderInputs(5) = '0') else
									 "011" when (EncoderInputs(4) = '0') else
									 "100" when (EncoderInputs(3) = '0') else
									 "101" when (EncoderInputs(2) = '0') else
									 "110" when (EncoderInputs(1) = '0') else	   
									 "111";												   -- Less priority (EncoderInputs(0))
	
	EncoderOutputs <= EncoderOutputs_Buffer when (EnableInput = '0') else "111";
	
	-- GroupOutput is low if any input becomes low 
	GroupOutput <= '0' when EncoderInputs(0) = '0' or EncoderInputs(1) = '0' or EncoderInputs(2) = '0' or EncoderInputs(3) = '0' or EncoderInputs(4) = '0' or EncoderInputs(5) = '0' or EncoderInputs(6) = '0' or EncoderInputs(7) = '0' else
						'1';
	
	-- The EO is active-Low when all inputs are High
	EnableOutputs <= '0' when EncoderInputs = "11111111" else '1';
end Behavioral;

