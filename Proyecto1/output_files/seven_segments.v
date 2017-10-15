 module seven_segments (
	input wire [31:0] num,
	output [20:0] seven_Segs
);
	
	reg [3:0] unidad,decimal,centena;
	reg [6:0] ss1,ss2,ss3;
	
	always @num begin
		unidad = (num%10)%10;
		decimal = (num/10)%10;
		centena = num/100;
		case (unidad)
			  1'h0 : ss1 <= 7'b1000000; //put 0 on display 1
			  1'h1 : ss1 <= 7'b1111001; //put 1 on display 1
			  1'h2 : ss1 <= 7'b0100100; //put 2 on display 1			  
			  1'h3 : ss1 <= 7'b0110000; //put 3 on display 1
			  1'h4 : ss1 <= 7'b0011001; //put 4 on display 1
			  1'h5 : ss1 <= 7'b0010010; //put 5 on display 1
			  1'h6 : ss1 <= 7'b0000010; //put 6 on display 1
			  1'h7 : ss1 <= 7'b1111000; //put 7 on display 1
			  1'h8 : ss1 <= 7'b0000000; //put 8 on display 1
			  1'h9 : ss1 <= 7'b0011000; //put 9 on display 1
		endcase
		case (decimal)
			  1'h0 : ss2 <= 7'b1000000; //put 0 on display 1
			  1'h1 : ss2 <= 7'b1111001; //put 1 on display 1
			  1'h2 : ss2 <= 7'b0100100; //put 2 on display 1			  
			  1'h3 : ss2 <= 7'b0110000; //put 3 on display 1
			  1'h4 : ss2 <= 7'b0011001; //put 4 on display 1
			  1'h5 : ss2 <= 7'b0010010; //put 5 on display 1
			  1'h6 : ss2 <= 7'b0000010; //put 6 on display 1
			  1'h7 : ss2 <= 7'b1111000; //put 7 on display 1
			  1'h8 : ss2 <= 7'b0000000; //put 8 on display 1
			  1'h9 : ss2 <= 7'b0011000; //put 9 on display 1
		  endcase
		  case (centena)
			  1'h0 : ss3 <= 7'b1000000; //put 0 on display 1
			  1'h1 : ss3 <= 7'b1111001; //put 1 on display 1
			  1'h2 : ss3 <= 7'b0100100; //put 2 on display 1			  
			  1'h3 : ss3 <= 7'b0110000; //put 3 on display 1
			  1'h4 : ss3 <= 7'b0011001; //put 4 on display 1
			  1'h5 : ss3 <= 7'b0010010; //put 5 on display 1
			  1'h6 : ss3 <= 7'b0000010; //put 6 on display 1
			  1'h7 : ss3 <= 7'b1111000; //put 7 on display 1
			  1'h8 : ss3 <= 7'b0000000; //put 8 on display 1
			  1'h9 : ss3 <= 7'b0011000; //put 9 on display 1
		  endcase
	end
	assign seven_Segs = {ss3, ss2, ss1};
endmodule