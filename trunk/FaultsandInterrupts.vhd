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
    Port ( RESET : in  STD_LOGIC;
           IRQ0 : in  STD_LOGIC;
           IRQ1 : in  STD_LOGIC;
           IRQ2 : in  STD_LOGIC;
           IRQ3 : in  STD_LOGIC;
           IRQ4 : in  STD_LOGIC;
           IRQ5 : in  STD_LOGIC;
           EL_FCODE : in  STD_LOGIC;
           MSWM : in  STD_LOGIC;
           PRIV : in  STD_LOGIC;
           MSWV : in  STD_LOGIC;
           TRAPO : in  STD_LOGIC;
           CLKM : in  STD_LOGIC;
           DMA_REQ : in  STD_LOGIC;
           MSWE : in  STD_LOGIC;
           NP : in  STD_LOGIC;
           NW : in  STD_LOGIC;
           BKPT : in  STD_LOGIC;
           SYSCALL : in  STD_LOGIC;
           IOCLK : in  STD_LOGIC;
           NEXT0 : in  STD_LOGIC;
           CLKS : in  STD_LOGIC;
           CLR_TRAP : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (0 to 15);
           RL_FAULT : out  STD_LOGIC;
           ENCODER : out  STD_LOGIC_VECTOR (0 to 3);
           FAULT_PENDING : out  STD_LOGIC);
end FaultsandInterrupts;

architecture Behavioral of FaultsandInterrupts is

begin


end Behavioral;

