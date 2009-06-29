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
           RL_FAULT : inout  STD_LOGIC;
           ENCODER : inout  STD_LOGIC_VECTOR (0 to 3);
           FAULT_PENDING : inout  STD_LOGIC);
end FaultsandInterrupts;

architecture Behavioral of FaultsandInterrupts is
signal interrupt_register,output_encoder,input_priority_encoder_46,input_priority_encoder_47 : std_logic_vector(0 to 7);
signal address_encoder,output_priority_encoder_46,output_priority_encoder_47 : std_logic_vector(0 to 2);
signal interrupt_ff : std_logic_vector(0 to 5);
signal faults_and_interrupts_latch :  std_logic_vector (0 to 3);
signal enable_input_u47,GroupOutput_46,SIG_CLEAR_56 : std_logic;
signal E3_encoder : std_logic;

component PriorityEncoder
	Port ( EnableInput : in  STD_LOGIC;
           EncoderInputs : in  STD_LOGIC_VECTOR (7 downto 0);
           EncoderOutputs : out  STD_LOGIC_VECTOR (2 downto 0);
           EnableOutputs : out  STD_LOGIC;
           GroupOutput : out  STD_LOGIC);
end component;

component EncoderDemux is
    Port ( E3 : in  STD_LOGIC;
           E2 : in  STD_LOGIC;
           E1 : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (2 downto 0);  -- A2,A1,A0
           Output : out  STD_LOGIC_VECTOR (7 downto 0)); -- O7,O6,O5,O4,O3,O2,O1,O0
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
	enable_input_u47 <= FAULT_PENDING or (interrupt_register(0) nor (not interrupt_register(7)));
	input_priority_encoder_47 <= interrupt_register(1 to 7) & '0';
	U47: PriorityEncoder port map (enable_input_u47, input_priority_encoder_47,output_priority_encoder_47);
	
	input_priority_encoder_46 <= NEG_SYSCALL & '1' &  ((not NEG_TRAPO) nand MSWV) & (PRIV nand MSWM) & NEG_BKPT & NEG_NW & NEG_NP & '1';
	U46: PriorityEncoder port map ('0', input_priority_encoder_46,output_priority_encoder_46,FAULT_PENDING,GroupOutput_46 );
	
	-- Implement the logic of U45 74F138 Encoder/Demultiplexer	
	address_encoder <= faults_and_interrupts_latch(3) & faults_and_interrupts_latch(2) & faults_and_interrupts_latch(1);
	E3_encoder <= IOCLK and SIG_CLEAR_56;
	U45: EncoderDemux port map(E3_encoder,faults_and_interrupts_latch(3),faults_and_interrupts_latch(3),address_encoder,output_encoder);
	
	-- Concatenate signal ENCODER
	ENCODER <= (output_priority_encoder_47(0) nand output_priority_encoder_46(0)) & (output_priority_encoder_47(1) nand output_priority_encoder_46(1)) & (output_priority_encoder_47(2) nand output_priority_encoder_46(2)) & (not GroupOutput_46);
	
	-- Implement the behavior of U56 OctalFF for holding the faults and interrupts signal
	RL_FAULT <= CLKS and (FAULT_PENDING or (not NEG_NEXT0));
	SIG_CLEAR_56 <= NEG_CLR_TRAP and NEG_RESET;
	process (ENCODER,RL_FAULT,SIG_CLEAR_56)
	begin
		if SIG_CLEAR_56 = '0' then
			faults_and_interrupts_latch <= (others => '0');
		elsif rising_edge(RL_FAULT) then
			faults_and_interrupts_latch <= ENCODER;
		end if;
	end process;
	
	-- Now implement the array of 74F244 Tri-state buffer
	process(NEG_EL_FCODE,faults_and_interrupts_latch)
	begin
		if NEG_EL_FCODE = '0' then
			L <= "00000000000" & faults_and_interrupts_latch & '0';
		else
			L <= (others => 'U');
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_5
	process (NEG_RESET,output_encoder(6),NEG_IRQ5)
	begin
		if (NEG_RESET and output_encoder(6)) = '0' then
			interrupt_ff(5) <= not '0';
		elsif falling_edge(NEG_IRQ5) then
			interrupt_ff(5) <= not '1';
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_4
	process (NEG_RESET,output_encoder(5),NEG_IRQ4)
	begin
		if (NEG_RESET and output_encoder(5)) = '0' then
			interrupt_ff(4) <= not '0';
		elsif falling_edge(NEG_IRQ4) then
			interrupt_ff(4) <= not '1';
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_3
	process (NEG_RESET,output_encoder(4),NEG_IRQ3)
	begin
		if (NEG_RESET and output_encoder(4)) = '0' then
			interrupt_ff(3) <= not '0';
		elsif falling_edge(NEG_IRQ3) then
			interrupt_ff(3) <= not '1';
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_2
	process (NEG_RESET,output_encoder(3),NEG_IRQ2)
	begin
		if (NEG_RESET and output_encoder(3)) = '0' then
			interrupt_ff(2) <= not '0';
		elsif falling_edge(NEG_IRQ2) then
			interrupt_ff(2) <= not '1';
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_1
	process (NEG_RESET,output_encoder(2),NEG_IRQ1)
	begin
		if (NEG_RESET and output_encoder(2)) = '0' then
			interrupt_ff(1) <= not '0';
		elsif falling_edge(NEG_IRQ1) then
			interrupt_ff(1) <= not '1';
		end if;
	end process;
	
	-- Implement the FlipFlopD for IRQ_0
	process (NEG_RESET,output_encoder(1),NEG_IRQ0)
	begin
		if (NEG_RESET and output_encoder(1)) = '0' then
			interrupt_ff(0) <= not '0';
		elsif falling_edge(NEG_IRQ0) then
			interrupt_ff(0) <= not '1';
		end if;
	end process;

end Behavioral;

