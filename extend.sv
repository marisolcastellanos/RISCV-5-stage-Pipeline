`timescale 1ns / 1ps

module extend(input  logic [31:7] InstrD,
              input  logic [1:0]  ImmSrcD,
              output logic [31:0] ImmExtD);
 
  always_comb
    case(ImmSrcD) 
               
      2'b00: ImmExtD = {{20{InstrD[31]}}, InstrD[31:20]};  // I-type 
               // 
      2'b01: ImmExtD =  {{20{InstrD[31]}}, InstrD[31:25], InstrD[11:7]};   // S-type (stores)
               // 
      2'b10: ImmExtD = {{20{InstrD[31]}}, InstrD[7], InstrD[30:25], InstrD[11:8], 1'b0};  // B-type (branches)
               // 
      2'b11: ImmExtD = {{12{InstrD[31]}}, InstrD[19:12], InstrD[20], InstrD[30:21], 1'b0};   // J-type (jal)
      default: ImmExtD = 32'bx; // undefined
    endcase             
endmodule
