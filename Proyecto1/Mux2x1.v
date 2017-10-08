module Mux2x1(
    input [31:0] A,
    input [31:0] B,
    input ctrl,
    output reg [31:0] C
    );

initial begin
C <= 0;
end

always @(*)
begin

if(ctrl==0)
	C <= A;
	
else
	C <= B;

end

endmodule
