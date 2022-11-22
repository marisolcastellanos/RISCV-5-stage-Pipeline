`timescale 1ns / 1ps


module regfile(input  logic        clk, 
               input  logic        RegWriteW, 
               input  logic [ 4:0] a1, a2, RdW, 
               input  logic [31:0] ResultW, 
               output logic [31:0] RD1D, RD2D);

  logic [31:0] rf[31:0];

  // three ported register file
  // read two ports combinationally (A1/RD1, A2/RD2)
  // write third port on rising edge of clock (A3/WD3/WE3)
  // register 0 hardwired to 0

  always_ff @(posedge clk)
    if(RegWriteW)
      rf[RdW]<=ResultW;
  
  assign RD1D = (a1!=0)?rf[a1]:0;
  assign RD2D = (a2!=0)?rf[a2]:0;

  
endmodule
