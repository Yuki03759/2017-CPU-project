module Sign_Extend (in, out);

	input logic [14:0] in;							//input
	output logic [31:0] out;						//output

	assign out = {{17{in[14]}}, in}; 	//add 1 by 16 times on front
endmodule
