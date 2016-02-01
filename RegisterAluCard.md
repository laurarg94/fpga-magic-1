# Introduction #

The register and Alu card includes most of the datapath of Magic-1, who receives control signals from Control card in order to execute each microinstruction of Magic-1 programs.


# Details #

This card will be described and will include the following parts:
  * ALU
  * General Registers
    1. Register A
    1. Register B
    1. Register C
    1. Register DP
    1. Register SP
    1. Register SSP
    1. Register PC
    1. Register TPC
  * MDR
  * MSW (Control and Flags bits)
  * Special Registers
    1. Register MAR

## ALU ##
The ALU handles all logic and arithimetic operations of Magic-1, ALU operands will be the L and R bus and will post the results in the Z bus, the ALU can also work with 8/16 bits wich is controled by the "aluop\_size" opcode bit.

Magic-1 ALU will handle the following operations:
  1. Operation AND
  1. Operation SUB
  1. Operation ADD
  1. Operation determined in IR(1..3)

The ALU card were made with 74F381 (ALU) chip wich has much more operations but for simplicity m1(Magic-1) will use just this operations:
| **Code** | **Operation** |
|:---------|:--------------|
| 0        | _Not used_    |
| 1        | _Not used_    |
| 2        | sub           |
| 3        | add           |
| 4        | xor           |
| 5        | or            |
| 6        | and           |
| 7        | _Not used_    |

If you check the ALU schematic you will see 2 extended operations selected by the **ALUOP\_SZ** and **DO\_RSHIFT** this operations refer to the Sign extension and Right shift
| **Operation** | **Description** |
|:--------------|:----------------|
| Sign extension | ALU(8) will be copied to ALU(0..7) |
| Right shift   | Z(0)=0 Z(1)=ALU(0) Z(2)=ALU(1) Z(3)=ALU(2) Z(4)=ALU(3) Z(5)=ALU(4) Z(6)=ALU(5) Z(7)=ALU(6)|

Remembering that we're working with Big endian, so the most significant bit will be bit(0)

Exemple:

**10011100**

|bit(0)=1|
|:-------|
|bit(1)=0|
|bit(2)=0|
|bit(3)=1|
|bit(4)=1|
|bit(5)=1|
|bit(6)=0|
|bit(7)=0|

Let's make an example on how IR(1..3) bits is used to select some ALU operation
"XOR.16 A,A" , on the **[Microcode listing](Microcode.md)** you will verify that his value is 0x46 wich in binary is **01001100** if you select the 1..3 bits (Remember we're big endian guys) we will have the value **100** wich will select the operation 4 in our table above.

Also ALU uses carry in bit, if you put low in signal USE\_CARRY no carry will be used, otherwise, if USE\_CARRY = 1, you should use as carry bit the MSW carry bit.


Here is the link for the ALU VHDL description:

http://code.google.com/p/fpga-magic-1/source/browse/trunk/ALU.vhd

Here is a simulation:
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/ALU_SIM.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/ALU_SIM.png)

## MSW ##
This register will hold the ALU results flags and some control bits.

| **Flag** | **Description** |
|:---------|:----------------|
| Zero     | Result of some ALU operation returned zero |
| Carry    | A Carry operation occurs when some arithimetic operation overflowed the ALU size  |
| Sign     | Indicate if the result of ALU is positive or negative|
| Overflow | Occurs when the sum of two positive numbers lead to a negative result|

Here is a simulation:

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/MSW_SIM.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/MSW_SIM.png)

Here is the link of MSW VHDL description:

http://code.google.com/p/fpga-magic-1/source/browse/trunk/MSW.vhd



## General Registers ##
This card stores the value of the following registers:

| **Register** | **Description** |
|:-------------|:----------------|
| A            | Accumulator.  Can be addressed as 8 or 16 bits.  Implied target of most operations and also used as a general load/store base register and memop operand. |
| B            | General load/store base register, plus source operand of alu ops and memops and target of some loads.  |
| C            | Special-purpose count register for block moves and variable shifts.|
| DP           | Global data pointer.  Most data references are relative to a base.|
| SP           | Stack pointer.  Always pushes and pop 16 bits at a time.|
| SSP          | Supervisor stack pointer.  Used when in supervisor mode.|
| PC           | Program Counter |
| TPC          | Temporary Program Counter |

Here is the link of General Registers VHDL description:

http://code.google.com/p/fpga-magic-1/source/browse/trunk/GeneralRegisters.vhd

## Special Registers ##
This card stores the value of the following registers:
| **Register** | **Description** |
|:-------------|:----------------|
| MAR          | Register used to Access memory in Page Table. |
| IMMVAL       | Imediate value.  |

Here is the link of Special Registers VHDL description:

http://code.google.com/p/fpga-magic-1/source/browse/trunk/SpecialRegisters.vhd