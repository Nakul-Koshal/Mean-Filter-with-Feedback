`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 00:34:36
// Design Name: 
// Module Name: sd_mux
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


module sd_mux(
input [3:0] Nslt,
input [10:0]s,
output reg [10:0]D
);

always @(*)begin
case(Nslt)
4'd0 :D=s;
4'd1: D=s-8'd255; 
4'd2: D=s-9'd510;
4'd3: D=s-10'd765;
4'd4: D=s-10'd1020;
4'd5: D=s-11'd1275;
4'd6: D=s-11'd1530;
4'd7: D=s-11'd1785;
4'd8: D=s-11'd2040;
default: D=s-10'd1020;
endcase
end
endmodule