--
-- Example ROM definitions pack for type-independent srecord output
-- Copyright (C) 2000 Hendrik De Vloed - hendrik.devloed@rug.ac.be
-- Copyright (C) 2007 Peter Miller
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 3 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program. If not, see
--      <http://www.gnu.org/licenses/>.
--
library IEEE;
use IEEE.std_logic_1164.all;
package x_defs_pack is
        -- The basic type of the data word stored in the ROM. Define
        -- your ROM's width here.
        subtype eprom_entry is std_logic_vector(7 downto 0); -- 11
        -- The type used to represent the ROM. Define your range
        -- here.
        type eprom_rom_array is array(0 to 511) of eprom_entry;
        -- The "Don't Care" value used to fill unused parts of the ROM.
        constant eprom_dont_care : eprom_entry := (others=>'-');
        -- The conversion function used to make srecord's output
        -- independent of the actual rom_entry type and # of bits.
        function x_entry(data:natural) return eprom_entry;
end package;

library IEEE;
use IEEE.numeric_std.all;
package body x_defs_pack is
        function x_entry(data:natural) return eprom_entry is
        begin
                return std_logic_vector(to_unsigned(data,eprom_entry'length));
        end x_entry;
end package body;
