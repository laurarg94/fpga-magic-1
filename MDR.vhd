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
           L : out  STD_LOGIC_VECTOR (0 to 15);
           D : out  STD_LOGIC_VECTOR (0 to 7));
end MDR;

architecture Behavioral of MDR is

begin


end Behavioral;

