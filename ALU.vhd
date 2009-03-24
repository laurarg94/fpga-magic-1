----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Describe ALU using Behavior description (Logic Based on 74F382 4-bit ALU)

entity ALU is
    Port ( R : in  STD_LOGIC_VECTOR (0 to 15);     -- Operand 1 (Big endian)
           L : in  STD_LOGIC_VECTOR (0 to 15);		-- Operand 2
           Z : out  STD_LOGIC_VECTOR (0 to 15);		-- Result
           DO_RSHIFT : in  STD_LOGIC;					-- Right shift
           ALUOP_SZ : in  STD_LOGIC;					-- ALU in 8 or 16 bits
           MSWC : in  STD_LOGIC;							-- Carry bit
           USE_CARRY : in  STD_LOGIC;					-- Use carry
           ALUOP : in  STD_LOGIC_VECTOR (0 to 1);  -- Define ALU operations (ADD,SUB,ABD,pass to IR)
           IR : in  STD_LOGIC_VECTOR (0 to 7);		-- (1 to 3) define ALU operations
           ALUV : out  STD_LOGIC;						-- Overflow flag
           ALUC : out  STD_LOGIC;						-- Carry flag
           ALUS : out  STD_LOGIC;						-- Sign flag
           ALUZ : out  STD_LOGIC);						-- Zero flag
end ALU;

architecture Behavioral of ALU is
--signal Alu_ControlInput : std_logic_vector(0 to 4);
signal Z_Intermediate : STD_LOGIC_VECTOR (0 to 16);
--signal overflow: STD_LOGIC_VECTOR(2 downto 0); 
begin
	-- Combinational logic to decode ALUOP and IR to control ALU operations
	-- If ALUOP='11' operation is ADD
	-- If ALUOP='10' operation is SUB
	-- if ALUOP='01' operation is AND
	-- if ALUOP='00' operation is defined in IR(1 to 3)
	--Alu_ControlInput <= ALUOP & IR(1 to 3);
	
	--Process to define ALU Behavior (Combinational Circuit)
	process (R,L,IR(1 to 3))
	begin
		case IR(1 to 3) is
			when "000" => 
				Z_Intermediate <= (OTHERS => '0');
			when "001" => 
				Z_Intermediate <= ('0' & L) - ('0' & R);
			when "010" => 
				Z_Intermediate <= ('0' & R) - ('0' & L);				
			when "011" => 
				Z_Intermediate <= ('0' & R) + ('0' & L);				
			when "100" => 
				Z_Intermediate <= ('0' & R) xor ('0' & L);				
			when "101" => 
				Z_Intermediate <= ('0' & R) or ('0' & L);				
			when "110" => 
				Z_Intermediate <= ('0' & R) and ('0' & L);				
			when "111" => 
				Z_Intermediate <= (OTHERS => '1');
			WHEN OTHERS => 
				Z_Intermediate <= (OTHERS => 'U');
		end case;
	end process;
	
	-- Process to generate flags
	process (R,L,Z_Intermediate)
	begin
		-- Zero flag
		if Z_Intermediate = "00000000000000000" then
			ALUZ <= '1';
		else
			ALUZ <= '0';
		end if;		
		
		-- Sign flag
		if Z_Intermediate(15) = '0' then)
			ALUS <= '0';
		else
			ALUS <= '1';
		end if;
						
		-- Carry flag
		ALUC <= Z_Intermediate(16);
		
		-- Overflow (http://www.csee.umbc.edu/~squire/cs411_l8.html)
		-- Two complement addition overflow when signs of input are the same but
		-- sign of output is different
		ALUV <= '1';
	end process;
	
	-- Process to deal with DO_RSHIFT signal
	process (Z_Intermediate,DO_RSHIFT)
	begin
		if DO_RSHIFT = '1' then
			Z <= Z_Intermediate(0 to 15) + Z_Intermediate(0 to 15);
		else
			Z <= Z_Intermediate(0 to 15);
		end if;	
	end process;		

end Behavioral;

