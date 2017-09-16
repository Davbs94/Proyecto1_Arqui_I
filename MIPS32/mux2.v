`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:53:53 06/18/2017 
// Design Name: 
// Module Name:    mux2 
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
module mux2(input select, input [31:0] a, input [31:0] b, output reg [31:0] q
    );



wire[31:0] a,b;

always @(select or a or b)
begin
   if( select == 1'b0)
	begin
      q <= a;
	end
   if( select == 1'b1)
	begin
      q <= b;
	end
end
endmodule
