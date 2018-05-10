module example_fulladder(
	
	input logic a,
	input logic b,
	output logic sum,
	input logic cin,
	output logic cout
	
	);
	
	logic m1, m2, m4, m7;
	
	assign cout = ((a&b)|(cin & a|b));
	assign sum = (m1|m2|m4|m7);
	assign m7 = ( a & b & cin);
	assign m1 = (~a & ~b & cin);
	assign m2 = (~a & b & cin);
	assign m4 = ( a & ~b & ~cin);

endmodule


