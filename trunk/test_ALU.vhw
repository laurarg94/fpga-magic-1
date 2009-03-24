--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : ISE
--  /   /         Filename : test_ALU.vhw
-- /___/   /\     Timestamp : Tue Mar 24 20:12:54 2009
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test_ALU
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test_ALU IS
END test_ALU;

ARCHITECTURE testbench_arch OF test_ALU IS
    COMPONENT ALU
        PORT (
            R : In std_logic_vector (0 To 15);
            L : In std_logic_vector (0 To 15);
            Z : Out std_logic_vector (0 To 15);
            DO_RSHIFT : In std_logic;
            ALUOP_SZ : In std_logic;
            MSWC : In std_logic;
            USE_CARRY : In std_logic;
            ALUOP : In std_logic_vector (0 To 1);
            IR : In std_logic_vector (0 To 7);
            ALUV : Out std_logic;
            ALUC : Out std_logic;
            ALUS : Out std_logic;
            ALUZ : Out std_logic
        );
    END COMPONENT;

    SIGNAL R : std_logic_vector (0 To 15) := "0000000000000000";
    SIGNAL L : std_logic_vector (0 To 15) := "0000000000000000";
    SIGNAL Z : std_logic_vector (0 To 15) := "0000000000000000";
    SIGNAL DO_RSHIFT : std_logic := '0';
    SIGNAL ALUOP_SZ : std_logic := '0';
    SIGNAL MSWC : std_logic := '0';
    SIGNAL USE_CARRY : std_logic := '0';
    SIGNAL ALUOP : std_logic_vector (0 To 1) := "00";
    SIGNAL IR : std_logic_vector (0 To 7) := "00000000";
    SIGNAL ALUV : std_logic := '0';
    SIGNAL ALUC : std_logic := '0';
    SIGNAL ALUS : std_logic := '0';
    SIGNAL ALUZ : std_logic := '0';

    BEGIN
        UUT : ALU
        PORT MAP (
            R => R,
            L => L,
            Z => Z,
            DO_RSHIFT => DO_RSHIFT,
            ALUOP_SZ => ALUOP_SZ,
            MSWC => MSWC,
            USE_CARRY => USE_CARRY,
            ALUOP => ALUOP,
            IR => IR,
            ALUV => ALUV,
            ALUC => ALUC,
            ALUS => ALUS,
            ALUZ => ALUZ
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                R <= "0000000000000010";
                L <= "0000000000000011";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                ALUOP <= "01";
                IR <= "00010000";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                ALUOP <= "10";
                IR <= "00100000";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                ALUOP <= "11";
                IR <= "00110000";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                DO_RSHIFT <= '1';
                IR <= "01110000";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                DO_RSHIFT <= '0';
                IR <= "00000101";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                IR <= "00000110";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                IR <= "11111111";
                -- -------------------------------------
                WAIT FOR 200 ns;

            END PROCESS;

    END testbench_arch;

