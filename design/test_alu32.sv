module test_alu32bit (a, b, out, sel);

	parameter LENGTH = 32;
	
	input [LENGTH - 1:0] a, b;
	input [7:0] sel;	   
	output [LENGTH - 1 :0] out;
	reg [LENGTH - 1 :0] out;
	
	always @(a, b, sel)
	begin 
		case (sel)
			6'b100000: y=a+b; 	//ADD
			6'b100001: y=a+b;	//ADD

			//6'b101000: 			//set less than signed
			//6'b101001:			//set less than unsigned
		endcase
	end
endmodule 