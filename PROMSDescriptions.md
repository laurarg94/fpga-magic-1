# Introduction #

This document will explain how the microcode will be stored in PROMS


# Details #

In order to maintain the circuitry regarding the Control part simpler M1 uses the microcode stored in PROMS in this way you gain more flexibility. M1 uses 5 Proms(U1,U2,U3,U4,U5) chips forming a 40 bit microinstruction.

![http://i219.photobucket.com/albums/cc244/leonardoaraujo/PromsCircuitry.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/PromsCircuitry.png)

Taking a look to the schematic we can easily observe each prom forming the control signals to be decoded.

| **PROM name** | **PROM hex filename** | **Signals created** |
|:--------------|:----------------------|:--------------------|
| U1            | prom4.hex             | ALUOP\_SZ, ALUOP(0..1), USE\_CARRY, LATCH\_SZ, NEGATE\_BR, RUSER\_PTB, CODE\_PTB |
| U2            | prom3.hex             | EL(0..3), ER(0..1), RIMMVAL(0..1)|
| U3            | prom2.hex             | E\_MDR\_HI, PRIV, XL\_MODE, XL\_PAGING, MISC(0..3)|
| U4            | prom1.hex             | Latch(0..3) XL\_MAR, XL\_MDR\_LO, XL\_MDR\_HI|
| U5            | prom0.hex             | Next(0..7)          |

The signals are better explained in **[here](MicroinstructionBits.md)**
These hex files are created with **[prombits.h](Prombits.md)**

Here you can see the **[PROM Hex listing](PROMHex.md)** in Intel Hex format. Those Hex files will be converted to VHDL using a tool called srecord http://srecord.sourceforge.net/

**srec\_cat prom0.hex -Intel -o prom0.vhd -VHdl**

This will create an VHDL description of a PROM with the hex contents.

http://code.google.com/p/fpga-magic-1/source/browse/trunk/prom0.vhd

http://code.google.com/p/fpga-magic-1/source/browse/trunk/prom1.vhd

http://code.google.com/p/fpga-magic-1/source/browse/trunk/prom2.vhd

http://code.google.com/p/fpga-magic-1/source/browse/trunk/prom3.vhd

http://code.google.com/p/fpga-magic-1/source/browse/trunk/prom4.vhd

Other option is to use FPGA Block Ram memory, so as we configure the FPGA we could load the microinstruction as .COE files

**Sample:** http://www.xilinx.com/itp/xilinx9/help/iseguide/mergedProjects/coregen/html/cgn_coe_file_syntax.htm

# Reading instructions from PROMs #
Now we're going to explain a instruction **halt** from the proms perspective.

If you read the halt instruction in **[microcode](Microcode.md)** you have:

|**Microcode Index**|**Instruction**|**Operations**|
|:------------------|:--------------|:-------------|
|0x00               |halt           |MISC(M\_HALT),DEC\_TO\_Z(R\_PC),L(R\_PC,LWORD),CODE,NEXT(Fetch)|

Also if you read in **[prombits.h](Prombits.md)** you have:
```
/* 0 */ {(0x100&0xff),3,1,0,0,0,0,0,0,0,2,3,1,3,0,3,0,1,0,0,1}
```

Also reading the **[microinstruction bits](MicroinstructionBits.md)** to verify the fields lenght in bits and converting the values from hexadecimal to binary we have:

| **next:8** | **latch:4** | **lmar:1** | **lmdrlo:1** | **lmdrhi:1** | **emdrlo:1** | **emdrhi:1** | **priv:1** | **lmode:1** | **lpaging:1** | **misc:4** | **e\_l:4** | **e\_r:2** | **immval:2** | **aluop\_size:1** | **aluop:2** | **carry:1** | **l\_size:1** | **br\_sense:1** | **user\_ptb:1** | **code\_ptb:1** |
|:-----------|:------------|:-----------|:-------------|:-------------|:-------------|:-------------|:-----------|:------------|:--------------|:-----------|:-----------|:-----------|:-------------|:------------------|:------------|:------------|:--------------|:----------------|:----------------|:----------------|
|00000000    |0011         |1           |0             |0             |0             |0             |0           |0            |0              |0010        |0011        |01          |11            |0                  |11           |0            |1              |0                |0                |1                |

Looking those bits separated by proms we got:

| **prom 0** | **prom 1** | **prom 2** | **prom 3** | **prom 4** |
|:-----------|:-----------|:-----------|:-----------|:-----------|
|00000000    |00111000    |00000010    |00110111    |01101001    |

Now let's read the first line looking for the first byte of each prom hex file
| **prom0** | **prom1** | **prom2** | **prom3** | **prom4** |
|:----------|:----------|:----------|:----------|:----------|
|:10000000003E3636364136362E39393939393939A6|:10000000135308080853080853101010101010104C|:1000000020000000000000000000000000000000D0|:10000000D353D2DBD453D6D753D5D5D5D5D5D5D523|:100000009696121212961212960202020202020230|
| **byte 0** | **byte 1** | **byte 2** | **byte 3** | **byte 4** |
| 0x00      | 0x13      | 0x20      | 0xD3      | 0x96      |

Converting those bytes to binary we got:

**00000000 00010011 00100000 11010011 10010110**  (From Proms)

**00000000 00111000 00000010 00110111 01101001**  (From prombits.h)

That's happen because the way gcc packs bit fields in structures (And this behavior is not default, all compilers could be different).
Let's start with the next field, as this field fills a full byte it is stored equal in prombits and in Proms hex, now going from right to left in the Proms schematics you have:

|latch:4|
|:------|
|lmar:1 |
|lmdrlo:1|
|lmdrhi:1|
|emdrlo:1|

Wich match exatcly with prombits.h
|latch:4|3(0011)|
|:------|:------|
|lmar:1 |1      |
|lmdrlo:1|0      |
|lmdrhi:1|0      |
|emdrlo:1|0      |

But will not match with the byte comming from prom 1 (0x13), which seems wrong at first. However, if you parse it into fields from least significant to most significant, it works out.  0x13 is **00010011** , but from left to right in fields it is **0011 1 0 0 0** Wich is exactly what we want.

|latch:4|3(0011)|
|:------|:------|
|lmar:1 |1      |
|lmdrlo:1|0      |
|lmdrhi:1|0      |
|emdrlo:1|0      |

So this inverse bits reading is what is done in hardware.
![http://i219.photobucket.com/albums/cc244/leonardoaraujo/Understand_Proms.png](http://i219.photobucket.com/albums/cc244/leonardoaraujo/Understand_Proms.png)