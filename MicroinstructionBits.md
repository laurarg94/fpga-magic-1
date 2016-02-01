# Introduction #

Magic-1 uses a Microinstruction word formed by 40 bits and placed into 5 512x8 Proms chips(74S472) thus forming a 512x40 bits Microstruction PROM wich will hold all subroutines to execute each opcode. Actually the opcode is an index to this PROM array memory.


# Details #

```
typedef struct {
	unsigned next:8;	// Next micro-op to exec. 0x00 means
				// use output of priority encoder, 0xff
				// means use IR[0..7].  Also a significant
				// bit of !(IR[0..7]==0xff) to give the full
				// 9-bit microcode address.
	unsigned latch:4;	// Register latch signal. Value:
				// 0x0 : none
				// 0x1 : MSW (flag nibble only, from Z)
				// 0x2 : C
				// 0x3 : PC
				// 0x4 : DP
				// 0x5 : SP
				// 0x6 : A
				// 0x7 : B
				// 0x8 : MDR (from Z)
				// 0x9 : PTB
				// 0xa : [A low placeholder]
				// 0xb : [A high placeholder]
				// 0xc : [B low placeholder]
				// 0xd : [C low placeholder]
				// 0xe : [SSP placeholder]
				// 0xf : IR_REG (IR[5..7])
	unsigned lmar:1;	// Latch MAR
	unsigned lmdrlo:1;	// Latch MDR(lo) from dbus
	unsigned lmdrhi:1;	// Latch MDR(hi) from dbus
	unsigned emdrlo:1;	// Drive dbus with MDR(lo)
	unsigned emdrhi:1;	// Drive dbus with MDR(hi)
	unsigned priv:1;	// Priviliged instruction
	unsigned lmode:1;	// Latch (M)ode bit in MSW
	unsigned lpaging:1;	// Latch (P)aging enable bit in MSW
	unsigned misc:4;	// Controls signals which never occur at the
				// same time:
				// 0x0 : none
				// 0x1 : 
				// 0x2 : halt
				// 0x3 : 
				// 0x4 : trap on overflow
				// 0x5 : latch PTE
				// 0x6 : set flags (from alu op)
				// 0x7 : init_inst (clear MDR, PC->TPC, latch IR)
				// 0x8 : right shift alu output
				// 0x9 : DMA acknowledge
				// 0xa : latch MSW[ie] (Interrupt Enable)
				// 0xb : do branch
				// 0xc : latch MSW[in_trap]
				// 0xd : commit state
				// 0xe : 
				// 0xf : 
	unsigned e_l:4;		// Enable L bus
				// 0x0 : MAR
				// 0x1 : MSW
				// 0x2 : C
				// 0x3 : PC
				// 0x4 : DP
				// 0x5 : SP
				// 0x6 : A
				// 0x7 : B
				// 0x8 : MDR
				// 0x9 : PTB
				// 0xa : SSP
				// 0xb : TPC
				// 0xc : 
				// 0xd : 
				// 0xe :
				// 0xf : IR_BASE (4+IR[6..7])
	unsigned e_r:2;		// Enable R bus
				// 0x0 : MDR
				// 0x1 : Immediate
				// 0x2 : Fault code/encoder
				// 0x3 :
	unsigned immval:2;	// Immediate value
				// 0x0 : 0
				// 0x1 : 1
				// 0x2 : -2
				// 0x3 : -1
	unsigned aluop_size:1;	// 0x0 -> 16 bits, 0x1 -> 8 bits
	unsigned aluop:2;	// Which alu operation to perform
				// 0x0 : IR[1..3]
				// 0x1 : AND
				// 0x2 : SUB
				// 0x3 : ADD
	unsigned carry:1;	// 0x0 -> 0, 0x1 -> MSW[c]
	unsigned l_size:1;	// 0x0 -> latch byte, 0x1 -> latch word
	unsigned br_sense:1;	// 0x0 -> don't negate, 0x1 -> negate
				// Non-negated branch conditions are:
				// 	0x0 : eq
				// 	0x1 : eq
				// 	0x2 : lt
				// 	0x3 : le
				// 	0x4 : ltu
				// 	0x5 : leu
				// 	0x6 : eq
				// 	0x7 : ne
	unsigned user_ptb:1;	// User page table base override
	unsigned code_ptb:1;	// 0 to select data region of PTB, 1 for code
} mcode_rec_t;
```