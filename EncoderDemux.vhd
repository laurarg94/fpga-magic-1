----------------------------------------------------------------------------------
-- Company: 		 Residencia
-- Engineer: 		 Leonardo Araujo dos Santos
-- 
-- Create Date:    22:30:47 05/10/2009 
-- Design Name: 
-- Module Name:    EncoderDemux - Behavioral 
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

entity EncoderDemux is
    Port ( E3 : in  STD_LOGIC;
           E2 : in  STD_LOGIC;
           E1 : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (2 downto 0);  -- A2,A1,A0
           Output : out  STD_LOGIC_VECTOR (7 downto 0)); -- O7,O6,O5,O4,O3,O2,O1,O0
end EncoderDemux;

architecture Behavioral of EncoderDemux is

begin
	-- This module will describe the behavior of 74f138 Encoder/Demultiplexer
	process (E3,E2,E1,Address)
	begin
		if E3='1' and E2='0' and E1='0' then
			case Address is
				when "000" =>
					Output <= "11111110";
				when "001" =>
					Output <= "11111101";
				when "010" =>
					Output <= "11111011";				
				when "011" =>
					Output <= "11110111";
				when "100" =>
					Output <= "11101111";
				when "101" =>
					Output <= "11011111";
				when "110" =>
					Output <= "10111111";
				when "111" =>
					Output <= "01111111";
				when others =>
					Output <= (others => 'X');
			end case;
		else 
			Output <= (others => '1');
		end if;
	end process;

end Behavioral;

