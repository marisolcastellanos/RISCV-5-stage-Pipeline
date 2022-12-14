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



//~~~~~~~~~~~~~~~~~iFetch Module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  logic [31:0] tb_InstrD,tb_PCD,tb_PCPlus4D;
  logic tb_PCSrcE;
  logic [31:0]tb_PCTargetE;


  ifetch ifetch1(clk, reset,1'b0,tb_PCTargetE,tb_InstrD,tb_PCD,tb_PCPlus4D); 

   initial begin      
  // tb_PCSrcE = 0;    
  // tb_PCTargetE = 0;      
   end                    

//~~~~~~~~~~~~~~~Decode Module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   logic           tb_RegWriteW;
   logic [31:0]    tb_ResultW;
   logic           tb_MemWriteE, tb_ALUSrcE,tb_RegWriteE, tb_JumpE,tb_BranchE;   
   logic [1:0]     tb_ResultSrcE;
   logic [2:0]     tb_ALUControlE;
   logic [4:0]     tb_RdE;
   logic [4:0]     tb_RdW;
   logic [31:0]    tb_PCE, tb_RD1E, tb_RD2E,tb_ImmExtE,tb_PCPlus4E;
   
   idecode idecode1(clk,reset,tb_RdW,tb_RegWriteW, tb_InstrD, tb_PCD, tb_PCPlus4D, tb_ResultW, tb_MemWriteE, tb_ALUSrcE,tb_RegWriteE, tb_JumpE, tb_BranchE, tb_ResultSrcE, tb_ALUControlE,tb_RdE,tb_PCE,tb_RD1E,tb_RD2E,tb_ImmExtE,tb_PCPlus4E);
   
//~~~~~~~~~~~~~~~Execute Module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
   logic [31:0]    tb_ALUResultM, tb_WriteDataM, tb_PCPlus4M;
   logic [4:0]     tb_RdM;
   logic           tb_MemWriteM, tb_RegWriteM;
   logic [1:0]     tb_ResultSrcM;
   
   
   execute execute1(clk,reset,tb_RD1E,tb_RD2E,tb_ImmExtE, tb_PCE,tb_PCPlus4E,tb_RdE,tb_RegWriteE, tb_MemWriteE, tb_JumpE,tb_BranchE,tb_ALUSrcE,tb_ResultSrcE,tb_ALUControlE,tb_ALUResultM,tb_WriteDataM,tb_PCPlus4M,tb_PCTargetE,tb_RdM,tb_MemWriteM,tb_RegWriteM,tb_ResultSrcM,tb_PCSrcE); 
   
//~~~~~~~~~~~~~~~Memory Module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   

    logic [1:0]     tb_ResultSrcW;
    logic [31:0]    tb_ReadDataM,tb_ALUResultW,tb_ReadDataW,tb_PCPlus4W; 
    
    memory memory1(clk,reset,tb_RegWriteM,tb_ResultSrcM,tb_RdM,tb_ALUResultM,tb_PCPlus4M,tb_MemWriteM,tb_WriteDataM,tb_RegWriteW,tb_ResultSrcW,tb_RdW,tb_ALUResultW,tb_ReadDataW,tb_PCPlus4W);

//~~~~~~~~~~~~~~~~Writeback Module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    writeback writeback1(clk,reset,tb_ResultSrcW,tb_ReadDataW,tb_PCPlus4W,tb_ALUResultW,tb_ResultW);


   initial begin
   
      $display("Time\t tb_ResultW");
      $monitor("%0d\t\t %h\t", $time, tb_ResultW);
      #260 $finish;
   end 
endmodule // pipeline
