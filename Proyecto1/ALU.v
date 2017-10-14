module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] CtrlFunc,
    output reg signed [31:0] Result,
    output reg [1:0] Flags
	 );


initial begin
Result <= 0;
Flags <= 0;
end

always@(*)
begin

if(CtrlFunc == 3'b000) //AND
	Result <= A & B;
	
else if(CtrlFunc == 3'b001) //OR
	Result <= A | B;

else if(CtrlFunc == 3'b010) //XOR
	Result <= A ^ B;
	
else if(CtrlFunc == 3'b011)//Suma
	Result <= A + B;
	
else if(CtrlFunc == 3'b100) //Resta
	Result <= A - B;

else if(CtrlFunc == 3'b101) //CMP
	begin
		Result <= A - B;
			if(Result == 32'd0)
				Flags <= 2'b01;

			else if(Result < 0)
				Flags <= 2'b10;
				
			else if(Result > 0)
				Flags <= 2'b00;
			else
				Flags <= 2'b00;
	end
else if(CtrlFunc == 3'b110) //mult	
	Result <= A * B;
else if(CtrlFunc == 3'b111) //shifter
	Result <= {A[15:0], {16{1'b0}}};
else
	Result <= 0;
end

endmodule
