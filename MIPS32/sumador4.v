`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:00 06/19/2017 
// Design Name: 
// Module Name:    sumador4 
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
module sumador4(input [31:0] PC, output reg [31:0] newpc
    );
	 
always @(*) begin
	newpc <= PC + 4;
end


endmodule
