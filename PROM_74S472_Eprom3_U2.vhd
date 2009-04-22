----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Leonardo Araujo dos Santos
-- 
-- Create Date:    02:03:05 04/17/2009 
-- Design Name: 	 ALU Magic-1
-- Module Name:    PROM_74S472 - Behavioral 
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
use IEEE.numeric_std.all;

use work.eprom_defs_pack.all;
use work.eprom_pack_3.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROM_74S472_Eprom3_U2 is	
    Port ( CE : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(8 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end PROM_74S472_Eprom3_U2;

architecture Behavioral of PROM_74S472_Eprom3_U2 is

begin
	-- Process to describe generic PROM memory
	process (CE,A)
	begin 
		if (CE = '0') then
			O <= eprom_rom_3(conv_integer(A));
		else 
			O <= (others => 'Z');
		end if;
	end process;

end Behavioral;

