`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:14 06/19/2017 
// Design Name: 
// Module Name:    jumpcalculation 
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
module jumpcalculation(input [31:0] pc, input [25:0] address, output reg [31:0] newjump
    );

always @(*) begin
	newjump = {pc[31:28],address, 2'b00}; 
end

endmodule
