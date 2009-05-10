----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Leonardo Araujo dos Santos
-- 
-- Create Date:    14:30:25 04/13/2009 
-- Design Name: 
-- Module Name:    FaultsandInterrupts - Behavioral 
-- Project Name:   Magic_1
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

entity FaultsandInterrupts is
    Port ( NEG_RESET : in  STD_LOGIC;
           NEG_IRQ0 : in  STD_LOGIC;
           NEG_IRQ1 : in  STD_LOGIC;
           NEG_IRQ2 : in  STD_LOGIC;
           NEG_IRQ3 : in  STD_LOGIC;
           NEG_IRQ4 : in  STD_LOGIC;
           NEG_IRQ5 : in  STD_LOGIC;
           NEG_EL_FCODE : in  STD_LOGIC;
           MSWM : in  STD_LOGIC;
           PRIV : in  STD_LOGIC;
           MSWV : in  STD_LOGIC;
           NEG_TRAPO : in  STD_LOGIC;
           CLKM : in  STD_LOGIC;
           NEG_DMA_REQ : in  STD_LOGIC;
           MSWE : in  STD_LOGIC;
           NEG_NP : in  STD_LOGIC;
           NEG_NW : in  STD_LOGIC;
           NEG_BKPT : in  STD_LOGIC;
           NEG_SYSCALL : in  STD_LOGIC;
           IOCLK : in  STD_LOGIC;
           NEG_NEXT0 : in  STD_LOGIC;
           CLKS : in  STD_LOGIC;
           NEG_CLR_TRAP : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (0 to 15);
           RL_FAULT : out  STD_LOGIC;
           ENCODER : out  STD_LOGIC_VECTOR (0 to 3);
           FAULT_PENDING : inout  STD_LOGIC);
end FaultsandInterrupts;

architecture Behavioral of FaultsandInterrupts is
signal interrupt_register : std_logic_vector(0 to 7);
signal interrupt_ff : std_logic_vector(0 to 5);
signal output_priority_encoder : std_logic_vector(0 to 2);
signal enable_input_u47 : std_logic;

component PriorityEncoder
	Port ( EnableInput : in  STD_LOGIC;
           EncoderInputs : in  STD_LOGIC_VECTOR (7 downto 0);
           EncoderOutputs : out  STD_LOGIC_VECTOR (2 downto 0);
           EnableOutputs : out  STD_LOGIC;
           GroupOutput : out  STD_LOGIC);
end component;

begin
	-- Implement the Interrupt register U?
	process (MSWE,interrupt_ff,NEG_DMA_REQ,NEG_RESET,CLKM)
	begin
		if NEG_RESET = '0' then
			interrupt_register <= (others => '0');
		elsif rising_edge(CLKM) then
			interrupt_register <= MSWE & interrupt_ff & NEG_DMA_REQ;			
		end if;
	end process;
	
	-- Implement the logic of U47 74148 (8 to 3) priority encoders (http://en.wikipedia.org/wiki/Encoder#Single_bit_4_to_2_Encoder)
	U47: PriorityEncoder port map (enable_input_u47, interrupt_register);	
	
	-- Implement the FF array U50 and U51
	process (NEG_RESET,interrupt_ff,NEG_IRQ5,NEG_IRQ4,NEG_IRQ3,NEG_IRQ2,NEG_IRQ1,NEG_IRQ0)
	begin
		--if (NEG_RESET
	end process;

end Behavioral;

