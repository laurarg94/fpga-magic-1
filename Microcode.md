# Introduction #

This document will list all microcode stored in Magic-1 PROMS. In order to understand those symbols in the **Operations** field take a look at **[Operation definitions listing](MicroinstructionDefines.md)**

The microcode will be stored in 5 PROMS forming a array of 512x40 bits memory. This proms files are included in

For look at all 256 instruction opcodes of M1 look at **[Opcode listing](Opcodes.md)**

We're going to show a simple opcode for ilustrate the process.

**add.16 a,b**

This instruction index is 0x3f if you check the "Operations" field you will check this values:

**TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)**

| **Operations** |	**Description**	|
|:---------------|:----------------|
| TO\_Z(R\_B)    | Place the contents of register B in Z bus |
| L(R\_MDR,LWORD) | Store the contents of Z in MDR register as a 16 bits word |
| NEXT(Aluop16)  | Continue the execution at the label **Aluop16** wich index is 0x117  |

So continuing the execution in 0x117 we got:

**E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_IR13,WORD,NO\_CARRY),L(R\_A,LWORD),MISC(M\_SET\_FLAGS),NEXT(Fetch)**

| **Operations** |	**Description**	|
|:---------------|:----------------|
| E\_L(R\_A)     | place the contents of the A register on the L bus |
| E\_R(ER\_MDR)  | place the contents of the MDR register on the R bus |
| ALU(OP\_IR13,WORD,NO\_CARRY) | perform an ALU operation based on bits 1-3 of the value in the instruction register (which in this case selects an ADD operation), do the operation using 16 bits, and feed a "0" in for incoming carry). |
| L(R\_A,LWORD)  | Store the contents of Z in A register as a 16 bits word |
| MISC(M\_SET\_FLAGS) | Set the Z, C, V and S bits of the MSW based on the result of the ALU operation |
| NEXT(Fetch)    | Go to the Fetch(0x100) microinstruction to start the next instruction. |

Continuing the execution in 0x100 we got:

**FETCH\_OP**

| **Operations** |	**Description**	|
|:---------------|:----------------|
| FETCH\_OP      | Searching this symbol "FETCH\_OP" in **[Operation definitions listing](MicroinstructionDefines.md)** we got **READLO,MISC(M\_INIT\_INST),INC\_TO\_Z(R\_MAR),L(R\_PC,LWORD),CODE,NEXT(UNUSABLE)** |

| **Operations** |	**Description**	|
|:---------------|:----------------|
| READLO         | Enable low part of MDR |
| MISC(M\_INIT\_INST)| Put value M\_INIT\_INST in misc field of ... wich means init\_inst (clear MDR, PC->TPC, latch IR)  |
| INC\_TO\_Z(R\_MAR)| Increment content of Z and store the result in MAR register |
| L(R\_PC,LWORD) | Store the contents of Z in PC register as a 16 bits word |
| CODE           | SET\_ADR(CODE\_SPACE,PTB\_NORMAL) |
| NEXT(UNUSABLE) | Finish the microinstruction |


# Details #
| **Microcode Index** |	**Instruction**	|	**Operations** |
|:--------------------|:----------------|:---------------|
|0x00                 |	halt	           |	MISC(M\_HALT),DEC\_TO\_Z(R\_PC),L(R\_PC,LWORD),CODE,NEXT(Fetch)                                 |
|0x01                 |	ld.8 A,#u16\_u8\_10(SP)	|	LDIMMHI,NEXT(Lda8\_16)                                                      |
|0x02                 |	push C	         |	TO\_Z(R\_C),L(R\_MDR,LWORD),NEXT(Push16)                                                      |
|0x03                 |	push PC	        |	TO\_Z(R\_TPC),L(R\_MDR,LWORD),NEXT(Push16)                                                    |
|0x04                 |	push DP	        |	TO\_Z(R\_DP),L(R\_MDR,LWORD),NEXT(Push16)                                                     |
|0x05                 |	 ld.8 B,#u16\_u8\_10(SP)	|	LDIMMHI,NEXT(Ldb8\_16)                                                      |
|0x06                 |	push A	         |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Push16)                                                      |
|0x07                 |	push B	         |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Push16)                                                      |
|0x08                 |	br.ne #d16	     |	LDIMMHI,NEXT(BrNegated)                                                                |
|0x09                 |	pop MSW	        |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0a                 |	pop C	          |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0b                 |	pop PC	         |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0c                 |	pop DP	         |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0d                 |	pop SP	         |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0e                 |	pop A	          |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x0f                 |	pop B	          |	TO\_Z(R\_SP),DATA,NEXT(Pop16)                                                                |
|0x10                 |	ld.8 A,#u16(DP)	|	LDIMMHI,NEXT(Lda8\_16)                                                              |
|0x11                 |	ld.8 A,#u8(SP)	 |	LDIMMLO,NEXT(Lda8\_8)                                                               |
|0x12                 |	ld.8 A,#u16(A)	 |	LDIMMHI,NEXT(Lda8\_16)                                                              |
|0x13                 |	ld.8 A,#u16(B)	 |	LDIMMHI,NEXT(Lda8\_16)                                                              |
|0x14                 |	ld.8 B,#u16(DP)	|	LDIMMHI,NEXT(Ldb8\_16)                                                              |
|0x15                 |	ld.8 B,#u8(SP)	 |	LDIMMLO,NEXT(Ldb8\_8)                                                               |
|0x16                 |	ld.8 B,#u16(A)	 |	LDIMMHI,NEXT(Ldb8\_16)                                                              |
|0x17                 |	ld.8 B,#u16(B)	 |	LDIMMHI,NEXT(Ldb8\_16)                                                              |
|0x18                 |	ld.16 A,#u16(DP)	|	LDIMMHI,NEXT(Lda16\_16)                                                         |
|0x19                 |	ld.16 A,#u16\_u8\_68(SP)	|	LDIMMHI,NEXT(Lda16\_16)                                                     |
|0x1a                 |	ld.16 A,#u16(A)	|	LDIMMHI,NEXT(Lda16\_16)                                                             |
|0x1b                 |	ld.16 A,#u16(B)	|	LDIMMHI,NEXT(Lda16\_16)                                                             |
|0x1c                 |	ld.16 B,#u16(DP)	|	LDIMMHI,NEXT(Ldb16\_16)                                                         |
|0x1d                 |	 ld.16 B,#u16\_u8\_68(SP)	|	LDIMMHI,NEXT(Ldb16\_16)                                                     |
|0x1e                 |	ld.16 B,#u16(A)	|	LDIMMHI,NEXT(Ldb16\_16)                                                             |
|0x1f                 |	ld.16 B,#u16(B)	|	LDIMMHI,NEXT(Ldb16\_16)                                                             |
|0x20                 |	sub.8 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x21                 |	sub.8 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x22                 |	push MSW	       |	TO\_Z(R\_MSW),L(R\_MDR,LWORD),NEXT(Push16)                                                |
|0x23                 |	sub.8 A,#u16(B)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x24                 |	sub.8 A,#i8\_1	 |	LDIMMLO,NEXT(Aluop8)                                                               |
|0x25                 |	 sub.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16)                                                |
|0x26                 |	push SP	        |	TO\_Z(R\_SP),L(R\_MDR,LWORD),NEXT(Push16)                                                     |
|0x27                 |	sub.8 A,B	      |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop8)                                                  |
|0x28                 |	sub.16 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x29                 |	sub.16 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x2a                 |	 sbc.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16Carry)                                           |
|0x2b                 |	sub.16 A,#u16(B)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x2c                 |	sub.16 A,#i16\_exti8	|	LDIMMHI,NEXT(Aluop16\_16)                                                       |
|0x2d                 |	sub.16 A,#exti8	|	LDIMMEXT,NEXT(Aluop16)                                                             |
|0x2e                 |	wcpte A,(B)	    |	PRIV(1),TO\_Z(R\_B),SET\_ADR(CODE\_SPACE,PTB\_OVERRIDE),NEXT(Wcpte)                         |
|0x2f                 |	sub.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x30                 |	add.8 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x31                 |	add.8 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x32                 |	br A	           |	TO\_Z(R\_A),L(R\_PC,LWORD),CODE,NEXT(Fetch)                                                   |
|0x33                 |	add.8 A,#u16(B)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x34                 |	add.8 A,#i8\_1	 |	LDIMMLO,NEXT(Aluop8)                                                               |
|0x35                 |	 add.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16)                                                |
|0x36                 |	add.8 A,A	      |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Aluop8)                                                  |
|0x37                 |	add.8 A,B	      |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop8)                                                  |
|0x38                 |	add.16 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x39                 |	add.16 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x3a                 |	syscall #sys\_num8	|	LDIMMLO,NEXT(Syscall)                                                          |
|0x3b                 |	add.16 A,#u16(B)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x3c                 |	add.16 A,#i16\_exti8	|	LDIMMHI,NEXT(Aluop16\_16)                                                       |
|0x3d                 |	add.16 A,#exti8	|	LDIMMEXT,NEXT(Aluop16)                                                             |
|0x3e                 |	add.16 A,A	     |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x3f                 |	add.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x40                 |	cmp.8 A,#u16(DP)	|	LDIMMHI,NEXT(Cmp8\_indir16)                                                     |
|0x41                 |	cmp.8 A,#u16(SP)	|	LDIMMHI,NEXT(Cmp8\_indir16)                                                     |
|0x42                 |	 copy C,B	      |	 TO\_Z(R\_B),L(R\_C,LWORD),NEXT(Fetch)                                                    |
|0x43                 |	cmp.8 A,#u16(B)	|	LDIMMHI,NEXT(Cmp8\_indir16)                                                         |
|0x44                 |	cmp.8 A,#i8\_0	 |	LDIMMLO,NEXT(Cmp8)                                                                 |
|0x45                 |	cmp.8 A,#0	     |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,BYTE,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(Fetch)           |
|0x46                 |	xor.16 A,A	     |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x47                 |	cmp.8 A,B	      |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmp8)                                                    |
|0x48                 |	cmp.16 A,#u16(DP)	|	LDIMMHI,NEXT(Cmp16\_indir16)                                                    |
|0x49                 |	cmp.16 A,#u16(SP)	|	LDIMMHI,NEXT(Cmp16\_indir16)                                                    |
|0x4a                 |	 sh0add B,A,B	  |	 TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(LeaB1)                                              |
|0x4b                 |	cmp.16 A,#u16(B)	|	LDIMMHI,NEXT(Cmp16\_indir16)                                                    |
|0x4c                 |	cmp.16 A,#i16\_exti8\_0	|	LDIMMHI,NEXT(Cmp16\_16)                                                     |
|0x4d                 |	cmp.16 A,#exti8\_0	|	LDIMMEXT,NEXT(Cmp16)                                                           |
|0x4e                 |	cmp.16 A,#0	    |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,WORD,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(Fetch)           |
|0x4f                 |	cmp.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmp16)                                                   |
|0x50                 |	or.8 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x51                 |	or.8 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x52                 |	sex A	          |	TO\_Z8(R\_A),L(R\_A,LWORD),NEXT(Fetch)                                                        |
|0x53                 |	or.8 A,#u16(B)	 |	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x54                 |	or.8 A,#i8\_1	  |	LDIMMLO,NEXT(Aluop8)                                                               |
|0x55                 |	 or.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16)                                                |
|0x56                 |	br.leu #d16	    |	LDIMMHI,NEXT(BrNormal)                                                                 |
|0x57                 |	or.8 A,B	       |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop8)                                                  |
|0x58                 |	or.16 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x59                 |	or.16 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x5a                 |	 sh1add A,B,A	  |	 TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(LeaABA2)                                            |
|0x5b                 |	or.16 A,#u16(B)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                      |
|0x5c                 |	or.16 A,#i16\_exti8	|	LDIMMHI,NEXT(Aluop16\_16)                                                       |
|0x5d                 |	or.16 A,#exti8	 |	LDIMMEXT,NEXT(Aluop16)                                                             |
|0x5e                 |	br.gtu #d16	    |	LDIMMHI,NEXT(BrNegated)                                                                |
|0x5f                 |	or.16 A,B	      |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x60                 |	and.8 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x61                 |	and.8 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                   |
|0x62                 |	 sh1add B,A,B	  |	 TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(LeaBAB2)                                            |
|0x63                 |	and.8 A,#u16(B)	|	LDIMMHI,NEXT(Aluop8\_indir16)                                                       |
|0x64                 |	and.8 A,#i8\_1	 |	LDIMMLO,NEXT(Aluop8)                                                               |
|0x65                 |	 and.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16)                                                |
|0x66                 |	 nop	           |	 NEXT(Fetch)                                                                               |
|0x67                 |	and.8 A,B	      |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop8)                                                  |
|0x68                 |	and.16 A,#u16(DP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x69                 |	and.16 A,#u16(SP)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x6a                 |	 sh1add B,B,A	  |	 TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(LeaBBA2)                                            |
|0x6b                 |	and.16 A,#u16(B)	|	LDIMMHI,NEXT(Aluop16\_indir16)                                                  |
|0x6c                 |	and.16 A,#i16\_exti8	|	LDIMMHI,NEXT(Aluop16\_16)                                                       |
|0x6d                 |	and.16 A,#exti8	|	LDIMMEXT,NEXT(Aluop16)                                                             |
|0x6e                 |	 strcopy	       |	 TO\_Z(R\_B),DATA,NEXT(Strcopy)                                                          |
|0x6f                 |	and.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0x70                 |	lea A,#u16(DP)	 |	LDIMMHI,NEXT(LdaA\_16)                                                              |
|0x71                 |	lea A,#u16(SP)	 |	LDIMMHI,NEXT(LdaA\_16)                                                              |
|0x72                 |	lea A,#u16(A)	  |	LDIMMHI,NEXT(LdaA\_16)                                                              |
|0x73                 |	lea A,#u16(B)	  |	LDIMMHI,NEXT(LdaA\_16)                                                              |
|0x74                 |	lea B,#u16(DP)	 |	LDIMMHI,NEXT(LdaB\_16)                                                              |
|0x75                 |	lea B,#u16(SP)	 |	LDIMMHI,NEXT(LdaB\_16)                                                              |
|0x76                 |	lea B,#u16(A)	  |	LDIMMHI,NEXT(LdaB\_16)                                                              |
|0x77                 |	lea B,#u16(B)	  |	LDIMMHI,NEXT(LdaB\_16)                                                              |
|0x78                 |	ld.8 A,#u8	     |	LDIMMLO,NEXT(LdiA8)                                                                    |
|0x79                 |	ld.8 B,#u8	     |	LDIMMLO,NEXT(LdiB8)                                                                    |
|0x7a                 |	ld.16 A,#exti8\_u16	|	LDIMMEXT,NEXT(LdiA16)                                                          |
|0x7b                 |	ld.16 B,#exti8\_u16	|	LDIMMEXT,NEXT(LdiB16)                                                          |
|0x7c                 |	ld.16 A,#u16	   |	LDIMMHI,NEXT(LdiA16\_lo)                                                            |
|0x7d                 |	ld.16 B,#u16	   |	LDIMMHI,NEXT(LdiB16\_lo)                                                            |
|0x7e                 |	adc.16 A,A	     |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Adc16)                                                   |
|0x7f                 |	adc.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Adc16)                                                   |
|0x80                 |	call #d16	      |	 LDIMMHI,NEXT(CallImm)                                                                 |
|0x81                 |	ld.16 A,#u8(SP)	|	LDIMMLO,NEXT(Lda16\_8)                                                              |
|0x82                 |	call A	         |	TO\_Z(R\_PC),L(R\_MDR,LWORD),NEXT(CallA)                                                      |
|0x83                 |	br #d16\_d8	    |	LDIMMHI,NEXT(RelBrLo)                                                                  |
|0x84                 |	sbr #d8	        |	LDIMMEXT,NEXT(RelBr)                                                                       |
|0x85                 |	ld.16 B,#u8(SP)	|	LDIMMLO,NEXT(Ldb16\_8)                                                              |
|0x86                 |	 lea A,#u8(SP)	 |	 LDIMMLO,NEXT(LeaShort)                                                            |
|0x87                 |	 lea B,#u8(SP)	 |	 LDIMMLO,NEXT(LeaShort)                                                            |
|0x88                 |	copy A,MSW	     |	TO\_Z(R\_MSW),L(R\_A,LWORD),NEXT(Fetch)                                                   |
|0x89                 |	br.eq #d16	     |	LDIMMHI,NEXT(BrNormal)                                                                 |
|0x8a                 |	reti	           |	 PRIV(1),NEXT(Reti)                                                                        |
|0x8b                 |	trapo	          |	MISC(M\_TRAPO),NEXT(Fetch)                                                                  |
|0x8c                 |	bset.8 A,#mask8,#d8	|	LDIMMLO,NEXT(Bset8)                                                            |
|0x8d                 |	bclr.8 A,#mask8,#d8	|	LDIMMLO,NEXT(Bclr8)                                                            |
|0x8e                 |	bset.16 A,#mask16,#d8	|	LDIMMHI,NEXT(Bset16)                                                       |
|0x8f                 |	bclr.16 A,#mask16,#d8	|	LDIMMHI,NEXT(Bclr16)                                                       |
|0x90                 |	cmpb.eq.8 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0x91                 |	cmpb.eq.8 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0x92                 |	copy B,A	       |	TO\_Z(R\_A),L(R\_B,LWORD),NEXT(Fetch)                                                     |
|0x93                 |	cmpb.eq.8 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                                |
|0x94                 |	cmpb.eq.8 A,#i8\_0,#d8	|	LDIMMLO,NEXT(Cmpb8)                                                        |
|0x95                 |	cmpb.eq.8 A,#0,#d8	|	TO\_Z(R\_MDR),L(R\_MDR,LWORD),NEXT(Cmpb8)                                         |
|0x96                 |	copy C,A	       |	TO\_Z(R\_A),L(R\_C,LWORD),NEXT(Fetch)                                                     |
|0x97                 |	cmpb.eq.8 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb8)                                           |
|0x98                 |	cmpb.eq.16 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0x99                 |	cmpb.eq.16 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0x9a                 |	copy A,B	       |	TO\_Z(R\_B),L(R\_A,LWORD),NEXT(Fetch)                                                     |
|0x9b                 |	cmpb.eq.16 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0x9c                 |	cmpb.eq.16 A,#i16\_exti8\_0,#d8	|	LDIMMHI,NEXT(Cmpb16\_16)                                            |
|0x9d                 |	cmpb.eq.16 A,#exti8\_0,#d8	|	LDIMMEXT,NEXT(Cmpb16)                                                  |
|0x9e                 |	cmpb.eq.16 A,#0,#d8	|	TO\_Z(R\_MDR),L(R\_MDR,LWORD),NEXT(Cmpb16)                                        |
|0x9f                 |	cmpb.eq.16 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb16)                                          |
|0xa0                 |	cmpb.lt.8 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xa1                 |	cmpb.lt.8 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xa2                 |	 sh0add A,A,B	  |	 TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(LeaA1)                                              |
|0xa3                 |	cmpb.lt.8 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                                |
|0xa4                 |	cmpb.lt.8 A,#i8\_0,#d8	|	LDIMMLO,NEXT(Cmpb8)                                                        |
|0xa5                 |	cmpb.lt.8 A,#0,#d8	|	TO\_Z(R\_MDR),L(R\_MDR,LWORD),NEXT(Cmpb8)                                         |
|0xa6                 |	br.lt #d16	     |	LDIMMHI,NEXT(BrNormal)                                                                 |
|0xa7                 |	cmpb.lt.8 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb8)                                           |
|0xa8                 |	cmpb.lt.16 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xa9                 |	cmpb.lt.16 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xaa                 |	 sh1add A,A,B	  |	 TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(LeaAAB2)                                            |
|0xab                 |	cmpb.lt.16 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xac                 |	cmpb.lt.16 A,#i16\_exti8,#d8	|	LDIMMHI,NEXT(Cmpb16\_16)                                                |
|0xad                 |	cmpb.lt.16 A,#exti8,#d8	|	LDIMMEXT,NEXT(Cmpb16)                                                      |
|0xae                 |	br.ge #d16	     |	LDIMMHI,NEXT(BrNegated)                                                                |
|0xaf                 |	cmpb.lt.16 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb16)                                          |
|0xb0                 |	cmpb.le.8 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xb1                 |	cmpb.le.8 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xb2                 |	sex B	          |	TO\_Z8(R\_B),L(R\_B,LWORD),NEXT(Fetch)                                                        |
|0xb3                 |	cmpb.le.8 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                                |
|0xb4                 |	cmpb.le.8 A,#i8,#d8	|	LDIMMLO,NEXT(Cmpb8)                                                            |
|0xb5                 |	br.le #d16	     |	LDIMMHI,NEXT(BrNormal)                                                                 |
|0xb6                 |	copy DP,A	      |	TO\_Z(R\_A),L(R\_DP,LWORD),NEXT(Fetch)                                                    |
|0xb7                 |	cmpb.le.8 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb8)                                           |
|0xb8                 |	cmpb.le.16 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xb9                 |	cmpb.le.16 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xba                 |	 adc.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16Carry)                                           |
|0xbb                 |	cmpb.le.16 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xbc                 |	cmpb.le.16 A,#i16\_exti8,#d8	|	LDIMMHI,NEXT(Cmpb16\_16)                                                |
|0xbd                 |	cmpb.le.16 A,#exti8,#d8	|	LDIMMEXT,NEXT(Cmpb16)                                                      |
|0xbe                 |	br.gt #d16	     |	LDIMMHI,NEXT(BrNegated)                                                                |
|0xbf                 |	cmpb.le.16 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb16)                                          |
|0xc0                 |	br.geu #d16	    |	LDIMMHI,NEXT(BrNegated)                                                                |
|0xc1                 |	 st.8 #u16\_u8\_10(SP),A	|	LDIMMHI,NEXT(Sta8\_16)                                                      |
|0xc2                 |	shl.16 A	       |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Shla16)                                                  |
|0xc3                 |	shr.16 A	       |	TO\_Z(R\_A),MISC(M\_RSHIFT),L(R\_A,LWORD),NEXT(Fetch)                                      |
|0xc4                 |	shl.16 B	       |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Shlb16)                                                  |
|0xc5                 |	st.8 #u16\_u8\_10(SP),B	|	LDIMMHI,NEXT(Stb8\_16)                                                      |
|0xc6                 |	shr.16 B	       |	TO\_Z(R\_B),MISC(M\_RSHIFT),L(R\_B,LWORD),NEXT(Fetch)                                      |
|0xc7                 |	xor.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Aluop16)                                                 |
|0xc8                 |	copy PTB,A	     |	PRIV(1),TO\_Z(R\_A),L(R\_PTB,LWORD),NEXT(Fetch)                                           |
|0xc9                 |	st.16 #u16\_u8\_10(SP),A	|	LDIMMHI,NEXT(Sta16\_16)                                                     |
|0xca                 |	copy MSW,A	     |	PRIV(1),NEXT(CopyMSWA)                                                                 |
|0xcb                 |	copy SP,A	      |	TO\_Z(R\_A),L(R\_SP,LWORD),NEXT(Fetch)                                                    |
|0xcc                 |	 xor.16 (--A),(--B)	|	 DEC\_TO\_Z(R\_A),DATA,NEXT(Mop16)                                                |
|0xcd                 |	 st.16 #u16\_u8\_10(SP),B	|	LDIMMHI,NEXT(Stb16\_16)                                                     |
|0xce                 |	ld.16 C,#u16	   |	LDIMMHI,NEXT(LdiC16\_lo)                                                            |
|0xcf                 |	br.ltu #d16	    |	LDIMMHI,NEXT(BrNormal)                                                                 |
|0xd0                 |	st.8 #u16(DP),A	|	LDIMMHI,NEXT(Sta8\_16)                                                              |
|0xd1                 |	st.8 #u8(SP),A	 |	LDIMMLO,NEXT(Sta8\_8)                                                               |
|0xd2                 |	st.8 #u16(A),A	 |	LDIMMHI,NEXT(Sta8\_16)                                                              |
|0xd3                 |	st.8 #u16(B),A	 |	LDIMMHI,NEXT(Sta8\_16)                                                              |
|0xd4                 |	st.8 #u16(DP),B	|	LDIMMHI,NEXT(Stb8\_16)                                                              |
|0xd5                 |	st.8 #u8(SP),B	 |	LDIMMLO,NEXT(Stb8\_8)                                                               |
|0xd6                 |	st.8 #u16(A),B	 |	LDIMMHI,NEXT(Stb8\_16)                                                              |
|0xd7                 |	st.8 #u16(B),B	 |	LDIMMHI,NEXT(Stb8\_16)                                                              |
|0xd8                 |	st.16 #u16(DP),A	|	LDIMMHI,NEXT(Sta16\_16)                                                         |
|0xd9                 |	st.16 #u8(SP),A	|	LDIMMLO,NEXT(Sta16\_8)                                                              |
|0xda                 |	st.16 #u16(A),A	|	LDIMMHI,NEXT(Sta16\_16)                                                             |
|0xdb                 |	st.16 #u16(B),A	|	LDIMMHI,NEXT(Sta16\_16)                                                             |
|0xdc                 |	st.16 #u16(DP),B	|	LDIMMHI,NEXT(Stb16\_16)                                                         |
|0xdd                 |	st.16 #u8(SP),B	|	LDIMMLO,NEXT(Stb16\_8)                                                              |
|0xde                 |	st.16 #u16(A),B	|	LDIMMHI,NEXT(Stb16\_16)                                                             |
|0xdf                 |	st.16 #u16(B),B	|	LDIMMHI,NEXT(Stb16\_16)                                                             |
|0xe0                 |	ldcode.8 A,(B)	 |	TO\_Z(R\_B),CODE,NEXT(Ldcode8)                                                       |
|0xe1                 |	 copy A,DP	     |	 TO\_Z(R\_DP),L(R\_A,LWORD),NEXT(Fetch)                                                   |
|0xe2                 |	ld.16 C,#exti8\_u16	|	LDIMMEXT,NEXT(LdiC16)                                                          |
|0xe3                 |	 memcopy4	      |	 INC2\_TO\_Z(R\_B),DATA,NEXT(Mcpy4)                                                       |
|0xe4                 |	enter #fsize16\_8	|	LDIMMHI,NEXT(Enter)                                                            |
|0xe5                 |	enter #fsize8	  |	NEG1\_TO\_Z,LATCH(R\_MDR),NEXT(Enter)                                                 |
|0xe6                 |	 vshl.16 A	     |	 TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Vshl)                                                   |
|0xe7                 |	 vshl.16 B	     |	 TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Vshl)                                                   |
|0xe8                 |	memcopy	        |	COMPARE\_0(R\_C),MISC(M\_SET\_FLAGS),NEXT(Bcopy)                                               |
|0xe9                 |	tosys	          |	PRIV(1),COMPARE\_0(R\_C),MISC(M\_SET\_FLAGS),NEXT(ToSys)                                       |
|0xea                 |	fromsys	        |	PRIV(1),COMPARE\_0(R\_C),MISC(M\_SET\_FLAGS),NEXT(FromSys)                                     |
|0xeb                 |	ldclr.8 A,(B)	  |	TO\_Z(R\_B),DATA,NEXT(LdClr)                                                         |
|0xec                 |	wdpte A,(B)	    |	PRIV(1),TO\_Z(R\_B),SET\_ADR(DATA\_SPACE,PTB\_OVERRIDE),NEXT(Wdpte)                         |
|0xed                 |	sbc.16 A,B	     |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Sbc16)                                                   |
|0xee                 |	 vshr.16 A	     |	 TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(Vshr)                                                   |
|0xef                 |	 vshr.16 B	     |	 TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Vshr)                                                   |
|0xf0                 |	cmpb.ne.8 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xf1                 |	cmpb.ne.8 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                            |
|0xf2                 |	copy A,C	       |	TO\_Z(R\_C),L(R\_A,LWORD),NEXT(Fetch)                                                     |
|0xf3                 |	cmpb.ne.8 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb8\_indir16)                                                |
|0xf4                 |	cmpb.ne.8 A,#i8\_0,#d8	|	LDIMMLO,NEXT(Cmpb8)                                                        |
|0xf5                 |	cmpb.ne.8 A,#0,#d8	|	TO\_Z(R\_MDR),L(R\_MDR,LWORD),NEXT(Cmpb8)                                         |
|0xf6                 |	copy A,SP	      |	TO\_Z(R\_SP),L(R\_A,LWORD),NEXT(Fetch)                                                    |
|0xf7                 |	cmpb.ne.8 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb8)                                           |
|0xf8                 |	cmpb.ne.16 A,#u16(DP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xf9                 |	cmpb.ne.16 A,#u16(SP),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xfa                 |	bkpt	           |	MISC(M\_BKPT),NEXT(Unreachable)                                                             |
|0xfb                 |	cmpb.ne.16 A,#u16(B),#d8	|	LDIMMHI,NEXT(Cmpb16\_indir16)                                           |
|0xfc                 |	cmpb.ne.16 A,#i16\_exti8\_0,#d8	|	LDIMMHI,NEXT(Cmpb16\_16)                                            |
|0xfd                 |	cmpb.ne.16 A,#exti8\_0,#d8	|	LDIMMEXT,NEXT(Cmpb16)                                                  |
|0xfe                 |	cmpb.ne.16 A,#0,#d8	|	TO\_Z(R\_MDR),L(R\_MDR,LWORD),NEXT(Cmpb16)                                        |
|0xff                 |	cmpb.ne.16 A,B,#d8	|	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Cmpb16)                                          |
|0x100                |	Fetch	          |	FETCH\_OP                                                                                   |
|0x101                |	IRQ5	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x102                |	IRQ4	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x103                |	IRQ3	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x104                |	IRQ2	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x105                |	IRQ1	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x106                |	IRQ0	           |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                                     |
|0x107                |	DMA\_req	       |	 MISC(M\_DMA\_ACK),NEXT(Fetch)                                                               |
|0x108                |	Fault\_syscall	 |	TO\_Z(R\_MAR),MISC(M\_COMMIT),NEXT(Fault)                                             |
|0x109                |		               |	                                                                                               |
|0x10a                |	Fault\_ovflo	   |	TO\_Z(R\_MAR),L(R\_PC,LWORD),NEXT(Fault)                                                  |
|0x10b                |	Fault\_priv	    |	TO\_Z(R\_MAR),L(R\_PC,LWORD),NEXT(Fault)                                                  |
|0x10c                |	Fault\_bkpt	    |	TO\_Z(R\_MAR),L(R\_PC,LWORD),NEXT(Fault)                                                  |
|0x10d                |	Fault\_nw	      |	TO\_Z(R\_MAR),L(R\_PC,LWORD),NEXT(Fault)                                                  |
|0x10e                |	Fault\_np	      |	TO\_Z(R\_MAR),L(R\_PC,LWORD),NEXT(Fault)                                                  |
|0x10f                |		               |	                                                                                               |
|0x110                |	Aluop8\_indir	  |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                            |
|0x111                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x112                |	Aluop8	         |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_IR13,BYTE,NO\_CARRY),L(R\_A,LBYTE),MISC(M\_SET\_FLAGS),NEXT(Fetch) |
|0x113                |	Aluop8\_indir16	|	LDIMMLO,NEXT(Aluop8\_indir)                                                         |
|0x114                |	Aluop16\_indir	 |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                            |
|0x115                |		               |	LDHI,NEXT(FALLTHRU)                                                                            |
|0x116                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x117                |	Aluop16	        |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_IR13,WORD,NO\_CARRY),L(R\_A,LWORD),MISC(M\_SET\_FLAGS),NEXT(Fetch) |
|0x118                |	Aluop16\_indir16	|	LDIMMLO,NEXT(Aluop16\_indir)                                                        |
|0x119                |	Cmp8\_indir	    |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                |
|0x11a                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x11b                |	Cmp8	           |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,BYTE,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(Fetch)               |
|0x11c                |	Cmp8\_indir16	  |	LDIMMLO,NEXT(Cmp8\_indir)                                                           |
|0x11d                |	Cmp16\_indir	   |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                |
|0x11e                |		               |	LDHI,NEXT(FALLTHRU)                                                                            |
|0x11f                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x120                |	Cmp16	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,WORD,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(Fetch)               |
|0x121                |	Cmp16\_indir16	 |	LDIMMLO,NEXT(Cmp16\_indir)                                                          |
|0x122                |	Cmpb8\_indir	   |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                |
|0x123                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x124                |	Cmpb8	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,BYTE,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBr)             |
|0x125                |	Cmpb8\_indir16	 |	LDIMMLO,NEXT(Cmpb8\_indir)                                                          |
|0x126                |	Cmpb16\_indir	  |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                            |
|0x127                |		               |	LDHI,NEXT(FALLTHRU)                                                                            |
|0x128                |		               |	LDLO,NEXT(FALLTHRU)                                                                            |
|0x129                |	Cmpb16	         |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,WORD,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBr)             |
|0x12a                |	Cmpb16\_indir16	|	LDIMMLO,NEXT(Cmpb16\_indir)                                                         |
|0x12b                |	CheckBr	        |	LDIMMEXT,CBR(B\_NORMAL,TakenBr)                                                             |
|0x12c                |	TakenBr	        |	E\_L(R\_PC),E\_R(ER\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_PC,LWORD),CODE,NEXT(Fetch)             |
|0x12d                |	BrNormal	       |	LDIMMLO,CBR(B\_NORMAL,TakenBr)                                                          |
|0x12e                |	BrNegated	      |	LDIMMLO,CBR(B\_NEGATED,TakenBr)                                                         |
|0x12f                |	Bset8	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_AND,BYTE,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBrNeg)          |
|0x130                |	CheckBrNeg	     |	LDIMMEXT,CBR(B\_NEGATED,TakenBr)                                                        |
|0x131                |	Bclr8	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_AND,BYTE,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBr)             |
|0x132                |	Bset16	         |	LDIMMLO,NEXT(FALLTHRU)                                                                     |
|0x133                |		               |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_AND,WORD,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBrNeg)              |
|0x134                |	Bclr16	         |	LDIMMLO,NEXT(FALLTHRU)                                                                     |
|0x135                |		               |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_AND,WORD,NO\_CARRY),MISC(M\_SET\_FLAGS),NEXT(CheckBr)                 |
|0x136                |	Push16	         |	DEC\_TO\_Z(R\_SP),DATA,NEXT(FALLTHRU)                                                         |
|0x137                |		               |	WRITELO,DEC\_TO\_Z(R\_MAR),DATA,L(R\_SP,LWORD),NEXT(FALLTHRU)                                      |
|0x138                |	 Whi	           |	WRITEHI,TO\_Z(R\_PC),CODE,NEXT(Fetch)                                                        |
|0x139                |	Pop16	          |	LDHI,NEXT(FALLTHRU)                                                                        |
|0x13a                |		               |	 READLO,INC\_TO\_Z(R\_MAR),L(R\_SP,LWORD),DATA,NEXT(FALLTHRU)                                      |
|0x13b                |		               |	TO\_Z(R\_MDR),L(R\_IR\_REG,LWORD),NEXT(PCtoMAR)                                                    |
|0x13c                |	Lda8\_8	        |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x13d                |		               |	LDLO,NEXT(LdiA8)                                                                               |
|0x13e                |	Lda8\_16	       |	LDIMMLO,NEXT(Lda8\_8)                                                                       |
|0x13f                |	Ldb8\_8	        |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x140                |		               |	LDLO,NEXT(LdiB8)                                                                               |
|0x141                |	Ldb8\_16	       |	LDIMMLO,NEXT(Ldb8\_8)                                                                       |
|0x142                |	Lda16\_8	       |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x143                |		               |	LDHI,NEXT(FALLTHRU)                                                                            |
|0x144                |		               |	LDLO,NEXT(LdiA16)                                                                              |
|0x145                |	Lda16\_16	      |	LDIMMLO,NEXT(Lda16\_8)                                                                  |
|0x146                |	Ldb16\_8	       |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x147                |		               |	LDHI,NEXT(FALLTHRU)                                                                            |
|0x148                |		               |	LDLO,NEXT(LdiB16)                                                                              |
|0x149                |	Ldb16\_16	      |	LDIMMLO,NEXT(Ldb16\_8)                                                                  |
|0x14a                |	Sta8\_8	        |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x14b                |		               |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(FALLTHRU)                                                        |
|0x14c                |	StaLo	          |	STLO,NEXT(Fetch)                                                                           |
|0x14d                |	Sta8\_16	       |	LDIMMLO,NEXT(Sta8\_8)                                                                       |
|0x14e                |	Sta16\_8	       |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x14f                |		               |	TO\_Z(R\_A),L(R\_MDR,LWORD),NEXT(FALLTHRU)                                                        |
|0x150                |	 Shi	           |	STHI,NEXT(StaLo)                                                                           |
|0x151                |	Sta16\_16	      |	LDIMMLO,NEXT(Sta16\_8)                                                                  |
|0x152                |	Stb8\_8	        |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x153                |		               |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(StaLo)                                                           |
|0x154                |	Stb8\_16	       |	LDIMMLO,NEXT(Stb8\_8)                                                                       |
|0x155                |	Stb16\_8	       |	GEN\_ADDR(R\_IR\_BASE),DATA,NEXT(FALLTHRU)                                                    |
|0x156                |		               |	TO\_Z(R\_B),L(R\_MDR,LWORD),NEXT(Shi)                                                             |
|0x157                |	Stb16\_16	      |	LDIMMLO,NEXT(Stb16\_8)                                                                  |
|0x158                |	Sbc16	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_SUB,WORD,CARRY\_IN),L(R\_A,LWORD),MISC(M\_SET\_FLAGS),NEXT(Fetch)  |
|0x159                |	Adc16	          |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_ADD,WORD,CARRY\_IN),L(R\_A,LWORD),MISC(M\_SET\_FLAGS),NEXT(Fetch)  |
|0x15a                |	LdaA\_16	       |	LDIMMLO,NEXT(LdaA)                                                                         |
|0x15b                |	LdaA	           |	GEN\_ADDR(R\_IR\_BASE),L(R\_A,LWORD),NEXT(Fetch)                                               |
|0x15c                |	LdaB\_16	       |	LDIMMLO,NEXT(LdaB)                                                                         |
|0x15d                |	LdaB	           |	GEN\_ADDR(R\_IR\_BASE),L(R\_B,LWORD),NEXT(Fetch)                                               |
|0x15e                |	LdiA8	          |	TO\_Z(R\_MDR),L(R\_A,LBYTE),NEXT(Fetch)                                                       |
|0x15f                |	LdiB8	          |	TO\_Z(R\_MDR),L(R\_B,LBYTE),NEXT(Fetch)                                                       |
|0x160                |	LdiA16\_lo	     |	LDIMMLO,NEXT(LdiA16)                                                                   |
|0x161                |	LdiA16	         |	TO\_Z(R\_MDR),L(R\_A,LWORD),NEXT(Fetch)                                                       |
|0x162                |	LdiB16\_lo	     |	LDIMMLO,NEXT(LdiB16)                                                                   |
|0x163                |	LdiB16	         |	TO\_Z(R\_MDR),L(R\_B,LWORD),NEXT(Fetch)                                                       |
|0x164                |	LdiC16\_lo	     |	LDIMMLO,NEXT(LdiC16)                                                                   |
|0x165                |	LdiC16	         |	TO\_Z(R\_MDR),L(R\_C,LWORD),NEXT(Fetch)                                                       |
|0x166                |	RelBrLo	        |	LDIMMLO,NEXT(RelBr)                                                                        |
|0x167                |	RelBr	          |	GEN\_ADDR(R\_PC),L(R\_PC,LWORD),CODE,NEXT(Fetch)                                              |
|0x168                |	CallImm	        |	LDIMMLO,NEXT(FALLTHRU)                                                                     |
|0x169                |		               |	GEN\_ADDR(R\_PC),L(R\_PC,LWORD),NEXT(FALLTHRU)                                                    |
|0x16a                |		               |	 E\_R(ER\_MDR),E\_L(R\_PC),ALU(OP\_SUB,WORD,NO\_CARRY),L(R\_MDR,LWORD),NEXT(Push16)                   |
|0x16b                |	CallA	          |	DEC\_TO\_Z(R\_SP),DATA,NEXT(FALLTHRU)                                                         |
|0x16c                |		               |	WRITELO,DEC\_TO\_Z(R\_MAR),DATA,L(R\_SP,LWORD),NEXT(FALLTHRU)                                      |
|0x16d                |		               |	WRITEHI,TO\_Z(R\_A),L(R\_PC,LWORD),CODE,NEXT(Fetch)                                               |
|0x16e                |	LdClr	          |	READLO,NEXT(FALLTHRU)                                                                      |
|0x16f                |		               |	TO\_Z(R\_MDR),L(R\_A,LBYTE),NEXT(Whi)                                                             |
|0x170                |	Wcpte	          |	 E\_L(R\_A),MISC(M\_LPTE),NEXT(PCtoMAR)                                                       |
|0x171                |	Enter	          |	LDIMMLO,NEXT(FALLTHRU)                                                                     |
|0x172                |		               |	GEN\_ADDR(R\_SP),DATA,NEXT(FALLTHRU)                                                             |
|0x173                |		               |	TO\_Z(R\_SP),L(R\_MDR,LWORD),NEXT(FALLTHRU)                                                       |
|0x174                |		               |	DEC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                            |
|0x175                |		               |	WRITELO,DEC\_TO\_Z(R\_MAR),DATA,L(R\_SP,LWORD),NEXT(FALLTHRU)                                      |
|0x176                |		               |	WRITEHI,TO\_Z(R\_MAR),L(R\_SP,LWORD),NEXT(PCtoMAR)                                                |
|0x177                |	Bcopy	          |	CBR(B\_NEGATED,FALLTHRU)                                                                    |
|0x178                |		               |	TO\_Z(R\_B),DATA,NEXT(FALLTHRU)                                                                  |
|0x179                |		               |	READLO,TO\_Z(R\_A),DATA,NEXT(Bcopy0)                                                             |
|0x17a                |	 ToSys	         |	 PRIV(1),CBR(B\_NEGATED,FALLTHRU)                                                           |
|0x17b                |		               |	 TO\_Z(R\_B),SET\_ADR(DATA\_SPACE,PTB\_OVERRIDE),NEXT(FALLTHRU)                                     |
|0x17c                |		               |	 READLO,TO\_Z(R\_A),DATA,NEXT(FALLTHRU)                                                          |
|0x17d                |	 Bcopy0	        |	 WRITELO,INC\_TO\_Z(R\_MAR),L(R\_A,LWORD),NEXT(FALLTHRU)                                       |
|0x17e                |	 Bcopy1	        |	 INC\_TO\_Z(R\_B),L(R\_B,LWORD),NEXT(FALLTHRU)                                                 |
|0x17f                |	 Bcopy2	        |	 DEC\_TO\_Z(R\_C),L(R\_C,LWORD),NEXT(FALLTHRU)                                                 |
|0x180                |	 BackupPC	      |	 DEC\_TO\_Z(R\_PC),L(R\_PC,LWORD),CODE,NEXT(Fetch)                                         |
|0x181                |	 FromSys	       |	 PRIV(1),CBR(B\_NEGATED,FALLTHRU)                                                       |
|0x182                |		               |	 TO\_Z(R\_B),DATA,NEXT(FALLTHRU)                                                                 |
|0x183                |		               |	 READLO,TO\_Z(R\_A),SET\_ADR(DATA\_SPACE,PTB\_OVERRIDE),NEXT(FALLTHRU)                              |
|0x184                |		               |	 WRITELO,INC\_TO\_Z(R\_MAR),L(R\_A,LWORD),NEXT(Bcopy1)                                             |
|0x185                |	Fault	          |	 TO\_MDR(R\_MSW),NEXT(FALLTHRU)                                                              |
|0x186                |		               |	 ZERO\_TO\_Z,MISC(M\_LEI),LMODE(1),NEXT(FALLTHRU)                                                 |
|0x187                |		               |	 DEC\_TO\_Z(R\_SSP),DATA,NEXT(FALLTHRU)                                                           |
|0x188                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x189                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x18a                |		               |	 TO\_MDR(R\_SP),NEXT(FALLTHRU)                                                                   |
|0x18b                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x18c                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x18d                |		               |	 TO\_MDR(R\_TPC),NEXT(FALLTHRU)                                                                  |
|0x18e                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x18f                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x190                |		               |	 TO\_MDR(R\_A),NEXT(FALLTHRU)                                                                    |
|0x191                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x192                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x193                |		               |	 TO\_MDR(R\_B),NEXT(FALLTHRU)                                                                    |
|0x194                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x195                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x196                |		               |	 TO\_MDR(R\_C),NEXT(FALLTHRU)                                                                    |
|0x197                |		               |	 PUSHLO,NEXT(FALLTHRU)                                                                         |
|0x198                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x199                |		               |	 TO\_MDR(R\_DP),NEXT(FALLTHRU)                                                                   |
|0x19a                |		               |	 PUSHLO,L(R\_SP,LWORD),NEXT(FALLTHRU)                                                           |
|0x19b                |		               |	 PUSHHI,NEXT(FALLTHRU)                                                                         |
|0x19c                |		               |	 TO\_Z(R\_PC),L(R\_A,LWORD),NEXT(FALLTHRU)                                                        |
|0x19d                |		               |	 TO\_Z(R\_FCODE),DATA,L(R\_C,LWORD),NEXT(FALLTHRU)                                                |
|0x19e                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x19f                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1a0                |	 	              |	 ZERO\_TO\_Z,L(R\_DP,LWORD),NEXT(FALLTHRU)                                                        |
|0x1a1                |	 	              |	 FROM\_MDR(R\_PC),CODE,MISC(M\_CLR\_TRAP),NEXT(Fetch)                                              |
|0x1a2                |	Reti	           |	 TO\_Z(R\_SP),DATA,NEXT(FALLTHRU)                                                            |
|0x1a3                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1a4                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1a5                |		               |	 FROM\_MDR(R\_DP),NEXT(FALLTHRU)                                                                 |
|0x1a6                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1a7                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1a8                |		               |	 FROM\_MDR(R\_C),NEXT(FALLTHRU)                                                                  |
|0x1a9                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1aa                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1ab                |		               |	 FROM\_MDR(R\_B),NEXT(FALLTHRU)                                                                  |
|0x1ac                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1ad                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1ae                |		               |	 FROM\_MDR(R\_A),NEXT(FALLTHRU)                                                                  |
|0x1af                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1b0                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1b1                |		               |	 FROM\_MDR(R\_PC),NEXT(FALLTHRU)                                                                 |
|0x1b2                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1b3                |		               |	 POPLO,NEXT(FALLTHRU)                                                                          |
|0x1b4                |		               |	 TO\_Z(R\_MDR),MISC(M\_COMMIT),NEXT(FALLTHRU)                                                     |
|0x1b5                |		               |	 POPHI,NEXT(FALLTHRU)                                                                          |
|0x1b6                |		               |	 READLO,INC\_TO\_Z(R\_MAR),L(R\_SP,LWORD),NEXT(FALLTHRU)                                           |
|0x1b7                |		               |	 TO\_Z(R\_MDR),L(R\_MSW,LWORD),LMODE(1),LPAGING(1),MISC(M\_LEI),NEXT(FALLTHRU)                     |
|0x1b8                |		               |	 TO\_Z(R\_TPC),L(R\_SP,LWORD),NEXT(PCtoMAR)                                                       |
|0x1b9                |	Syscall	        |	TO\_Z(R\_MDR),L(R\_A,LWORD),NEXT(FALLTHRU)                                                    |
|0x1ba                |		               |	MISC(M\_SYSCALL),NEXT(Unreachable)                                                              |
|0x1bb                |	 Ldcode8	       |	 LDLO,NEXT(LdiA8)                                                                      |
|0x1bc                |	Wdpte	          |	 E\_L(R\_A),MISC(M\_LPTE),NEXT(PCtoMAR)                                                       |
|0x1bd                |	Shlb16	         |	E\_L(R\_B),E\_R(ER\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_B,LWORD),NEXT(Fetch)                    |
|0x1be                |	Shla16	         |	E\_L(R\_A),E\_R(ER\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_A,LWORD),NEXT(Fetch)                    |
|0x1bf                |	Aluop16\_16	    |	LDIMMLO,NEXT(Aluop16)                                                                  |
|0x1c0                |	Cmpb16\_16	     |	LDIMMLO,NEXT(Cmpb16)                                                                   |
|0x1c1                |	Cmp16\_16	      |	LDIMMLO,NEXT(Cmp16)                                                                    |
|0x1c2                |	PCtoMAR	        |	TO\_Z(R\_PC),CODE,NEXT(Fetch)                                                                |
|0x1c3                |	 Vshl	          |	 COMPARE\_0(R\_C),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)                                           |
|0x1c4                |	 	              |	 CBR(B\_NEGATED,FALLTHRU)                                                                       |
|0x1c5                |	 	              |	 COMPARE\_0(R\_MDR),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)                                             |
|0x1c6                |	 	              |	 CBR(B\_NEGATED,FALLTHRU)                                                                       |
|0x1c7                |	 	              |	 E\_L(R\_MDR),E\_R(ER\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_IR\_REG,LWORD),NEXT(Bcopy2)               |
|0x1c8                |	 Vshr	          |	 COMPARE\_0(R\_C),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)                                           |
|0x1c9                |	 	              |	 CBR(B\_NEGATED,FALLTHRU)                                                                       |
|0x1ca                |		               |	 COMPARE\_0(R\_MDR),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)                                             |
|0x1cb                |		               |	 CBR(B\_NEGATED,FALLTHRU)                                                                       |
|0x1cc                |		               |	 TO\_Z(R\_MDR),MISC(M\_RSHIFT),L(R\_IR\_REG,LWORD),NEXT(Bcopy2)                                     |
|0x1cd                |	 LeaAAB2	       |	 E\_R(ER\_MDR),E\_L(R\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_MDR,LWORD),NEXT(FALLTHRU)        |
|0x1ce                |	 LeaA1	         |	 E\_R(ER\_MDR),E\_L(R\_A),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_A,LWORD),NEXT(Fetch)                   |
|0x1cf                |	 LeaBBA2	       |	 E\_R(ER\_MDR),E\_L(R\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_MDR,LWORD),NEXT(FALLTHRU)        |
|0x1d0                |	 LeaB1	         |	 E\_R(ER\_MDR),E\_L(R\_B),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_B,LWORD),NEXT(Fetch)                   |
|0x1d1                |	 LeaABA2	       |	 E\_R(ER\_MDR),E\_L(R\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_MDR,LWORD),NEXT(FALLTHRU)        |
|0x1d2                |		               |	 E\_R(ER\_MDR),E\_L(R\_B),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_A,LWORD),NEXT(Fetch)                       |
|0x1d3                |	 LeaBAB2	       |	 E\_R(ER\_MDR),E\_L(R\_MDR),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_MDR,LWORD),NEXT(FALLTHRU)        |
|0x1d4                |		               |	 E\_R(ER\_MDR),E\_L(R\_A),ALU(OP\_ADD,WORD,NO\_CARRY),L(R\_B,LWORD),NEXT(Fetch)                       |
|0x1d5                |	CopyMSWA	       |	 TO\_Z(R\_A),L(R\_MSW,LWORD),LMODE(1),LPAGING(1),MISC(M\_LEI),NEXT(PCtoMAR)                |
|0x1d6                |	 Strcopy	       |	 READLO,TO\_Z(R\_A),DATA,NEXT(FALLTHRU)                                                  |
|0x1d7                |	 	              |	 WRITELO,COMPARE8\_0(R\_MDR),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)                                    |
|0x1d8                |	 	              |	 TO\_Z(R\_PC),CODE,NEXT(FALLTHRU)                                                                |
|0x1d9                |	 	              |	 INC\_TO\_Z(R\_A),L(R\_A,LWORD),NEXT(FALLTHRU)                                                     |
|0x1da                |		               |	 INC\_TO\_Z(R\_B),L(R\_B,LWORD),CBR(B\_NEGATED,BackupPC)                                            |
|0x1db                |	 LeaShort	      |	 GEN\_ADDR(R\_SP),L(R\_IR\_REG,LWORD),NEXT(Fetch)                                          |
|0x1dc                |	 Mcpy4	         |	 READHI,INC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                |
|0x1dd                |	 	              |	 READLO,TO\_Z(R\_B),DATA,NEXT(FALLTHRU)                                                          |
|0x1de                |	 	              |	 TO\_Z(R\_MDR),L(R\_C,LWORD),NEXT(FALLTHRU)                                                       |
|0x1df                |	 	              |	 READHI,INC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                    |
|0x1e0                |	 	              |	 READLO,TO\_Z(R\_A),DATA,NEXT(FALLTHRU)                                                          |
|0x1e1                |	 	              |	 WRITEHI,INC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                   |
|0x1e2                |	 	              |	 WRITELO,INC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                   |
|0x1e3                |	 	              |	 TO\_Z(R\_C),L(R\_MDR,LWORD),NEXT(FALLTHRU)                                                       |
|0x1e4                |	 	              |	 WRITEHI,INC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                   |
|0x1e5                |	 	              |	 WRITELO,INC\_TO\_Z(R\_MAR),L(R\_A,LWORD),NEXT(FALLTHRU)                                           |
|0x1e6                |	 	              |	 INC2\_TO\_Z(R\_B),L(R\_B,LWORD),NEXT(FALLTHRU)                                                    |
|0x1e7                |	 	              |	 INC2\_TO\_Z(R\_B),L(R\_B,LWORD),NEXT(PCtoMAR)                                                     |
|0x1e8                |	 Mop16	         |	 READLO,NEXT(FALLTHRU)                                                                     |
|0x1e9                |	 	              |	 WRITELO,DEC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                   |
|0x1ea                |	 	              |	 READHI,NEXT(FALLTHRU)                                                                         |
|0x1eb                |		               |	 WRITEHI,TO\_Z(R\_MDR),L(R\_C,LWORD),NEXT(FALLTHRU)                                               |
|0x1ec                |	 	              |	 DEC\_TO\_Z(R\_B),DATA,NEXT(FALLTHRU)                                                             |
|0x1ed                |	 	              |	 READLO,DEC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                    |
|0x1ee                |	 	              |	 READHI,TO\_Z(R\_MAR),L(R\_B,LWORD),NEXT(FALLTHRU)                                                |
|0x1ef                |	 	              |	 E\_L(R\_C),E\_R(ER\_MDR),ALU(OP\_IR13,WORD,NO\_CARRY),L(R\_MDR,LWORD),MISC(M\_SET\_FLAGS),NEXT(FALLTHRU)|
|0x1f0                |	 Mop16a	        |	 DEC\_TO\_Z(R\_A),DATA,NEXT(FALLTHRU)                                                         |
|0x1f1                |	 	              |	 WRITELO,DEC\_TO\_Z(R\_MAR),DATA,L(R\_A,LWORD),NEXT(Whi)                                           |
|0x1f2                |	 Mop16Carry	    |	 READLO,NEXT(FALLTHRU)                                                                 |
|0x1f3                |	 	              |	 WRITELO,DEC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                   |
|0x1f4                |	 	              |	 READHI,NEXT(FALLTHRU)                                                                         |
|0x1f5                |	 	              |	 WRITEHI,TO\_Z(R\_MDR),L(R\_C,LWORD),READHI,NEXT(FALLTHRU)                                        |
|0x1f6                |	 	              |	 DEC\_TO\_Z(R\_B),DATA,NEXT(FALLTHRU)                                                             |
|0x1f7                |	 	              |	 READLO,DEC\_TO\_Z(R\_MAR),DATA,NEXT(FALLTHRU)                                                    |
|0x1f8                |	 	              |	 READHI,TO\_Z(R\_MAR),L(R\_B,LWORD),NEXT(FALLTHRU)                                                |
|0x1f9                |	 	              |	 E\_L(R\_C),E\_R(ER\_MDR),ALU(OP\_IR13,WORD,CARRY\_IN),L(R\_MDR,LWORD),MISC(M\_SET\_FLAGS),NEXT(Mop16a) |
|0x1fa                |	 	              |	                                                                                               |
|0x1fb                |	 	              |	                                                                                               |
|0x1fc                |	 	              |	                                                                                               |
|0x1fd                |		               |	                                                                                               |
|0x1fe                |	Unreachable	    |	NEXT(Unreachable)                                                                      |
|0x1ff                |	UNUSABLE	       |	                                                                                       |