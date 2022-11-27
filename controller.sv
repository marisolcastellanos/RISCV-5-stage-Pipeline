`timescale 1ns / 1ps

module controller(input  logic [6:0] opD,
                  input  logic [2:0] funct3D,
                  input  logic       funct7b5D,
                  output logic       RegWriteD,
                  output logic [1:0] ResultSrcD,
                  output logic       MemWriteD, JumpD,BranchD,
                  output logic [2:0] ALUControlD,
                  output logic       ALUSrcD,
                  output logic [1:0] ImmSrcD);

  logic [1:0] ALUOp;
  logic       PCSrcE;
  logic       JumpE;
  logic       BranchE; 
  logic       ZeroE;
  //logic       Branch;

  maindec md(opD, ResultSrcD, RegWriteD, BranchD,
             ALUSrcD, MemWriteD, JumpD, ImmSrcD, ALUOp);
  aludec  ad(opD[5], funct3D, funct7b5D, ALUOp, ALUControlD);

  //assign PCSrcE = BranchE & ZeroE | JumpE;
endmodule
