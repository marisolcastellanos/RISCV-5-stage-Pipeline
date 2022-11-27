`timescale 1ns / 1ps


module memory(
    input   logic           clk,reset,
    input   logic           RegWriteM,
    input   logic [1:0]     ResultSrcM, 
    input   logic           MemWriteM,
    input   logic [31:0]    ALUResultM,
    input   logic [31:0]    WriteDataM, 
    input   logic [4:0]     RdM, 
    input   logic [31:0]    PCPlus4M,
    output  logic           RegWriteW,
    output  logic [1:0]     ResultSrcW, 
    output  logic [31:0]    ALUResultW,
    output  logic [31:0]    ReadDataW,
    output  logic [4:0]     RdW, 
    output  logic [31:0]    PCPlus4W);
    
    logic [31:0] ReadDataM;
    
    dmem dmem1(clk,MemWriteM,ALUResultM,WriteDataM,ReadDataM); 
    mem_wb mem_wb1(clk,reset,RegWriteM,ResultSrcM,ALUResultM,ReadDataM,RdM,PCPlus4M,RegWriteW,ResultSrcW,ALUResultW,ReadDataW,RdW,PCPlus4W);
    
endmodule
