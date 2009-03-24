////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2003 Xilinx, Inc.
// All Right Reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : ISE
//  /   /         Filename : test_ALU.tfw
// /___/   /\     Timestamp : Sun Mar 22 21:20:48 2009
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: 
//Design Name: test_ALU_tb_0
//Device: Xilinx
//
`timescale 1ns/1ps

module test_ALU_tb_0;
    reg [0:15] R = 16'b0000000000000000;
    reg [0:15] L = 16'b0000000000000000;
    wire [0:15] Z;
    reg DO_RSHIFT = 1'b0;
    reg ALUOP_SZ = 1'b0;
    reg MSWC = 1'b0;
    reg USE_CARRY = 1'b0;
    reg [0:1] ALUOP = 2'b00;
    reg [0:7] IR = 8'b00000000;
    wire ALUV;
    wire ALUC;
    wire ALUS;
    wire ALUZ;


    ALU UUT (
        .R(R),
        .L(L),
        .Z(Z),
        .DO_RSHIFT(DO_RSHIFT),
        .ALUOP_SZ(ALUOP_SZ),
        .MSWC(MSWC),
        .USE_CARRY(USE_CARRY),
        .ALUOP(ALUOP),
        .IR(IR),
        .ALUV(ALUV),
        .ALUC(ALUC),
        .ALUS(ALUS),
        .ALUZ(ALUZ));

    initial begin
        // -------------  Current Time:  100ns
        #100;
        R = 16'b0000000000000010;
        L = 16'b0000000000000011;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        ALUOP = 2'b01;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        ALUOP = 2'b10;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        ALUOP = 2'b11;
    end

endmodule

