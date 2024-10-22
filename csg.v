`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 00:28:48
// Design Name: 
// Module Name: csg
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

// Control Signal Generator
module csg
  (
    input [7:0]P0,P1,P2,P3,
    output Ctr
  );
  
  wire c0,c1,c2,c3,c4,c5;
  
// Stage-1
  Detector D1(.NoD(c0),.P(P0));
  Detector D2(.NoD(c1),.P(P1));
  Detector D3(.NoD(c2),.P(P2));
  Detector D4(.NoD(c3),.P(P3));
  
// Stage-2
  and and_s2_1(c4,c0,c1);
  
  and and_s2_2(c5,c2,c3);
  
// Output
  and and_o(Ctr,c4,c5);
  
endmodule