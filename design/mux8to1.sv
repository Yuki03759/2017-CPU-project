//////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: Alex Yamamura & Udit Kaushik
//
// Create Date: 8/21/2017
// Design Name: 8 to 1 MUX
// Module Name: mux8to1
// Project Name: Midterm Project Summer 2 2017
//
// Dependencies: Mux4to1, Mux2to1
//
// Revision: 1
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module mux8to1 (
	input logic a,
	input logic b,
	input logic c,
	input logic d,
	input logic e,
	input logic f,
	input logic g,
	input logic h,
	input logic [2:0] sel,
	output logic out
	);

	logic con1;
	logic con2;

	mux4to1 Imp1(
		.a (a),
		.b (b),
		.c (c),
		.d (d),
		.sel (sel[1:0]),
		.out (con1)
		);

	mux4to1 Imp2(
		.a (e),
		.b (f),
		.c (g),
		.d (h),
		.sel (sel[1:0]),
		.out (con2)
		);

	mux2to1 Imp3(
		.a (con1),
		.b (con2),
		.sel (sel[2]),
		.out(out)
	);
endmodule
