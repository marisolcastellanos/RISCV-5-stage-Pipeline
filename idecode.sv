`timescale 1ns / 1ps

module idecode(
    input   logic           clk,reset, 
    input   logic           RegWriteW,
    input   logic [31:0]    InstrD,
                            PCD, 
                            PCPlus4D, 
                            ResultW, 
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
   
    
//Extend immediate source 
extend ext(immsrc,instr,immext); 
    
//Register File
regfile rf(a1,a2,a3,wd3,we3,rd1,rd2); 

//Control Unit
controller contr(funct3D,funct7b5D,opD,MemWriteD,ALUSrcD,RegWriteD,JumpD,BranchD,ResultSrcD,ImmSrcD,ALUControlD);
   
//Idecode pipeline register
id_ex id_ex1(clk,reset,MemWriteD,ALUSrcD,RegWriteD,JumpD, BranchD,ResultSrcD,ALUControlD,RdD,RD1D,RD2D,PCD,ImmExtD, PCPlus4D, 
                 MemWriteE,ALUSrcE,RegWriteE, JumpE,BranchE,ResultSrcE,ALUControlE,RdE,PCE,RD1E,RD2E,ImmExtE,PCPlus4E);
    
    // simulation                             
   initial begin
     $display("Time\t PCD\t InstrD\t\t InstrD19_15\t InstrD24_20\t InstrD11_7\t  MemWriteE\t JumpE\t BranchE\t ALUSrcE\t ResultSrcE\t ALUControlE\t RD1E\t RD2E\t PCE\t PCPlus4E\t ImmExtE\t RdE");
     $monitor("%0d\t\t %0d\t\t %h\t\t   %0d\t\t\t %0d\t\t\t %0d\t\t %0d\t\t  %b\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %d\t\t\t  %0d\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t %0d\t\t", $time,  PCD, InstrD,
                    InstrD[19:15], InstrD[24:20], InstrD[11:7],
                    RegWriteE,
                    MemWriteE,
                    JumpE,
                    BranchE,
                    ALUSrcE,
                    ResultSrcE,
                    ALUControlE,
                    RD1E, 
                    RD2E,
                    PCE, 
                    PCPlus4E, 
                    ImmExtE,
                    RdE);
      #220 $finish;
   end
          
     
endmodule
