`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:36 06/10/2017 
// Design Name: 
// Module Name:    InstruccionReg 
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
module InstruccionReg(
	input wire [31:0] DataIn,
	input wire IR_W,
	output reg [31:0] DataOut,
	input wire clk
);

reg [31:0] MEMO;

initial begin
MEMO=0;
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(posedge clk) begin

	dataOut <= MEMO;
	
end

always @(negedge clk) begin
	if(IR_W)begin
		MEMO <= DataIn;
	end
	else begin
		DataOut <= MEMO;
	end
	
endmodule
