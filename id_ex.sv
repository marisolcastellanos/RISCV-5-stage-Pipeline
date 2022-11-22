`timescale 1ns / 1ps



module id_ex(

    input   logic           clk,reset,
    input   logic           MemWriteD,
    input   logic           ALUSrcD,
    input   logic           RegWriteD, JumpD,BranchD,
    input   logic [1:0]     ResultSrcD,
    input   logic [2:0]     ALUControlD,
    input   logic [5:0]     RdD,
    input   logic [31:0]    RD1D,RD2D, 
                            PCD,
                            ImmExtD, 
                            PCPlus4D, 
    output  logic           MemWriteE,
    output  logic           ALUSrcE,
    output  logic           RegWriteE, JumpE,BranchE,
    output  logic [1:0]     ResultSrcE,
    output  logic [2:0]     ALUControlE)
    output  logic [4:0]     RdE,
    output  logic [31:0]    PCE,
                            RD1E,
                            RD2E,
                            ImmExtE, 
                            PCPlus4E);
    
    
    
    

                        
    

    );
endmodule
