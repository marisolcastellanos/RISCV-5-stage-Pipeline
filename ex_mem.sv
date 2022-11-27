`timescale 1ns / 1ps

module ex_mem(

    input   logic        clk, reset, 
    input   logic        RegWriteE,
    input   logic [1:0]  ResultSrcE,
    input   logic        MemWriteE, 
    input   logic [31:0] ALUResultE, 
    input   logic        WriteDataE, 
    input   logic        RdE,
    input   logic [31:0] PCPlus4E,

    output logic        RegWriteM,
    output logic [1:0]  ResultSrcM,
    output logic        MemWriteM, 
    output logic [31:0] ALUResultM, 
    output logic        WriteDataM, 
    output logic        RdM,
    output logic [31:0] PCPlus4M);
    
    always_ff@(posedge clk,posedge reset)
        if (reset) begin 
            RegWriteM <= 0;
            ResultSrcM <= 0;
            MemWriteM <= 0;
            ALUResultM <= 0;
            WriteDataM <= 0;
            RdM <= 0;
            PCPlus4M <= 0;
         end 
         else begin 
            RegWriteM <= RegWriteE;
            ResultSrcM <= ResultSrcE;
            MemWriteM <= MemWriteE;
            ALUResultM <= ALUResultE;
            WriteDataM <= WriteDataE;
            RdM <= RdE;
            PCPlus4M <= PCPlus4E;
         end
    
    
endmodule
