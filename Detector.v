`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 00:45:57
// Design Name: 
// Module Name: Detector
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

// Noise Detector Unit
module Detector
  (
  input [7:0]P,
  output NoD
);
  
  wire [13:0]con;
  
//	Stage-1
  nor nor_s1_1(con[0],P[0],P[1]);
  nor nor_s1_2(con[1],P[2],P[3]);
  nor nor_s1_3(con[2],P[4],P[5]);
  nor nor_s1_4(con[3],P[6],P[7]);
  
  nand nand_s1_1(con[4],P[0],P[1]);
  nand nand_s1_2(con[5],P[2],P[3]);
  nand nand_s1_3(con[6],P[4],P[5]);
  nand nand_s1_4(con[7],P[6],P[7]);
  
  
  
  
// Stage-2
  and and_s2_1(con[8],con[0],con[1]);
  and and_s2_2(con[9],con[2],con[3]);
  
  nor nor_s2_1(con[10],con[4],con[5]);
  nor nor_s2_2(con[11],con[6],con[7]);
  
  


// Stage-3
  and and_s3_1(con[12],con[8],con[9]);
  
  and and_s3_2(con[13],con[10],con[11]);
  
  
  
  
// Ouput 
  or or_o(NoD,con[12],con[13]);
  // HERE WE TOOK (OR) AND NOT (NOR) BECAUSE WE WANTED 1 IF THERE WAS A NOISY PIXEL RATHER THAN A 0
  
  endmodule
