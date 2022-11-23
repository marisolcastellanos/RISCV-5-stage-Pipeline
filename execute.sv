`timescale 1ns / 1ps


module execute(

    input  logic         clk,reset,
    input  logic [31:0]  RD1E,RD2E,ImmExtE,PCE,PCPlus4E,
    input  logic [4:0]   RdE,
    input  logic         RegWriteE,MemWriteE,JumpE,BranchE,AUSrcE,
    input  logic [1:0]   ResultSrcE, 
    input  logic [2:0]   ALUControlE, 
    output logic [31:0]  ALUResutM,WriteDataM,PCPlus4M, PCTargetE,
    output logic [4:0]   RdM, 
    output logic         MemWriteM,RegWriteM, 
    output logic [1:0]   ResultSrcM );
    
    logic   PCSrcE;
    logic   ZeroE; 
    
    
    assign PCSrcE = BranchE & ZeroE | JumpE;
    
    
    
endmodule
