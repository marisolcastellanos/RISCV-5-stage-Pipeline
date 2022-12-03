`timescale 1ns / 1ps


module aludec(input  logic       opb5,
              input  logic [2:0] funct3D,
              input  logic       funct7b5D, 
              input  logic [1:0] ALUOp,
              output logic [2:0] ALUControlD);

  logic  RtypeSub;
  assign RtypeSub = funct7b5D & opb5;  // TRUE for R-type subtract instruction

  always_comb
    case(ALUOp)
     // add the logic here 
      2'b00: ALUControlD = 3'b000; //add
        
      2'b01: ALUControlD = 3'b001; //subtract
          
      2'b10: case(funct3D)
        
        3'b010: ALUControlD = 3'b101; //SLT      
            
        3'b110: ALUControlD = 3'b011; //OR 
            
        3'b111: ALUControlD = 3'b010; //AND
       
        3'b000: case({opb5,funct7b5D}) 
          2'b11: ALUControlD = 3'b001;
          
          2'b00: ALUControlD = 3'b000;
                              
          2'b01: ALUControlD = 3'b000;
                              
          2'b10: ALUControlD = 3'b000;
                              
          endcase
           
        default: ALUControlD= 3'bxxx;  
        endcase
    endcase
endmodule
