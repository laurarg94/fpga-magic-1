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
static const char *ng0 = "C:/fpga-magic-1/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_std_logic_unsigned_equal_stdv_stdv(char *, char *, char *, char *, char *);
char *p_2592010699_sub_1648892470_2592010699(char *, char *, char *, char *, char *, char *);
char *p_2592010699_sub_1687144926_2592010699(char *, char *, char *, char *, char *, char *);
char *p_2592010699_sub_747089392_2592010699(char *, char *, char *, char *, char *, char *);
char *p_3620187407_sub_4215186851_3620187407(char *, char *, char *, char *, char *, char *);
char *p_3620187407_sub_4215258725_3620187407(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1164U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 4514);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 4516);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 4518);
    t13 = xsi_mem_cmp(t11, t2, 2U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(70, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)0, 3U);
    t3 = (t0 + 3020);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t3);

LAB2:    t1 = (t0 + 2952);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(62, ng0);
    t14 = (t0 + 1252U);
    t15 = *((char **)t14);
    t16 = (1 - 0);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t14 = (t15 + t18);
    t19 = (t0 + 3020);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t14, 3U);
    xsi_driver_first_trans_fast(t19);
    goto LAB2;

LAB4:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 4520);
    t3 = (t0 + 3020);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 4523);
    t3 = (t0 + 3020);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB2;

LAB6:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 4526);
    t3 = (t0 + 3020);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB2;

LAB12:;
}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char t33[16];
    char t34[16];
    char t35[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1692U);
    t2 = *((char **)t1);
    t1 = (t0 + 4529);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB12:    t5 = (t0 + 4532);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB13:    t8 = (t0 + 4535);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB14:    t11 = (t0 + 4538);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB15:    t14 = (t0 + 4541);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB16:    t17 = (t0 + 4544);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB17:    t20 = (t0 + 4547);
    t22 = xsi_mem_cmp(t20, t2, 3U);
    if (t22 == 1)
        goto LAB9;

LAB18:    t23 = (t0 + 4550);
    t25 = xsi_mem_cmp(t23, t2, 3U);
    if (t25 == 1)
        goto LAB10;

LAB19:
LAB11:    xsi_set_current_line(95, ng0);
    t1 = xsi_get_transient_memory(17U);
    memset(t1, 0, 17U);
    t2 = t1;
    memset(t2, (unsigned char)0, 17U);
    t3 = (t0 + 3056);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 17U);
    xsi_driver_first_trans_fast(t3);

LAB2:    t1 = (t0 + 2960);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(79, ng0);
    t26 = xsi_get_transient_memory(17U);
    memset(t26, 0, 17U);
    t27 = t26;
    memset(t27, (unsigned char)2, 17U);
    t28 = (t0 + 3056);
    t29 = (t28 + 32U);
    t30 = *((char **)t29);
    t31 = (t30 + 40U);
    t32 = *((char **)t31);
    memcpy(t32, t26, 17U);
    xsi_driver_first_trans_fast(t28);
    goto LAB2;

LAB4:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 636U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4408U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 548U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4392U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_3620187407_sub_4215258725_3620187407(IEEE_P_3620187407, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB5:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4392U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 636U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4408U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_3620187407_sub_4215258725_3620187407(IEEE_P_3620187407, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB6:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4392U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 636U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4408U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_3620187407_sub_4215186851_3620187407(IEEE_P_3620187407, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB7:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4392U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 636U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4408U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_2592010699_sub_1648892470_2592010699(IEEE_P_2592010699, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB8:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4392U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 636U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4408U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_2592010699_sub_1687144926_2592010699(IEEE_P_2592010699, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB9:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 548U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 2244);
    t5 = (t0 + 4392U);
    t1 = xsi_base_array_concat(t1, t34, t3, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t6 = (t0 + 636U);
    t8 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 2244);
    t11 = (t0 + 4408U);
    t6 = xsi_base_array_concat(t6, t35, t9, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = p_2592010699_sub_747089392_2592010699(IEEE_P_2592010699, t33, t1, t34, t6, t35);
    t14 = (t0 + 3056);
    t15 = (t14 + 32U);
    t17 = *((char **)t15);
    t18 = (t17 + 40U);
    t20 = *((char **)t18);
    memcpy(t20, t12, 17U);
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB10:    xsi_set_current_line(93, ng0);
    t1 = xsi_get_transient_memory(17U);
    memset(t1, 0, 17U);
    t2 = t1;
    memset(t2, (unsigned char)3, 17U);
    t3 = (t0 + 3056);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 17U);
    xsi_driver_first_trans_fast(t3);
    goto LAB2;

LAB20:;
}

static void work_a_0832606739_3212880686_p_2(char *t0)
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
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;

LAB0:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 1780U);
    t2 = *((char **)t1);
    t1 = (t0 + 4488U);
    t3 = (t0 + 4553);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 16;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (16 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3092);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 1780U);
    t2 = *((char **)t1);
    t8 = (15 - 0);
    t9 = (t8 * 1);
    t15 = (1U * t9);
    t16 = (0 + t15);
    t1 = (t2 + t16);
    t10 = *((unsigned char *)t1);
    t17 = (t10 == (unsigned char)2);
    if (t17 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3128);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 1780U);
    t2 = *((char **)t1);
    t8 = (16 - 0);
    t9 = (t8 * 1);
    t15 = (1U * t9);
    t16 = (0 + t15);
    t1 = (t2 + t16);
    t10 = *((unsigned char *)t1);
    t3 = (t0 + 3164);
    t4 = (t3 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t11 = *((char **)t7);
    *((unsigned char *)t11) = t10;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 3200);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 40U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 2968);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(104, ng0);
    t7 = (t0 + 3092);
    t11 = (t7 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

LAB5:    xsi_set_current_line(111, ng0);
    t3 = (t0 + 3128);
    t4 = (t3 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t11 = *((char **)t7);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB6;

}

static void work_a_0832606739_3212880686_p_3(char *t0)
{
    char t5[16];
    char t10[16];
    char t18[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 812U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 1780U);
    t2 = *((char **)t1);
    t7 = (0 - 0);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t6 = (t0 + 3236);
    t11 = (t6 + 32U);
    t12 = *((char **)t11);
    t15 = (t12 + 40U);
    t19 = *((char **)t15);
    memcpy(t19, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);

LAB3:    t1 = (t0 + 2976);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 1780U);
    t6 = *((char **)t1);
    t7 = (0 - 0);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t1 = (t6 + t9);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 15;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (15 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 1780U);
    t15 = *((char **)t12);
    t14 = (0 - 0);
    t16 = (t14 * 1U);
    t17 = (0 + t16);
    t12 = (t15 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 0;
    t20 = (t19 + 4U);
    *((int *)t20) = 15;
    t20 = (t19 + 8U);
    *((int *)t20) = 1;
    t21 = (15 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = p_3620187407_sub_4215186851_3620187407(IEEE_P_3620187407, t5, t1, t10, t12, t18);
    t23 = (t0 + 3236);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 40U);
    t27 = *((char **)t26);
    memcpy(t27, t20, 16U);
    xsi_driver_first_trans_fast_port(t23);
    goto LAB3;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1,(void *)work_a_0832606739_3212880686_p_2,(void *)work_a_0832606739_3212880686_p_3};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/_tmp/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
