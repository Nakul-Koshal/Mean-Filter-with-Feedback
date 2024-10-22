`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 02:36:17
// Design Name: 
// Module Name: trimmed_filter
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


module trimmed_filter(
input [7:0]P,
input clk,rst,
output [7:0]out
);

wire sel; //  select line for mux (Control signal of R5 -> telling whether R5 is noisy or not)
wire [7:0] R1,R2,R3,R4,R5,R6,R7,R8,R9,m_out;// Register Bank and mean filter output

// Buffer Instantiation
Buffer buffer(.clk(clk),.rst(rst),.Pixel(P),.R1(R1),.R2(R2),.R3(R3),.R4(R4),.R5(R5),.R6(R6),.R7(R7),.R8(R8),.R9(R9),.feed(out));

// Mean Filter Instantiation
Mean_filter mean_filter(.P1(R1),.P2(R2),.P3(R3),.P4(R4),.P6(R6),.P7(R7),.P8(R8),.P9(R9),.m_out(m_out));

// Noise Detector Instantiation
Detector detector(.P(R5),.NoD(sel));

// Mux Instantiation
mux mux_final_output(.sel(sel),.I1(m_out),.I0(R5),.Y(out));

endmodule
