module mux4to1_32bit(
	input logic [31:0]a,
	input logic [31:0]b,
	input logic [31:0]c,
	input logic [31:0]d,
	input logic [1:0] sel,
	output logic [31:0]out
	);

	logic [31:0]con1;
	logic [31:0]con2;

	mux2to1_32bit Imp1(
		.a (a),
		.b (b),
		.sel(sel[0]),
		.out(con1)
	);

	mux2to1_32bit Imp2(
		.a (c),
		.b (d),
		.sel(sel[0]),
		.out(con2)
	);

	mux2to1_32bit Imp3(
		.a (con1),
		.b (con2),
		.sel(sel[1]),
		.out(out)
	);

endmodule
