`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 00:32:36
// Design Name: 
// Module Name: NoSalt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module NoSalt
  (
    input [7:0]P1,P2,P3,P4,P6,P7,P8,P9,
    output [3:0]N_slt
  );
  
  wire c1,c2,c3,c4,c6,c7,c8,c9;
  wire [1:0]c10,c11,c12,c13;
  wire [2:0]c14,c15;
  
  
  
// Stage-1
  SaltOrNot SS1(.S_ctr(c1),.P(P1));
  SaltOrNot SS2(.S_ctr(c2),.P(P2));
  SaltOrNot SS3(.S_ctr(c3),.P(P3));
  SaltOrNot SS4(.S_ctr(c4),.P(P4));
  
  SaltOrNot SS5(.S_ctr(c6),.P(P6));
  SaltOrNot SS6(.S_ctr(c7),.P(P7));
  SaltOrNot SS7(.S_ctr(c8),.P(P8));
  SaltOrNot SS8(.S_ctr(c9),.P(P9));
  
  
  
// Stage-2
  assign c10 = c1 + c2;
  assign c11 = c3 + c4;
  
  assign c12 = c6 + c7;
  assign c13 = c8 + c9;
  
  
  
// Stage-3
  assign c14 = c10 + c11;
  assign c15 = c12 + c13;
  
  
  
// Output
  assign N_slt = c14 + c15;
  
endmodule
