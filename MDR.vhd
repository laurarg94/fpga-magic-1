----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:58 04/04/2009 
-- Design Name: 
-- Module Name:    MDR - Behavioral 
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

entity MDR is
    Port ( DBUS : inout  STD_LOGIC_VECTOR (0 to 7);
           RW : in  STD_LOGIC;
           DMA_ACK : in  STD_LOGIC;
           Z : in  STD_LOGIC_VECTOR (0 to 15);
           XL_MDR_HI : in  STD_LOGIC;
           XL_MDR_LO : in  STD_LOGIC;
           L_MDR_HI : in  STD_LOGIC;
           L_MDR_LO : in  STD_LOGIC;
           COMMIT : in  STD_LOGIC;
           E_MDR_HI : in  STD_LOGIC;
           E_MDR_LO : in  STD_LOGIC;
           ER_MDR : in  STD_LOGIC;
           EL_MDR : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (0 to 15);
           L : out  STD_LOGIC_VECTOR (0 to 15));
end MDR;

architecture Behavioral of MDR is
	signal D :  std_logic_vector (0 to 7);
	signal MDR_HIGH : std_logic_vector(0 to 7);
	signal MDR_LOW : std_logic_vector(0 to 7);
begin
	-- Process to implement behavior of 74f245, the DMA_ACK signal will detach MDR from memory bus (DBUS) so
	-- the data bus (DBUS) can be driven by panel switches
	process (RW,DMA_ACK,DBUS)
	begin
		if DMA_ACK = '0' then
			DBUS <= (others => 'Z');
		else
			if RW = '0' then
				-- B to A (DBUS to D)
				D <= DBUS;
			else
				-- A to B (D to DBUS)
				DBUS <= D;
			end if;
		end if;
	end process;
	
	-- Process to describe row of 4 74153(U62 63 64 65) used to select DataBus,Z(0..7), or
	-- or the value of bit 7 of the low byte (i.e. - for sign extension). And describe also
	-- 74273 octal D ff
	process (XL_MDR_HI,XL_MDR_LO,Z(0 to 7),D(0 to 7),COMMIT,L_MDR_HI)
	variable concat_sel : std_logic_vector(0 to 1);
	begin
		concat_sel := XL_MDR_LO & XL_MDR_HI;
		if COMMIT = '1' then
			MDR_HIGH <= (others => '0');
		else
			if rising_edge(L_MDR_HI) then
				-- Can be from D,Z or D(0)				
				case concat_sel is
					
					-- From Z
					when "00" =>
						MDR_HIGH <= Z(0 to 7);
					
					-- From D
					when "01" =>
						MDR_HIGH <= D(0 to 7);  
					
					-- Sign extension??
					when "11" =>					
						MDR_HIGH <= D(0) & D(0) & D(0) & D(0) & D(0) & D(0) & D(0) & D(0);
					when others =>
						null;
				end case;
			end if;
		end if;
	end process;
	
	-- Process to describe row of 2x 74157 for select of DataBus or Z into 74273 octal D FF
	-- used to store low byte of MDR
	process(XL_MDR_LO,D(0 to 7) Z(8 to 15),COMMIT, L_MDR_LO)
	begin
		if COMMIT = '1' then
			MDR_LOW <= (others => '0');
		else
			if rising_edge(L_MDR_LO) then
				case XL_MDR_LO is
					when '0' =>
						MDR_LOW <= Z(8 to 15);
					when '1' =>
						MDR_LOW <= D(0 to 7);  
					when others =>
						null;
				end case;
			end if;
		end if;
	end process;
	

end Behavioral;

