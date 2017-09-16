`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:12 06/19/2017 
// Design Name: 
// Module Name:    mux4 
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
module mux4(input [1:0] select, input [31:0] a, input [31:0] b, input [31:0] c, input [31:0] d, output reg [31:0] q
    );



wire[31:0] a,b;

always @(select or a or b or c or d)
begin
   if( select == 2'b00)
	begin
      q <= a;
	end
   if( select == 2'b01)
	begin
      q <= b;
	end
	if( select == 2'b10)
	begin
      q <= c;
	end
   if( select == 2'b11)
	begin
      q <= d;
	end
end
endmodule