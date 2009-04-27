----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Leonardo Araujo dos Santos
-- 
-- Create Date:    21:46:13 04/21/2009 
-- Design Name:    Microcode Magic-1
-- Module Name:    Microcode - Behavioral 
-- Project Name:   Magic-1 VHDL
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

entity Microcode is
    Port ( NEG_RESET : in  STD_LOGIC;
           CLKM : in  STD_LOGIC;
           INIT_INST : in  STD_LOGIC;
           FAULT_PENDING : in  STD_LOGIC;
           MSWC : in  STD_LOGIC;
           MSWZ : in  STD_LOGIC;
           MSWS : in  STD_LOGIC;
           MSWV : in  STD_LOGIC;
           NEG_DO_BRANCH : in  STD_LOGIC;
           ENCODER : in  STD_LOGIC_VECTOR (0 to 3);
           DBUS : in  STD_LOGIC_VECTOR (0 to 7);
           NEG_DMA_ACK : in  STD_LOGIC;
           NEG_FP_WRITE : in  STD_LOGIC;
           IR : inout  STD_LOGIC_VECTOR (0 to 7);
           NEXT_SIG : inout  STD_LOGIC_VECTOR (0 to 7);
           NEG_NEXT0 : out  STD_LOGIC;
           R_RW : out  STD_LOGIC;
           NEG_E_MDR_HI : inout  STD_LOGIC;
           NEG_E_MDR_LO : inout  STD_LOGIC;
           LATCH : out  STD_LOGIC_VECTOR (0 to 3);
           XL_MAR : out  STD_LOGIC;
           XL_MDR_LO : out  STD_LOGIC;
           XL_MDR_HI : out  STD_LOGIC;
           PRIV : out  STD_LOGIC;
           XL_MODE : out  STD_LOGIC;
           XL_PAGING : out  STD_LOGIC;
           MISC : out  STD_LOGIC_VECTOR (0 to 3);
           EL : out  STD_LOGIC_VECTOR (0 to 3);
           ER : out  STD_LOGIC_VECTOR (0 to 1);
           RIMMVAL : out  STD_LOGIC_VECTOR (0 to 1);
           ALUOP_SZ : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (0 to 1);
           USE_CARRY : out  STD_LOGIC;
           LATCH_SZ : out  STD_LOGIC;
           RUSER_PTB : out  STD_LOGIC;
           CODE_PTB : out  STD_LOGIC);
end Microcode;

architecture Behavioral of Microcode is
signal OPCODE_SELECT : STD_LOGIC_VECTOR(0 to 1);
signal MICROCODE_ADDRESS : STD_LOGIC_VECTOR(0 to 7);
signal FULL_PROM_ADDRESS : STD_LOGIC_VECTOR(0 to 8);
signal OUTPUT_PROM_0,OUTPUT_PROM_1,OUTPUT_PROM_2,OUTPUT_PROM_3,OUTPUT_PROM_4 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT_MICROINSTRUCTION : STD_LOGIC_VECTOR(39 downto 0);
signal BR_SENSE, OUTPUT_BRANCH_LOGIC : STD_LOGIC;
signal NEXT_IS_ZERO,NEXT_NOT_ZERO : STD_LOGIC;
signal FAULT_OR_NEXT_ZERO : STD_LOGIC;
signal NEG_NEXT0_SIG : STD_LOGIC;

-- Component (PROMS memory)
component PROM_74S472_Eprom0_U5
	Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component PROM_74S472_Eprom1_U4
	Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component PROM_74S472_Eprom2_U3
	Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component PROM_74S472_Eprom3_U2
	Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component PROM_74S472_Eprom4_U1
	Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin
	-- Process to describe IR register (Don't forget to add all signals readed in sensivity list to avoid unwanted latches)
	process (INIT_INST,DBUS)
	begin		
		-- Load Register IR with DBUS
		if rising_edge(INIT_INST) then
			IR <= DBUS;
		end if;											
	end process;
	
	-- Process to describe circuitry used for creating signals for branches (jump if something(zero,carry,...))
	process (MSWC,MSWZ,MSWS,MSWV,IR(1 to 3),BR_SENSE, NEG_DO_BRANCH)
	variable output_mux : std_logic;
	begin
		     --C,B,A (Mux sel input)
		case IR(1 to 3) is
			when "000" =>
				output_mux := MSWZ;
			when "001" =>
				output_mux := MSWZ;
			when "010" =>
				output_mux := MSWS xor MSWV;
			when "011" =>
				output_mux := MSWZ or (MSWS xor MSWV);
			when "100" =>
				output_mux := not MSWC;
			when "101" =>
				output_mux := MSWZ or (not MSWC);
			when "110" =>
				output_mux := MSWZ;
			when "111" =>
				output_mux := not MSWZ;
			when others =>
				output_mux := 'Z';
		end case;
		
		OUTPUT_BRANCH_LOGIC <= NEG_DO_BRANCH or (output_mux xor BR_SENSE);
	end process;
	
	-- If Next = 0x0 use priority encoder (Describe U24)
	NEXT_IS_ZERO <= '1' when NEXT_SIG  = "00000000" else '0'; 
	
	NEXT_NOT_ZERO <= '0' when NEXT_SIG = "00000000" else '1';
	
	-- Describe U6
	FAULT_OR_NEXT_ZERO <= FAULT_PENDING or NEXT_IS_ZERO;
	
	-- U44B logic for signal NEG_NEXT0_SIG
	NEG_NEXT0_SIG <= OUTPUT_BRANCH_LOGIC and NEXT_NOT_ZERO and (not FAULT_PENDING); 
	
	NEG_NEXT0 <= NEG_NEXT0_SIG;
	OPCODE_SELECT <= FAULT_OR_NEXT_ZERO & NEG_NEXT0_SIG;
	-- Process to describe array of 74153 to select signals from NEXT,IR,Encoder(0..3)
	process (OPCODE_SELECT,IR,NEXT_SIG,ENCODER)
	begin
		case OPCODE_SELECT is 
			when "00" =>
				MICROCODE_ADDRESS <= "0000" & ENCODER;
			when "01" =>
				MICROCODE_ADDRESS <= IR;
			when "10" =>
				MICROCODE_ADDRESS <= "0000" & ENCODER;
			when "11" =>
				MICROCODE_ADDRESS <= NEXT_SIG;
			when others =>
				MICROCODE_ADDRESS <= (others => 'X');
		end case;
	end process;
	
	-- Proms
	FULL_PROM_ADDRESS <= FAULT_OR_NEXT_ZERO & MICROCODE_ADDRESS;
	U5: PROM_74S472_Eprom0_U5 port map ('0', FULL_PROM_ADDRESS, OUTPUT_PROM_0);
	U4: PROM_74S472_Eprom1_U4 port map ('0', FULL_PROM_ADDRESS, OUTPUT_PROM_1);
	U3: PROM_74S472_Eprom2_U3 port map ('0', FULL_PROM_ADDRESS, OUTPUT_PROM_2);
	U2: PROM_74S472_Eprom3_U2 port map ('0', FULL_PROM_ADDRESS, OUTPUT_PROM_3);
	U1: PROM_74S472_Eprom4_U1 port map ('0', FULL_PROM_ADDRESS, OUTPUT_PROM_4);
	OUTPUT_MICROINSTRUCTION <= OUTPUT_PROM_4 & OUTPUT_PROM_3 & OUTPUT_PROM_2 & OUTPUT_PROM_1 & OUTPUT_PROM_0;
	
	-- Process to describe arrays of 74273 to store Microinstrucrion of 40bits lenght
	process (NEG_RESET,CLKM,OUTPUT_MICROINSTRUCTION)
	begin
		if NEG_RESET = '0' then
			CODE_PTB <= '0';
			RUSER_PTB <= '0';
			LATCH_SZ <= '0';
			BR_SENSE <= '0';
			USE_CARRY <= '0';
			ALUOP <= (others => '0');
			ALUOP_SZ <= '0';
			
			RIMMVAL <= (others => '0');
			ER <= (others => '0');
			EL <= (others => '0');
			
			PRIV <= '0';
			XL_MODE <= '0';
			XL_PAGING <= '0';
			MISC <= (others => '0');
			
			LATCH <= (others => '0');
			XL_MAR <= '0';
			XL_MDR_LO <= '0';
			XL_MDR_HI <= '0';
			
			NEXT_SIG <= (others => '0');
			
		else
			if rising_edge(CLKM) then
				CODE_PTB <= OUTPUT_MICROINSTRUCTION(39);
				RUSER_PTB <= OUTPUT_MICROINSTRUCTION(38);				
				BR_SENSE <= OUTPUT_MICROINSTRUCTION(37);
				LATCH_SZ <= OUTPUT_MICROINSTRUCTION(36);
				USE_CARRY <= OUTPUT_MICROINSTRUCTION(35);
				ALUOP <= OUTPUT_MICROINSTRUCTION(34 downto 33);
				ALUOP_SZ <= OUTPUT_MICROINSTRUCTION(32);
				
				RIMMVAL <= OUTPUT_MICROINSTRUCTION(31 downto 30);
				ER <= OUTPUT_MICROINSTRUCTION(29 downto 28);
				EL <= OUTPUT_MICROINSTRUCTION(27 downto 24);
				
				MISC <= OUTPUT_MICROINSTRUCTION(23 downto 20);
				XL_PAGING <= OUTPUT_MICROINSTRUCTION(19);
				XL_MODE <= OUTPUT_MICROINSTRUCTION(18);
				PRIV <= OUTPUT_MICROINSTRUCTION(17);
				NEG_E_MDR_HI <= not OUTPUT_MICROINSTRUCTION(16);
								
				NEG_E_MDR_LO <= not OUTPUT_MICROINSTRUCTION(15);
				XL_MDR_HI <= OUTPUT_MICROINSTRUCTION(14);
				XL_MDR_LO <= OUTPUT_MICROINSTRUCTION(13);
				XL_MAR <= OUTPUT_MICROINSTRUCTION(12);
				LATCH <= OUTPUT_MICROINSTRUCTION(11 downto 8);
								
				NEXT_SIG <= OUTPUT_MICROINSTRUCTION(7 downto 0);
			end if;
		end if;
	end process;
	
	-- Process to handle signal R_RW
	process (NEG_E_MDR_HI, NEG_E_MDR_LO, NEG_DMA_ACK, NEG_FP_WRITE)
	begin
		R_RW <= not (NEG_E_MDR_LO and NEG_E_MDR_HI and (NEG_DMA_ACK or NEG_FP_WRITE));
	end process;

end Behavioral;

