----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leonardo Araujo dos Santos
-- 
-- Create Date:    10:22:55 03/21/2009 
-- Design Name: 	 ALU Magic-1
-- Module Name:    ALU - Behavioral 
-- Project Name: 	 Magic-1 VHDL
-- Target Devices: Spartan3
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
use work.standardDefinitions.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Describe ALU using Behavior description (Logic Based on 74F382 4-bit ALU)
-- This ALU will provide the following operations (Other operations from 74F382 will be unused)
-- Code   Operation
-- 0
-- 1
-- 2		SUB	
-- 3		ADD
-- 4		XOR
-- 5		OR
-- 6		AND
-- 7

entity ALU is
    Port ( R : in  STD_LOGIC_VECTOR (0 to 15);     -- Operand 1 (Big endian, MSB is bit 0)
           L : in  STD_LOGIC_VECTOR (0 to 15);		-- Operand 2
           Z : out  STD_LOGIC_VECTOR (0 to 15);		-- Result
           DO_RSHIFT : in  STD_LOGIC;					-- Right shift
           ALUOP_SZ : in  STD_LOGIC;					-- ALU in 8 or 16 bits
           MSWC : in  STD_LOGIC;							-- Carry bit
           USE_CARRY : in  STD_LOGIC;					-- Use carry
           ALUOP : in  STD_LOGIC_VECTOR (0 to 1);  -- Define ALU operations (ADD,SUB,ABD,pass to IR)
           IR : in  STD_LOGIC_VECTOR (0 to 7);		-- (1 to 3) define ALU operations
           ALUV : out  STD_LOGIC;						-- Overflow flag (Only have meaning in signed operations (and, sub)
           ALUC : out  STD_LOGIC;						-- Carry flag
           ALUS : out  STD_LOGIC;						-- Sign flag
           ALUZ : out  STD_LOGIC);						-- Zero flag
end ALU;

architecture Behavioral of ALU is
signal Alu_ControlInput : aluControl_type;
signal Z_Intermediate : STD_LOGIC_VECTOR (0 to 16);
begin
	-- Combinational logic to decode ALUOP and IR to control ALU operations
	-- If ALUOP='11' operation is ADD	(Check 74F382, for right bits of each operation)
	-- If ALUOP='10' operation is SUB
	-- if ALUOP='01' operation is AND
	-- if ALUOP='00' operation is defined in IR(1 to 3)
	--Alu_ControlInput <= ALUOP & IR(1 to 3);
	 SEL_ALU_CONTROL: process (ALUOP,IR(1 to 3),R,L)
	 begin
		case ALUOP is
			when "00" =>
				Alu_ControlInput <= IR(1 to 3);		-- Pass IR(1 to 3) directly
			when "01" =>
				Alu_ControlInput <= alu_and;
			when "10" =>
				Alu_ControlInput <= alu_sub;				
			when "11" =>
				Alu_ControlInput <= alu_add;	
			WHEN OTHERS => 
				Alu_ControlInput <= alu_dontcare;
		end case;
	 end process;
	
	--Process to define ALU Behavior (Combinational Circuit)
	process (Alu_ControlInput,IR(1 to 3),R,L)
	begin
		case Alu_ControlInput is			
			when alu_sub => 
				if USE_CARRY = '0' then
					Z_Intermediate <= ('0' & R) - ('0' & L);				-- The & is used to concatenate the bits
				else
					Z_Intermediate <= ('0' & R) - ('0' & L) - ("000000000000000" & MSWC);
				end if;
				
			when alu_add => 
				if USE_CARRY = '0' then
					Z_Intermediate <= ('0' & R) + ('0' & L);				
				else
					Z_Intermediate <= ('0' & R) + ('0' & L) + ("000000000000000" & MSWC);				
				end if;
				
			when alu_xor => 
				Z_Intermediate <= ('0' & R) xor ('0' & L);								
				
			when alu_or => 
				Z_Intermediate <= ('0' & R) or ('0' & L);				
				
			when alu_and => 
				Z_Intermediate <= ('0' & R) and ('0' & L);											
				
			when others => 
				Z_Intermediate <= (OTHERS => 'X');
		end case;
	end process;
	
	-- Process to generate flags (Zero, Sign, Carry, Overflow)
	process (Z_Intermediate)
	begin
		-- Zero flag
		if Z_Intermediate = "00000000000000000" then
			ALUZ <= '1';
		else
			ALUZ <= '0';
		end if;		
		
		-- Sign flag
		if Z_Intermediate(15) = '0' then
			ALUS <= '0';
		else
			ALUS <= '1';
		end if;
						
		-- Carry flag
		ALUC <= Z_Intermediate(0);
		
		-- Overflow (http://www.csee.umbc.edu/~squire/cs411_l8.html) and (http://intelliwiki.kylesblog.com/index.php/Overflow_Flag)
		-- Two complement addition overflow when signs of input are the same but
		-- sign of output is different
		-- Overflow only make sense in sign operations.
		case Alu_ControlInput is
			when alu_add =>
				-- When adding we can get two overflow situations.....
				-- Adding two positive numbers producing a negative result
				-- OR
				-- Adding two negative numbers producing a positive result
				ALUV <= (R(0) and L(0) and (not Z_Intermediate(1)))   or   ((not R(0)) and (not L(0)) and Z_Intermediate(1));
			
			when alu_sub =>
				-- When substracting we can get two overflow situations.....
				-- Substracting a positive number from a negative number gaving a positive result
				-- OR
				-- Substracting a negative number from a positive number gaving a negative result
				ALUV <= ((not R(0)) and (L(0)) and (not Z_Intermediate(1)))    or    ((R(0)) and (not L(0)) and Z_Intermediate(1));
			
			when others => 
				ALUV <= '0';
		end case;
		
		-- Deal with DO_RSHIFT (Remember that the now the MSB is 0 Big endian
		if DO_RSHIFT = '1' then
			-- Z(0)=0 Z(1)=ALU(0) Z(2)=ALU(1) Z(3)=ALU(2) Z(4)=ALU(3) Z(5)=ALU(4) Z(6)=ALU(5) Z(7)=ALU(6)
			Z(0) <= '0';
			Z(1) <= Z_Intermediate(0);
			Z(2) <= Z_Intermediate(1);
			Z(3) <= Z_Intermediate(2);
			Z(4) <= Z_Intermediate(3);
			Z(5) <= Z_Intermediate(4);
			Z(6) <= Z_Intermediate(5);
			Z(7) <= Z_Intermediate(6);			
			Z(8) <= Z_Intermediate(7);
			Z(9) <= Z_Intermediate(8);
			Z(10) <= Z_Intermediate(9);
			Z(11) <= Z_Intermediate(10);
			Z(12) <= Z_Intermediate(11);
			Z(13) <= Z_Intermediate(12);
			Z(14) <= Z_Intermediate(13);
			Z(15) <= Z_Intermediate(14);
		else
			if ALUOP_SZ = '1' then
				-- Sign extension
				Z(0 to 7) <= Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9) & Z_Intermediate(9);
				Z(8 to 15) <= Z_Intermediate(9 to 16);
			else
				-- Normal operation			
				Z <= Z_Intermediate(1 to 16);
			end if;			
		end if;	
		
	end process;
		

end Behavioral;

