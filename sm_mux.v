`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 02:39:26
// Design Name: 
// Module Name: sm_mux
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


module sm_mux
  (
    input [10:0]I,
    input [3:0]T_nfp,
    output reg [7:0]Mean_nfp
  );
  
  wire [7:0]D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_16,D_32,D_64,D_128;
  
  assign D_2= I >> 1;
  assign D_4= I >> 2;
  assign D_8= I >> 3;
  assign D_16= I >> 4;
  assign D_32= I >> 5;
  assign D_64= I >> 6;
  assign D_128= I >> 7;
  assign D_3= D_4 + D_16 + D_64;
  assign D_5= D_4 - D_16 + D_128;
  assign D_6= D_8 + D_32 + D_128;
  assign D_7= D_8 + D_64;

  always @(*)
    begin
      case(T_nfp)
        4'd0 : Mean_nfp=8'b0;
        4'd1 : Mean_nfp=I;
        4'd2 : Mean_nfp=D_2;
        4'd3 : Mean_nfp=D_3;
        4'd4 : Mean_nfp=D_4;
        4'd5 : Mean_nfp=D_5;
        4'd6 : Mean_nfp=D_6;
        4'd7 : Mean_nfp=D_7;
        4'd8 : Mean_nfp=D_8;
        default: Mean_nfp=D_4;
        endcase
        end
        endmodule
