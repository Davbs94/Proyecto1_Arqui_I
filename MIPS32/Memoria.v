`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:21 06/09/2017 
// Design Name: 
// Module Name:    Memoria 
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
module Memoria(
input wire [31:0] dir,                             
input wire [31:0] write_data,   
input wire memwrite, memread,
input wire clk,                  
output reg [31:0] read_data     
);

reg [31:0] MEMO[0:127];  // 128x32

integer i;


initial begin
  read_data <= 0;
  
  
  for (i = 0; i < 128; i = i + 1) begin
    MEMO[i] = 0;
  end
  
  
  // Quemado de programa
  MEMO[32] = 32'h2413000A;
  MEMO[33] = 32'h2414000A;
  MEMO[34] = 32'h0293A820;
  MEMO[35] = 32'h00000000;
  MEMO[36] = 32'h00000000;
  MEMO[37] = 32'h00000000;
end

always @(*) begin
  if (memread == 1'b1) begin
		
		
		//Static Data
		if(dir == 32'h10000000)begin
			read_data <= MEMO[0];
		end
		if(dir == 32'h10000004)begin
			read_data <= MEMO[1];
		end
		if(dir== 32'h10000008)begin
			read_data <= MEMO[2];
		end
		if(dir == 32'h1000000C)begin
			read_data <= MEMO[3];
		end
		if(dir == 32'h10000010)begin
			read_data <= MEMO[4];
		end
		if(dir == 32'h10000014)begin
			read_data <= MEMO[5];
		end
		if(dir == 32'h10000018)begin
			read_data <= MEMO[6];
		end
		if(dir == 32'h1000001C)begin
			read_data <= MEMO[7];
		end
		if(dir == 32'h10000020)begin
			read_data <= MEMO[8];
		end
		if(dir == 32'h10000024)begin
			read_data <= MEMO[9];
		end
		if(dir == 32'h10000028)begin
			read_data <= MEMO[10];
		end
		if(dir == 32'h1000002C)begin
			read_data <= MEMO[11];
		end
		if(dir == 32'h10000030)begin
			read_data <= MEMO[12];
		end
		if(dir== 32'h10000034)begin
			read_data <= MEMO[13];
		end
		if(dir == 32'h10000038)begin
			read_data <= MEMO[14];
		end
		if(dir== 32'h1000003C)begin
			read_data <= MEMO[15];
		end
		if(dir == 32'h10000040)begin
			read_data <= MEMO[16];
		end
		if(dir == 32'h10000044)begin
			read_data <= MEMO[17];
		end
		if(dir == 32'h10000048)begin
			read_data <= MEMO[18];
		end
		if(dir == 32'h1000004C)begin
			read_data <= MEMO[19];
		end
		if(dir == 32'h10000050)begin
			read_data <= MEMO[20];
		end
		if(dir == 32'h10000054)begin
			read_data <= MEMO[21];
		end
		if(dir == 32'h10000058)begin
			read_data <= MEMO[22];
		end
		if(dir == 32'h1000005C)begin
			read_data <= MEMO[23];
		end
		if(dir == 32'h10000060)begin
			read_data <= MEMO[24];
		end
		if(dir == 32'h10000064)begin
			read_data <= MEMO[25];
		end
		if(dir == 32'h10000068)begin
			read_data <= MEMO[26];
		end
		if(dir == 32'h1000006C)begin
			read_data <= MEMO[27];
		end
		if(dir == 32'h10000070)begin
			read_data <= MEMO[28];
		end
		if(dir == 32'h10000074)begin
			read_data <= MEMO[29];
		end
		if(dir == 32'h10000078)begin
			read_data <= MEMO[30];
		end
		if(dir == 32'h1000007C)begin
			read_data <= MEMO[31];
		end
		
		//Text... Memoria de instrucciones
		if(dir == 32'h00400000)begin
			read_data <= MEMO[32];
		end
		if(dir == 32'h00400004)begin
			read_data <= MEMO[33];
		end
		if(dir == 32'h00400008)begin
			read_data <= MEMO[34];
		end
		if(dir == 32'h0040000C)begin
			read_data <= MEMO[35];
		end
		if(dir == 32'h00400010)begin
			read_data <= MEMO[36];
		end
		if(dir == 32'h00400014)begin
			read_data <= MEMO[37];
		end
		
  end

end

always @(negedge clk) begin
	if (memwrite == 1'b1) begin
	
	
		//Static Data
		if(dir == 32'h10000000)begin
			MEMO[0] <= write_data;
		end
		if(dir == 32'h10000004)begin
			MEMO[1] <= write_data;
		end
		if(dir == 32'h10000008)begin
			MEMO[2] <= write_data;
		end
		if(dir == 32'h1000000C)begin
			MEMO[3] <= write_data;
		end
		if(dir == 32'h10000010)begin
			MEMO[4] <= write_data;
		end
		if(dir== 32'h10000014)begin
			MEMO[5] <= write_data;
		end
		if(dir == 32'h10000018)begin
			MEMO[6] <= write_data;
		end
		if(dir == 32'h1000001C)begin
			MEMO[7] <= write_data;
		end
		if(dir == 32'h10000020)begin
			MEMO[8] <= write_data;
		end
		if(dir == 32'h10000024)begin
			MEMO[9] <= write_data;
		end
		if(dir == 32'h10000028)begin
			MEMO[10] <= write_data;
		end
		if(dir == 32'h1000002C)begin
			MEMO[11] <= write_data;
		end
		if(dir == 32'h10000030)begin
			MEMO[12] <= write_data;
		end
		if(dir == 32'h10000034)begin
			MEMO[13] <= write_data;
		end
		if(dir == 32'h10000038)begin
			MEMO[14] <= write_data;
		end
		if(dir == 32'h1000003C)begin
			MEMO[15] <= write_data;
		end
		if(dir == 32'h10000040)begin
			MEMO[16] <= write_data;
		end
		if(dir == 32'h10000044)begin
			MEMO[17] <= write_data;
		end
		if(dir == 32'h10000048)begin
			MEMO[18] <= write_data;
		end
		if(dir == 32'h1000004C)begin
			MEMO[19] <= write_data;
		end
		if(dir == 32'h10000050)begin
			MEMO[20] <= write_data;
		end
		if(dir == 32'h10000054)begin
			MEMO[21] <= write_data;
		end
		if(dir == 32'h10000058)begin
			MEMO[22] <= write_data;
		end
		if(dir == 32'h1000005C)begin
			MEMO[23] <= write_data;
		end
		if(dir == 32'h10000060)begin
			MEMO[24] <= write_data;
		end
		if(dir == 32'h10000064)begin
			MEMO[25] <= write_data;
		end
		if(dir == 32'h10000068)begin
			MEMO[26] <= write_data;
		end
		if(dir == 32'h1000006C)begin
			MEMO[27] <= write_data;
		end
		if(dir == 32'h10000070)begin
			MEMO[28] <= write_data;
		end
		if(dir == 32'h10000074)begin
			MEMO[29] <= write_data;
		end
		if(dir == 32'h10000078)begin
			MEMO[30] <= write_data;
		end
		if(dir == 32'h1000007C)begin
			MEMO[31] <= write_data;
		end
		
	end
end

endmodule

