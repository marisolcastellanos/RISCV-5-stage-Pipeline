`timescale 1ns / 1ps


module execute(

    input  logic         clk,reset,
    input  logic [31:0]  RD1E,RD2E,ImmExtE,PCE,PCPlus4E,
    input  logic [4:0]   RdE,
    input  logic         RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,
    input  logic [1:0]   ResultSrcE, 
    input  logic [2:0]   ALUControlE, 
    output logic [31:0]  ALUResutM,WriteDataM,PCPlus4M, PCTargetE,
    output logic [4:0]   RdM, 
    output logic         MemWriteM,RegWriteM, 
    output logic [1:0]   ResultSrcM );
    
    logic   PCSrcE;
    logic   ZeroE; 
    logic   SrcBE;
    logic   ALUResultE;
    
    
    assign PCSrcE = BranchE & ZeroE | JumpE;
    
    mux2 #(32) srcbmux(RD2E,ImmExtE,ALUSrcE,SrcBE);
    adder      PCaddBRANCH(PCE,ImmExtE,PCTargetE);
    alu        alu(RD1E,SrcBE, ALUControlE,ALUResultE,ZeroE);
    
    
endmodule
