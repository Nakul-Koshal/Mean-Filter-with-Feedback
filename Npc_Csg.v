`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 17:56:51
// Design Name: 
// Module Name: Npc_Csg
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

// Noisy pixel counter and control signal generator
module Npc_Csg
(
input [7:0]P1,P2,P3,P4,P6,P7,P8,P9,
output [3:0]N_ppr,N_slt,
output Ctr
);

  csg csg_1(.P0(P2),.P1(P4),.P2(P6),.P3(P8),.Ctr(Ctr));
  NoPepper NoPepper_1(.P1(P1),.P2(P2),.P3(P3),.P4(P4),.P6(P6),.P7(P7),.P8(P8),.P9(P9),.N_ppr(N_ppr));
  NoSalt NoSalt_1(.P1(P1),.P2(P2),.P3(P3),.P4(P4),.P6(P6),.P7(P7),.P8(P8),.P9(P9),.N_slt(N_slt));
    
endmodule
