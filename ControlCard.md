# Introduction #

This card includes the Control part of Magic-1 it fetches and decodes each instruction to generate signals to control the data path.


# Details #

This card includes the following  parts

| **Part** | **Description** |
|:---------|:----------------|
| Microcode | It uses the magic-1 opcodes to fetch the microinstruction data from Proms |
| Field Decode | Prepare signals delivered from Microcode |
| Faults and Interrupts | Stores Interrupt, Fault bits and Encoder signal marshalled to Microcode |


## Microcode ##

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/Microcode_Schematic.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/Microcode_Schematic.png)

This part will use the following signals:
  * IR
  * ENCODER
  * Next

As indexes for PROM microinstruction area, so after fetching each microinstruction it will create the 40 bit signals needed for controlling magic-1.

It also handles the branch (jumps in code)

And stores IR signal.

This module is described here:

http://code.google.com/p/fpga-magic-1/source/browse/trunk/Microcode.vhd

### IF(Instruction Fetch) ###
The instruction fetch process will load the instruction from the PROMS using the opcode index.


## Faults and Interrupts ##
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/FaultsInterrupts.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/FaultsInterrupts.png)

There are times that we want to break the endless loop of Magic-1 instruction engine, for doing this we will need:
  * Faults: Represent situations in which something has happened during the execution of the code that prevents further progress.
  * Interrupts: Requests for attention by devices outside of the CPU

Here is a list of common Interrupts and Faults samples:

| **Event** | **Kind** |
|:----------|:---------|
| Page not present | Fault    |
| Page not writeable | Fault    |
| Privilege violation | Fault    |
| Heartbeat timer | Interrupt |
| interrupt Serial port | Interrupt |
|  Keyboard | Interrupt |

There's also the syscall instruction, which will be implemented as a flavor of fault. This instruction must cause a transition into supervisor mode, which faults and interrupts automatically do. A difference between syscall and normal faults is that when we return after processing a syscall, we want to return to the instruction following the sysceall op.


Complete explanation [here](http://www.homebrewcpu.com/braindump.htm)

## Field Decode ##
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/FieldDecode1.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/FieldDecode1.png)
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/FieldDecode2.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/FieldDecode2.png)
The
[decode](http://www.cs.umd.edu/class/sum2003/cmsc311/Notes/CompOrg/fetchDecode.html) process consist in fetching all the needed operands. For example the ` "add.16 (--A),(--B)",IM_NONE,IM_NONE ` will add the values of A and B registers, then the values of register A and B need to be fetched from Datapath. Also the FieldDecode card will be responsible to create signals depending on the bits on IR,LATCH,MISC. (Decoding process)