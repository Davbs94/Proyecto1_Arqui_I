`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:40 06/10/2017 
// Design Name: 
// Module Name:    ControlAlu 
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
module ControlAlu(input [5:0] funct,input [5:0] OPCODE,input ALU_OP, output reg [3:0] ALU_FUN);

always @(*)begin

if(ALU_OP)begin
	if (OPCODE==0) begin
	case(funct)
		6'b100000: ALU_FUN = 4'b0001; //add
		6'b100010: ALU_FUN = 4'b0010; //sub
		6'b011000: ALU_FUN = 4'b0011; //mult
		6'b011010: ALU_FUN = 4'b0100; //div
		6'b100100: ALU_FUN = 4'b0101; //and
		6'b100101: ALU_FUN = 4'b0110; //or
		6'b100111: ALU_FUN = 4'b0111; //nor
		6'b100110: ALU_FUN = 4'b1000; //xor
		6'b101000: ALU_FUN = 4'b1001; //not
		6'b101001: ALU_FUN = 4'b1010; //nand
		6'b001000: ALU_FUN = 4'b1011; //jr
	endcase
	end
	else if (OPCODE==9) begin
		ALU_FUN = 4'b0001; //add
	end
end
if(ALU_OP==0)begin
	ALU_FUN= 4'b1111; //nada
end
end
			


endmodule
