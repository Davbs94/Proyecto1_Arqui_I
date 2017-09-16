`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:40 04/27/2017 
// Design Name: 
// Module Name:    clk1khz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk1khz(clk, oclk);
input clk;

output reg oclk;
reg [15:0] count; // 65535

initial 
	count=1'b0;
always @ (posedge clk) begin
 count<=count+ 1'b1;
 if (count >= 16'b1100001101010000) //50k0
	oclk<=1'b1;
 else
	oclk<=1'b0;
 end
 
endmodule