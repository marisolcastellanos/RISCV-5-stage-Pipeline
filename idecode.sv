`timescale 1ns / 1ps

module idecode(
    input   logic           clk,reset,
    input   logic [4:0]     RdW, 
    input   logic           RegWriteW, //WE3
    input   logic [31:0]    InstrD,  
                            PCD, 
                            PCPlus4D, 
                            ResultW, //WD3
    output  logic           MemWriteE,
    output  logic           ALUSrcE,
    output  logic           RegWriteE, 
    output  logic           JumpE,
    output  logic           BranchE,
    output  logic [1:0]     ResultSrcE,
    output  logic [2:0]     ALUControlE,
    output  logic [4:0]     RdE, //A3
    output  logic [31:0]    PCE,
                            RD1E, //RD1
                            RD2E,  //RD2
                            ImmExtE, 
                            PCPlus4E);
logic [4:0]     RdD;
logic [31:0]    RD1D,RD2D,ImmExtD;
logic [1:0]     ImmSrcD,ResultSrcD;
logic           MemWriteD,ALUSrcD,JumpD,BranchD;
logic [2:0]     ALUControlD;
logic           RegWriteD;    
//Extend immediate source 
extend ext(.instr(InstrD[31:7]),.immsrc(ImmSrcD),.immext(ImmExtD)); 
    
//Register File
regfile rf(clk,RegWriteW,InstrD[19:15],InstrD[24:20],RdW,ResultW,RD1D,RD2D); 

//Control Unit
controller contr(InstrD[6:0],InstrD[14:12],InstrD[30],RegWriteD,ResultSrcD,MemWriteD,JumpD,BranchD,ALUControlD,ALUSrcD,ImmSrcD);
   
//Idecode pipeline register
id_ex id_ex1(clk,reset,MemWriteD,ALUSrcD,RegWriteD,JumpD,BranchD,ResultSrcD,ALUControlD,InstrD[11:7],PCD,RD1D,RD2D,ImmExtD, PCPlus4D, 
                       MemWriteE,ALUSrcE,RegWriteE,JumpE,BranchE,ResultSrcE,ALUControlE,RdE,PCE,RD1E,RD2E,ImmExtE, PCPlus4E);
    
    // simulation                             
//   initial begin
//     $display("Time\t PCD\t InstrD\t\t InstrD19_15\t InstrD24_20\t InstrD11_7\t  MemWriteE\t JumpE\t BranchE\t ALUSrcE\t ResultSrcE\t ALUControlE\t RD1E\t RD2E\t PCE\t PCPlus4E\t ImmExtE\t RdE");
//     $monitor("%0d\t\t %0d\t\t %h\t\t   %0d\t\t\t %0d\t\t\t %0d\t\t %0d\t\t  %b\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %d\t\t\t  %0d\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t %0d\t\t", $time,  PCD, InstrD,
//                    InstrD[19:15], InstrD[24:20], InstrD[11:7],
//                    RegWriteE,
//                    MemWriteE,
//                    JumpE,
//                    BranchE,
//                    ALUSrcE,
//                    ResultSrcE,
//                    ALUControlE,
//                    RD1E, 
//                    RD2E,
//                    PCE, 
//                    PCPlus4E, 
//                    ImmExtE,
//                    RdE);
//      #220 $finish;
//   end
          
     
endmodule
