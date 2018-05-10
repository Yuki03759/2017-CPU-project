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

module mux8to1_32bit (
	input logic [31:0]a,
	input logic [31:0]b,
	input logic [31:0]c,
	input logic [31:0]d,
	input logic [31:0]e,
	input logic [31:0]f,
	input logic [31:0]g,
	input logic [31:0]h,
	input logic [2:0] sel,
	output logic [31:0] out
	);

	logic [31:0] con1;
	logic [31:0] con2;

	mux4to1_32bit Imp1(
		.a (a),
		.b (b),
		.c (c),
		.d (d),
		.sel (sel[1:0]),
		.out (con1)
		);

	mux4to1_32bit Imp2(
		.a (e),
		.b (f),
		.c (g),
		.d (h),
		.sel (sel[1:0]),
		.out (con2)
		);

	mux2to1_32bit Imp3(
		.a (con1),
		.b (con2),
		.sel (sel[2]),
		.out(out)
	);
endmodule
