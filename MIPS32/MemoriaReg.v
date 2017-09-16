`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:35 06/09/2017 
// Design Name: 
// Module Name:    MemoriaReg 
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
module MemoriaReg(
	input wire [31:0] DataIn,          
	output reg [31:0] DataOut,
	input wire clk
);

reg [31:0] MEMO;

initial begin
MEMO=0;
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(negedge clk) begin
	 MEMO <= DataIn;
end
always @(posedge clk) begin
	 DataOut <= MEMO;
end
endmodule
