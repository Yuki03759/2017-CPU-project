//////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: David Tiao & Yuki Hayashi
// 
// Create Date: 8/21/2017
// Design Name: 2 to 1 MUX
// Module Name: mux2to1
// Project Name: Midterm Project Summer 2 2017
// 
// Dependencies: None
// 
// Revision: 1
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fulladder (a,b,c_in,sum,c_out);

	input a;
	input b;
	input c_in;
	output sum;
	output c_out;
	
	assign sum = a ^ b ^ c_in;
	assign c_out = (a & b) | (a & c_in) | (b & c_in);


endmodule
