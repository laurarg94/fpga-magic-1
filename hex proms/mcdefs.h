// -----------------------------------------------------------------------
//
//   WARNING - This is an auto-generated file.  Do not edit!  See
//   http://www.homebrewcpu.com for details
//
//   Copyright 2001, 2002, 2003 Bill Buzbee - All Rights reserved (not that 
//   anyone is likely to care...)
//
// -----------------------------------------------------------------------
#ifndef __MCDEFS_H_
#define __MCDEFS_H_
// Register defines for LATCH() and EL()
#define R_MSW   1
#define R_C     2
#define R_PC    3
#define R_DP    4
#define R_SP    5
#define R_A     6
#define R_B     7
#define R_MDR   8
#define R_PTB   9
#define R_SSP   10
// Register defines for LATCH()-only
#define R_NONE  0
#define R_IR_REG        15
// Register defines for EL()-only
#define R_MAR   0
#define R_TPC   11
#define R_FCODE 12
#define R_IR_BASE       15
// Register defines for ER()
#define ER_MDR  0
#define ER_IMM  1
#define ER_FAULT        2
// Defines for IMMVAL()
#define IMM_0   0
#define IMM_1   1
#define IMM_NEG1        3
#define IMM_NEG2        2
// Defines for MISC()
#define M_NONE  0
#define M_SYSCALL 1
#define M_HALT  2
#define M_BKPT 3
#define M_TRAPO 4
#define M_LPTE  5
#define M_SET_FLAGS     6
#define M_INIT_INST     7
#define M_RSHIFT        8
#define M_DMA_ACK       9
#define M_LEI   10
#define M_DO_BRANCH     11
#define M_CLR_TRAP      12
#define M_COMMIT 13
// Defines for ALUOP(op,size,carry)
#define OP_IR13 0
#define OP_AND  1
#define OP_SUB  2
#define OP_ADD  3
#define WORD    0
#define BYTE    1
#define LWORD   1
#define LBYTE   0
#define NO_CARRY        0
#define CARRY_IN        1
// Defines for CBR()
#define B_NORMAL        0
#define B_NEGATED       1
#else
#endif // __MCDEFS_H_
