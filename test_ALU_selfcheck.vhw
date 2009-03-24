--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : ISE
--  /   /         Filename : test_ALU_selfcheck.vhw
-- /___/   /\     Timestamp : Sun Mar 22 21:27:48 2009
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test_ALU_selfcheck
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test_ALU_selfcheck IS
END test_ALU_selfcheck;

ARCHITECTURE testbench_arch OF test_ALU_selfcheck IS
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
    SIGNAL ALUV : std_logic := '1';
    SIGNAL ALUC : std_logic := '1';
    SIGNAL ALUS : std_logic := '1';
    SIGNAL ALUZ : std_logic := '1';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

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
            PROCEDURE CHECK_ALUC(
                next_ALUC : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (ALUC /= next_ALUC) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns ALUC="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, ALUC);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_ALUC);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_ALUS(
                next_ALUS : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (ALUS /= next_ALUS) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns ALUS="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, ALUS);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_ALUS);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_ALUV(
                next_ALUV : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (ALUV /= next_ALUV) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns ALUV="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, ALUV);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_ALUV);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_ALUZ(
                next_ALUZ : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (ALUZ /= next_ALUZ) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns ALUZ="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, ALUZ);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_ALUZ);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_Z(
                next_Z : std_logic_vector (0 To 15);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (Z /= next_Z) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns Z="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Z);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Z);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                R <= "0000000000000010";
                L <= "0000000000000011";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                ALUOP <= "01";
                IR <= "00000001";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                ALUOP <= "10";
                IR <= "00000010";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                ALUOP <= "11";
                IR <= "00000011";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                DO_RSHIFT <= '1';
                IR <= "00000100";
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
                IR <= "00000111";
                -- -------------------------------------
                WAIT FOR 200 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

