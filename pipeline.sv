`timescale 1ns / 1ps

module pipeline();

logic   clk; 
logic   reset;

//logic [31:0] WriteData, DataAdr;
//logic        MemWrite;
  
// initialize test
  initial
    begin
      reset <= 1; # 5; reset <= 0;
    end

// generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end



//~~~~~~~~~~~~~~~~~iFetch Module~~~~~~~~~~~~~~~~~~~~~~

  logic [31:0] tb_InstrD,tb_PCD,tb_PCPlus4D;
  logic tb_PCSrcE;
  logic [31:0]tb_PCTargetE;


  ifetch ifetch1(clk, reset,tb_PCSrcE,tb_PCTargetE,tb_InstrD,tb_PCD,tb_PCPlus4D); 

   initial begin      
    tb_PCSrcE <= 0;    
    tb_PCTargetE <= 0;      
   end                    

//~~~~~~~~~~~~~~~Decode Module~~~~~~~~~~~~~~~~~~~~~~~~~~

   logic           tb_RegWriteD;
   logic [31:0]    tb_ResultW;
   logic           tb_MemWriteE, tb_ALUSrcE,tb_RegWriteE, tb_JumpE,tb_BranchE;   
   logic [1:0]     tb_ResultSrcE;
   logic [2:0]     tb_ALUControlE;
   logic [4:0]     tb_RdE;
   logic [31:0]    tb_PCE, tb_RD1E, tb_RD2E,tb_ImmExtE,tb_PCPlus4E;
   
   idecode idecode1(clk,reset,tb_RegWriteD, tb_InstrD, tb_PCD, tb_PCPlus4D, tb_ResultW, tb_MemWriteE, tb_ALUSrcE,tb_RegWriteE, tb_JumpE, tb_BranchE, tb_ResultSrcE, tb_ALUControlE,tb_RdE,tb_PCE,tb_RD1E,tb_RD2E,tb_ImmExtE,tb_PCPlus4E);
   
endmodule // pipeline
