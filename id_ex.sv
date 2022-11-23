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
    output  logic [2:0]     ALUControlE,
    output  logic [4:0]     RdE,
    output  logic [31:0]    PCE,
                            RD1E,
                            RD2E,
                            ImmExtE, 
                            PCPlus4E);
    
    always_ff@(posedge clk,posedge reset)
    if (reset) begin 
        MemWriteE <= 0; 
        ALUSrcE <= 0; 
        RegWriteE <= 0; 
        JumpE <= 0; 
        BranchE <= 0; 
        ResultSrcE <= 0; 
        ALUControlE <= 0; 
        RdE <= 0; 
        PCE <= 0; 
        RD1E <= 0; 
        RD2E <= 0; 
        ImmExtE <= 0; 
        PCPlus4E <= 0; 
    end 
    else begin 
        MemWriteE <= MemWriteD; 
        ALUSrcE <= ALUSrcD; 
        RegWriteE <= RegWriteD; 
        JumpE <= JumpD; 
        BranchE <= BranchD; 
        ResultSrcE <= ResultSrcD; 
        ALUControlE <= ALUControlD; 
        RdE <= RdD; 
        PCE <= PCD; 
        RD1E <= RD1D; 
        RD2E <= RD2D; 
        ImmExtE <= ImmExtD; 
        PCPlus4E <= PCPlus4D; 
    end              
 
endmodule
