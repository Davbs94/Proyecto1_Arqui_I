`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:07 06/10/2017 
// Design Name: 
// Module Name:    Control 
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
module Control(input clk,input reset,input [5:0] OPCODE,output reg PC_LD, output reg SEL_DIR, output reg MEM_WD, output reg MEM_RD,
					output reg IR_W, output reg SEL_DEST, output reg SEL_DAT, output reg REG_RD, output reg REG_WR,
					output reg [1:0] SEL_OPERA, output reg SEL_OPERAB, output reg [1:0] SEL_PC, output reg OP_ALU);



	reg	[1:0] state;
	reg	[1:0] next_state;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	parameter R = 6'b000000, BEQ = 6'b000100, SW = 6'b101011, LW = 6'b100011, J = 6'b000010, ADDIU = 6'b001001;


	
	

	always @ (posedge clk) 
	begin
		if (reset)
		begin
			state <= S0;
		end
		else
		   begin
			state <= next_state;
			end
	end
	
	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	// Determino el piso del ascensor
	always @ (state)
	begin
	case (state)
		
				S0:
					begin
					$display("Ciclo=%d",1);
					//instruction Fetch
						next_state <= S1;
						PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=1;
						IR_W=1;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
					
				S1:
					begin
					//Intruction decode formato R
					$display("OPCODE=%d",OPCODE);
					if(OPCODE == R)begin
						$display("Ciclo=%d",2);
						next_state <= S2;
						PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=1;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
					else if(OPCODE == J) begin
						$display("Ciclo=%d",5);
						next_state <= S0;
						PC_LD=1;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=1;
						OP_ALU=0;
					
					end
					else if(OPCODE == ADDIU) begin
						$display("Ciclo=%d",5);
						next_state <= S2;
						PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=1;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					
					end
					else
					begin
					$display("Ciclo=%d",111);
					PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
					end
				
				S2:
					begin
					//EXE Formato R
					if(OPCODE == R)begin
						$display("Ciclo=%d",3);
						next_state <= S3;
						PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=1;
					end
					else if(OPCODE == ADDIU) begin
						$display("Ciclo=%d",6);
						next_state <= S3;
						PC_LD=0;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=0;
						SEL_OPERA=0;
						SEL_OPERAB=1;
						SEL_PC=0;
						OP_ALU=1;
					
					end
					end
			
				S3:
					begin
					//WB Formato R
					if(OPCODE == R)begin
						$display("Ciclo=%d",4);
						next_state <= S0;
						PC_LD=1;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=1;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=1;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
					else if(OPCODE == ADDIU) begin
						$display("Ciclo=%d",7);
						next_state <= S0;
						PC_LD=1;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=1;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
					end
			
				default:
					begin
						$display("Ciclo=%d",10);
						next_state <= S0;
						PC_LD=1;
						SEL_DIR=0;
						MEM_WD=0;
						MEM_RD=0;
						IR_W=0;
						SEL_DEST=0;
						SEL_DAT=0;
						REG_RD=0;
						REG_WR=1;
						SEL_OPERA=0;
						SEL_OPERAB=0;
						SEL_PC=0;
						OP_ALU=0;
					end
			endcase
	end
	


endmodule
