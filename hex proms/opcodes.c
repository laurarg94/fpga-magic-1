// -----------------------------------------------------------------------
//
//   WARNING - This is an auto-generated file.  Do not edit!  See
//   http://www.homebrewcpu.com for details
//
//   Copyright 2001, 2002, 2003 Bill Buzbee - All Rights reserved (not that 
//   anyone is likely to care...)
//
// -----------------------------------------------------------------------


op_handler_t handlers[256] = {
	do_halt, // halt
	do_ld, // ld.8 A,#u16_u8_10(SP)
	do_push, // push C
	do_push, // push PC
	do_push, // push DP
	do_ld, // ld.8 B,#u16_u8_10(SP)
	do_push, // push A
	do_push, // push B
	do_br, // br.ne #d16
	do_pop, // pop MSW
	do_pop, // pop C
	do_pop, // pop PC
	do_pop, // pop DP
	do_pop, // pop SP
	do_pop, // pop A
	do_pop, // pop B
	do_ld, // ld.8 A,#u16(DP)
	do_ld, // ld.8 A,#u8(SP)
	do_ld, // ld.8 A,#u16(A)
	do_ld, // ld.8 A,#u16(B)
	do_ld, // ld.8 B,#u16(DP)
	do_ld, // ld.8 B,#u8(SP)
	do_ld, // ld.8 B,#u16(A)
	do_ld, // ld.8 B,#u16(B)
	do_ld, // ld.16 A,#u16(DP)
	do_ld, // ld.16 A,#u16_u8_68(SP)
	do_ld, // ld.16 A,#u16(A)
	do_ld, // ld.16 A,#u16(B)
	do_ld, // ld.16 B,#u16(DP)
	do_ld, // ld.16 B,#u16_u8_68(SP)
	do_ld, // ld.16 B,#u16(A)
	do_ld, // ld.16 B,#u16(B)
	do_sub, // sub.8 A,#u16(DP)
	do_sub, // sub.8 A,#u16(SP)
	do_push, // push MSW
	do_sub, // sub.8 A,#u16(B)
	do_sub, // sub.8 A,#i8_1
	do_sub, // sub.16 (--A),(--B)
	do_push, // push SP
	do_sub, // sub.8 A,B
	do_sub, // sub.16 A,#u16(DP)
	do_sub, // sub.16 A,#u16(SP)
	do_sbc, // sbc.16 (--A),(--B)
	do_sub, // sub.16 A,#u16(B)
	do_sub, // sub.16 A,#i16_exti8
	do_sub, // sub.16 A,#exti8
	do_wcpte, // wcpte A,(B)
	do_sub, // sub.16 A,B
	do_add, // add.8 A,#u16(DP)
	do_add, // add.8 A,#u16(SP)
	do_br, // br A
	do_add, // add.8 A,#u16(B)
	do_add, // add.8 A,#i8_1
	do_add, // add.16 (--A),(--B)
	do_add, // add.8 A,A
	do_add, // add.8 A,B
	do_add, // add.16 A,#u16(DP)
	do_add, // add.16 A,#u16(SP)
	do_syscall, // syscall #sys_num8
	do_add, // add.16 A,#u16(B)
	do_add, // add.16 A,#i16_exti8
	do_add, // add.16 A,#exti8
	do_add, // add.16 A,A
	do_add, // add.16 A,B
	do_cmp, // cmp.8 A,#u16(DP)
	do_cmp, // cmp.8 A,#u16(SP)
	do_copy, // copy C,B
	do_cmp, // cmp.8 A,#u16(B)
	do_cmp, // cmp.8 A,#i8_0
	do_cmp, // cmp.8 A,#0
	do_xor, // xor.16 A,A
	do_cmp, // cmp.8 A,B
	do_cmp, // cmp.16 A,#u16(DP)
	do_cmp, // cmp.16 A,#u16(SP)
	do_sh0add, // sh0add B,A,B
	do_cmp, // cmp.16 A,#u16(B)
	do_cmp, // cmp.16 A,#i16_exti8_0
	do_cmp, // cmp.16 A,#exti8_0
	do_cmp, // cmp.16 A,#0
	do_cmp, // cmp.16 A,B
	do_or, // or.8 A,#u16(DP)
	do_or, // or.8 A,#u16(SP)
	do_sex, // sex A
	do_or, // or.8 A,#u16(B)
	do_or, // or.8 A,#i8_1
	do_or, // or.16 (--A),(--B)
	do_br, // br.leu #d16
	do_or, // or.8 A,B
	do_or, // or.16 A,#u16(DP)
	do_or, // or.16 A,#u16(SP)
	do_sh1add, // sh1add A,B,A
	do_or, // or.16 A,#u16(B)
	do_or, // or.16 A,#i16_exti8
	do_or, // or.16 A,#exti8
	do_br, // br.gtu #d16
	do_or, // or.16 A,B
	do_and, // and.8 A,#u16(DP)
	do_and, // and.8 A,#u16(SP)
	do_sh1add, // sh1add B,A,B
	do_and, // and.8 A,#u16(B)
	do_and, // and.8 A,#i8_1
	do_and, // and.16 (--A),(--B)
	do_nop, // nop
	do_and, // and.8 A,B
	do_and, // and.16 A,#u16(DP)
	do_and, // and.16 A,#u16(SP)
	do_sh1add, // sh1add B,B,A
	do_and, // and.16 A,#u16(B)
	do_and, // and.16 A,#i16_exti8
	do_and, // and.16 A,#exti8
	do_strcopy, // strcopy
	do_and, // and.16 A,B
	do_lea, // lea A,#u16(DP)
	do_lea, // lea A,#u16(SP)
	do_lea, // lea A,#u16(A)
	do_lea, // lea A,#u16(B)
	do_lea, // lea B,#u16(DP)
	do_lea, // lea B,#u16(SP)
	do_lea, // lea B,#u16(A)
	do_lea, // lea B,#u16(B)
	do_ld, // ld.8 A,#u8
	do_ld, // ld.8 B,#u8
	do_ld, // ld.16 A,#exti8_u16
	do_ld, // ld.16 B,#exti8_u16
	do_ld, // ld.16 A,#u16
	do_ld, // ld.16 B,#u16
	do_adc, // adc.16 A,A
	do_adc, // adc.16 A,B
	do_call, // call #d16
	do_ld, // ld.16 A,#u8(SP)
	do_call, // call A
	do_br, // br #d16_d8
	do_sbr, // sbr #d8
	do_ld, // ld.16 B,#u8(SP)
	do_lea, // lea A,#u8(SP)
	do_lea, // lea B,#u8(SP)
	do_copy, // copy A,MSW
	do_br, // br.eq #d16
	do_reti, // reti
	do_trapo, // trapo
	do_bset, // bset.8 A,#mask8,#d8
	do_bclr, // bclr.8 A,#mask8,#d8
	do_bset, // bset.16 A,#mask16,#d8
	do_bclr, // bclr.16 A,#mask16,#d8
	do_cmpb, // cmpb.eq.8 A,#u16(DP),#d8
	do_cmpb, // cmpb.eq.8 A,#u16(SP),#d8
	do_copy, // copy B,A
	do_cmpb, // cmpb.eq.8 A,#u16(B),#d8
	do_cmpb, // cmpb.eq.8 A,#i8_0,#d8
	do_cmpb, // cmpb.eq.8 A,#0,#d8
	do_copy, // copy C,A
	do_cmpb, // cmpb.eq.8 A,B,#d8
	do_cmpb, // cmpb.eq.16 A,#u16(DP),#d8
	do_cmpb, // cmpb.eq.16 A,#u16(SP),#d8
	do_copy, // copy A,B
	do_cmpb, // cmpb.eq.16 A,#u16(B),#d8
	do_cmpb, // cmpb.eq.16 A,#i16_exti8_0,#d8
	do_cmpb, // cmpb.eq.16 A,#exti8_0,#d8
	do_cmpb, // cmpb.eq.16 A,#0,#d8
	do_cmpb, // cmpb.eq.16 A,B,#d8
	do_cmpb, // cmpb.lt.8 A,#u16(DP),#d8
	do_cmpb, // cmpb.lt.8 A,#u16(SP),#d8
	do_sh0add, // sh0add A,A,B
	do_cmpb, // cmpb.lt.8 A,#u16(B),#d8
	do_cmpb, // cmpb.lt.8 A,#i8_0,#d8
	do_cmpb, // cmpb.lt.8 A,#0,#d8
	do_br, // br.lt #d16
	do_cmpb, // cmpb.lt.8 A,B,#d8
	do_cmpb, // cmpb.lt.16 A,#u16(DP),#d8
	do_cmpb, // cmpb.lt.16 A,#u16(SP),#d8
	do_sh1add, // sh1add A,A,B
	do_cmpb, // cmpb.lt.16 A,#u16(B),#d8
	do_cmpb, // cmpb.lt.16 A,#i16_exti8,#d8
	do_cmpb, // cmpb.lt.16 A,#exti8,#d8
	do_br, // br.ge #d16
	do_cmpb, // cmpb.lt.16 A,B,#d8
	do_cmpb, // cmpb.le.8 A,#u16(DP),#d8
	do_cmpb, // cmpb.le.8 A,#u16(SP),#d8
	do_sex, // sex B
	do_cmpb, // cmpb.le.8 A,#u16(B),#d8
	do_cmpb, // cmpb.le.8 A,#i8,#d8
	do_br, // br.le #d16
	do_copy, // copy DP,A
	do_cmpb, // cmpb.le.8 A,B,#d8
	do_cmpb, // cmpb.le.16 A,#u16(DP),#d8
	do_cmpb, // cmpb.le.16 A,#u16(SP),#d8
	do_adc, // adc.16 (--A),(--B)
	do_cmpb, // cmpb.le.16 A,#u16(B),#d8
	do_cmpb, // cmpb.le.16 A,#i16_exti8,#d8
	do_cmpb, // cmpb.le.16 A,#exti8,#d8
	do_br, // br.gt #d16
	do_cmpb, // cmpb.le.16 A,B,#d8
	do_br, // br.geu #d16
	do_st, // st.8 #u16_u8_10(SP),A
	do_shl, // shl.16 A
	do_shr, // shr.16 A
	do_shl, // shl.16 B
	do_st, // st.8 #u16_u8_10(SP),B
	do_shr, // shr.16 B
	do_xor, // xor.16 A,B
	do_copy, // copy PTB,A
	do_st, // st.16 #u16_u8_10(SP),A
	do_copy, // copy MSW,A
	do_copy, // copy SP,A
	do_xor, // xor.16 (--A),(--B)
	do_st, // st.16 #u16_u8_10(SP),B
	do_ld, // ld.16 C,#u16
	do_br, // br.ltu #d16
	do_st, // st.8 #u16(DP),A
	do_st, // st.8 #u8(SP),A
	do_st, // st.8 #u16(A),A
	do_st, // st.8 #u16(B),A
	do_st, // st.8 #u16(DP),B
	do_st, // st.8 #u8(SP),B
	do_st, // st.8 #u16(A),B
	do_st, // st.8 #u16(B),B
	do_st, // st.16 #u16(DP),A
	do_st, // st.16 #u8(SP),A
	do_st, // st.16 #u16(A),A
	do_st, // st.16 #u16(B),A
	do_st, // st.16 #u16(DP),B
	do_st, // st.16 #u8(SP),B
	do_st, // st.16 #u16(A),B
	do_st, // st.16 #u16(B),B
	do_ldcode, // ldcode.8 A,(B)
	do_copy, // copy A,DP
	do_ld, // ld.16 C,#exti8_u16
	do_memcopy4, // memcopy4
	do_enter, // enter #fsize16_8
	do_enter, // enter #fsize8
	do_vshl, // vshl.16 A
	do_vshl, // vshl.16 B
	do_memcopy, // memcopy
	do_tosys, // tosys
	do_fromsys, // fromsys
	do_ldclr, // ldclr.8 A,(B)
	do_wdpte, // wdpte A,(B)
	do_sbc, // sbc.16 A,B
	do_vshr, // vshr.16 A
	do_vshr, // vshr.16 B
	do_cmpb, // cmpb.ne.8 A,#u16(DP),#d8
	do_cmpb, // cmpb.ne.8 A,#u16(SP),#d8
	do_copy, // copy A,C
	do_cmpb, // cmpb.ne.8 A,#u16(B),#d8
	do_cmpb, // cmpb.ne.8 A,#i8_0,#d8
	do_cmpb, // cmpb.ne.8 A,#0,#d8
	do_copy, // copy A,SP
	do_cmpb, // cmpb.ne.8 A,B,#d8
	do_cmpb, // cmpb.ne.16 A,#u16(DP),#d8
	do_cmpb, // cmpb.ne.16 A,#u16(SP),#d8
	do_bkpt, // bkpt
	do_cmpb, // cmpb.ne.16 A,#u16(B),#d8
	do_cmpb, // cmpb.ne.16 A,#i16_exti8_0,#d8
	do_cmpb, // cmpb.ne.16 A,#exti8_0,#d8
	do_cmpb, // cmpb.ne.16 A,#0,#d8
	do_cmpb, // cmpb.ne.16 A,B,#d8
};



opcode_t opcodes[256] = {
	{"halt",IM_NONE,IM_NONE},
	{"ld.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"push C",IM_NONE,IM_NONE},
	{"push PC",IM_NONE,IM_NONE},
	{"push DP",IM_NONE,IM_NONE},
	{"ld.8 B,0x%04x(SP)",IM_WORD,IM_NONE},
	{"push A",IM_NONE,IM_NONE},
	{"push B",IM_NONE,IM_NONE},
	{"br.ne L%04X",IM_WORD,IM_NONE},
	{"pop MSW",IM_NONE,IM_NONE},
	{"pop C",IM_NONE,IM_NONE},
	{"pop PC",IM_NONE,IM_NONE},
	{"pop DP",IM_NONE,IM_NONE},
	{"pop SP",IM_NONE,IM_NONE},
	{"pop A",IM_NONE,IM_NONE},
	{"pop B",IM_NONE,IM_NONE},
	{"ld.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"ld.8 A,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"ld.8 A,0x%04x(A)",IM_WORD,IM_NONE},
	{"ld.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"ld.8 B,0x%04x(DP)",IM_WORD,IM_NONE},
	{"ld.8 B,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"ld.8 B,0x%04x(A)",IM_WORD,IM_NONE},
	{"ld.8 B,0x%04x(B)",IM_WORD,IM_NONE},
	{"ld.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"ld.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"ld.16 A,0x%04x(A)",IM_WORD,IM_NONE},
	{"ld.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x(DP)",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x(SP)",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x(A)",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x(B)",IM_WORD,IM_NONE},
	{"sub.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"sub.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"push MSW",IM_NONE,IM_NONE},
	{"sub.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"sub.8 A,0x%04x",IM_EXT8,IM_NONE},
	{"sub.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"push SP",IM_NONE,IM_NONE},
	{"sub.8 A,B",IM_NONE,IM_NONE},
	{"sub.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"sub.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sbc.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"sub.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"sub.16 A,0x%04x",IM_WORD,IM_NONE},
	{"sub.16 A,0x%04x",IM_EXT8,IM_NONE},
	{"wcpte A,(B)",IM_NONE,IM_NONE},
	{"sub.16 A,B",IM_NONE,IM_NONE},
	{"add.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"add.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"br A",IM_NONE,IM_NONE},
	{"add.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"add.8 A,0x%04x",IM_EXT8,IM_NONE},
	{"add.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"add.8 A,A",IM_NONE,IM_NONE},
	{"add.8 A,B",IM_NONE,IM_NONE},
	{"add.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"add.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"syscall 0x%02x",IM_BYTE,IM_NONE},
	{"add.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"add.16 A,0x%04x",IM_WORD,IM_NONE},
	{"add.16 A,0x%04x",IM_EXT8,IM_NONE},
	{"add.16 A,A",IM_NONE,IM_NONE},
	{"add.16 A,B",IM_NONE,IM_NONE},
	{"cmp.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"cmp.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"copy C,B",IM_NONE,IM_NONE},
	{"cmp.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"cmp.8 A,0x%04x",IM_EXT8,IM_NONE},
	{"cmp.8 A,0x0000",IM_NONE,IM_NONE},
	{"xor.16 A,A",IM_NONE,IM_NONE},
	{"cmp.8 A,B",IM_NONE,IM_NONE},
	{"cmp.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"cmp.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sh0add B,A,B",IM_NONE,IM_NONE},
	{"cmp.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"cmp.16 A,0x%04x",IM_WORD,IM_NONE},
	{"cmp.16 A,0x%04x",IM_EXT8,IM_NONE},
	{"cmp.16 A,0x0000",IM_NONE,IM_NONE},
	{"cmp.16 A,B",IM_NONE,IM_NONE},
	{"or.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"or.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sex A",IM_NONE,IM_NONE},
	{"or.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"or.8 A,0x%04x",IM_EXT8,IM_NONE},
	{"or.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"br.leu L%04X",IM_WORD,IM_NONE},
	{"or.8 A,B",IM_NONE,IM_NONE},
	{"or.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"or.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sh1add A,B,A",IM_NONE,IM_NONE},
	{"or.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"or.16 A,0x%04x",IM_WORD,IM_NONE},
	{"or.16 A,0x%04x",IM_EXT8,IM_NONE},
	{"br.gtu L%04X",IM_WORD,IM_NONE},
	{"or.16 A,B",IM_NONE,IM_NONE},
	{"and.8 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"and.8 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sh1add B,A,B",IM_NONE,IM_NONE},
	{"and.8 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"and.8 A,0x%04x",IM_EXT8,IM_NONE},
	{"and.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"nop",IM_NONE,IM_NONE},
	{"and.8 A,B",IM_NONE,IM_NONE},
	{"and.16 A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"and.16 A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"sh1add B,B,A",IM_NONE,IM_NONE},
	{"and.16 A,0x%04x(B)",IM_WORD,IM_NONE},
	{"and.16 A,0x%04x",IM_WORD,IM_NONE},
	{"and.16 A,0x%04x",IM_EXT8,IM_NONE},
	{"strcopy",IM_NONE,IM_NONE},
	{"and.16 A,B",IM_NONE,IM_NONE},
	{"lea A,0x%04x(DP)",IM_WORD,IM_NONE},
	{"lea A,0x%04x(SP)",IM_WORD,IM_NONE},
	{"lea A,0x%04x(A)",IM_WORD,IM_NONE},
	{"lea A,0x%04x(B)",IM_WORD,IM_NONE},
	{"lea B,0x%04x(DP)",IM_WORD,IM_NONE},
	{"lea B,0x%04x(SP)",IM_WORD,IM_NONE},
	{"lea B,0x%04x(A)",IM_WORD,IM_NONE},
	{"lea B,0x%04x(B)",IM_WORD,IM_NONE},
	{"ld.8 A,0x%02x",IM_BYTE,IM_NONE},
	{"ld.8 B,0x%02x",IM_BYTE,IM_NONE},
	{"ld.16 A,0x%04x",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x",IM_WORD,IM_NONE},
	{"ld.16 A,0x%04x",IM_WORD,IM_NONE},
	{"ld.16 B,0x%04x",IM_WORD,IM_NONE},
	{"adc.16 A,A",IM_NONE,IM_NONE},
	{"adc.16 A,B",IM_NONE,IM_NONE},
	{"call L%04X",IM_WORD,IM_NONE},
	{"ld.16 A,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"call A",IM_NONE,IM_NONE},
	{"br L%04X",IM_WORD,IM_NONE},
	{"sbr L%04X",IM_EXT8,IM_NONE},
	{"ld.16 B,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"lea A,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"lea B,0x%02x(SP)",IM_BYTE,IM_NONE},
	{"copy A,MSW",IM_NONE,IM_NONE},
	{"br.eq L%04X",IM_WORD,IM_NONE},
	{"reti",IM_NONE,IM_NONE},
	{"trapo",IM_NONE,IM_NONE},
	{"bset.8 A,0x%04x,L%04X",IM_BYTE,IM_EXT8},
	{"bclr.8 A,0x%04x,L%04X",IM_BYTE,IM_EXT8},
	{"bset.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"bclr.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.8 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.8 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"copy B,A",IM_NONE,IM_NONE},
	{"cmpb.eq.8 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.8 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"cmpb.eq.8 A,0x0000,L%04X",IM_NONE,IM_EXT8},
	{"copy C,A",IM_NONE,IM_NONE},
	{"cmpb.eq.8 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.eq.16 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.16 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"copy A,B",IM_NONE,IM_NONE},
	{"cmpb.eq.16 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"cmpb.eq.16 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"cmpb.eq.16 A,0x0000,L%04X",IM_NONE,IM_EXT8},
	{"cmpb.eq.16 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.lt.8 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.lt.8 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"sh0add A,A,B",IM_NONE,IM_NONE},
	{"cmpb.lt.8 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.lt.8 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"cmpb.lt.8 A,0x0000,L%04X",IM_NONE,IM_EXT8},
	{"br.lt L%04X",IM_WORD,IM_NONE},
	{"cmpb.lt.8 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.lt.16 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.lt.16 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"sh1add A,A,B",IM_NONE,IM_NONE},
	{"cmpb.lt.16 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.lt.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"cmpb.lt.16 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"br.ge L%04X",IM_WORD,IM_NONE},
	{"cmpb.lt.16 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.le.8 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.le.8 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"sex B",IM_NONE,IM_NONE},
	{"cmpb.le.8 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.le.8 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"br.le L%04X",IM_WORD,IM_NONE},
	{"copy DP,A",IM_NONE,IM_NONE},
	{"cmpb.le.8 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.le.16 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.le.16 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"adc.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"cmpb.le.16 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.le.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"cmpb.le.16 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"br.gt L%04X",IM_WORD,IM_NONE},
	{"cmpb.le.16 A,B,L%04X",IM_EXT8,IM_NONE},
	{"br.geu L%04X",IM_WORD,IM_NONE},
	{"st.8 0x%04x(SP),A",IM_WORD,IM_NONE},
	{"shl.16 A",IM_NONE,IM_NONE},
	{"shr.16 A",IM_NONE,IM_NONE},
	{"shl.16 B",IM_NONE,IM_NONE},
	{"st.8 0x%04x(SP),B",IM_WORD,IM_NONE},
	{"shr.16 B",IM_NONE,IM_NONE},
	{"xor.16 A,B",IM_NONE,IM_NONE},
	{"copy PTB,A",IM_NONE,IM_NONE},
	{"st.16 0x%04x(SP),A",IM_WORD,IM_NONE},
	{"copy MSW,A",IM_NONE,IM_NONE},
	{"copy SP,A",IM_NONE,IM_NONE},
	{"xor.16 (--A),(--B)",IM_NONE,IM_NONE},
	{"st.16 0x%04x(SP),B",IM_WORD,IM_NONE},
	{"ld.16 C,0x%04x",IM_WORD,IM_NONE},
	{"br.ltu L%04X",IM_WORD,IM_NONE},
	{"st.8 0x%04x(DP),A",IM_WORD,IM_NONE},
	{"st.8 0x%02x(SP),A",IM_BYTE,IM_NONE},
	{"st.8 0x%04x(A),A",IM_WORD,IM_NONE},
	{"st.8 0x%04x(B),A",IM_WORD,IM_NONE},
	{"st.8 0x%04x(DP),B",IM_WORD,IM_NONE},
	{"st.8 0x%02x(SP),B",IM_BYTE,IM_NONE},
	{"st.8 0x%04x(A),B",IM_WORD,IM_NONE},
	{"st.8 0x%04x(B),B",IM_WORD,IM_NONE},
	{"st.16 0x%04x(DP),A",IM_WORD,IM_NONE},
	{"st.16 0x%02x(SP),A",IM_BYTE,IM_NONE},
	{"st.16 0x%04x(A),A",IM_WORD,IM_NONE},
	{"st.16 0x%04x(B),A",IM_WORD,IM_NONE},
	{"st.16 0x%04x(DP),B",IM_WORD,IM_NONE},
	{"st.16 0x%02x(SP),B",IM_BYTE,IM_NONE},
	{"st.16 0x%04x(A),B",IM_WORD,IM_NONE},
	{"st.16 0x%04x(B),B",IM_WORD,IM_NONE},
	{"ldcode.8 A,(B)",IM_NONE,IM_NONE},
	{"copy A,DP",IM_NONE,IM_NONE},
	{"ld.16 C,0x%04x",IM_WORD,IM_NONE},
	{"memcopy4",IM_NONE,IM_NONE},
	{"enter 0x%04x",IM_WORD,IM_NONE},
	{"enter 0x%02x",IM_EXT8,IM_NONE},
	{"vshl.16 A",IM_NONE,IM_NONE},
	{"vshl.16 B",IM_NONE,IM_NONE},
	{"memcopy",IM_NONE,IM_NONE},
	{"tosys",IM_NONE,IM_NONE},
	{"fromsys",IM_NONE,IM_NONE},
	{"ldclr.8 A,(B)",IM_NONE,IM_NONE},
	{"wdpte A,(B)",IM_NONE,IM_NONE},
	{"sbc.16 A,B",IM_NONE,IM_NONE},
	{"vshr.16 A",IM_NONE,IM_NONE},
	{"vshr.16 B",IM_NONE,IM_NONE},
	{"cmpb.ne.8 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.ne.8 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"copy A,C",IM_NONE,IM_NONE},
	{"cmpb.ne.8 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.ne.8 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"cmpb.ne.8 A,0x0000,L%04X",IM_NONE,IM_EXT8},
	{"copy A,SP",IM_NONE,IM_NONE},
	{"cmpb.ne.8 A,B,L%04X",IM_EXT8,IM_NONE},
	{"cmpb.ne.16 A,0x%04x(DP),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.ne.16 A,0x%04x(SP),L%04X",IM_WORD,IM_EXT8},
	{"bkpt",IM_NONE,IM_NONE},
	{"cmpb.ne.16 A,0x%04x(B),L%04X",IM_WORD,IM_EXT8},
	{"cmpb.ne.16 A,0x%04x,L%04X",IM_WORD,IM_EXT8},
	{"cmpb.ne.16 A,0x%04x,L%04X",IM_EXT8,IM_EXT8},
	{"cmpb.ne.16 A,0x0000,L%04X",IM_NONE,IM_EXT8},
	{"cmpb.ne.16 A,B,L%04X",IM_EXT8,IM_NONE},
};
