module mux4to1(
	input a,
	input b,
	input c,
	input d,
	input [1:0] sel,
	output out
	);
	
	logic con1;
	logic con2;
	
	mux2to1 Imp1(
		.a (a),
		.b (b),
		.sel(sel[0]),
		.out(con1)
	);
	
	mux2to1 Imp2(
		.a (c),
		.b (d),
		.sel(sel[0]),
		.out(con2)
	);
	
	mux2to1 Imp3(
		.a (con1),
		.b (con2),
		.sel(sel[1]),
		.out(out)
		);
		
endmodule
