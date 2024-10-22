`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 02:37:18
// Design Name: 
// Module Name: Buffer
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


module Buffer
# (parameter COUNT= 253)//  Size of Line Buffer 
// REMEMBER HERE WE TOOK { PIXELS IN A IMAGE (ROW) - 3} BECAUSE OF THE REGISTERS 1,2,3,4,5,6,7,8,9 PRESENT IN THE FLOW
  (
    input clk,rst,
    input [7:0]Pixel,feed,
    output reg [7:0] R1,R2,R3,R4,R5,R6,R7,R8,R9
    );
    
    reg [7:0] line_buff1 [COUNT-1:0];
    reg [7:0] line_buff2 [COUNT-1:0];
    reg [7:0] RT1,RT2,RT3,RT4,RT5,RT6,RT7,RT8,RT9;// Temporary  Registers
    integer i;
    
    always @ (posedge clk)
    begin
    if(rst) begin
    RT7 <= 1'd0;
    RT8 <= 1'd0;
    RT9 <= 1'd0;
    RT4 <= 1'd0;
    RT5 <= 1'd0;
    RT6 <= 1'd0;
    RT1 <= 1'd0;
    RT2 <= 1'd0;
    RT3 <= 1'd0;
    end
    
    else begin
    
    RT9 <= Pixel;
    RT8 <= RT9;
    RT7 <= RT8;
    line_buff2[0] <= RT7;
    RT6 <= line_buff2[COUNT-1];
    
    for ( i=COUNT-2 ; i>=0; i=i-1 )
        line_buff2[i+1] <= line_buff2[i];
 
 
     RT5 <= RT6;
     RT4 <= RT5;
     line_buff1[0] <= RT4;
     RT3 <= line_buff1[COUNT-1];
     
     for ( i=COUNT-2 ; i>=0; i=i-1 )
         line_buff1[i+1] <= line_buff1[i];
   RT2 <= RT3;
   RT1 <= RT2;
   
   if(RT4 != feed)
      RT4 <= feed;
   end
   end//posedge end 
   
   always @(*)
   if(RT1 !== 8'bx)
// if(RT1) 
   begin
   R1<=RT1;
   R2<=RT2;
   R3<=RT3;
   R4<=RT4;
   R5<=RT5;
   R6<=RT6;
   R7<=RT7;
   R8<=RT8;
   R9<=RT9;
   end 
   
  endmodule
  