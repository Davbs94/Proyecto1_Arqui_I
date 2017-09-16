`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:07 06/18/2017 
// Design Name: 
// Module Name:    instReg 
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
module instReg(
	input wire [31:0] DataIn,          
	input wire IR_W,
	output reg [5:0] opcode,
	output reg [5:0] funct,
	output reg [5:0] rs,
	output reg [5:0] rt,
	output reg [5:0] rd,
	output reg [15:0] inm,
	input wire clk
);

reg [31:0] MEMO;


initial begin
MEMO = 32'h00400000;
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(posedge clk) begin
	 if(IR_W)begin
		opcode = MEMO[31:26];
		funct = MEMO[5:0];
		rs
		MEMO = DataIn;
		$display("RegPI=%d",MEMO);
	 end
end
endmodule