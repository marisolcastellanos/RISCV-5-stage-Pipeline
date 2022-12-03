`timescale 1ns / 1ps


module execute(

    input  logic         clk,reset,
    input  logic [31:0]  RD1E,
    input  logic [31:0]  RD2E,
    input  logic [31:0]  ImmExtE,
    input  logic [31:0]  PCE,
    input  logic [31:0]  PCPlus4E,
    input  logic [4:0]   RdE,
    input  logic         RegWriteE,
    input  logic         MemWriteE,
    input  logic         JumpE,
    input  logic         BranchE,
    input  logic         ALUSrcE,
    input  logic [1:0]   ResultSrcE, 
    input  logic [2:0]   ALUControlE, 
    output logic [31:0]  ALUResultM,
    output logic [31:0]  WriteDataM,
    output logic [31:0]  PCPlus4M, 
    output logic [31:0]  PCTargetE,
    output logic [4:0]   RdM, 
    output logic         MemWriteM,
    output logic         RegWriteM,
    output logic [1:0]   ResultSrcM,
    output logic         PCSrcE );
    
    //logic   PCSrcE;
    logic   ZeroE; 
    logic [31:0] SrcAE;
    logic [31:0] SrcBE;
    logic [31:0] ALUResultE;
    logic [31:0] WriteDataE;
   
    assign PCSrcE = BranchE & ZeroE | JumpE;
    assign WriteDataE = RD2E;
    
    mux2 #(32)    srcbmux(RD2E,ImmExtE,ALUSrcE,SrcBE);
    adder         pcADDbranch(PCE,ImmExtE,PCTargetE);
    alu           ALU(RD1E,SrcBE, ALUControlE,ZeroE,ALUResultE);
    ex_mem        ex_mem1(clk,reset,RegWriteE,ResultSrcE,MemWriteE, ALUResultE,WriteDataE,RdE,PCPlus4E,RegWriteM,ResultSrcM,MemWriteM, ALUResultM,WriteDataM,RdM,PCPlus4M);
    
    
    
    
endmodule
