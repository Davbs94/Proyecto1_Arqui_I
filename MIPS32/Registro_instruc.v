`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:28 06/18/2017 
// Design Name: 
// Module Name:    Registro_instruc 
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
module Registro_instruc(
	input wire [31:0] DataIn,          
	input wire IR_W,
	output reg [31:0] DataOut,
	input wire clk
);

reg [31:0] MEMO;


initial begin
MEMO = 32'h00000000;
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(negedge clk) begin
	 if(IR_W)begin
		MEMO = DataIn;
	 end
	
end
always @(posedge clk) begin
	DataOut <= MEMO;
end
endmodule