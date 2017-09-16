`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:47 06/03/2017 
// Design Name: 
// Module Name:    alu 
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
module alu(input [31:0] a, input [31:0] b, input [3:0] ALUop, input  cn, input [3:0] shamt, output reg [31:0] r);
				
wire [31:0]a,b;
wire [3:0] ALUop,shamt;


always @(*)
begin
	case ( ALUop ) 
		4'b0001: r=a+b; // add
		4'b0010: r=a-b; // sub
		4'b0011: r=a*b; // mult
		4'b0100: r=a/b; // div
		4'b0101: r=a&b; // and 
		4'b0110: r=a|b; // or 
		4'b0111: r=~(a|b); // nor 
		4'b1000: r=a^b; // xor 
		4'b1001: r=~b; // not 
		4'b1010: r=~(a&b); // nand
		4'b1011: r=b; // jr 

   endcase
end
endmodule
