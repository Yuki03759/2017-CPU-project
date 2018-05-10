module example1(a,out);

	input a;
	output out;
	
	assign out = ((~sel)&a)|(sel&b);
	
endmodule