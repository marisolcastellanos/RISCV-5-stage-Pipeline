`timescale 1ns / 1ps

module controller(input  logic [6:0] opD,
                  input  logic [2:0] funct3D,
                  input  logic       funct7b5D,
                  output logic       MemWriteD,
                  output logic       ALUSrcD,
                  output logic       RegWriteD, JumpD,BranchD,
                  output logic [1:0] ResultSrcD,
                  output logic [1:0] ImmSrcD,
                  output logic [2:0] ALUControlD);

  logic [1:0] ALUOp;
  logic       Branch;

  maindec md(opD, ResultSrcD, MemWriteD, BranchD,
             ALUSrcD, RegWriteD, JumpD, ImmSrcD, ALUOp);
  aludec  ad(opD[5], funct3D, funct7b5D, ALUOp, ALUControlD);

  assign PCSrcE = BranchE & ZeroE | JumpE;
endmodule
