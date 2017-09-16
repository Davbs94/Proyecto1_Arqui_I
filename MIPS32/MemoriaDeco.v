`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:16 06/05/2017 
// Design Name: 
// Module Name:    MemoriaDeco 
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
module MemoriaDeco (
input wire [4:0] addrA,          
input wire [4:0] addrB,          
input wire [4:0] addrWR,         
input wire [31:0] write_data,    
input wire memwrite, memread,
input wire clk,                  
output reg [31:0] read_dataA,    
output reg [31:0] read_dataB      
);

reg [31:0] MEMO[0:31];  

integer i;

initial begin
  for (i = 0; i < 32; i = i + 1) begin
    MEMO[i] = i;
  end
end


always @(*) begin
  
  if (memread == 1'b1) begin
    read_dataA <= MEMO[addrA];
	 read_dataB <= MEMO[addrB];
  end
end

always @(negedge clk) begin
	if (memwrite == 1'b1) begin
		MEMO[addrWR] <= write_data;
	end
end

endmodule
