`timescale 1ns / 1ps


module writeback(
    input   logic           clk,reset,
    input   logic           RegWriteW,
    input   logic [1:0]     ResultSrcW,
    input   logic [31:0]    ReadDataW,
    input   logic [4:0]     RdW,
    input   logic [31:0]    PCPlus4W,
    input   logic [31:0]    ALUResultW,
    output  logic [31:0]    ResultW);
    
    mux3 #(32) resultmux(ALUResultW,ReadDataW,PCPlus4W,ResultSrcW,ResultW);
endmodule
