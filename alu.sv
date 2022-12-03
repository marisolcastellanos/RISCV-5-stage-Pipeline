`timescale 1ns / 1ps


module alu(input  logic [31:0] SrcAE,
           input  logic [31:0] SrcBE,
           input  logic [2:0]  ALUControlE,
           output logic        ZeroE,
           output logic [31:0] ALUResultE);
  //logic ZeroE;
  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when is add or subtract operation

  assign condinvb = ALUControlE[0] ? ~SrcBE : SrcBE;
  assign sum = SrcAE + condinvb + ALUControlE[0];
  assign isAddSub = ~ALUControlE[2] & ~ALUControlE[1] |
                    ~ALUControlE[1] & ALUControlE[0];

  always_comb
    case (ALUControlE)
      3'b000: ALUResultE=sum; 
      3'b001: ALUResultE=sum; 
      3'b101: ALUResultE=sum[31]^v;
      3'b011: ALUResultE=SrcAE|SrcBE;
      3'b010: ALUResultE=SrcAE&SrcBE;
      default: ALUResultE=32'bx;
    endcase

  assign ZeroE = (ALUResultE == 0) ? 1 : 0;
  assign v = ~(ALUControlE[0] ^ SrcAE[31] ^ SrcBE[31]) & (SrcAE[31] ^ sum[31]) & isAddSub;
  
endmodule

