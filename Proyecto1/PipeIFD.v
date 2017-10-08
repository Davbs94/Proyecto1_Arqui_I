module PipeIFD(
    input clk,
    input [31:0] InstructionIN,
	 output [4:0] OpCodeOUT,
	 output [15:0] DireccionOUT,
	 output [4:0] DirRegAOUT,
	 output [4:0] DirRegBOUT,
	 output [31:0] InmCorrimOUT,
	 output [4:0] DirWriteOUT
);

	 reg [4:0] OpCodeTMP;
	 reg [15:0] DireccionTMP;
	 reg [4:0] DirRegATMP;
	 reg [4:0] DirRegBTMP;
	 reg [31:0] InmCorrimTMP;
	 reg [4:0] DirWriteTMP;

always @(posedge clk)
begin
	OpCodeTMP = InstructionIN[31:27];
	DireccionTMP = InstructionIN[15:0];
	DirRegATMP = InstructionIN[21:17];
	DirRegBTMP = InstructionIN[16:12];
	InmCorrimTMP = {{15{1'b0}}, InstructionIN[16:0]};
	DirWriteTMP = InstructionIN[26:22];
	
end

	 assign OpCodeOUT = OpCodeTMP;
	 assign DireccionOUT = DireccionTMP;
	 assign DirRegAOUT = DirRegATMP;
	 assign DirRegBOUT = DirRegBTMP;
	 assign InmCorrimOUT = InmCorrimTMP;
	 assign DirWriteOUT = DirWriteTMP;
	 
endmodule
