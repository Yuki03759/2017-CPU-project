//////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: Alex Yamamura & Udit Kaushik
//
// Create Date: 8/21/2017
// Design Name: 4 to 1 MUX
// Module Name: mux4to1
// Project Name: Midterm Project Summer 2 2017
//
// Dependencies: Mux2to1
//
// Revision: 1
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module mux4to1(
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic [1:0] sel,
	output logic out
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
