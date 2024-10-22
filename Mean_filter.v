`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 02:38:10
// Design Name: 
// Module Name: Mean_filter
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


module Mean_filter
  (
    input [7:0]P1,P2,P3,P4,P6,P7,P8,P9,
    output [7:0]m_out
  );
  
  wire [7:0]mean_nfp,mean_hv;
  wire [8:0]add1,add2,add3,add4;
  wire [9:0]add5,S1;
  wire [10:0]S,D;
  wire Ctr;
  wire [3:0]N_ppr,N_slt,T_np,T_nfp;
  
// Noisy pixel counter and control signal generator
  Npc_Csg Npc_Csg_1(.P1(P1),.P2(P2),.P3(P3),.P4(P4),.P6(P6),.P7(P7),.P8(P8),.P9(P9),.N_ppr(N_ppr),.Ctr(Ctr),.N_slt(N_slt));
  
// Add8
  assign T_np=N_ppr + N_slt;
  
// Sub
  assign T_nfp= 4'd8 - T_np;
  
// Add1
  assign add1= P1 + P3;
  
// Add2
  assign add2= P7 + P9;
  
// Add3
  assign add3= P2 + P4;
  
// Add4
  assign add4= P6 + P8;
  
// Add5
  assign add5= add1 + add2;
  
// Add6
  assign S1= add3 + add4;
  
// Add7
  assign S= add5 + S1;
 
// Select difference
  sd_mux sd_mux_1(.Nslt(N_slt),.s(S),.D(D));
  
// Select mean
  sm_mux sm_mux_1(.I(D),.T_nfp(T_nfp),.Mean_nfp(mean_nfp));
  
// S1/4
  assign mean_hv= S1 >> 2;
  
// MUX
  mux mux_1(.sel(Ctr),.I0(mean_nfp),.I1(mean_hv),.Y(m_out));
  
endmodule
