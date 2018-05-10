module test_alu32_tb
	
	parameter LENGTH  = 32;
	
	input logic [LENGTH - 1: 0] a;
	input logic [LENGTH - 1: 0]b;
	input logic [7:0] sel;
	input logic [LENGTH - 1out;