`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:37 06/17/2017 
// Design Name: 
// Module Name:    PCReg 
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
module PCReg(
	input wire [31:0] DataIn,          
	input wire PC_LD,
	output reg [31:0] DataOut,
	input wire clk
);

reg [31:0] MEMO;


initial begin
MEMO = 32'h00400000;
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers

always @(negedge clk) begin
	 if(PC_LD)begin
		MEMO = DataIn;
	 end
	
end
always @(posedge clk) begin
	DataOut <= MEMO;
end
endmodule
