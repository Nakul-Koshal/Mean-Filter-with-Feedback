`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 00:33:29
// Design Name: 
// Module Name: SaltOrNot
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


module 	SaltOrNot
  (
    input [7:0]P,
    output S_ctr
  );
  
  wire [5:0]con;
  
// Stage-1
  and and_s1_1(con[0],P[0],P[1]);
  and and_s1_2(con[1],P[2],P[3]);
  and and_s1_3(con[2],P[4],P[5]);
  and and_s1_4(con[3],P[6],P[7]);
  
// Intermediate Stage
  and and_i_1(con[4],con[0],con[1]);
  and and_i_2(con[5],con[2],con[3]);
  
// Output
  and and_o(S_ctr,con[4],con[5]);
  
endmodule
