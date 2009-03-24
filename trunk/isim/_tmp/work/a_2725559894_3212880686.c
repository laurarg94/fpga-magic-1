/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0x734844ce */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Magic-1_FPGA/Magic_1/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_std_logic_unsigned_equal_stdv_stdv(char *, char *, char *, char *, char *);
char *p_2592010699_sub_1648892470_2592010699(char *, char *, char *, char *, char *, char *);
char *p_2592010699_sub_1687144926_2592010699(char *, char *, char *, char *, char *, char *);
char *p_2592010699_sub_747089392_2592010699(char *, char *, char *, char *, char *, char *);
char *p_3620187407_sub_4215186851_3620187407(char *, char *, char *, char *, char *, char *);
char *p_3620187407_sub_4215258725_3620187407(char *, char *, char *, char *, char *, char *);


static void work_a_2725559894_3212880686_p_0(char *t0)
{
    char t37[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1252U);
    t2 = *((char **)t1);
    t3 = (1 - 0);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4168);
    t8 = xsi_mem_cmp(t6, t1, 3U);
    if (t8 == 1)
        goto LAB3;

LAB12:    t9 = (t0 + 4171);
    t11 = xsi_mem_cmp(t9, t1, 3U);
    if (t11 == 1)
        goto LAB4;

LAB13:    t12 = (t0 + 4174);
    t14 = xsi_mem_cmp(t12, t1, 3U);
    if (t14 == 1)
        goto LAB5;

LAB14:    t15 = (t0 + 4177);
    t17 = xsi_mem_cmp(t15, t1, 3U);
    if (t17 == 1)
        goto LAB6;

LAB15:    t18 = (t0 + 4180);
    t20 = xsi_mem_cmp(t18, t1, 3U);
    if (t20 == 1)
        goto LAB7;

LAB16:    t21 = (t0 + 4183);
    t23 = xsi_mem_cmp(t21, t1, 3U);
    if (t23 == 1)
        goto LAB8;

LAB17:    t24 = (t0 + 4186);
    t26 = xsi_mem_cmp(t24, t1, 3U);
    if (t26 == 1)
        goto LAB9;

LAB18:    t27 = (t0 + 4189);
    t29 = xsi_mem_cmp(t27, t1, 3U);
    if (t29 == 1)
        goto LAB10;

LAB19:
LAB11:    xsi_set_current_line(67, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)0, 16U);
    t6 = (t0 + 2796);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    t10 = (t9 + 40U);
    t12 = *((char **)t10);
    memcpy(t12, t1, 16U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t1 = (t0 + 2736);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(59, ng0);
    t30 = xsi_get_transient_memory(16U);
    memset(t30, 0, 16U);
    t31 = t30;
    memset(t31, (unsigned char)2, 16U);
    t32 = (t0 + 2796);
    t33 = (t32 + 32U);
    t34 = *((char **)t33);
    t35 = (t34 + 40U);
    t36 = *((char **)t35);
    memcpy(t36, t30, 16U);
    xsi_driver_first_trans_fast(t32);
    goto LAB2;

LAB4:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t1 = (t0 + 4080U);
    t6 = (t0 + 548U);
    t7 = *((char **)t6);
    t6 = (t0 + 4064U);
    t9 = p_3620187407_sub_4215258725_3620187407(IEEE_P_3620187407, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB5:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t1 = (t0 + 4064U);
    t6 = (t0 + 636U);
    t7 = *((char **)t6);
    t6 = (t0 + 4080U);
    t9 = p_3620187407_sub_4215258725_3620187407(IEEE_P_3620187407, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB6:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t1 = (t0 + 4064U);
    t6 = (t0 + 636U);
    t7 = *((char **)t6);
    t6 = (t0 + 4080U);
    t9 = p_3620187407_sub_4215186851_3620187407(IEEE_P_3620187407, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB7:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t1 = (t0 + 4064U);
    t6 = (t0 + 636U);
    t7 = *((char **)t6);
    t6 = (t0 + 4080U);
    t9 = p_2592010699_sub_1648892470_2592010699(IEEE_P_2592010699, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB8:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t1 = (t0 + 4064U);
    t6 = (t0 + 636U);
    t7 = *((char **)t6);
    t6 = (t0 + 4080U);
    t9 = p_2592010699_sub_1687144926_2592010699(IEEE_P_2592010699, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB9:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t1 = (t0 + 4064U);
    t6 = (t0 + 636U);
    t7 = *((char **)t6);
    t6 = (t0 + 4080U);
    t9 = p_2592010699_sub_747089392_2592010699(IEEE_P_2592010699, t37, t2, t1, t7, t6);
    t10 = (t0 + 2796);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t15 = (t13 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB2;

LAB10:    xsi_set_current_line(66, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)3, 16U);
    t6 = (t0 + 2796);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    t10 = (t9 + 40U);
    t12 = *((char **)t10);
    memcpy(t12, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB20:;
}

static void work_a_2725559894_3212880686_p_1(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1692U);
    t2 = *((char **)t1);
    t1 = (t0 + 4144U);
    t3 = (t0 + 4192);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 15;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (15 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 2832);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2868);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2904);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2940);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 2744);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(76, ng0);
    t7 = (t0 + 2832);
    t11 = (t7 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

}

static void work_a_2725559894_3212880686_p_2(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 812U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1692U);
    t2 = *((char **)t1);
    t1 = (t0 + 2976);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 2752);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1692U);
    t6 = *((char **)t1);
    t1 = (t0 + 4144U);
    t7 = (t0 + 1692U);
    t8 = *((char **)t7);
    t7 = (t0 + 4144U);
    t9 = p_3620187407_sub_4215186851_3620187407(IEEE_P_3620187407, t5, t6, t1, t8, t7);
    t10 = (t0 + 2976);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB3;

}


extern void work_a_2725559894_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2725559894_3212880686_p_0,(void *)work_a_2725559894_3212880686_p_1,(void *)work_a_2725559894_3212880686_p_2};
	xsi_register_didat("work_a_2725559894_3212880686", "isim/_tmp/work/a_2725559894_3212880686.didat");
	xsi_register_executes(pe);
}
