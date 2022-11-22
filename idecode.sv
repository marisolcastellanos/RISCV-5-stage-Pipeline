`timescale 1ns / 1ps

module idecode(
    input   logic           clk,reset, 
    input   logic           RegWriteW,
    input   logic [31:0]    InstrD,
                            PCD, 
                            PCPlus4D, 
                            ResultW, 
    input   logic [5:0]     RdW,
    output  logic [5:0]     RdE,
    output  logic [31:0]    PCE,
                            RD1E,
                            RD2E,
                            ImmExtE, 
                            PCPlus4E,
    output  logic [1:0]     ResultSrcE,
    output  logic           MemWriteE,
    output  logic           ALUSrcE,
    output  logic           RegWriteE, JumpE,BranchE,
    output  logic [2:0]     ALUControlE);
    
 
    
//Extend immediate source 
extend(InstrD, ImmSrcD, ImmExtD); 
    
//Register File
regfile(a1,a2,RdW,ResultW,RegWriteD,RD1D,RD2D) 

//Control Unit
controller
          
                   

    
endmodule
