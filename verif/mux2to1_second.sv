module mux_2to1_second(
	d_0,
	d_1,
	sel,
	out
	);
	
	input d_0, d_1, sel;
	output out;
	wire out;
	
	assign out  (sel)? d_1 : d_0;
	
endmodule