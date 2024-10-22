`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2023 22:37:46
// Design Name: 
// Module Name: tds_tb
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

module trimmed_tb();
reg clk,rst; // clock  and reset
reg [7:0]P;
wire [7:0]out;
reg [16:0] vectornum; // bookkeeping variables        //2^16 = 65536
reg [7:0] testvectors[1:65536]; //array of testvectors //256*256

integer outfile; // File descriptor
   
//instantiate device under test
trimmed_filter dut(.clk(clk),.rst(rst),.P(P),.out(out));

// generate clock
always #5 clk=~clk;

//initial begin
//$dumpfile("power_trimmed.vcd");
//$dumpvars(1,trimmed_tb.dut);
//end

// at start of test, load vectors
initial 
begin
$readmemb("D:/Median_Filter/Input.mem",testvectors); // Read vectors 
outfile = $fopen("D:/Median_Filter/Outputs/Output_trimmed.txt","w"); // Open the file to which results are to be written

//  Initialize
vectornum = 0;
clk=0;rst=0; 
end

// apply test vectors on rising edge of clk
always @(posedge clk)
begin
P = testvectors[vectornum];
end

// check results on falling edge of clk
always @(negedge clk)begin
if(~rst)begin
$fdisplay (outfile, "%b",out ); // Writing the result to the File
vectornum = vectornum + 1; // read next vector
if (testvectors[vectornum] === 8'bx)
begin
$fclose(outfile); // close the file
$finish;// End simulation
end
end
end

endmodule